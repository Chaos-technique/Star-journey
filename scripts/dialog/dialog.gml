///dialog(caracter, tps_afich, texte)
function dialog(argument0, argument1, argument2) {
	caracter = argument0
	ligne = argument1
	texte = argument2

	draw_set_font(YUgothic30);

	if caracter == 0
	{nam = "Hp.R"
	col1 = c_fuchsia
	col2 = c_silver
	tail_name = 115}
	if caracter == 1
	{nam = "???"
	col1 = c_white
	col2 = c_silver
	tail_name = 75}

	draw_text_color(400,1350 + ligne*80, nam,col1,col1,col2,col2,1)
	draw_text(400+tail_name,1350 + ligne*80 , ": " +texte );


}
