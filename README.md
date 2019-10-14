# Endless Dungeon Documentation

This is the documentation for the Endless Dungeon Project.

### Table of Contents

* [Entities](#the-entity-class)
* [Maps](#the-map-class)
* [Collisions](#collisions)
* [Camera](#camera)

----


# The Entity Class

**Entities** are anything in the game that acts like a character, enemy, or player. By default, they all have `x` and `y` coordinates, as well as an `img` attribute. Here are the details about `Entity` objects:

### Attributes

| Name | Type | Description |
| ---- | ---- | ----------- |
| `img` | image data | Passed into `love.graphics.draw()` as the first parameter by `Entity:draw()` |
| `x` | integer | Passed into `love.graphics.draw()` as the second parameter by `Entity:draw()` |
| `y` | integer | Passed into `love.graphics.draw()` as the third parameter by `Entity:draw()` |

### Methods

| Name | Returns | Description |
| ---- | ------- | ----------- |
| `Entity:new()` | `object` | Creates an `Entity` object |
| `Entity:draw()` | `nil` | Renders image to screen. Uses attributes `x`, `y`, and `img`. |

## How to Use

To make an entity, first make sure you `require` the `core/entity` file at the top of your code **before** `love.load()`:

```lua
local Entity = require 'core/entity'
```

Then, you can create your **Entity** object in your `love.load()` function by calling the `Entity:new()` function. To draw the `Entity`, call the `draw()` method in your `love.draw()` function.

Here is a whole program, using the default `Entity` image:

```lua
local Entity = require 'core/entity'

function love.load()
  img = love.graphics.newImage('player.png') -- Load the player sprite
  player = Entity:new(img, 200, 200) -- Create the Entity object named player
end

function love.update(dt)
  -- You don't have to update anything
end

function love.draw()
  player:draw() -- Draw the entity object named player
end
```

To change the image, just replace the `player.img` attribute with a different image (add this to `love.load()` if you want to test it out, but replace `'pathto/image/filename.png'` with the actual path to your image file):

```lua
player.img = love.graphics.newImage('pathto/image/filename.png')
```

----

# The Map Class

The `Map` class is used to create `Map` objects, which are 2D matrices filled with `Tile` objects. Here is some information about `Map` objects:

### Attributes

| Name | Type | Description |
| ---- | ---- | ----------- |
| `matrix` | table | A 1D or 2D table, with each index containing a `Tile` object |
| `x` | integer | Offsets the location of the `Tile.x` values stored in `matrix` |
| `y` | integer | Offsets the location of the `Tile.y` values stored in `matrix` |

### Methods

| Name | Returns | Description |
| ---- | ------- | ----------- |
| `Map:new(x, y)` | `object` | Creates an `Map` object with dimensions `x` by `y` using default texture|
| `Map:new(template)` | `object` | Create a `Map` object that mirrors `template`. `template` is a 1D or 2D table with image data representing the different tiles. The `Tile` objects will be sized based on the size of the first tile. |
| `Map:draw()` | `nil` | Calls `Tile:draw()` on every tile in the `matrix` |
| `Map:cc(x, y, w, h)` | `boolean` | Returns a `true` or `false` value based on whether or not the given rectangle is overlapping with a tile in the `matrix` |

## How to Use

You can create a `Map` object using the `Map:new()` function. First, remember to `require` the `'core/map'` file at the top of your code, before `love.load()`:

```lua
local Map = require 'core/map'
```

Then, you can make a new `Map` object in your `love.load()` function. To draw the `Map` object, call the `Map:draw()` function on it. Here is a full example that you can try:

```lua
local Map = require 'core/map'

function love.load()
  map = Map:new(5, 5) -- Create a 5 x 5 map object named "map"
end

function love.update(dt)
  -- Nothing to update
end

function love.draw()
  map:draw()
end
```

To make a custom table, you can create a `template` data structure that you can pass into `Map:new(template)`. The `template` will determine the size of the map and the textures that get loaded into each `Tile` object. Here is an example:

```lua
local Map = require 'core/map'

function love.load()

  floorTile = love.graphics.newImage('asset.png')
  altar     = love.graphics.newImage('altar-asset.png')
  template = { --a 3 x 3 map with the altar texture in the middle
               {floorTile, floorTile, floorTile},
               {floorTile, altar, floorTile},
               {floorTile, floorTile, floorTile},
             }
  map = Map:new(template)
end

function love.update(dt)
  -- Nothing to update
end

function love.draw()
  map:draw()
end
```

## Collisions in the Map

If you want to check the map for collisions, you can use the `Map:cc(x, y, w, h)` function. The function returns a `true` value if the rectangle is overlapping with any part of the map, and `false` value if it isn't.

Here's how you can use the `Map:cc(x, y, w, h)` function. Follow the steps in order, adding to the code as you go.

#### Step 1: Creating the Collision Map

You will have two maps in your game: the background, and the collision map. The collision map stores all of the tiles that you don't want the character to overlap with. Here's an example of a `love.load()` function that would work for this goal:

```lua
local Map = require 'core/map'
local Util = require 'core/util'

function love.load()
  -- Create the player variables
  img = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  x = 400
  y = 300

  -- Create the background map
  floor = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  background = {
    {floor, floor, floor, floor},
    {floor, floor, floor, floor},
    {floor, floor, floor, floor},
    {floor, floor, floor, floor},
  }

  -- Create the collision map, with walls around the edge of the map
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  collision = {
    {wall, wall, wall, wall},
    {wall, nil, nil, wall},
    {wall, nil, nil, wall},
    {wall, nil, nil, wall},
  }
end
```

Add to your code so you have two maps, each with a different name. One map will store the tiles you want to collide with, one will store the background. Create blank spaces by using `nil` instead of an image variable.

#### Step 2: Collide with the Map

Next, you need to choose which map to collide with. Use the same collision code that you have for your player movement. Right now, it probably looks like this:

```lua
function love.update(dt)
  if love.keyboard.isDown('up') then
    if cc(x, y, 64, 64, 100, 200, 64, 64) then
      y = y - 1
    end
  end
  if love.keyboard.isDown('down') then
    if cc(x, y, 64, 64, 100, 200, 64, 64) then
      y = y + 1
    end
  end
  if love.keyboard.isDown('right') then
    if cc(x, y, 64, 64, 100, 200, 64, 64) then
      x = x + 1
    end
  end
  if love.keyboard.isDown('left') then
    if cc(x, y, 64, 64, 100, 200, 64, 64) then
      x = x - 1
    end
  end
end

```

Instead of just colliding with one tile, you need to collide with the whole collision map. Change your code so it looks like this:

```lua
function love.update(dt)
  if love.keyboard.isDown('up') then
    if collision:cc(x, y, 64, 64) == false then
      y = y - 1
    end
  end
  if love.keyboard.isDown('down') then
    if collision:cc(x, y, 64, 64) == false then
      y = y + 1
    end
  end
  if love.keyboard.isDown('right') then
    if collision:cc(x, y, 64, 64) == false then
      x = x + 1
    end
  end
  if love.keyboard.isDown('left') then
    if collision:cc(x, y, 64, 64) == false then
      x = x - 1
    end
  end
end
```

I used `collision:cc(x, y, 64, 64)` because I named my collision map `collision`. I used `x`, `y`, `64`, and `64` because those numbers represent the player rectangle. I don't need to give it a second rectangle because it checks the whole map.

#### Step 3: Draw Your Maps

Finally, you can draw your maps. The order matters; you will want to draw your background map first, followed by your collision map, followed by the character. Here is an example:

```lua
function love.draw()
  background:draw()
  collision:draw()
  love.graphics.draw(img, x, y)
end
```

----


# Collisions

Collisions happen when the game senses that two rectangles are overlapping. We can trigger different events when these rectangles overlap; for example, you could make the player's HP decrease while the "player" rectangle is overlapping with the "enemy" rectangle.

Here's some information about the collision detection function I have provided:

| Function |  Returns | Description |
| -------- | -------- | ----------- |
| `cc(x1, y1, w1, h1, x2, y2, w2, h2)` | `boolean` | Given the coordinates and size of two rectangles, return `true` if they are overlapping. Otherwise, return `false`. |

## Collision Detection: How To

To sense if two rectangles are overlapping, first import the `util.lua` file that contains the function definition for the function that checks collisions. **Put this line of code at the top of your `main.lua` file, before `love.load()`**:

```lua
local Util = require 'core/util'
```

Then, use the `cc()` function to check if two rectangles are overlapping. The function will **return** a value of `true` if the rectangles are overlapping, and a value of `false` if the rectangles are not overlapping. You can use this function in an `if()` statement to trigger different events based on what rectangles the player is overlapping with. Here is an example program that prints out an HP value, and that makes the value of HP decrease when the player is in the top left corner of the screen:

```lua
local Util = require 'core/util'

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game
end

function love.update(dt)
  -- Set up player movement
  if love.keyboard.isDown('up') then
    y = y - 1
  end
  if love.keyboard.isDown('down') then
    y = y + 1
  end
  if love.keyboard.isDown('left') then
    x = x - 1
  end
  if love.keyboard.isDown('right') then
    x = x + 1
  end

  -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
  if cc(x, y, w, h,   0, 0, 64, 64) then  
    -- if true, decrease HP:
    hp = hp - 1
  end
end

function love.draw()
  -- Draw the player
  love.graphics.draw(playerImg, x, y)

  -- Draw the rectangle in the upper left corner
  love.graphics.rectangle('line', 0, 0, 64, 64)

  -- Print the player's HP in the top left corner
  love.graphics.print(hp, 0, 0)
end

```

## Collision with Tiles

Use the following example to prevent player movement into a certain space:

```lua
local Map = require 'core/map'
local Util = require 'core/util'

function love.load()
  img = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  x = 400
  y = 300
end

function love.update(dt)
  if love.keyboard.isDown('up') then
    if cc(x, y, 64, 64, 100, 200, 64, 64) == false then
      y = y - 1
    end
  end
  if love.keyboard.isDown('down') then
    if cc(x, y, 64, 64, 100, 200, 64, 64) == false then
      y = y + 1
    end
  end
  if love.keyboard.isDown('right') then
    if cc(x, y, 64, 64, 100, 200, 64, 64) == false then
      x = x + 1
    end
  end
  if love.keyboard.isDown('left') then
    if cc(x, y, 64, 64, 100, 200, 64, 64) == false then
      x = x - 1
    end
  end
end

function love.draw()
  love.graphics.draw(img, x, y)
end

```

I have not included a map in this example; follow the instructions in the [Map](#maps) section for information on adding a map.

## Collisions in the Map

If you want to check the map for collisions, you can use the `Map:cc(x, y, w, h)` function. The function returns a `true` value if the rectangle is overlapping with any part of the map, and `false` value if it isn't.

Here's how you can use the `Map:cc(x, y, w, h)` function. Follow the steps in order, adding to the code as you go.

#### Step 1: Creating the Collision Map

You will have two maps in your game: the background, and the collision map. The collision map stores all of the tiles that you don't want the character to overlap with. Here's an example of a `love.load()` function that would work for this goal:

```lua
local Map = require 'core/map'
local Util = require 'core/util'

function love.load()
  -- Create the player variables
  img = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  x = 400
  y = 300

  -- Create the background map
  floor = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  background = {
    {floor, floor, floor, floor},
    {floor, floor, floor, floor},
    {floor, floor, floor, floor},
    {floor, floor, floor, floor},
  }

  -- Create the collision map, with walls around the edge of the map
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  collision = {
    {wall, wall, wall, wall},
    {wall, nil, nil, wall},
    {wall, nil, nil, wall},
    {wall, nil, nil, wall},
  }
end
```

Add to your code so you have two maps, each with a different name. One map will store the tiles you want to collide with, one will store the background. Create blank spaces by using `nil` instead of an image variable.

#### Step 2: Collide with the Map

Next, you need to choose which map to collide with. Use the same collision code that you have for your player movement. Right now, it probably looks like this:

```lua
function love.update(dt)
  if love.keyboard.isDown('up') then
    if cc(x, y, 64, 64, 100, 200, 64, 64) then
      y = y - 1
    end
  end
  if love.keyboard.isDown('down') then
    if cc(x, y, 64, 64, 100, 200, 64, 64) then
      y = y + 1
    end
  end
  if love.keyboard.isDown('right') then
    if cc(x, y, 64, 64, 100, 200, 64, 64) then
      x = x + 1
    end
  end
  if love.keyboard.isDown('left') then
    if cc(x, y, 64, 64, 100, 200, 64, 64) then
      x = x - 1
    end
  end
end

```

Instead of just colliding with one tile, you need to collide with the whole collision map. Change your code so it looks like this:

```lua
function love.update(dt)
  if love.keyboard.isDown('up') then
    if collision:cc(x, y, 64, 64) then
      y = y - 1
    end
  end
  if love.keyboard.isDown('down') then
    if collision:cc(x, y, 64, 64) then
      y = y + 1
    end
  end
  if love.keyboard.isDown('right') then
    if collision:cc(x, y, 64, 64) then
      x = x + 1
    end
  end
  if love.keyboard.isDown('left') then
    if collision:cc(x, y, 64, 64) then
      x = x - 1
    end
  end
end
```

I used `collision:cc(x, y, 64, 64)` because I named my collision map `collision`. I used `x`, `y`, `64`, and `64` because those numbers represent the player rectangle. I don't need to give it a second rectangle because it checks the whole map.

#### Step 3: Draw Your Maps

Finally, you can draw your maps. The order matters; you will want to draw your background map first, followed by your collision map, followed by the character. Here is an example:

```lua
function love.draw()
  background:draw()
  collision:draw()
  love.graphics.draw(img, x, y)
end
```



----

# Camera

The `gamera` is a camera that automatically scales and repositions the camera.

## How to Use

First, you need to `require` the `gamera` at the top of your code. This imports the library and allows you to use it in your code.

```lua
local gamera = require 'core/gamera'
```

Then, you should make the camera and store it in a data structure. **Put something like this in your `love.load()` function:**

```lua
cam = gamera.new(0, 0, 2000, 2000) -- Create a camera that can move in a rectangle from 0, 0 to 2000, 2000
```

To change the position of your camera, use the `gamera:setPosition(x, y)` method. This will likely go in your `love.update(dt)` function:

```lua
cam:setPosition(400, 400)
```

Remember that you can use a variable anywhere where you see a number...

Finally, you need to invoke the camera when you draw anything to the screen. To make this happen, set up your `love.draw()` function accordingly:

```lua
function love.draw()
  cam:draw(function(l, t, w, h)

  --Draw everything here. For example:
  love.graphics.draw(playerImg, x, y)

  end)
end
```

----
