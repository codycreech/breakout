Class = require 'libs.hump.class'

Paddle = Class {}

function Paddle:init(x, y)
  love.graphics.setDefaultFilter('nearest')
  self.img = love.graphics.newImage('assets/images/paddle.png')
  self.x = x
  self.y = y
  self.w = self.img:getWidth()
  self.h = self.img:getHeight()
  self.boundX = love.graphics.getWidth()

  self.speedX = 0
  self.maxSpeedX = 850
  self.acceleration = 1000
  self.brakeFactor = 0.30
end

function Paddle:update(dt)
  local movedHorizontally = false
  --Paddle movement
  if love.keyboard.isDown("left") and (self.x - self.w / 2) > 20 or joystick:isGamepadDown("dpleft") and (self.x - self.w / 2) > 20 then
    self.speedX = self.speedX - self.acceleration
    if self.speedX < -self.maxSpeedX then
      self.speedX = -self.maxSpeedX
    end
    movedHorizontally = true
  end

  if love.keyboard.isDown("right") and (self.x + self.w / 2) < self.boundX - 25 or joystick:isGamepadDown("dpright") and (self.x + self.w / 2) < self.boundX - 25 then
    self.speedX = self.speedX + self.acceleration
    if self.speedX > self.maxSpeedX then
      self.speedX = self.maxSpeedX
    end
    movedHorizontally = true
  end
  if not movedHorizontally then
    self.speedX = self.speedX * self.brakeFactor
  end

  self.x = self.x + (self.speedX * dt)
end

function Paddle:draw()
  love.graphics.draw(self.img, self.x, self.y, math.rad(0), 1.2, 1.2, self.w / 2, self.h / 2)
  love.graphics.setColor(1,1,1)
  love.graphics.circle('fill', self.x, self.y, 2)
end

return Paddle
