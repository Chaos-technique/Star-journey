if room == room0
{if instance_number(oPerso) <= 20
{with (instance_create_layer(0,0,"vaisseau",oPerso))
{IA = 1
vaisseau_type = irandom_range(2,6)
Faction = irandom_range(0,1)
x = irandom_range(-15000,15000)
y = irandom_range(-15000,15000)
event_user(0)}
}

spawn_epave_x = irandom_range(-15000,15000)
spawn_epave_y = irandom_range(-15000,15000)

if  instance_number(oEpave) < 1
{
with (instance_create_layer(spawn_epave_x,spawn_epave_y,"vaisseau",oEpave))
{while distance_to_object(oPlanet) < 600
{x = irandom_range(-15000,15000)
y = irandom_range(-15000,15000)}
fill = 1
destruct = 0
}
}
}