require 'lovemap/main.lua'
require 'cursor'

function love.load()
  love.graphics.setMode(800, 600, false, true, 0)
  love.graphics.setCaption('Lovemap Example')
  love.mouse.setVisible(false)
  map = Lovemap:new(60, 50)
  map:setup()
end

function love.update(dt)
  if love.keyboard.isDown("w") then map:move(0, -1) end
  if love.keyboard.isDown("s") then map:move(0, 1)  end
  if love.keyboard.isDown("a") then map:move(-1, 0) end
  if love.keyboard.isDown("d") then map:move(1, 0)  end

  if love.keyboard.isDown(1) then cursor.material = Lovemap.materials.dirt end
  if love.keyboard.isDown(2) then cursor.material = Lovemap.materials.grass end
  if love.keyboard.isDown(3) then cursor.material = Lovemap.materials.water end
  if love.keyboard.isDown(4) then cursor.material = Lovemap.materials.deepwater end

  if love.mouse.isDown("l") then cursor.click() end
end

function love.draw()
  map:draw()
  cursor.draw()
  love.graphics.print("1 - Dirt", 10, 20)
  love.graphics.print("2 - Grass", 10, 40)
  love.graphics.print("3 - Water", 10, 60)
  love.graphics.print("4 - Deep Water", 10, 80)
  love.graphics.print("WASD to move", 10, 100)
end

