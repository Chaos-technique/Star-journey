if dead
{press_d = 0
press_q = 0
press_z = 0
press_e = 0
press_up = 0
press_left = 0
press_right = 0
press_space = 0
press_escape = 0}

var spin = press_q - press_d;
var lateral = press_left- press_right 
angle += spin*v_angle;
turret_angle += spin*v_angle;

if angle >= 360 or angle <= -360
{angle= 0}
if turret_angle >= 360 or turret_angle <= -360
{turret_angle= 0}
image_angle = angle;
v = sqrt(v_x*v_x + v_y*v_y)
///animation
if (v ==0)
{image_index = 0
image_speed = 0}
else if (v < v_max-2)
{image_index = 1}
else if (v > v_max-2)
{image_speed = 1
if (image_index ==0)
{image_index = 2}
}


if hp <=0 and dead == 0
{dead = 1
special_activ = 0
instance_create_layer(x,y,"laser",oExplosion)
alarm[1] = 70
if vaisseau_type == 4
{instance_create_layer(x +100*sin(degtorad(angle)),y +100*cos(degtorad(angle)),"laser",oExplosion)
instance_create_layer(x +40*cos(degtorad(angle))-40*sin(degtorad(angle)),y-40*cos(degtorad(angle))+40*sin(degtorad(angle)),"laser",oExplosion)}
if vaisseau_type == 5
{instance_create_layer(x +300*sin(degtorad(angle)),y +300*cos(degtorad(angle)),"laser",oExplosion)
instance_create_layer(x +40*cos(degtorad(angle))-40*sin(degtorad(angle)),y-40*cos(degtorad(angle))+40*sin(degtorad(angle)),"laser",oExplosion)
instance_create_layer(x +70*cos(degtorad(angle))+70*sin(degtorad(angle)),y+70*cos(degtorad(angle))+70*sin(degtorad(angle)),"laser",oExplosion)}

}

///pulse


if (press_z)
{
	if (v < v_max)  and ((not special_activ and vaisseau_type == 2) or vaisseau_type != 2 )
	{
	v_x += accel*sin(degtorad(angle));
	v_y += accel*cos(degtorad(angle));
	}
	if (v >0)
	{v_x -= frein*(v_x/v);
	v_y -= frein*(v_y/v);}
	if special_activ and vaisseau_type == 2
	{v_x = v_max*sin(degtorad(angle));
	v_y = v_max*cos(degtorad(angle));}
}
else {if (v >0) and ((not special_activ and vaisseau_type == 2) or vaisseau_type != 2 )
{v_x -= frein*(v_x/v);
v_y -= frein*(v_y/v);}
	if (v_x > -1 && v_x <1)
		{v_x=0}
	if (v_y > -1 && v_y <1)
		{v_y=0}
}

///pulse lr
if turret_mode = 0
{
vlr = sqrt(v_xlr*v_xlr + v_ylr*v_ylr)
if (press_left ||press_right)
	{if (vlr < v_maxlr) and ((not special_activ and vaisseau_type == 2) or vaisseau_type != 2 )
		{v_xlr += accellr*cos(degtorad(-angle))*lateral
		v_ylr += accellr*sin(degtorad(-angle))*lateral}
	else if (vlr >0) and ((not special_activ and vaisseau_type == 2) or vaisseau_type != 2 )
	{v_xlr -= accellr*(v_xlr/vlr)
	v_ylr -= accellr*(v_ylr/vlr)}
	
	if special_activ and vaisseau_type == 2
	{v_x = v_max*cos(degtorad(-angle))*lateral
	v_y = v_max*sin(degtorad(-angle))*lateral}
}
else {if (vlr >0) and ((not special_activ and vaisseau_type == 2) or vaisseau_type != 2 )
	{v_xlr -= accellr*(v_xlr/vlr)
	v_ylr -= accellr*(v_ylr/vlr)}
if (v_xlr > -1 && v_xlr <1)
{v_xlr = 0}
if (v_ylr > -1 && v_ylr <1)
{v_ylr = 0}
}
}
show_debug_message(special_activ)
if turret_mode = 1
{turret_angle += accellr*lateral}
x -= v_x + v_xlr
y -= v_y + v_ylr
//fire


