randomize();
possession = noone;
last_touch = noone;
restart = choose(obj_control.teamA, obj_control.teamB);
can_be_touched = 0;
can_be_goal = true;

teamA_possession = 0;
teamB_possession = 0;

direc_ = direction;

if (global.gamemode == "career mode") {

	if (obj_control.game.competition == "l00") {
		idle_sprite = spr_ball_l00;
		sprite1 = spr_ball_l00_1;
		sprite3 = spr_ball_l00_3;
		sprite5 = spr_ball_l00_5;
		sprite7 = spr_ball_l00_7;
	} else if (obj_control.game.competition == "l01") {
		idle_sprite = spr_ball_l01;
		sprite1 = spr_ball_l01_1;
		sprite3 = spr_ball_l01_3;
		sprite5 = spr_ball_l01_5;
		sprite7 = spr_ball_l01_7;
	} else {
		idle_sprite = spr_ball;
		sprite1 = spr_ball_1;
		sprite3 = spr_ball_3;
		sprite5 = spr_ball_5;
		sprite7 = spr_ball_7;
	}

} else {
	
	idle_sprite = spr_ball;
	sprite1 = spr_ball_1;
	sprite3 = spr_ball_3;
	sprite5 = spr_ball_5;
	sprite7 = spr_ball_7;
	
}

sprite = idle_sprite;


if (obj_control.rain) {
	fric = 0.11;
} else {
	fric = 0.1;
}

function reset() {
	
	for (var i = 0; i < array_length(obj_control.player_list); ++i) {
	    if (obj_control.player_list[i].pos == "GK") {
			obj_control.player_list[i].target_x = 180;
		}
		obj_control.player_list[i].x = obj_control.player_list[i].target_x;
		obj_control.player_list[i].y = obj_control.player_list[i].og_y;
		obj_control.player_list[i].stamina = obj_control.player_list[i].max_stamina;
		obj_control.player_list[i].action = "idle";
		obj_control.player_list[i].slide_counter = 0;
		
	}
	
}