--Copyright (c) 2011 jessa0 & Yan Ding
--Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
--
--The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
--
--THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity BOUNCINGBALL is
  generic (
    -- game speed in Hz
    GAME_SPEED: integer := 60;
    -- maximum speed of any object in the game in px/cycle
    MAX_SPEED: integer := 32;
    MAX_X_SPEED: integer := 18;
    MAX_Y_SPEED: integer := 25;
    -- ball color
    BALL_COLOR: std_logic_vector(2 downto 0) := "110";
    -- paddle colors
    LEFT_PADDLE_COLOR: std_logic_vector(2 downto 0) := "100";
    RIGHT_PADDLE_COLOR: std_logic_vector(2 downto 0) := "011";
    -- game border color
    BORDER_COLOR: std_logic_vector(2 downto 0) := "111";
    -- background color
    BACKGROUND_COLOR: std_logic_vector(2 downto 0) := "001";
    -- ball radius in px
    BALL_RADIUS: integer := 10;
    -- ball serving position
    BALL_X_DIST_SERVE: integer := 70;
    BALL_Y_SERVE: integer := 75;
    -- ball serving velocity
    BALL_X_SPEED_SERVE: integer := 5;
    BALL_Y_VEL_SERVE: integer := 3;
    -- starting paddle distance from wall in px
    PADDLE_X_DIST_START: integer := 50;
    PADDLE_Y_SPEED_MAX: integer := 7;
    PADDLE_Y_ACCEL: integer := 1;
    PADDLE_Y_DECEL: integer := 2;
    -- paddle dimensions divided by 2 in px
    PADDLE_WIDTH: integer := 5;
    PADDLE_HEIGHT: integer := 50;
    -- goal height
    GOAL_HEIGHT: integer := 75;
    -- border width divided by 2 in px
    BORDER_WIDTH: integer := 2;
    -- display resolution in px
    DISPLAY_WIDTH: integer := 640;
    DISPLAY_HEIGHT: integer := 480;
    -- number of clock cycles per second
    CLOCK_CYCLES: integer := 50000000;
    -- constants taken from DISPLAY
    DISPLAY_START_ADDRESS: std_logic_vector(17 downto 0) := (others => '0');
    BITS_PER_PIXEL: integer := 3;
    PIXELS_PER_WORD: integer := 10;
    PIXEL_BITS_PER_WORD: integer := 30);
  port (
    clk_50MHz: in std_logic;
    button_3: in std_logic;
    button_2: in std_logic;
    button_1: in std_logic;
    button_0: in std_logic;
    pause: in std_logic;
    -- player score outputs
    P: buffer std_logic_vector(7 downto 0) := (others => '0');
    Q: buffer std_logic_vector(7 downto 0) := (others => '0');
    -- display lines
    back: buffer std_logic := '0';
    pixel_write_request: buffer std_logic := '0';
    pixel_write_address: out std_logic_vector(17 downto 0);
    pixel_write_data: out std_logic_vector(PIXEL_BITS_PER_WORD - 1 downto 0));
end BOUNCINGBALL;

