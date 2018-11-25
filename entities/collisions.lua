function ball_paddle_collision(ball, paddle)
  local overlap, shift_ball_x, shift_ball_y
  local a = { x = paddle.x,
              y = paddle.y,
              w = paddle.w,
              h = paddle.h }
  local b = { x = ball.x,
              y = ball.y,
              w = ball.w,
              h = ball.h }
  overlap, shift_ball_x, shift_ball_y =
  check_rectangles_overlap(a, b)
  if overlap then
    ball:rebound(shift_ball_x, shift_ball_y)
    --print('ball-paddle collision')
  end
end

function ball_walls_collisions(ball, walls)
  local overlap, shift_ball_x, shift_ball_y
  local b = { x = ball.x,
              y = ball.y,
              w = ball.w,
              h = ball.h }
  for i, wall in pairs(walls.current_level_walls) do
    local a = { x = wall.x,
                y = wall.y,
                w = wall.w,
                h = wall.h }
    overlap, shift_ball_x, shift_ball_y =
    check_rectangles_overlap(a, b)
    if overlap then
      ball:rebound(shift_ball_x, shift_ball_y)
      --print('ball-wall collision')
    end
  end
end

function check_rectangles_overlap(a, b)
  local overlap = false
  local shift_b_x, shift_b_y = 0, 0
  if not ( a.x + a.w < b.x or b.x + b.w < a.x or
           a.y + a.h < b.y or b.y + b.h < a.y ) then
             overlap = true
             if ( a.x + a.w / 2 ) < ( b.x + b.w / 2 ) then
               shift_b_x = ( a.x + a.w ) - b.x
             else
               shift_b_x = a.x - ( b.x + b.w )
             end
             if ( a.y + a.h / 2 ) < ( b.y + b.h / 2 ) then
               shift_b_y = ( a.y + a.h ) - b.y
             else
               shift_b_y = a.y - ( b.y + b.h )
             end
  end
  return overlap, shift_b_x, shift_b_y
end
