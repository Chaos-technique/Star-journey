draw_self()
if vaisseau_type == 5
{draw_sprite_ext(sTurret,0,x-45*sin(degtorad(angle)), y-45*cos(degtorad(angle)),1,1,turret_angle,c_white,1)
draw_sprite_ext(sTurret,0,x+100*sin(degtorad(angle)),y+100*cos(degtorad(angle)),1,1,turret_angle,c_white,1)}



if hp < hpmax and not dead
{draw_sprite(sBarpv,hp*58/hpmax,x,y)}

