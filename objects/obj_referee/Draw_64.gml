draw_set_alpha(obj_control.general_alpha);

draw_set_halign(fa_left);

if (obj_ball.restart != noone && ref_speech == "") {
	ref_speech = variable_global_get(string(obj_ball.restart) + "_name") + " BALL";
	alarm[0] = 120;
}

if (ref_speech != "") {
	draw_set_color(c_white);
	draw_rectangle(27, y - 24, 27 + string_width(ref_speech) + 3, y - 16, false);
	draw_set_color(c_black);
	draw_rectangle(27, y - 24, 28 + string_width(ref_speech) + 3, y - 15, true);
	draw_text(30, y - 20, ref_speech);
}

draw_set_halign(fa_center);
