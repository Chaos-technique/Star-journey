draw_self()
if vaisseau_type == 5
{draw_sprite_ext(sTurret,0,x-45*sin(degtorad(angle)), y-45*cos(degtorad(angle)),1,1,turret_angle,c_white,1)
draw_sprite_ext(sTurret,0,x+100*sin(degtorad(angle)),y+100*cos(degtorad(angle)),1,1,turret_angle,c_white,1)}


if hp < hpmax and not dead
{draw_sprite(sBarpv,hp*58/hpmax,x,y)}

if press_left == 1 and press_right == 0
{draw_sprite_ext(Sreactor_right,0,x,y,2,1,angle,c_white,1)}
if press_left == 0 and press_right == 1
{draw_sprite_ext(Sreactor_left,0,x,y,2,1,angle,c_white,1)}

if oMap.flag_define and IA == 0
{angle_indic =point_direction(x,y,oMap.flag_x,oMap.flag_y)-90
if vaisseau_type ==1
{dist_ind = 80}
if vaisseau_type ==2 or vaisseau_type ==6 or vaisseau_type ==3
{dist_ind = 100}
if vaisseau_type ==4
{dist_ind = 150}
if vaisseau_type ==5
{dist_ind = 350}
if vaisseau_type ==7
{dist_ind = 450}
indic_x = x - dist_ind*sin(degtorad(angle_indic))
indic_y = y - dist_ind*cos(degtorad(angle_indic))
draw_sprite_ext(sDirection,0,indic_x,indic_y,1,1,angle_indic,c_white,1)
if position_meeting(oMap.flag_x,oMap.flag_y,self)
{oMap.flag_define = 0}}