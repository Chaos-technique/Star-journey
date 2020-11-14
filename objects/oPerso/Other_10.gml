
if (vaisseau_type ==1)
{sprite_index = sVaisseau1
v_angle = 4;
v_max = 17;
accel = 1;
frein = 0.02;
frein2 = 0.09
v_maxlr = 6;
accellr = 1.5;
fire_rate = 18;
v_laser = 40;
laser_vie = 15;
nbr_laser= 1;
dmg = 15
precision = 0
hpmax = 125
turret_mode = 0
crew_max = 0}
if (vaisseau_type ==2)
{if Faction == 0
{sprite_index = sVaisseau2}
if Faction == 1
{sprite_index = sVaisseau2pir}
if Faction == 2
{sprite_index = sVaisseau2vig}
v_angle = 5;
v_max = 28;
accel = 1;
frein = 0.02;
frein2 = 0.08
v_maxlr = 12;
accellr = 1;
fire_rate = 9;
v_laser = 50;
laser_vie = 10;
nbr_laser= 1;
dmg = 20
precision = 5
hpmax = 150
turret_mode = 0
crew_max = 1

with (instance_create_layer(x ,y ,"laser",oBouclier))
	{parent = other.id
	bcl_type = 1
	bcl_part = 1}
with (instance_create_layer(x ,y ,"laser",oBouclier))
	{parent = other.id
	bcl_type = 1
	bcl_part = 2}
with (instance_create_layer(x ,y ,"laser",oBouclier))
	{parent = other.id
	bcl_type = 1
	bcl_part = 3}
with (instance_create_layer(x ,y ,"laser",oBouclier))
	{parent = other.id
	bcl_type = 1
	bcl_part = 4}

}
if (vaisseau_type ==3)
{if Faction == 0
{sprite_index = sVaisseau3}
if Faction == 1
{sprite_index = sVaisseau3pir}
if Faction == 2
{sprite_index = sVaisseau3vig}
v_angle = 4.5;
v_max = 22;
accel = 0.75;
frein = 0.02;
frein2 = 0.06
v_maxlr = 10;
accellr = 1;
fire_rate = 20;
v_laser = 50;
laser_vie = 15;
nbr_laser= 2;
dmg = 30
precision = 0
hpmax = 350
turret_mode = 0
crew_max = 3}
if (vaisseau_type ==4)
{if Faction == 0
{sprite_index = sVaisseau4}
if Faction == 1
{sprite_index = sVaisseau4pir}
if Faction == 2
{sprite_index = sVaisseau4vig}
v_angle = 3;
v_max = 28;
accel = 0.75;
frein = 0.02;
frein2 = 0.04
v_maxlr = 6;
accellr = 1;
fire_rate = 8;
v_laser = 60;
laser_vie = 15;
nbr_laser= 1;
dmg = 20
precision = 2
hpmax = 450
turret_mode = 0
crew_max = 5}
if (vaisseau_type ==5)
{if Faction == 0
{sprite_index = sVaisseau5}
if Faction == 1
{sprite_index = sVaisseau5pir}
if Faction == 2
{sprite_index = sVaisseau5vig}
v_angle = 1.25;
v_max = 20;
accel = 0.25;
frein = 0.01;
frein2 = 0.03
v_maxlr = 6;
accellr = 3;
fire_rate = 8;
v_laser = 60;
laser_vie = 15;
nbr_laser= 2;
dmg = 20
precision = 1
hpmax = 1000
turret_mode = 1
crew_max = 7}
if (vaisseau_type ==6)
{if Faction == 0
{sprite_index = sVaisseau6
spr_bas = sVaisseau6}
if Faction == 1
{sprite_index = sVaisseau6pir
spr_bas = sVaisseau6pir}
if Faction == 2
{sprite_index = sVaisseau6vig
spr_bas = sVaisseau6vig}
v_angle = 6;
v_max = 35;
accel = 1;
frein = 0.02;
frein2 = 0.2
v_maxlr = 6;
accellr = 3;
fire_rate = 7;
v_laser = 70;
laser_vie = 13.5;
nbr_laser= 1;
dmg = 20
precision = 1
hpmax = 300
turret_mode = 0
crew_max = 2}
if (vaisseau_type ==7)
{sprite_index = sVaisseau7
v_angle = 1.25;
v_max = 20;
accel = 0.4;
frein = 0.01;
frein2 = 0.05
v_maxlr = 2;
accellr = 1;
fire_rate = 6;
v_laser = 60;
laser_vie = 20;
nbr_laser= 3;
dmg = 20
precision = 4
hpmax = 1300
turret_mode = 0
crew_max = 5}
hp = hpmax

angle_diag = radtodeg(arcsin(v_maxlr/v_max))
v_maxdiag = sqrt((v_maxlr*v_maxlr*v_max*v_max)/(v_maxlr*v_maxlr*cos(degtorad(135))*cos(degtorad(135))+v_max*v_max*sin(degtorad(135))*sin(degtorad(135))))