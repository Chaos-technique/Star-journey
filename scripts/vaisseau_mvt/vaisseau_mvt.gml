function vaisseau_mvt() {
	if dead
	{press_d = 0
	press_q = 0
	press_z = 0
	press_s = 0
	press_e = 0
	press_up = 0
	press_left = 0
	press_right = 0
	press_space = 0
	press_escape = 0
	if IA == 0
	{oMap.flag_define = 0}}

	var spin = press_q - press_d;
	var lateral = press_left- press_right
	
	if press_z and press_s
		{press_z = 0
		press_s = 0}
	if press_left and press_right
		{press_left = 0
		press_right = 0}
	
	if v <= v_max
	{v_anglefin = v_angle - 0.5*v_angle*v/v_max}
	angle += spin*v_anglefin;
	turret_angle += spin*v_anglefin;

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
	instance_create_layer(x +70*cos(degtorad(angle))+70*sin(degtorad(angle)),y+70*cos(degtorad(angle))+70*sin(degtorad(angle)),"laser",oExplosion)}}

	///pulse

	
	if (press_z >0) and (not (press_left ||press_right) or turret_mode == 1)
	{
		if ((not special_activ and vaisseau_type == 2) or vaisseau_type != 2 )
		{if point_distance(v_x,v_y,v_max*press_z*sin(degtorad(angle)),v_max*press_z*cos(degtorad(angle))) > accel
			{v_x += accel*press_z*sin(degtorad(point_direction(v_x,v_y,v_max*sin(degtorad(angle)),v_max*cos(degtorad(angle)))+90))
			v_y += accel*press_z*cos(degtorad(point_direction(v_x,v_y,v_max*sin(degtorad(angle)),v_max*cos(degtorad(angle)))+90))}
		else
			{v_x = v_max*press_z*sin(degtorad(angle))
			v_y = v_max*press_z*cos(degtorad(angle))}}
		if (v > 0)   and (((not special_activ) and vaisseau_type == 2) or vaisseau_type != 2 )
			{v_x -= frein*v_x;
			v_y -= frein*v_y;}
	}
	else{if ((v >0) ) and not (press_left ||press_right) and ((not special_activ and (vaisseau_type == 2 or vaisseau_type == 6)) or (vaisseau_type != 2  or vaisseau_type == 6))
		{if not press_s 
			{v_x -= frein*v_x;
			v_y -= frein*v_y}
		else
			{v_x -= frein2*v_x;
			v_y -= frein2*v_y}
		}
	if (v_x > -frein2 && v_x <frein2) and (v_y > -frein2 && v_y <frein2)
		{v_x = 0
		v_y = 0}
	}

	if oPerso.v > 60
	{show_debug_message(oPerso.v)}
	
	///pulse lr
	if turret_mode = 0
	{
	///vlr = sqrt(v_xlr*v_xlr + v_ylr*v_ylr)
	if (press_left ||press_right) and not press_z >0
		{if ((not special_activ and vaisseau_type == 2) or vaisseau_type != 2 )
		{if point_distance(v_x,v_y,v_maxlr*sin(degtorad(angle+90))*lateral,v_maxlr*cos(degtorad(angle+90))*lateral) > accel
			{v_x += accellr*sin(degtorad(point_direction(v_x,v_y,v_maxlr*cos(degtorad(-angle))*lateral,v_maxlr*sin(degtorad(-angle))*lateral)+90))
			v_y += accellr*cos(degtorad(point_direction(v_x,v_y,v_maxlr*cos(degtorad(-angle))*lateral,v_maxlr*sin(degtorad(-angle))*lateral)+90))
			}
		else
			{v_x = v_maxlr*cos(degtorad(-angle))*lateral
			v_y = v_maxlr*sin(degtorad(-angle))*lateral}
	if (v > 0)
		{v_x -= frein*v_x;
		v_y -= frein*v_y;}}}
		
	if (press_left ||press_right) and press_z >0
		{if ((not special_activ and vaisseau_type == 2) or vaisseau_type != 2 )
		{if point_distance(v_x,v_y,v_max*sin(degtorad(angle+angle_diag*lateral)),v_max*cos(degtorad(angle+angle_diag*lateral))) > accel
			{v_x += accel*press_z*sin(degtorad(point_direction(v_x,v_y,v_max*sin(degtorad(angle+angle_diag*lateral)),v_max*cos(degtorad(angle+angle_diag*lateral)))+90))
			v_y += accel*press_z*cos(degtorad(point_direction(v_x,v_y,v_max*sin(degtorad(angle+angle_diag*lateral)),v_max*cos(degtorad(angle+angle_diag*lateral)))+90))
			}
		}}
		
	if special_activ and vaisseau_type == 2
	{if press_z>0 and not (press_left ||press_right)
		{v_x = v_max*sin(degtorad(angle))
		v_y = v_max*cos(degtorad(angle))}
	if (press_left ||press_right) and press_z >0
		{v_x = v_max*sin(degtorad(angle+angle_diag*lateral))
		v_y = v_max*cos(degtorad(angle+angle_diag*lateral))}
	if (press_left ||press_right) and not press_z >0
		{v_x = v_max*cos(degtorad(-angle))*lateral
		v_y = v_max*sin(degtorad(-angle))*lateral}
	}


	///else {if (v >0) and ((not special_activ and (vaisseau_type == 2 or vaisseau_type == 6)) or (vaisseau_type != 2  or vaisseau_type == 6))
		///{v_x -= accellr*(v_x/v)
		///v_y -= accellr*(v_y/v)}
	///if (v_x > -1 && v_x <1)
		///{v_x = 0}
	///if (v_y > -1 && v_y <1)
		///{v_y = 0}
	///}
	}



	if turret_mode = 1
	{turret_angle += accellr*lateral}

	x -= v_x 
	y -= v_y
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
	{if special_activ
		{nbr_laser = crew_nbr}
	else
		{nbr_laser = 1}
	center1_lx = x-80*sin(degtorad(angle));
	center1_ly = y-80*cos(degtorad(angle));
	center2_lx = x+70*sin(degtorad(angle)) + 45*cos(-degtorad(angle));
	center2_ly = y+70*cos(degtorad(angle)) + 45*sin(-degtorad(angle));
	center3_lx = x+70*sin(degtorad(angle)) - 45*cos(-degtorad(angle));
	center3_ly = y+70*cos(degtorad(angle)) - 45*sin(-degtorad(angle));
	center4_lx = x-50*sin(degtorad(angle));
	center4_ly = y-50*cos(degtorad(angle));}
	if (vaisseau_type ==5)
	{center1_lx = x-45*sin(degtorad(angle));
	center1_ly = y-45*cos(degtorad(angle));
	center2_lx = x+100*sin(degtorad(angle));
	center2_ly = y+100*cos(degtorad(angle));
	center1spe_lx = x-240*sin(degtorad(angle));
	center1spe_ly = y-240*cos(degtorad(angle));
	center2spe_lx = x-70*sin(degtorad(angle)) - 60*cos(-degtorad(angle));
	center2spe_ly = y-70*cos(degtorad(angle)) - 60*sin(-degtorad(angle));
	center3spe_lx = x-70*sin(degtorad(angle)) + 60*cos(-degtorad(angle));
	center3spe_ly = y-70*cos(degtorad(angle)) + 60*sin(-degtorad(angle));
	center4spe_lx = x+80*sin(degtorad(angle)) - 100*cos(-degtorad(angle));
	center4spe_ly = y+80*cos(degtorad(angle)) - 100*sin(-degtorad(angle));
	center5spe_lx = x+80*sin(degtorad(angle)) + 100*cos(-degtorad(angle));
	center5spe_ly = y+80*cos(degtorad(angle)) + 100*sin(-degtorad(angle));}
	if (vaisseau_type ==6)
	{center1_lx = x-20*sin(degtorad(angle));
	center1_ly = y-20*cos(degtorad(angle));}
	if (vaisseau_type ==7)
	{center1_lx = x-300*sin(degtorad(angle));
	center1_ly = y-300*cos(degtorad(angle));
	center2_lx = x+220*sin(degtorad(angle)) - 150*cos(-degtorad(angle));
	center2_ly = y+220*cos(degtorad(angle)) - 150*sin(-degtorad(angle));
	center3_lx = x+220*sin(degtorad(angle)) + 150*cos(-degtorad(angle));
	center3_ly = y+220*cos(degtorad(angle)) + 150*sin(-degtorad(angle));}

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
	{laser_type = other.Faction
	parent = other.id
	alarm[0] = parent.laser_vie;
	speed = parent.v_laser+parent.v;
	direction = point_direction(x,y,parent.l_x,parent.l_y)
	direction += random_range(-parent.precision,parent.precision);
	image_angle = direction -90;
	dmg =  other.dmg}

	if (nbr_laser >= 2)
	{if turret_mode == 0
		{l_x = center2_lx -800*sin(degtorad(angle));
		l_y = center2_ly -800*cos(degtorad(angle));}
	if turret_mode == 1
		{l_x = center2_lx -800*sin(degtorad(turret_angle));
		l_y = center2_ly -800*cos(degtorad(turret_angle));}

	with (instance_create_layer(center2_lx ,center2_ly ,"laser",oLaser))
	{laser_type = other.Faction
	parent = other.id
	alarm[0] = parent.laser_vie;
	speed = parent.v_laser+parent.v;
	direction = point_direction(x,y,parent.l_x,parent.l_y)
	direction += random_range(-parent.precision,parent.precision);
	image_angle = direction -90;
	dmg =  other.dmg}}


	if (nbr_laser >= 3)
	{if turret_mode == 0
		{l_x = center3_lx -800*sin(degtorad(angle));
		l_y = center3_ly -800*cos(degtorad(angle));}
	if turret_mode == 1
		{l_x = center3_lx -800*sin(degtorad(turret_angle));
		l_y = center3_ly -800*cos(degtorad(turret_angle));}

	with (instance_create_layer(center3_lx ,center3_ly ,"laser",oLaser))
	{laser_type = other.Faction
	parent = other.id
	alarm[0] = parent.laser_vie;
	speed = parent.v_laser+parent.v;
	direction = point_direction(x,y,parent.l_x,parent.l_y)
	direction += random_range(-parent.precision,parent.precision);
	image_angle = direction -90;
	dmg =  other.dmg}}


	if (nbr_laser >= 4)
	{if turret_mode == 0
		{l_x = center4_lx -800*sin(degtorad(angle));
		l_y = center4_ly -800*cos(degtorad(angle));}
	if turret_mode == 1
		{l_x = center4_lx -800*sin(degtorad(turret_angle));
		l_y = center4_ly -800*cos(degtorad(turret_angle));}

	with (instance_create_layer(center4_lx ,center4_ly ,"laser",oLaser))
	{laser_type = other.Faction
	parent = other.id
	alarm[0] = parent.laser_vie;
	speed = parent.v_laser+parent.v;
	direction = point_direction(x,y,parent.l_x,parent.l_y)
	direction += random_range(-parent.precision,parent.precision);
	image_angle = direction -90;
	dmg = other.dmg}}
	is_firing = false
	alarm[0]=fire_rate}

	///se poser
	///if (press_e)
	///{att = true}
	///if (att && place_meeting(x,y,oPlanet))
	///{if (image_xscale > 0.1)
		///{image_xscale -= 0.05
		///image_yscale -= 0.05}
	///}

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
	curveAsset = AnimMissile3
	curvePosition = 0
	curveSpeed = 0.02
	init_speed = parent.v;
	direction = point_direction(x,y,parent.l_x,parent.l_y)
	image_angle = direction -90;
	dmg = 150}
	l_x = center2_lx -800*sin(degtorad(angle));
	l_y = center2_ly -800*cos(degtorad(angle));
	with (instance_create_layer(center2_lx,center2_ly ,"laser",oLaser))
	{laser_type = 3
	parent = other.id
	alarm[0] = 50;
	curveAsset = AnimMissile3
	curvePosition = 0
	curveSpeed = 0.02
	init_speed = parent.v;
	direction = point_direction(x,y,parent.l_x,parent.l_y)
	image_angle = direction -90;
	dmg = 150}}

	if vaisseau_type == 4
	{alarm[2]= 300
	special_activ = 1
	alarm[3]= 250}

	if vaisseau_type == 5
	{alarm[2]= 30
	l_x = center1spe_lx -800*sin(degtorad(angle));
	l_y = center1spe_ly -800*cos(degtorad(angle));
	with (instance_create_layer(center1spe_lx ,center1spe_ly ,"laser",oLaser))
	{laser_type = 4
	missile_traj = 1
	parent = other.id
	alarm[0] = 50;
	speed = 25+parent.v;
	direction = point_direction(x,y,parent.l_x,parent.l_y)
	image_angle = direction -90;
	dmg = 150}
	l_x = center2spe_lx -800*sin(degtorad(angle+20));
	l_y = center2spe_ly -800*cos(degtorad(angle+20));
	with (instance_create_layer(center2spe_lx,center2spe_ly ,"laser",oLaser))
	{laser_type = 4
	missile_traj = 2
	parent = other.id
	alarm[0] = 50;
	speed = 25+parent.v;
	direction = point_direction(x,y,parent.l_x,parent.l_y)
	image_angle = direction -90;
	dmg = 150}
	l_x = center3spe_lx -800*sin(degtorad(angle-20));
	l_y = center3spe_ly -800*cos(degtorad(angle-20));
	with (instance_create_layer(center3spe_lx ,center3spe_ly ,"laser",oLaser))
	{laser_type = 4
	missile_traj = 3
	parent = other.id
	alarm[0] = 50;
	speed = 25+parent.v;
	direction = point_direction(x,y,parent.l_x,parent.l_y)
	image_angle = direction -90;
	dmg = 150}
	l_x = center4spe_lx -800*sin(degtorad(angle+30));
	l_y = center4spe_ly -800*cos(degtorad(angle+30));
	with (instance_create_layer(center4spe_lx,center4spe_ly ,"laser",oLaser))
	{laser_type = 4
	missile_traj = 4
	parent = other.id
	alarm[0] = 50;
	speed = 25+parent.v;
	direction = point_direction(x,y,parent.l_x,parent.l_y)
	image_angle = direction -90;
	dmg = 150}
	l_x = center5spe_lx -800*sin(degtorad(angle-30));
	l_y = center5spe_ly -800*cos(degtorad(angle-30));
	with (instance_create_layer(center5spe_lx,center5spe_ly ,"laser",oLaser))
	{laser_type = 4
	missile_traj = 5
	parent = other.id
	alarm[0] = 50;
	speed = 25+parent.v;
	direction = point_direction(x,y,parent.l_x,parent.l_y)
	image_angle = direction -90;
	dmg = 150}}

	if vaisseau_type == 6 and not special_activ
	{alarm[2]= 50
	special_activ = 1}
	}
	if vaisseau_type == 6 and not special_activ
	{sprite_index = spr_bas}

	if special_activ and vaisseau_type == 2 and anim_spe = 0
	{anim_spe = 1
	alarm[4] = 10
	with instance_create_layer(x,y,"laser",oExplosion)
	{sprite_index = sSpecial2
	image_angle = other.angle}}


	if special_activ and vaisseau_type == 6
	{sprite_index = sSpecial2
	if press_left
		{x += -500*cos(-degtorad(angle))
		y += -500*sin(-degtorad(angle))
		special_activ = 0} 
	if press_right
		{x += 500*cos(-degtorad(angle))
		y += 500*sin(-degtorad(angle))
		special_activ = 0}
	if press_down
		{x += 500*sin(degtorad(angle))
		y += 500*cos(degtorad(angle))
		special_activ = 0}
	}
	if IA==0
	{camera_set_view_size(view_camera [0],2560+zoom*v,1920+zoom*v)
	camera_set_view_pos (view_camera [0], x - (camera_get_view_width(view_camera [0]) / 2) - decal*v_x, y - (camera_get_view_height(view_camera [0]) / 2)- decal*v_y)
	}

	var deg;
	deg = instance_place(x, y, oLaser);
	if deg != noone and (Faction == 0 or deg.parent.Faction != Faction) and deg.parent != id
	   {hp -= deg.dmg;
	   with (deg) instance_destroy();}


}
