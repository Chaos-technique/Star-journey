///respawn
dead = 0
if instance_number(oPlanet) != 0
{x = oControl.planet[Faction].x
y = oControl.planet[Faction].y}
else
{x = 0
y = 0}
v_x = 0
v_y = 0
mode = 1
hp = hpmax