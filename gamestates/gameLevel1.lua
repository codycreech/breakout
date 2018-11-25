local Class = require 'libs.hump.class'
local Paddle = require 'entities.paddle'
local Gamestate = require 'libs.hump.gamestate'
local Ball = require 'entities.ball'
require 'entities/collisions'
require 'entities/walls'

local gameLevel1 = Class {}

function gameLevel1:init()
  joysticks = love.joystick.getJoysticks()
  joystick = joysticks[1]
end

function gameLevel1:enter()
  x = love.graphics.getWidth() / 2
  y = love.graphics.getHeight() * 0.90
  paddle = Paddle(x, y)
  ballX = paddle.x
  ballY = paddle.y - 10
  ball = Ball(ballX, ballY)

  walls.construct_walls()

  background = love.graphics.newImage('assets/images/bg_space_seamless.png')
  bg_music = love.audio.newSource('assets/sounds/lord_of_destruction.mp3', 'stream')
end

function gameLevel1:update(dt)
  --if dt > 0.035 then return end

  love.audio.play(bg_music)

  if not ball.released then
    ball.x = paddle.x
    ball.y = paddle.y - 10
  end

  if ball.y > ball.boundY + 100 then
    ball:reset()
  end

  paddle:update(dt)
  ball:update(dt)
  walls.update(dt)

  --ball:checkCollision(paddle)

  ball_paddle_collision(ball, paddle)
  ball_walls_collisions(ball, walls)
end

function gameLevel1:draw()
  love.graphics.draw(background)
  paddle:draw()
  ball:draw()
  walls.draw()
end

function gameLevel1:keypressed(key)
  if Gamestate.current() ~= pause and key == 'p' then
    Gamestate.push(pause)
  end
end

function love.keyreleased(key)
  -- body...
  if key == 'space' then
    ball.released = true
  end
end

return gameLevel1
