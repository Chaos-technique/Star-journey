function Ia_1() {
	press_d = 0
	press_q = 0
	press_z = 0
	press_s = 0
	press_e = 0
	press_up = 0
	press_left = 0
	press_right = 0
	press_space = 0
	press_escape = 0
	direction_vis = 0

	if i3 == noone
	{i3 = 0}

	
	var atk;
	atk = instance_place(x, y, oLaser);
	if atk != noone
	{if (Faction == 0 or atk.parent.Faction != Faction) and atk.parent != id and mode != 0
	{ene = atk.parent
	mode = 2}}

	scan = instance_find(oPerso,i3)

	if Faction == 1 and mode != 2
	{if distance_to_object(scan) < 1000
		{if scan.Faction == 2
			{ene = scan
			mode = 2}
	}
	}
	if Faction == 2 and mode != 2
	{if distance_to_object(scan) < 1000
		{if scan.Faction == 1
			{ene = scan
			mode = 2}
	}
	}

	///à améliorer pour que les vaisseau reste à coté

	if scan != noone and Faction != 0 and mode == 1 and vaisseau_type != 5
	{
	if (scan.vaisseau_type == 5 or scan.vaisseau_type == 7) and Faction == scan.Faction and distance_to_object(scan) < 1000 and dice() >= 7
		{desti = scan
		angle_escort = irandom_range(0,360)
		mode = 3
		alarm[5] = 20000
		with (desti)
		{if ds_list_empty(escort_list)
			{ds_list_add(escort_list,other.id)}
		else
			{escort_list = ds_list_create()
			ds_list_add(escort_list,id,other.id)}}
		}
	}


	trajectoire = point_direction(x,y,v_x,v_y) - 90
	diff_traj = trajectoire - image_angle
	if trajectoire - image_angle > 180
		{diff_traj = trajectoire - image_angle - 360}
	if trajectoire - image_angle  < -180
		{diff_traj = trajectoire - image_angle + 360}

	if mode == 2
	{Ia_combat()}
	
	if mode == 1
	{Ia_cruise()}

	if mode == 0
	{direction_vis = 0}
	
	if mode == 3
	{if distance_to_point(desti.x + 700*cos(degtorad(angle_escort)),desti.y + 700*sin(degtorad(angle_escort))) < 40
	{press_z = 0}
	else
	{press_z = 1}
	direction_vis = point_direction(x,y,desti.x + 700*cos(degtorad(angle_escort)),desti.y+ 700*sin(degtorad(angle_escort))) - 90
	}

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

	///Strat
	if ds_exists(escort_list,ds_type_list)
	{///show_debug_message(escort_list)
		}

	i3 +=1
	if i3 > instance_number(oPerso)
	{i3 = 0}


}
