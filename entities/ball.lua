Class = require 'libs.hump.class'

Ball = Class {}

function Ball:init(x, y, released)
  love.graphics.setDefaultFilter('nearest')
  self.img = love.graphics.newImage('assets/images/ball.png')
  self.startX = x
  self.startY = y
  self.x = x
  self.y = y
  self.w = self.img:getWidth()
  self.h = self.img:getHeight()
  self.boundX = love.graphics.getWidth()
  self.boundY = love.graphics.getHeight()

  self.speedX = 0
  self.speedY = 500
  self.maxSpeedX = 1000
  self.maxSpeedY = 1000
  self.acceleration = 1200
  self.brakeFactor = 0.3

  self.released = false
end

function Ball:update(dt)

  --ball released
  if released then
    self.speedY = self.speedY - self.acceleration
    if self.speedY < -self.maxSpeedY then
      self.speedY = -self.maxSpeedY
    end
  end

  self.x = self.x + (self.speedX * dt)
  self.y = self.y - (self.speedY * dt)

end

function Ball:draw()
  love.graphics.draw(self.img, self.x, self.y, math.rad(0), 2, 2, self.w / 2, self.h / 2)
end

function Ball:checkCollision(paddle)
  --collides with top of screen
  if self.y < 0 then
    self.speedY = -self.speedY
  end
  --collides with paddle
  if (self.y + self.h) > paddle.y and
  self.x >= paddle.x and
  (self.x + self.w) <= (paddle.x + paddle.w)
    then
      self.speedY = -self.speedY
  end
  --collides with bottom of screen
  if self.y > self.boundY + 100 then
    self.x = self.startX
    self.y = self.startY
    self.released = false
  end
end

return Ball
