if nbr_msg != 0
{draw_sprite_ext(sDialoguebox2,0,camera_get_view_width(view_camera [0])/2 -oPerso.zoom*oPerso.v/2,1600,1,1,0,c_white,0.5)}
if nbr_msg >= 1
{dialog(ds_list_find_value(name,0),0,ds_list_find_value(text,0))}
if nbr_msg >= 2
{dialog(ds_list_find_value(name,1),1,ds_list_find_value(text,1))}
if nbr_msg >= 3
{dialog(ds_list_find_value(name,2),2,ds_list_find_value(text,2))}
if nbr_msg >= 4
{dialog(ds_list_find_value(name,3),3,ds_list_find_value(text,3))}
if nbr_msg >= 5
{dialog(ds_list_find_value(name,4),4,ds_list_find_value(text,4))}
if nbr_msg == 6
{dialog(ds_list_find_value(name,5),5,ds_list_find_value(text,5))}