if (vaisseau_type ==1)
{center1_lx = x-45*sin(degtorad(angle));
center1_ly = y-45*cos(degtorad(angle));}
if (vaisseau_type ==2)
{center1_lx = x-70*sin(degtorad(angle));
center1_ly = y-70*cos(degtorad(angle));}
if (vaisseau_type ==3)
{center1_lx = x-15*sin(degtorad(angle)) + 40*cos(-degtorad(angle));
center1_ly = y-15*cos(degtorad(angle)) + 40*sin(-degtorad(angle));
center2_lx = x-15*sin(degtorad(angle)) - 40*cos(-degtorad(angle));
center2_ly = y-15*cos(degtorad(angle)) - 40*sin(-degtorad(angle));}
if (vaisseau_type ==4)
{center1_lx = x-80*sin(degtorad(angle));
center1_ly = y-80*cos(degtorad(angle));}
if (vaisseau_type ==5)
{center1_lx = x-45*sin(degtorad(angle));
center1_ly = y-45*cos(degtorad(angle));
center2_lx = x+100*sin(degtorad(angle));
center2_ly = y+100*cos(degtorad(angle));}
if (vaisseau_type ==6)
{center1_lx = x-70*sin(degtorad(angle));
center1_ly = y-70*cos(degtorad(angle));}

l_x = center1_lx -800*sin(degtorad(angle));
l_y = center1_ly -800*cos(degtorad(angle));


if (is_firing == true) && (press_space)
{if turret_mode == 0
	{l_x = center1_lx -800*sin(degtorad(angle));
	l_y = center1_ly -800*cos(degtorad(angle));}
if turret_mode == 1
	{l_x = center1_lx -800*sin(degtorad(turret_angle));
	l_y = center1_ly -800*cos(degtorad(turret_angle));}

with (instance_create_layer(center1_lx ,center1_ly ,"laser",oLaser))
{laser_type = 0
parent = other.id
alarm[0] = parent.laser_vie;
speed = parent.v_laser+parent.v;
direction = point_direction(x,y,parent.l_x,parent.l_y)
direction += random_range(-parent.precision,parent.precision);
image_angle = direction -90;
dmg = 10}
if (nbr_laser >= 2)
{if turret_mode == 0
	{l_x = center2_lx -800*sin(degtorad(angle));
	l_y = center2_ly -800*cos(degtorad(angle));}
if turret_mode == 1
	{l_x = center2_lx -800*sin(degtorad(turret_angle));
	l_y = center2_ly -800*cos(degtorad(turret_angle));}

with (instance_create_layer(center2_lx ,center2_ly ,"laser",oLaser))
{laser_type = 0
parent = other.id
alarm[0] = parent.laser_vie;
speed = parent.v_laser+parent.v;
direction = point_direction(x,y,parent.l_x,parent.l_y)
direction += random_range(-parent.precision,parent.precision);
image_angle = direction -90;
dmg = 10}}
is_firing = false
alarm[0]=fire_rate}

///se poser
if (press_e)
{att = true}
if (att && place_meeting(x,y,oPlanet))
{if (image_xscale > 0.1)
	{image_xscale -= 0.05
	image_yscale -= 0.05}
}

///special
if press_up and not special
{special = 1

if vaisseau_type == 2
{alarm[2]= 300
special_activ = 1
alarm[3]= 250}

if vaisseau_type == 3
{alarm[2]= 300
with (instance_create_layer(center1_lx ,center1_ly ,"laser",oLaser))
{laser_type = 3
parent = other.id
alarm[0] = 50;
speed = 25+parent.v;
direction = point_direction(x,y,parent.l_x,parent.l_y)
image_angle = direction -90;
dmg = 150}
l_x = center2_lx -800*sin(degtorad(angle));
l_y = center2_ly -800*cos(degtorad(angle));
with (instance_create_layer(center2_lx,center2_ly ,"laser",oLaser))
{laser_type = 3
parent = other.id
alarm[0] = 50;
speed = 25+parent.v;
direction = point_direction(x,y,parent.l_x,parent.l_y)
image_angle = direction -90;
dmg = 150}}
}

if special_activ and vaisseau_type == 2 and anim_spe = 0
{anim_spe = 1
alarm[4] = 10
with instance_create_layer(x,y,"laser",oExplosion)
{sprite_index = sSpecial2
image_angle = other.angle}}

var deg;
deg = instance_place(x, y, oLaser);
if deg != noone and deg.parent != id
   {hp -= deg.dmg;
   with (deg) instance_destroy();
   }