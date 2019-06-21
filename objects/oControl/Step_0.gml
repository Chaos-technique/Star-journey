if instance_number(oPerso) <= 2
{
with (instance_create_layer(0,0,"vaisseau",oPerso))
{IA = 1
vaisseau_type = irandom_range(1,6)
event_user(0)}
}