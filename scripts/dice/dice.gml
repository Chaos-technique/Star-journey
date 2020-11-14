// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dice(){
	if dice_cd == 1
		{dice_cd = 0
		alarm[6] = 1500
		return irandom_range(1,12)}
	if dice_cd == 0
		return 0

}