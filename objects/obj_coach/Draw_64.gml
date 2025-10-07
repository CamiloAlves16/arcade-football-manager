
draw_set_halign(fa_right);
if (coach_speech != "") {
	draw_set_color(c_white);
	draw_rectangle(x - 7 - string_width(coach_speech) - 5, y - 24, x - 7, y - 16, false);
	draw_set_color(c_black);
	draw_rectangle(x - 7 - string_width(coach_speech) - 6, y - 24, x - 6, y - 15, true);
	draw_text(x - 8, y - 20, coach_speech);
}

draw_set_halign(fa_center);
