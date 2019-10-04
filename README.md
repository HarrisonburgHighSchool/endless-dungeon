# Endless Dungeon Documentation

This is the documentation f33or the Endless Dungeon Project.

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

----


# Collisions

Under construction

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
