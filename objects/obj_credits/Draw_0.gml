draw_set_font(global.fnt_numbers);
draw_set_halign(fa_center);
draw_set_color(global.c_bluer);
draw_rectangle(40,40,320,600,false);
	
draw_set_color(global.c_gold);
draw_rectangle(40,40,320,600,true);

draw_set_color(c_white);

draw_sprite(spr_back, 0, 25, 15);

draw_text_ext_transformed(185, 80, "CREDITS", 11, 80, 3, 3, 0);

draw_set_halign(fa_left);
	
draw_sprite_ext(spr_ball_7,image_index/10,60,128,2,2,0,c_white,1);
draw_text_transformed(80,120,"2D SPRITES: CHASERSGAMING",2,2,0);