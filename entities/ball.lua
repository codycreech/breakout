Class = require 'libs.hump.class'

Ball = Class {}

function Ball:init(x, y, released)
  love.graphics.setDefaultFilter('nearest')
  self.img = love.graphics.newImage('assets/images/ball.png')
  self.x = x
  self.y = y
  self.w = self.img:getWidth()
  self.h = self.img:getHeight()
  self.boundX = love.graphics.getWidth()
  self.boundY = love.graphics.getHeight()
  
  self.speedX = 0
  self.speedY = 0
  self.maxSpeedX = 1000
  self.maxSpeedY = 1000
  self.acceleration = 1200
  self.brakeFactor = 0.3
  
  self.released = false
end

function Ball:update(dt)
  local movedVertically = false
  
  --ball released
  if released then
    self.speedY = self.speedY - self.acceleration
    if self.speedY < -self.maxSpeedY then
      self.speedY = -self.maxSpeedY
    end
    movedVertically = true
  end
  if not movedVertically then
    self.speedY = self.speedY * self.brakeFactor
  end
  
  self.x = self.x + (self.speedX * dt)
  self.y = self.y + (self.speedY * dt)
end

function Ball:draw()
  love.graphics.draw(self.img, self.x, self.y, math.rad(0), 2, 2, self.w / 2, self.h / 2)
end

function love.keypressed(key)
  if key == 'space' then
    self.released = true
  end
end

return Ball