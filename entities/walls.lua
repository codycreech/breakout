walls = {}
walls.current_level_walls = {}
walls.wall_thickness = 3

function walls.draw()
  for _, wall in pairs(walls.current_level_walls) do
    walls.draw_wall(wall)
  end
end

function walls.update(dt)
  for _, wall in pairs(walls.current_level_walls) do
    walls.update_wall(wall)
  end
end

function walls.draw_wall(wall)
  love.graphics.rectangle('line', wall.x, wall.y, wall.w, wall.h)
end

function walls.update_wall(wall)

end

function walls.new_wall(x, y, w, h)
  return ({ x = x,
            y = y,
            w = w,
            h = h })
end

function walls.construct_walls()
  local left_wall = walls.new_wall(
  0,
  0,
  walls.wall_thickness,
  love.graphics.getHeight()
)
  local right_wall = walls.new_wall(
  love.graphics.getWidth() - walls.wall_thickness,
  0,
  walls.wall_thickness,
  love.graphics.getHeight()
)
  local top_wall = walls.new_wall(
  0,
  0,
  love.graphics.getWidth(),
  walls.wall_thickness
)
  local bottom_wall = walls.new_wall(
  0,
  love.graphics.getHeight() - walls.wall_thickness,
  love.graphics.getWidth(),
  walls.wall_thickness
)
  walls.current_level_walls['left'] = left_wall
  walls.current_level_walls['right'] = right_wall
  walls.current_level_walls['top'] = top_wall
  walls.current_level_walls['bottom'] = bottom_wall
end