architecture behavioral of BOUNCINGBALL is
begin
  -- game loop
  process
    -- number of words per framebuffer
    constant PIXEL_WORD_COUNT: integer := (DISPLAY_WIDTH * DISPLAY_HEIGHT
                                           / PIXELS_PER_WORD);
    -- number of words to draw per cycle. increasing this will use LUTs
    constant PIXELS_PER_DRAW_CYCLE: integer := 1;
   
    -- number of cycles per game loop
    constant GAME_CYCLES: integer := CLOCK_CYCLES / GAME_SPEED;
    -- number of cycles a pixel write takes
    constant WRITE_CYCLES: integer := 5;
    -- number of cycles to wait before placing ball to serve
    constant START_CYCLES: integer := GAME_SPEED * 1;
    -- number of cycles to wait before serving
    constant SERVE_CYCLES: integer := GAME_SPEED * 2;

    
    -- vector types
    type pos_t is record
      x: integer range -BALL_RADIUS to DISPLAY_WIDTH - 1 + BALL_RADIUS;
      y: integer range -BALL_RADIUS to DISPLAY_HEIGHT - 1 + BALL_RADIUS;
    end record;
    type vel_t is record
      x: integer range -MAX_SPEED to MAX_SPEED;
      y: integer range -MAX_SPEED to MAX_SPEED;
    end record;
    type size_t is record
      x: integer range -(DISPLAY_WIDTH - 1) to DISPLAY_WIDTH - 1;
      y: integer range -(DISPLAY_HEIGHT - 1) to DISPLAY_HEIGHT - 1;
    end record;
    subtype color_t is std_logic_vector(BITS_PER_PIXEL - 1 downto 0);
    type hole_t is record
      x: boolean;
      y: boolean;
    end record;
    -- object state type
    type obj_t is record
      pos: pos_t;
      vel: vel_t;
      size: size_t;
      invert: boolean;
      hole: hole_t;
      color: color_t;
      friction: boolean;
      power_up: vel_t;
    end record;
    type obj_array_t is array (integer range <>) of obj_t;

    -- game cycle state
    type state_t is (
      DO_GAME_STATE,
      COLLIDE_BALL,
      MOVE_BALL,
      COLLIDE_WITH_BALL,
      ACCELERATE_PADDLE,
      COLLIDE_PADDLE,
      MOVE_PADDLE,
      START_DISPLAY,
      DRAW_WORD,
      WRITE_WORD,
      DISPLAY_DONE,
      IDLE);
    variable state: state_t := DO_GAME_STATE;

    -- game state
    type game_state_t is (
      START,
      SERVE,
      PLAY);
    variable game_state: game_state_t := START;
    
    -- game objects
    constant OBJ_COUNT: integer := 5;
    constant PADDLE_COUNT: integer := 2;
    constant BORDER_IDX: integer := 4;
    constant PADDLES_IDX: integer := 0;
    variable obj:
      obj_array_t(OBJ_COUNT - 1 downto 0) := (
        -- game border
        (pos => (DISPLAY_WIDTH / 2, DISPLAY_HEIGHT / 2),
         vel => (0, 0),
         size => (-(DISPLAY_WIDTH / 2 - (BORDER_WIDTH * 2)),
                  -(DISPLAY_HEIGHT / 2 - (BORDER_WIDTH * 2))),
         invert => TRUE,
         hole => (FALSE, FALSE),
         color => BORDER_COLOR,
         friction => FALSE,
         power_up => (0, 0)),
        -- left goal
        (pos => (BORDER_WIDTH, DISPLAY_HEIGHT / 2),
         vel => (0, 0),
         size => (BORDER_WIDTH, GOAL_HEIGHT),
         invert => FALSE,
         hole => (FALSE, TRUE),
         color => BACKGROUND_COLOR,
         friction => FALSE,
         power_up => (0, 0)),
        -- right goal
        (pos => (DISPLAY_WIDTH - BORDER_WIDTH, DISPLAY_HEIGHT / 2),
         vel => (0, 0),
         size => (BORDER_WIDTH, GOAL_HEIGHT),
         invert => FALSE,
         hole => (FALSE, TRUE),
         color => BACKGROUND_COLOR,
         friction => FALSE,
         power_up => (0, 0)),
        -- left paddle
        (pos => (PADDLE_X_DIST_START, DISPLAY_HEIGHT / 2),
         vel => (0, 0),
         size => (PADDLE_WIDTH, PADDLE_HEIGHT),
         invert => FALSE,
         hole => (FALSE, FALSE),
         color => LEFT_PADDLE_COLOR,
         friction => TRUE,
         power_up => (-1, -2)),
        -- right paddle
        (pos => (DISPLAY_WIDTH - PADDLE_X_DIST_START, DISPLAY_HEIGHT / 2),
         vel => (0, 0),
         size => (PADDLE_WIDTH, PADDLE_HEIGHT),
         invert => FALSE,
         hole => (FALSE, FALSE),
         color => RIGHT_PADDLE_COLOR,
         friction => TRUE,
         power_up => (2, 1)));
    
    -- ball object
    variable ball: obj_t := (
      pos => (-BALL_RADIUS, -BALL_RADIUS),
      vel => (0, 0),
      size => (BALL_RADIUS, BALL_RADIUS),
      invert => FALSE,
      hole => (FALSE, FALSE),
      color => BALL_COLOR,
	   friction => FALSE,
	   power_up => (0, 0));

    -- last player to score
    variable left_player_scored: boolean := TRUE;

    -- cycle counters
    variable game_cycle: integer range 0 to GAME_CYCLES - 1 := 0;
    variable write_cycle: integer range 0 to WRITE_CYCLES - 1 := 0;
    variable start_cycle: integer range 0 to START_CYCLES - 1 := 0;
    variable serve_cycle: integer range 0 to SERVE_CYCLES - 1 := 0;
    -- current display position
    variable display_pos: pos_t;
    -- offset to current word in framebuffer
    variable word_offset: integer range 0 to PIXEL_WORD_COUNT - 1;
    variable pixel_offset:
      integer range 0 to PIXEL_BITS_PER_WORD - BITS_PER_PIXEL;
    -- current object index
    variable cur_obj: integer range 0 to OBJ_COUNT - 1 := 0;
    variable cur_paddle: integer range 0 to PADDLE_COUNT - 1 := 0;
    
    -- collision detection
    type collision_t is record
      x: boolean;
      y: boolean;
    end record;

    -- store collision of ball with other objects
    variable collision: collision_t;
    
    function collide (
      a: obj_t;
      b: obj_t) return collision_t is
      variable a_size: size_t;
      variable in_y_before, in_y_after, in_x_before, in_x_after: boolean;
      variable collision: collision_t := (FALSE, FALSE);
    begin
      -- do hole in x direction
      if (b.hole.x) then
        a_size.x := -a.size.x;
      else
        a_size.x := a.size.x;
      end if;
      -- do hole in y direction
      if (b.hole.y) then
        a_size.y := -a.size.y;
      else
        a_size.y := a.size.y;
      end if;
      
      in_x_before :=
        (((a.pos.x >= b.pos.x - (b.size.x + a_size.x))
          xor b.invert)
         and
         ((a.pos.x < b.pos.x + (b.size.x + a_size.x))
          xor b.invert))
        xor b.invert;
      in_y_before :=
        (((a.pos.y >= b.pos.y - (b.size.y + a_size.y))
          xor b.invert)
         and
         ((a.pos.y < b.pos.y + (b.size.y + a_size.y))
          xor b.invert))
        xor b.invert;
      in_x_after :=
        (((a.pos.x + a.vel.x >= b.pos.x - (b.size.x + a_size.x))
          xor b.invert)
         and
         ((a.pos.x + a.vel.x < b.pos.x + (b.size.x + a_size.x))
          xor b.invert))
        xor b.invert;
      in_y_after :=
        (((a.pos.y + a.vel.y >= b.pos.y - (b.size.y + a_size.y))
          xor b.invert)
        and
         ((a.pos.y + a.vel.y < b.pos.y + (b.size.y + a_size.y))
          xor b.invert))
        xor b.invert;

      -- x-axis collision
      if ((not in_x_before and in_x_after) and (in_y_after or b.invert)) then
        collision.x := TRUE;
      end if;
      -- y-axis collision
      if ((not in_y_before and in_y_after) and (in_x_after or b.invert)) then
        collision.y := TRUE;
      end if;
      return collision;
    end function;

    function draw_ball (
      display_pos: in pos_t;
      ball: in obj_t) return boolean is
    begin
      return (ball.pos.x - display_pos.x) * (ball.pos.x - display_pos.x)
        + (ball.pos.y - display_pos.y) * (ball.pos.y - display_pos.y)
        <= BALL_RADIUS * BALL_RADIUS;
    end function;

    function draw_rect (
      display_pos: in pos_t;
      obj: in obj_t) return boolean is
    begin
      return
        (((display_pos.x >= obj.pos.x - obj.size.x)
          xor obj.invert)
         and ((display_pos.x < obj.pos.x + obj.size.x)
              xor obj.invert)
         and ((display_pos.y >= obj.pos.y - obj.size.y)
              xor obj.invert)
         and ((display_pos.y < obj.pos.y + obj.size.y)
              xor obj.invert))
        xor obj.invert;
    end function;

  begin
    wait until rising_edge(clk_50MHz);

    if (state = DO_GAME_STATE) then
      -- implement reset
      if (button_0 = '1' and button_1 = '1' and button_2 = '1' and button_3 = '1') then
        if (pause = '1') then
          -- clear score as well
          P <= (others => '0');
          Q <= (others => '0');
        end if;

        game_state := START;
      end if;
		
      if (game_state = START) then
        if (start_cycle < START_CYCLES - 1) then
          start_cycle := start_cycles + 1;
        else
          -- place the ball for serving
          if (left_player_scored) then
            -- place ball on left
            ball.pos.x := BALL_X_DIST_SERVE;
          else
            -- place ball on right
            ball.pos.x := DISPLAY_WIDTH - 1 - BALL_X_DIST_SERVE;
          end if;
          -- place ball on top
          ball.pos.y := BALL_Y_SERVE;

          start_cycle := 0;
          game_state := SERVE;
        end if;
        state := ACCELERATE_PADDLE;
      elsif (game_state = SERVE) then
        if (serve_cycle < SERVE_CYCLES - 1) then
          serve_cycle := serve_cycle + 1;
        else
          -- serve the ball
          if (left_player_scored) then
            -- send ball toward right
            ball.vel.x := BALL_X_SPEED_SERVE;
          else
            -- send ball toward left
            ball.vel.x := -BALL_X_SPEED_SERVE;
          end if;
          -- send ball down
          ball.vel.y := BALL_Y_VEL_SERVE;

          serve_cycle := 0;
          game_state := PLAY;
        end if;
        state := ACCELERATE_PADDLE;
      elsif (game_state = PLAY) then
        if (pause = '0') then
          state := COLLIDE_BALL;
        end if;
      end if;
    elsif (state = COLLIDE_BALL) then
      collision := collide(ball, obj(cur_obj));
      if (collision.x or collision.y) then
        -- ball collided with something
        if (not obj(cur_obj).hole.x and not obj(cur_obj).hole.y) then
          -- ball didnt collide with hole
          
          -- update ball x velocity
          if (collision.x) then
            -- apply y friction
            if (obj(cur_obj).friction) then
              ball.vel.y := ball.vel.y + (obj(cur_obj).vel.y - ball.vel.y) / 4;
            end if;
            -- apply x powerup
            if (ball.pos.x < obj(cur_obj).pos.x) then
              -- apply left powerup
              ball.vel.x := -ball.vel.x + obj(cur_obj).power_up.x;
            elsif (ball.pos.x > obj(cur_obj).pos.x) then
              -- apply right powerup
              ball.vel.x := -ball.vel.x + obj(cur_obj).power_up.y;
            else
              -- just bounce off (assuming other objects dont move in x dir)
              ball.vel.x := -ball.vel.x;
            end if;
            ball.pos.x := ball.pos.x + obj(cur_obj).vel.x;
          end if;
          -- update ball y velocity
          if (collision.y) then
            ball.vel.y := 2 * obj(cur_obj).vel.y - ball.vel.y;
            -- dont apply x friction
            ball.pos.y := ball.pos.y + obj(cur_obj).vel.y;
          end if;
          -- cap ball velocity
          if (ball.vel.y > MAX_Y_SPEED) then
            ball.vel.y := MAX_Y_SPEED;
          elsif (ball.vel.y < -MAX_Y_SPEED) then
            ball.vel.y := -MAX_Y_SPEED;
          end if;
          if (ball.vel.x > MAX_X_SPEED) then
            ball.vel.x := MAX_X_SPEED;
          elsif (ball.vel.x > 0 and ball.vel.x < BALL_X_SPEED_SERVE) then
            ball.vel.x := BALL_X_SPEED_SERVE;
          elsif (ball.vel.x < -MAX_X_SPEED) then
            ball.vel.x := -MAX_X_SPEED;
          elsif (ball.vel.x < 0 and ball.vel.x > -BALL_X_SPEED_SERVE) then
            ball.vel.x := -BALL_X_SPEED_SERVE;
          end if;
        end if;
        -- stop after first collision
        state := MOVE_BALL;
      elsif (cur_obj < OBJ_COUNT - 1) then
        cur_obj := cur_obj + 1;
      else
        -- stop after last object
        state := MOVE_BALL;
      end if;
    elsif (state = MOVE_BALL) then
      if ((not (collision.x or collision.y))
          or obj(cur_obj).hole.x or obj(cur_obj).hole.y) then
        -- no collision occured, so move ball
        if (ball.pos.x + ball.vel.x >= DISPLAY_WIDTH - 1 + BALL_RADIUS) then
          -- left player scored

          -- move ball off screen
          ball.pos.x := DISPLAY_WIDTH - 1 + BALL_RADIUS;

          -- give left player a point
          if (P(3 downto 0) = "1001") then
            P(3 downto 0) <= "0000";
            if (P(7 downto 4) = "1001") then
              P(7 downto 4) <= "0000";
            else
              P(7 downto 4) <= P(7 downto 4) + 1;
            end if;
          else
            P(3 downto 0) <= P(3 downto 0) + 1;
          end if;
          left_player_scored := TRUE;
          -- serve the ball
          game_state := START;
        elsif (ball.pos.x + ball.vel.x < -BALL_RADIUS) then
          -- right player scored

          -- move ball off screen
          ball.pos.x := 0;

          -- give right player a point
          if (Q(3 downto 0) = "1001") then
            Q(3 downto 0) <= "0000";
            if (Q(7 downto 4) = "1001") then
              Q(7 downto 4) <= "0000";
            else
              Q(7 downto 4) <= Q(7 downto 4) + 1;
            end if;
          else
            Q(3 downto 0) <= Q(3 downto 0) + 1;
          end if;
          left_player_scored := FALSE;
          -- serve the ball
          game_state := START;
        else
          -- move ball in x direction
          ball.pos.x := ball.pos.x + ball.vel.x;
        end if;
        -- move ball in y direction
        ball.pos.y := ball.pos.y + ball.vel.y;
      end if;
      
      -- move to next state
      cur_obj := 0;
      state := COLLIDE_WITH_BALL;
    elsif (state = COLLIDE_WITH_BALL) then
      collision := collide(obj(cur_obj), ball);
      if (collision.x or collision.y) then
        if (collision.x) then
          ball.vel.x := 2 * obj(cur_obj).vel.x - ball.vel.x;
          -- apply y friction
          if (obj(cur_obj).friction) then
            ball.vel.y := ball.vel.y + (obj(cur_obj).vel.y - ball.vel.y) / 4;
          end if;
        end if;
        if (collision.y) then
          ball.vel.y := 2 * obj(cur_obj).vel.y - ball.vel.y;
          -- dont apply x friction
        end if;

        -- cap ball velocity
        if (ball.vel.y > MAX_Y_SPEED) then
          ball.vel.y := MAX_Y_SPEED;
        elsif (ball.vel.y < -MAX_Y_SPEED) then
          ball.vel.y := -MAX_Y_SPEED;
        end if;
        if (ball.vel.x > MAX_X_SPEED) then
          ball.vel.x := MAX_X_SPEED;
        elsif (ball.vel.x < -MAX_X_SPEED) then
          ball.vel.x := -MAX_X_SPEED;
        end if;
        
        -- stop after first collision
        cur_obj := 0;
        state := ACCELERATE_PADDLE;
      elsif (cur_obj < OBJ_COUNT - 1) then
        cur_obj := cur_obj + 1;
      else
        -- stop after last object
        cur_obj := 0;
        state := ACCELERATE_PADDLE;
      end if;
    elsif (state = ACCELERATE_PADDLE) then
      if (button_0 = '1' and button_1 = '0') then
        -- button 0
        if (obj(0).vel.y > -PADDLE_Y_SPEED_MAX) then
          obj(0).vel.y := obj(0).vel.y - PADDLE_Y_ACCEL;
        end if;
      elsif (button_1 = '1' and button_0 = '0') then
        -- button 1
        if (obj(0).vel.y < PADDLE_Y_SPEED_MAX) then
          obj(0).vel.y := obj(0).vel.y + PADDLE_Y_ACCEL;
        end if;
      else
        if (obj(0).vel.y < 0) then
          obj(0).vel.y := obj(0).vel.y + PADDLE_Y_DECEL;
        elsif (obj(0).vel.y > 0) then
          obj(0).vel.y := obj(0).vel.y - PADDLE_Y_DECEL;
        else
          obj(0).vel.y := 0;
        end if;
      end if;
      if (button_3 = '1' and button_2 = '0') then
        -- button 3
        if (obj(1).vel.y > -PADDLE_Y_SPEED_MAX) then
          obj(1).vel.y := obj(1).vel.y - PADDLE_Y_ACCEL;
        end if;
      elsif (button_2 = '1' and button_3 = '0') then
        -- button 2
        if (obj(1).vel.y < PADDLE_Y_SPEED_MAX) then
          obj(1).vel.y := obj(1).vel.y + PADDLE_Y_ACCEL;
        end if;
      else
        if (obj(1).vel.y < 0) then
          obj(1).vel.y := obj(1).vel.y + PADDLE_Y_DECEL;
        elsif (obj(1).vel.y > 0) then
          obj(1).vel.y := obj(1).vel.y - PADDLE_Y_DECEL;
        else
          obj(1).vel.y := 0;
        end if;
      end if;
		
      state := COLLIDE_PADDLE;
    elsif (state = COLLIDE_PADDLE) then
      collision := collide(obj(PADDLES_IDX + cur_paddle), obj(BORDER_IDX));
      if (collision.y) then
        obj(PADDLES_IDX + cur_paddle).vel.y := 0;
      end if;
      
      if (cur_paddle < PADDLE_COUNT - 1) then
        cur_paddle := cur_paddle + 1;
      else
        cur_paddle := 0;
        state := MOVE_PADDLE;
      end if;
    elsif (state = MOVE_PADDLE) then
      -- move paddle
      for cur_paddle in PADDLE_COUNT - 1 downto 0 loop
        obj(cur_paddle).pos.x :=
          obj(cur_paddle).pos.x + obj(cur_paddle).vel.x;
        obj(cur_paddle).pos.y :=
          obj(cur_paddle).pos.y + obj(cur_paddle).vel.y;
      end loop;
      
      -- move to paddle collision detection
      cur_obj := 0;
      state := START_DISPLAY;
    elsif (state = START_DISPLAY) then
      -- set up display counters
      pixel_offset := PIXEL_BITS_PER_WORD - BITS_PER_PIXEL;
      word_offset := 0;
      display_pos := (DISPLAY_WIDTH - 1, DISPLAY_HEIGHT - 1);
      state := DRAW_WORD;
    elsif (state = DRAW_WORD) then
      for px in PIXELS_PER_DRAW_CYCLE - 1 downto 0 loop
        -- increment pixel offset within word
        if (pixel_offset < PIXEL_BITS_PER_WORD - BITS_PER_PIXEL) then
          pixel_offset := pixel_offset + BITS_PER_PIXEL;
        else
          pixel_offset := 0;
        end if;
        
        -- increment display counters
        if (display_pos.x < DISPLAY_WIDTH - 1) then
          display_pos.x := display_pos.x + 1;
        else
          display_pos.x := 0;
          if (display_pos.y < DISPLAY_HEIGHT - 1) then
            display_pos.y := display_pos.y + 1;
          else
            display_pos.y := 0;
          end if;
        end if;

        -- generate background pixel by default
        pixel_write_data(pixel_offset + BITS_PER_PIXEL - 1
                         downto pixel_offset) <= BACKGROUND_COLOR;

        -- determine whether pixel falls within an object
        if (draw_ball(display_pos, ball)) then
          -- draw ball pixel
          pixel_write_data(pixel_offset + BITS_PER_PIXEL - 1
                           downto pixel_offset) <= ball.color;
        else
          for i in obj'range loop
            if (draw_rect(display_pos, obj(i))) then
              -- draw object pixel
              pixel_write_data(pixel_offset + BITS_PER_PIXEL - 1
                               downto pixel_offset) <= obj(i).color;
            end if;
          end loop;
        end if;
        
        -- start writing word if done drawing it
        if (pixel_offset = PIXEL_BITS_PER_WORD - BITS_PER_PIXEL) then
          state := WRITE_WORD;
          exit;
        end if;
      end loop;
    elsif (state = WRITE_WORD) then
      if (write_cycle = 0) then
        -- increment word
        if (word_offset < PIXEL_WORD_COUNT - 1) then
          word_offset := word_offset + 1;
        else
          word_offset := 0;
        end if;
      elsif (write_cycle = 2) then
        -- set address for use in next write
        if (back = '0') then
          -- write to back buffer
          pixel_write_address <=
            DISPLAY_START_ADDRESS + PIXEL_WORD_COUNT + word_offset;
        else
          -- write to front buffer
          pixel_write_address <= DISPLAY_START_ADDRESS + word_offset;
        end if;

        -- enable writing
        pixel_write_request <= '1';
      end if;
      
      -- increment write cycle
      if (write_cycle < WRITE_CYCLES - 1) then
        write_cycle := write_cycle + 1;
      else
        write_cycle := 0;
        -- move to next state
        if (word_offset < PIXEL_WORD_COUNT - 1) then
          -- draw another word
          state := DRAW_WORD;
        else
          -- drew all words, so finish
          state := DISPLAY_DONE;
        end if;
      end if;
    elsif (state = DISPLAY_DONE) then
      -- swap framebuffers
      back <= not back;      
      -- disable writing
      pixel_write_request <= '0';
      
      state := IDLE;
    end if;
    
    -- increment game cycle
    if (game_cycle < GAME_CYCLES - 1) then
      game_cycle := game_cycle + 1;
    else
      game_cycle := 0;
      state := DO_GAME_STATE;
    end if;
  end process;
end behavioral;
