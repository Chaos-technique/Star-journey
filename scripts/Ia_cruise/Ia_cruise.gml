// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Ia_cruise(){
	press_space = 0
	if instance_number(oPlanet) != 0
	{if distance_to_point(desti.x,desti.y) < 100
	{desti = oControl.planet[random_range(0,instance_number(oPlanet))]}
	direction_vis = point_direction(x,y,desti.x,desti.y) - 90

	/*if turret_mode ==0
	{if (diff_traj<= 0 and diff_traj >= -360) or (diff_traj > 180 and diff_traj < 360)
		{press_right = 1
		press_left = 0}
	else
		{press_right = 0
		press_left = 1}

	if diff_traj < image_angle + 10 && diff_traj > image_angle - 10
		{press_right = 0
		press_left = 0}}*/

	if distance_to_point(desti.x,desti.y) < 400 and v > 10
	{press_z = 0}
	else
	{press_z = 1}
	}
}