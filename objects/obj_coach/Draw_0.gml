draw_set_font(global.fnt_numbers);

sprite = asset_get_index("spr_idle_" + string(dir));
draw_sprite_ext(sprite, image_index / 10 , x, y,1,1,0,sc,1);
shirt = asset_get_index("spr_idle_" + string(dir) + "_tracksuit");
draw_sprite_ext(shirt, image_index / 10 , x, y,1,1,0,team_color1,1);

draw_set_color(c_black);
draw_text(x,y-26, name + " ");

if (carded) {
	draw_sprite(spr_card, 0, x - 1 + string_width(name + " ")/2, y-26);
}

if (coach_id == "c10") {
	
	if (speech_cooldown <= 0) {
		
		for (var i = 0; i < array_length(things_you_can_say); ++i) {
		
		    draw_set_color(c_black);
			draw_rectangle(70, 440 + (i*40), 360-70, 450 + (i*40), true);
			draw_text(180, 445 + (i*40), things_you_can_say[i]);
		
			draw_set_color(c_white);
		
		}
		
	} else {
		
		draw_set_color(c_black);
		draw_text_transformed(185, 540, speech_cooldown, 5, 5, 0);
		draw_set_color(c_white);
		
	}
	
}