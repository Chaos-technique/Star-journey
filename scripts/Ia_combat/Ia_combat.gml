// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Ia_combat(){
	if (distance_to_object(ene) > 800)
		{press_z = 1}
	else
		{press_z = false}
	direction_vis = point_direction(x,y,ene.x,ene.y) - 90 ///  - (ene.v_y*distance_to_object(ene))/v_laser
	ene_vis = direction_vis - ene.turret_angle
	if direction_vis - ene.turret_angle > 180
		{ene_vis = direction_vis - ene.turret_angle - 360}
	if ene_vis = direction_vis - ene.turret_angle < -180
		{ene_vis = direction_vis - ene.turret_angle + 360}

	if ene.dead == 1
	{mode = 1}

	if turret_mode == 0
	{if (ene_vis <= 20 and ene_vis >= -360) or (ene_vis > 180 and ene_vis < 360)
		{press_left = 0
		press_right = 1}
	else
		{press_left = 1
		press_right = 0}
	
	if ene_vis > -20 and ene_vis < 20
		{press_left = 0
		press_right = 0}


	diff_vis = direction_vis - image_angle
	if direction_vis - image_angle > 180
		{diff_vis = direction_vis - image_angle - 360}
	if direction_vis - image_angle < -180
		{diff_vis = direction_vis - image_angle + 360}
	
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

	if (diff_vis_turret < 15 and diff_vis_turret > -15 and distance_to_object(ene) < v_laser*laser_vie + 200) or distance_to_object(ene) < 300
	{press_space = 1}
	else
	{press_space = 0}
	
	
	}
	
	with collision_line(x, y,ene.x ,ene.y, oPerso,true,true )
		{if id != other.ene and other.ene.Faction != Faction
			{other.press_space = 0}}
	
	if distance_to_object(ene) > 3000
	{mode = 1}
}