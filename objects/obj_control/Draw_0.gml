/// @description 

draw_set_font(global.fnt_numbers);

if (screen == "game") { // GAME SCREEN ________________________________________________________________________________________
	
	draw_sprite(spr_field,0,180,180);
	
	draw_set_alpha(general_alpha);
	
	//draw_line(0, 31 + 317 *(1/3), 360, 31 + 317 *(1/3));
	//draw_line(0, 350 - 317 *(1/3), 360, 350 - 317 *(1/3));
	
	for (var i = 0; i < array_length(player_list); ++i) { // Shadows
		
		if (player_list[i].action == "save") {
			angle = 0;
			shadow_x = player_list[i].x;
			shadow_y = player_list[i].y + 1;
		} else {
			angle = point_direction(0, 0, player_list[i].x, player_list[i].y);
			shadow_x = player_list[i].x;
			shadow_y = player_list[i].y;
		}
		
	    draw_sprite_ext(player_list[i].sprite, image_index/10,shadow_x, shadow_y,1,1,angle,c_black,0.35);
		
	}
	
	draw_sprite_ext(obj_referee.sprite, image_index/10,obj_referee.x, obj_referee.y,1,1,point_direction(0, 0, obj_referee.x, obj_referee.y),c_black,0.35);
	
	for (var i = 0; i < array_length(coach_list); ++i) { // Shadows
		draw_sprite_ext(coach_list[i].sprite, image_index/10,coach_list[i].x, coach_list[i].y,1,1,point_direction(0, 0, coach_list[i].x, coach_list[i].y),c_black,0.35);
	}
	
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	
	if (timeclock > 0) {
		draw_text_transformed(190,185,timeclock,15,15,0);
	}
	
	if (rain) {
		draw_set_alpha(0.5);
		effect_create_depth(-1,ef_rain,0,0,0,c_gray);
		draw_set_alpha(1);
	}
	
} else if (screen == "end") { // END/RESTART GAME SCREEN ________________________________________________________________________________________
	
	draw_sprite(spr_field,0,180,180);
	
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	
	draw_text_transformed(190,120, winner_sentence,4,4,0);
	
	draw_text_transformed(180,180,"MAN OF THE MATCH: " + string(best_player_name) + " " + string(best_player_number),3,3,0);
	draw_text_transformed(180,200,"TACKLES: " + string(best_player_tackles) + " / " + "GOALS: " + string(best_player_goals),2,2,0);
	
	draw_text_transformed(180,230,"POSSESSION: " + string(round((teamA_possession/(teamA_possession+teamB_possession))*100)) + "%" + " / " + string(round((teamB_possession/(teamA_possession+teamB_possession))*100)) + "%",2,2,0);
	
	draw_sprite_ext(spr_idle_1,0,180,160,1,1,0,best_player_sc,1);
	draw_sprite_ext(spr_idle_1_shirt,0,180,160,1,1,0,best_player_team_color1,1);
	if (best_player_kittype == "shorts") {
		draw_sprite_ext(spr_idle_1_shorts,0,180,160,1,1,0,best_player_team_color2,1);
	} else if (best_player_kittype == "stripes") {
		draw_sprite_ext(spr_idle_1_stripes,0,180,160,1,1,0,best_player_team_color2,1);
	} else if (best_player_kittype == "stripes and shorts") {
		draw_sprite_ext(spr_idle_1_stripes,0,180,160,1,1,0,best_player_team_color2,1);
		draw_sprite_ext(spr_idle_1_shorts,0,180,160,1,1,0,best_player_team_color3,1);
	} else if (best_player_kittype == "bars and shorts") {
		draw_sprite_ext(spr_idle_1_bars,0,180,160,1,1,0,best_player_team_color2,1);
		draw_sprite_ext(spr_idle_1_shorts,0,180,160,1,1,0,best_player_team_color3,1);
	} else if (best_player_kittype == "sleeves") {
		draw_sprite_ext(spr_idle_1_sleeves,0,180,160,1,1,0,best_player_team_color2,1);
	} else if (best_player_kittype == "sleeves and shorts") {
		draw_sprite_ext(spr_idle_1_sleeves,0,180,160,1,1,0,best_player_team_color2,1);
		draw_sprite_ext(spr_idle_1_shorts,0,180,160,1,1,0,best_player_team_color3,1);
	} else if (best_player_kittype == "checkers") {
		draw_sprite_ext(spr_idle_1_stripes,0,180,160,1,1,0,best_player_team_color2,1);
		draw_sprite_ext(spr_idle_1_bars,0,180,160,1,1,0,best_player_team_color2,1);
	}
	draw_sprite(spr_ball,0,175,155);
	
	draw_text_transformed(180,270,"TAP TO ADVANCE",2,2,0);
	
}