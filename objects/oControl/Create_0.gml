randomize()
var i;
for (i = 0; i < instance_number(oPlanet); i += 1)
{
   planet[i] = instance_find(oPlanet,i);
}

var i2;
for (i2 = 0; i2 < instance_number(oPerso); i2 += 1)
{
	vaisseau[i2] = instance_find(oPerso,i2);
}
crew_visible = 1
tps_aff_crew = 500
alarm[0] = tps_aff_crew
