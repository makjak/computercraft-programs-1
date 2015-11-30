--[[
Copyright (c) 2015 
Robert David Alkire II, IGN ian_xw
Distributed under the MIT License.
(See accompanying file LICENSE or copy
at http://opensource.org/licenses/MIT)
]]

-- assigns fake/real turtle
local t
if turtle then
  t = turtle
else
  t = require "mockTurtle"
end

Locus = {}
Locus.__index = Locus
Locus.x = 0
Locus.y = 0
Locus.z = 0
-- Sets the location for the center
-- block
Locus.new= function( x, y, z )
  local self = setmetatable({}, Locus)
  self.x = x
  self.y = y
  self.z = z
  return self
end

local deadReckoner = {}
local dr = deadReckoner

deadReckoner.FORE = 0
deadReckoner.STARBOARD = 1
deadReckoner.AFT = 2
deadReckoner.PORT = 3

deadReckoner.heading=deadReckoner.FORE

deadReckoner.place=Locus.new(0, 0, 0)

-- TODO calculate howFarFromHome
-- with each move
deadReckoner.howFarFromHome = 0

-- Turns as needed to face the 
-- target direction indicated
deadReckoner.bearTo= function(target)

  local WAYS = {}
  WAYS[deadReckoner.FORE] = "FORE"
  WAYS[deadReckoner.STARBOARD]= 
      "STARBOARD"
  WAYS[deadReckoner.AFT] = "AFT"
  WAYS[deadReckoner.PORT] = "PORT"

  local trnsRght = 
      target - deadReckoner.heading
  
  local trns = math.abs( trnsRght )
  if trns ~= 0 then
    local i = 0
    while i < trns do
      if trnsRght >= 0 then
        t.turnRight()
      else
        t.turnLeft()
      end -- which way
      i = i + 1
    end -- turn loop
  end -- there were any turns
  
  deadReckoner.heading = target
end

-- Tries to move ahead. If successful,
-- it updates its current location
-- relative to where it started and 
-- returns true.
-- Else, it returns false and the
-- reason why not.
deadReckoner.moveAhead= function()
  local isAble, whynot = t.forward()
  
  if isAble then
    if dr.heading== dr.AFT then
      dr.place.z= dr.place.z - 1
    elseif dr.heading== dr.FORE then
      dr.place.z= dr.place.z + 1
    elseif dr.heading== dr.PORT then
      dr.place.x= dr.place.x- 1
    else
      dr.place.x= dr.place.x+ 1
    end
    
  end
  
  return isAble, whynot
end

return deadReckoner
