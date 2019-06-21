press_q = keyboard_check_direct(ord("Q"));
press_d = keyboard_check_direct(ord("D"));
press_z = keyboard_check_direct(ord("Z"));
press_e = keyboard_check_direct(ord("E"));
press_up = keyboard_check(vk_up)
press_left = keyboard_check(vk_left)
press_right = keyboard_check(vk_right)
press_space = keyboard_check(vk_space)
press_escape = keyboard_check(vk_escape)

camera_set_view_pos (view_camera [0], x - (view_wport [0] / 2), y - (view_hport [0] / 2))