press_d = 0
press_q = 0
press_z = 0
press_e = 0
press_up = 0
press_left = 0
press_right = 0
press_space = 0
press_escape = 0


var atk;
atk = instance_place(x, y, oLaser);
if atk != noone and atk.parent != id
   {ene = atk.parent
	combat = 1
	cruise = 0}

trajectoire = point_direction(x,y,v_x,v_y) - 90
diff_traj = trajectoire - image_angle
if trajectoire - image_angle > 180
	{diff_traj = trajectoire - image_angle - 360}
if trajectoire - image_angle  < -180
	{diff_traj = trajectoire - image_angle + 360}

if combat
{

if (distance_to_object(ene) > 200)
	{press_z = 1}
else
	{press_z = false}
direction_vis = point_direction(x,y,ene.x - (ene.v_x*distance_to_object(ene))/v_laser,ene.y  - (ene.v_y*distance_to_object(ene))/v_laser) - 90
ene_vis = direction_vis - ene.turret_angle
if direction_vis - ene.turret_angle > 180
	{ene_vis = direction_vis - ene.turret_angle - 360}
if ene_vis = direction_vis - ene.turret_angle < -180
	{ene_vis = direction_vis - ene.turret_angle + 360}

if ene.dead == 1
{combat = 0
cruise = 1}

if turret_mode == 0
{if (ene_vis <= 0 and ene_vis >= -360) or (ene_vis > 180 and ene_vis < 360)
	{press_left = 0
	press_right = 1}
else
	{press_left = 1
	press_right = 0}
show_debug_message(diff_vis)

if (diff_vis < 15 and diff_vis > -15 and distance_to_object(ene) < v_laser*laser_vie + 200) or distance_to_object(ene) < 300
{press_space = 1}
else
{press_space = 0}
}

else
{diff_vis_turret = direction_vis - turret_angle
if direction_vis - turret_angle > 180
	{diff_vis_turret = direction_vis - turret_angle - 360}
if direction_vis - turret_angle < -180
	{diff_vis_turret = direction_vis - turret_angle + 360}

if (diff_vis_turret <= 0 and diff_vis_turret >= -360) or (diff_vis_turret > 180 and diff_vis_turret < 360)
	{press_left = 0
	press_right = 1}
else
	{press_left = 1
	press_right = 0}

if direction_vis < image_angle + 10 && direction_vis > image_angle - 10
	{press_left = 0
	press_right = 0}
}

}
if cruise
{press_space = 0
if distance_to_point(desti.x,desti.y) < 100
{desti = oControl.planet[random_range(0,instance_number(oPlanet))]}
direction_vis = point_direction(x,y,desti.x,desti.y) - 90

if turret_mode ==0
{if (diff_traj<= 0 and diff_traj >= -360) or (diff_traj > 180 and diff_traj < 360)
	{press_right = 1
	press_left = 0}
else
	{press_right = 0
	press_left = 1}

if diff_traj < image_angle + 10 && diff_traj > image_angle - 10
	{press_right = 0
	press_left = 0}}

if distance_to_point(desti.x,desti.y) < 400 and v > 10
{press_z = 0}
else
{press_z = 1}
}

if cruise == 0 and combat == 0
{direction_vis = 0}

diff_vis = direction_vis - image_angle
if direction_vis - image_angle > 180
	{diff_vis = direction_vis - image_angle - 360}
if direction_vis - image_angle < -180
	{diff_vis = direction_vis - image_angle + 360}


if (diff_vis <= 0 and diff_vis >= -360) or (diff_vis > 180 and diff_vis < 360)
	{press_d = 1
	press_q = 0}
else
	{press_d = 0
	press_q = 1}

if direction_vis < image_angle + 10 && direction_vis > image_angle - 10
	{press_d = 0
	press_q = 0}
