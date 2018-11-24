--! main.lua : Breakout Game
Gamestate = require 'libs.hump.gamestate'
local gameLevel1 = require 'gamestates.gameLevel1'
local pause = require 'gamestates.pause'

function love.load()
  Gamestate.registerEvents()
  Gamestate.switch(gameLevel1)
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.push('quit')
  elseif key == 'p' then
    Gamestate.push(pause)
  end
end