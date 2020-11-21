draw_set_font(YUgothic);
draw_set_colour(c_white);


if crew_visible == 1
{draw_text(2375,50, string(oPerso.crew_nbr) + "/" + string(oPerso.crew_max));
draw_sprite(sCrew,0,2450,60)
draw_text(100,50, string(oPerso.money))
draw_sprite(sMoney,0,125,60)}


