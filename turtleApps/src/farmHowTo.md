# farm.lua 1.2.x
for computercraft 1.63 and above

## Basic Usage

I assume that you're lazy like me, and
have dowloaded this as a file called 
"frm".

Place the robot at the field's lower 
left corner, and put a chest behind it.

Put wheat seeds, carrots and/or 
potatoes in the turtle's first few 
inventory slots, some fuel in its 9th 
slot, launch with:

        frm length [rows]

For example for a 10 x 10 field, type:

        frm 10

If you want to use a rectangular field
without blocking, also specify rows:

        frm 10 12

Or you can use 0 as the sole parameter 
if you block the robot at the corners.
Note: Make the blocks two-high, since
the robot now works from there.  

        frm 0

If it isn't blocked, the program will 
estimate the width of the largest 
square field that it can harvest and 
re-plant, given the amount of fuel. 
This may not be appropriate for worlds
where fuel is not needed/unlimited.

If you only use one crop and only the
first slot, the robot will leave a gap
of farmland between rows, since the 
crops grow more quickly that way.

## Somewhat More Advanced Usage

If you don't want the gaps, just put 
the same kind of seeds in the the first
two slots.  Otherwise when you 
alternate seed types in the inventory
slots, the robot will alternate crops
accordingly. After those first few, 
leave a gap in the inventory to tell 
the turtle where the references stop.

If you need more clarity, below is a
table-grid of the robot's inventory.
First, the symbols:

- S1, S2, S3: Alternating wheat seeds, 
	carrots or potatoes. Slot one must
	have at least one item; the other 
	slots are optional. They're 
	"reference" seeds.
- F: Fuel
- b: blank. The point is, there must be 
	a blank right after the reference 
	seeds.
- w: Anything or nothing. whatever.

The inventory should look like this.

| S1 | S2*| S3*| b |
|----|----|----|---|
| w  |  w |  w | w |
| F  |  w |  w | w |
| w  |  w |  w | w |

After working the field, if there's 
fuel remaining, it will wait 40 minutes
from when it began then repeat the 
cycle.

See http://computercraft.info for more
about robot turtles.
