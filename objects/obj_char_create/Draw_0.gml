draw_set_font(global.fnt_numbers);
draw_set_halign(fa_center);
draw_set_color(global.c_bluer);
draw_rectangle(40,40,320,600,false);
	
draw_set_color(global.c_gold);
draw_rectangle(40,40,320,600,true);
	
draw_set_halign(fa_center);
draw_set_color(c_white);

draw_sprite(spr_box,0,180,570);
draw_text_transformed(180+5, 570-4, "ADVANCE", 3, 3, 0);

draw_text_transformed(185,70,screen,3,3,0);

draw_sprite(spr_back, esc_option_index, 25, 15);

if (screen == "FIRST NAME") {
	
	global.c10_firstname = keyboard_string;
	global.c10_firstname = string_upper(global.c10_firstname);
	
	draw_text_transformed(185,135,global.c10_firstname,3,3,0);
	if (keyboard_string == "") {
		draw_set_alpha(cursor_alpha);
		draw_text_transformed(185,135,"|",3,3,0);
		draw_set_alpha(1);
	}

} else if (screen == "LAST NAME") {
	
	global.c10_lastname = keyboard_string;
	global.c10_lastname = string_upper(global.c10_lastname);
	
	draw_text_transformed(185,135,global.c10_lastname,3,3,0);
	if (keyboard_string == "") {
		draw_set_alpha(cursor_alpha);
		draw_text_transformed(185,135,"|",3,3,0);
		draw_set_alpha(1);
	}

} else if (screen == "CHARACTERISTICS") {
	
	draw_set_color(c_green);
	draw_rectangle(180-20,165-50,180+20,165+10,false);
	draw_set_color(global.c_gold);
	draw_rectangle(180-20,165-50,180+20,165+10,true);
	
	draw_sprite_ext(spr_idle_1,0,180,165,2,2,0,global.c10_sc,1);
	draw_sprite_ext(spr_idle_1_tracksuit,0,180,165,2,2,0,c_white,1);
	
	draw_sprite_ext(spr_arrow, 0, 110, 155, -1, 1, 0, c_white, 1);
	draw_sprite(spr_arrow, 0, 250, 155);
	
	draw_set_color(c_white);
	draw_text_transformed(185,255,"AGE",3,3,0);
	draw_text_transformed(185,285,global.c10_age,3,3,0);
	
	draw_sprite_ext(spr_arrow, 0, 110, 285, -1, 1, 0, c_white, 1);
	draw_sprite(spr_arrow, 0, 250, 285);
	
} else if (screen == "COUNTRY") {
	
	global.c10_country = keyboard_string;
	global.c10_country = string_upper(global.c10_country);
	
	draw_text_transformed(185,135,global.c10_country,3,3,0);
	if (keyboard_string == "") {
		draw_set_alpha(cursor_alpha);
		draw_text_transformed(185,135,"|",3,3,0);
		draw_set_alpha(1);
	}

} else if (screen == "TEAM") {
	
	draw_sprite_ext(spr_arrow, 0, 110, 135, -1, 1, 0, c_white, 1);
	draw_sprite(spr_arrow, 0, 250, 135);
	
	draw_text_transformed(185,135,variable_global_get(variable_global_get(create_team + "_league") + "_name"),3,3,0);

	draw_text_transformed(185,325,variable_global_get(string(create_team) + "_name"),3,3,0);
	
	draw_sprite_ext(spr_arrow, 0, 110, 255, -1, 1, 0, c_white, 1);
	draw_sprite(spr_arrow, 0, 250, 255);

	draw_sprite_ext(spr_badge,variable_global_get(string(create_team) + "_badge"),180,255,10,10,0,variable_global_get(string(create_team) + "_color1"),1);
	draw_sprite_ext(spr_badge_accent,variable_global_get(string(create_team) + "_badge"),180,255,10,10,0,variable_global_get(string(create_team) + "_color2"),1);

} else if (screen == "SHOW TUTORIALS?") {
	
	draw_set_color(c_white);
	draw_text_transformed(185,285,tutorial_state,3,3,0);
	
	draw_sprite_ext(spr_arrow, 0, 110, 285, -1, 1, 0, c_white, 1);
	draw_sprite(spr_arrow, 0, 250, 285);

}

