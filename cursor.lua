cursor = {
  material = Lovemap.materials.dirt
}

function cursor.draw()
  x = (cursor.absoluteX() - cursor.absoluteX() % Lovemap.tileSize) - map.x
  y = (cursor.absoluteY() - cursor.absoluteY() % Lovemap.tileSize) - map.y
  love.graphics.drawq(Lovemap.tileset, cursor.material:baseTile(), x, y)
end

function cursor.click()
  if cursor.mapTile().material ~= cursor.material then
    cursor.mapTile().material = cursor.material
    map:buildSpriteBatch()
  end
end

function cursor.mapX()
  return (cursor.absoluteX() - cursor.absoluteX() % Lovemap.tileSize) / Lovemap.tileSize + 1
end

function cursor.mapY()
  return (cursor.absoluteY() - cursor.absoluteY() % Lovemap.tileSize) / Lovemap.tileSize + 1
end

function cursor.mapTile()
  return map.tiles[cursor.mapX()][cursor.mapY()]
end

function cursor.absoluteX()
  return map.x + love.mouse.getX()
end

function cursor.absoluteY()
  return map.y + love.mouse.getY()
end
