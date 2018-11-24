--! Pause Gamestate
Pause = Gamestate.new()

function Pause:enter(from)
  self.from = from
end

function Pause:draw()
  local W, H = love.graphics.getWidth(), love.graphics.getHeight()
  
  self.from:draw()
  
  love.graphics.setColor(0, 0, 0, 100)
  love.graphics.rectangle('fill', 0, 0, 0, W, H)
  love.graphics.setColor(255, 255, 255)
  love.graphics.printf('PAUSE', 0, H/2, W, 'center')
end

function love.keypressed(key)
  if Gamestate.current() ~= menu and key == 'p' then
    return Gamestate.push(pause)
  end
end

return Pause