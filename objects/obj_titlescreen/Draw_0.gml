draw_set_font(global.fnt_numbers);
draw_set_halign(fa_center);
draw_set_color(global.c_bluer);
draw_rectangle(40,40,320,600,false);
	
draw_set_color(global.c_gold);
draw_rectangle(40,40,320,600,true);

draw_set_color(c_white);
draw_text_ext_transformed(185, 80, "ARCADE FOOTBALL MANAGER", 11, 80, 3, 3, 0);

if (file_exists("gamesave.sav")) {
	draw_sprite(spr_box,0,180, option1_y);
	draw_text_transformed(180+5, option1_y-4, "CONTINUE", 3, 3, 0);
}

draw_sprite(spr_box,0,180, option2_y);
draw_text_transformed(180+5, option2_y-4, "NEW GAME", 3, 3, 0);

draw_sprite(spr_box,0,180, option3_y);
draw_text_transformed(180+5, option3_y-4, "EXTRAS", 3, 3, 0);

draw_sprite(spr_box,0,180, option4_y);
draw_text_transformed(180+5, option4_y-4, "CREDITS", 3, 3, 0);

draw_sprite(spr_box,0,180, option5_y);
draw_text_transformed(180+5, option5_y-4, "EXIT GAME", 3, 3, 0);

draw_text_transformed(180+5, 530, "CLICK TO JOIN OUR DISCORD ;)", 2, 2, 0);
draw_sprite_ext(spr_discord, 0, 180, 500, 2, 2, 0, c_white, 1);

draw_sprite_ext(spr_afm, 0, 180, 560, 2, 2, 0, c_white, 1);
