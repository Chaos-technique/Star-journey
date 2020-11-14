function get_input() {
	if pilot_mode ==0
	{press_q = keyboard_check_direct(ord("Q"));
	press_d = keyboard_check_direct(ord("D"));
	press_z = keyboard_check_direct(ord("Z"));
	press_s = keyboard_check_direct(ord("S"));
	press_e = keyboard_check_direct(ord("E"));
	press_up = keyboard_check(vk_up)
	press_down = keyboard_check(vk_down)
	press_left = keyboard_check(vk_left)
	press_right = keyboard_check(vk_right)
	press_space = keyboard_check(vk_space)
	press_escape = keyboard_check(vk_escape)}
	if pilot_mode ==1
	{
	if angle_difference(angle,point_direction(x,y,mouse_x,mouse_y) -90) > 2
	{press_q = 0
	press_d = 1}
	else if angle_difference(angle,point_direction(x,y,mouse_x,mouse_y) -90) < -2
	{press_q = 1
	press_d = 0}
	else
	{press_q = 0
	press_d = 0}
	press_z = keyboard_check_direct(ord("Z"));
	press_s = keyboard_check_direct(ord("S"));
	press_e = keyboard_check_direct(ord("E"));
	press_up = mouse_check_button(mb_right)
	press_down = keyboard_check(vk_down)
	press_left = keyboard_check(ord("Q"))
	press_right = keyboard_check(ord("D"))
	press_space = mouse_check_button(mb_left)
	press_escape = keyboard_check(vk_escape)}
	
	if pilot_mode ==2
	{
	if angle_difference(angle,point_direction(x,y,mouse_x,mouse_y) -90) > 2
	{press_q = 0
	press_d = 1}
	else if angle_difference(angle,point_direction(x,y,mouse_x,mouse_y) -90) < -2
	{press_q = 1
	press_d = 0}
	else
	{press_q = 0
	press_d = 0}
	
	if point_distance(x,y,mouse_x,mouse_y) - 0 >0
	{if (point_distance(x,y,mouse_x,mouse_y) - 0)/1000 < 1
		{press_z = (point_distance(x,y,mouse_x,mouse_y) - 0)/1000}
	else
	{press_z = 1}}
	press_s = keyboard_check_direct(ord("S"));
	press_e = keyboard_check_direct(ord("E"));
	press_up = mouse_check_button(mb_right)
	press_down = keyboard_check(vk_down)
	press_left = keyboard_check(ord("Q"))
	press_right = keyboard_check(ord("D"))
	press_space = mouse_check_button(mb_left)
	press_escape = keyboard_check(vk_escape)
	show_debug_message(press_z)}


	var Epave
	Epave = instance_place(x,y,oEpave)
	if (Epave != noone and Epave.fill != 0 and v < 3 and crew_nbr < crew_max)
	{crew_nbr +=1
	Epave.fill = 0
	oControl.crew_visible = 1
	alarm[0] = oControl.tps_aff_crew}


}
