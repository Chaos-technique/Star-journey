if laser_type == 0
{sprite_index = sLaser}
if laser_type == 1
{sprite_index = sLaser_pir}
if laser_type == 2
{sprite_index = sLaser_vig}
if laser_type == 3
{sprite_index = sSpecial3
curvePosition += curveSpeed
var _curveStruct = animcurve_get(curveAsset)
var _channel = animcurve_get_channel(_curveStruct, "v")
var _value = animcurve_channel_evaluate(_channel,curvePosition)
speed = _value*40 + init_speed}
if laser_type == 4
{sprite_index = sSpecial5
if missile_traj == 2
{direction -= 1
image_angle -= 1}
if missile_traj == 3
{direction += 1
image_angle += 1}
if missile_traj == 4
{direction -= 1.5
image_angle -= 1.5}
if missile_traj == 5
{direction += 1.5
image_angle += 1.5}
}
