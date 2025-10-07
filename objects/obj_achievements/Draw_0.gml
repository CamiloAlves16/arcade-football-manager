draw_set_font(global.fnt_numbers);
draw_set_halign(fa_center);
draw_set_color(global.c_bluer);
draw_rectangle(40,40,320,600,false);
	
draw_set_color(global.c_gold);
draw_rectangle(40,40,320,600,true);

draw_set_color(c_white);

draw_sprite(spr_back, esc_option_index, 25, 15);

if (screen == "ACHIEVEMENTS") {
	
	option1 = "DETAILS";
	
	draw_text_transformed(180,20,"ACHIEVEMENTS",4,4,0);
	
	if (array_length(global.achievement_list) > 23) {
		max_display = 23;
	} else {
		max_display = array_length(global.achievement_list);
	}
	
	for (var i = 0; i < max_display; ++i) {
		
		if (selected_index == i) {
			draw_set_color(c_yellow);
		} else {
			draw_set_color(c_white);
		}
		
	    draw_set_halign(fa_left);
	
		draw_text_transformed(50, 50 + ((i)*20), global.achievement_list[i].ach_title, 2, 2, 0);
		
		if (global.achievement_list[i].ach_status) {
			draw_sprite(spr_ach, 1, 315, 50 + ((i)*20));
		} else {
			draw_sprite(spr_ach, 0, 315, 50 + ((i)*20));
		}
		
	}
	
	draw_set_color(c_black);
	draw_rectangle(100, 525, 210, 535, false);
	draw_set_color(c_blue);
	draw_rectangle(102, 527, lerp(102, 208, completed_pct/100), 533, false);
	
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text_transformed(180+5, 500, "PROGRESS", 2, 2, 0);
	draw_text_transformed(240, 530, string(completed_pct) + "%", 2, 2, 0);
	
}

if (array_length(warnings) > 0) {
	
	option1 = "CLOSE";
	
	draw_set_alpha(0.8);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
	
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	
	draw_text_transformed(185, 50, warnings[0].warning_title, 3, 3, 0);
	draw_text_ext_transformed(185, 100, warnings[0].warning_text, 11, 100, 2, 2, 0);
	
}

if (option1 != "") {
	
	draw_sprite(spr_box, option1_index, option1_x, option1_y);
	if (option1_index == 0) {
		draw_text_transformed(option1_x+5, option1_y-4, option1, 3, 3, 0);
	} else {
		draw_text_transformed(option1_x+5, option1_y, option1, 3, 3, 0);
	}
	
}

