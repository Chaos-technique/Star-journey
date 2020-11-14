rel = instance_find(oPerso,0)
x = camera_get_view_width(view_camera [0])/2 -rel.zoom*rel.v/2
y = camera_get_view_height(view_camera [0])/2 -rel.zoom*rel.v/2
draw_self()


mouse_xrel = (mouse_x-(rel.x-rel.decal*rel.v_x))-rel.zoom*rel.v*(mouse_x-(rel.x-rel.decal*rel.v_x))/camera_get_view_width(view_camera [0]) +x
mouse_yrel = (mouse_y-(rel.y-rel.decal*rel.v_y))-rel.zoom*rel.v*(mouse_y-(rel.y-rel.decal*rel.v_y))/camera_get_view_height(view_camera [0]) +y

if mouse_check_button_pressed(mb_left)
{flag_xmap = mouse_xrel
flag_ymap = mouse_yrel
flag_x = (flag_xmap-x)*50 + rel.x
flag_y = (flag_ymap-y)*50 + rel.y
flag_define = 1}

var i
for (i = 0; i < instance_number(oPlanet); i += 1)
{x_planetmap =((oControl.planet[i].x-rel.x)/50)+x
y_planetmap = ((oControl.planet[i].y-rel.y)/50)+y
	if x_planetmap < 2400 and x_planetmap > 200 and y_planetmap < 1500 and y_planetmap >400
	{
		if x_planetmap-mouse_xrel < 30 and x_planetmap-mouse_xrel > -30 and y_planetmap-mouse_yrel < 30 and y_planetmap-mouse_yrel > -30
			{draw_sprite(oControl.planet[i].splanetmap_exp,0,((oControl.planet[i].x-rel.x)/50)+x,((oControl.planet[i].y-rel.y)/50)+y)}
		else
			{draw_sprite(oControl.planet[i].splanetmap,0,((oControl.planet[i].x-rel.x)/50)+x,((oControl.planet[i].y-rel.y)/50)+y)}
		if flag_define and point_distance(x_planetmap,y_planetmap,flag_xmap ,flag_ymap ) < 40
			{flag_xmap = x_planetmap
			flag_ymap = y_planetmap
			flag_x = (flag_xmap-x)*50 + rel.x
			flag_y = (flag_ymap-y)*50 + rel.y}
	}
}

if mouse_check_button_pressed(mb_right)
{flag_define = 0}

x_epavemap = ((oEpave.x-rel.x)/50)+x
y_epavemap = ((oEpave.y-rel.y)/50)+y

if x_epavemap < 2400 and x_epavemap > 200 and y_epavemap < 1500 and y_epavemap >400
{draw_sprite(sIndicEpave,subim,((oEpave.x-rel.x)/50)+x,((oEpave.y-rel.y)/50)+y)}

if flag_define
{draw_sprite(sFlag,0,flag_xmap,flag_ymap)}

draw_sprite_ext(sPerso_map,0,x,y,1,1,rel.angle,c_white,1)