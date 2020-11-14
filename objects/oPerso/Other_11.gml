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
	{center1_lx = x-70*sin(degtorad(angle));
	center1_ly = y-70*cos(degtorad(angle));}
	if (vaisseau_type ==7)
	{center1_lx = x-300*sin(degtorad(angle));
	center1_ly = y-300*cos(degtorad(angle));
	center2_lx = x+220*sin(degtorad(angle)) - 150*cos(-degtorad(angle));
	center2_ly = y+220*cos(degtorad(angle)) - 150*sin(-degtorad(angle));
	center3_lx = x+220*sin(degtorad(angle)) + 150*cos(-degtorad(angle));
	center3_ly = y+220*cos(degtorad(angle)) + 150*sin(-degtorad(angle));}