/// @description SETUP
name = string_copy(variable_global_get(baller_id + "_firstname"), 1, 1) + "." + string_copy(variable_global_get(baller_id + "_lastname"), 1, 1) + ".";
sc = variable_global_get(string(baller_id) + "_sc");
team = variable_global_get(string(baller_id) + "_team");
number = variable_global_get(string(baller_id) + "_number");
injury = variable_global_get(string(baller_id) + "_injury");

kittype = variable_global_get(string(team) + "_kittype");
if (pos == "GK" && team == obj_control.teamA) {
	kittype = "shorts";
	team_color1 = c_yellow;
	team_color2 = c_yellow;
	team_color3 = c_yellow;
} else if (pos == "GK" && team == obj_control.teamB) {
	kittype = "shorts";
	team_color1 = c_fuchsia;
	team_color2 = c_fuchsia;
	team_color3 = c_fuchsia;
} else if (team == obj_control.teamB && variable_global_get(obj_control.teamA + "_color1") == variable_global_get(obj_control.teamB + "_color1")) {
	team_color1 = variable_global_get(string(team) + "_color3");
	team_color2 = variable_global_get(string(team) + "_color3");
	team_color3 = variable_global_get(string(team) + "_color3");
} else {
	team_color1 = variable_global_get(string(team) + "_color1");
	team_color2 = variable_global_get(string(team) + "_color2");
	team_color3 = variable_global_get(string(team) + "_color3");
}

spd = variable_global_get(baller_id + "_spd");
tkl = variable_global_get(string(baller_id) + "_tkl");
tec = variable_global_get(string(baller_id) + "_tec");
sta = variable_global_get(baller_id + "_sta");
gk = variable_global_get(baller_id + "_gk");
def = variable_global_get(string(baller_id) + "_def");
mid = variable_global_get(string(baller_id) + "_mid");
ata = variable_global_get(baller_id + "_ata");

if (injury > 0) {
	gk = 1;
	def = 1;
	mid = 1;
	ata = 1;
}

if (pos == "GK" && gk == 2) {
	tkl = clamp(tkl - 1, 1, 3);
	spd = clamp(spd - 1, 1, 3);
} else if (pos == "GK" && gk == 1) {
	tkl = clamp(tkl - 1, 1, 3);
	spd = clamp(spd - 1, 1, 3);
	tec = clamp(tec - 1, 1, 3);
	sta = clamp(sta - 1, 1, 3);
} else if ((pos == "RD" || pos == "CD" || pos == "LD") && def == 2) {
	tkl = clamp(tkl - 1, 1, 3);
	spd = clamp(spd - 1, 1, 3);
} else if ((pos == "RD" || pos == "CD" || pos == "LD") && def == 1) {
	tkl = clamp(tkl - 1, 1, 3);
	spd = clamp(spd - 1, 1, 3);
	tec = clamp(tec - 1, 1, 3);
	sta = clamp(sta - 1, 1, 3);
} else if ((pos == "RM" || pos == "CM" || pos == "LM") && mid == 2) {
	tec = clamp(tec - 1, 1, 3);
	spd = clamp(spd - 1, 1, 3);
} else if ((pos == "RM" || pos == "CM" || pos == "LM") && mid == 1) {
	tkl = clamp(tkl - 1, 1, 3);
	spd = clamp(spd - 1, 1, 3);
	tec = clamp(tec - 1, 1, 3);
	sta = clamp(sta - 1, 1, 3);
} else if ((pos == "RF" || pos == "CF" || pos == "LF") && ata == 2) {
	tec = clamp(tec - 1, 1, 3);
	spd = clamp(spd - 1, 1, 3);
} else if ((pos == "RF" || pos == "CF" || pos == "LF") && ata == 1) {
	tkl = clamp(tkl - 1, 1, 3);
	spd = clamp(spd - 1, 1, 3);
	tec = clamp(tec - 1, 1, 3);
	sta = clamp(sta - 1, 1, 3);
}

sav = tkl;
mov_speed = lerp(0.6,1,(spd - 1)/2);
og_mov_speed = mov_speed;
if (sta == 3) {
	max_stamina = 1200;
} else if (sta == 2) {
	max_stamina = 1000;
} else {
	max_stamina = 800;
}
stamina = max_stamina;

if (pos == "GK") {
	radius = 70;
	pow = 6;
} else {
	radius = 110;
	pow = 5;
}
move = false;
sprite = spr_run_1;
action = "idle";
dir = 1;

slide_counter = 0;
tackle_successful = false;

tackles_won = 0;
goals = 0;
assists = 0;
saves = 0;
own_goals = 0;

open = true;

assisted_by = noone;

distance_to_nearest_opponent = 0;
pass_options = [];

function pass_sort(a, b) {
	
	a_rating = a.rating;
	b_rating = b.rating;
	
	if (a_rating == b_rating) {
		return 0
	} else if (a_rating > b_rating) {
		return -1
	} else {
		return 1
	}
	
}

function pass(target, acc) {
	
	if (action == "run" || action == "idle") {
		
		if (acc == 3) {
			pass_x = target.x;
			pass_y = target.y;
			pass_zpower = clamp(lerp(2, 5, point_distance(x, y, pass_x, pass_y) / 200), 1, 4);
		} else if (acc == 2) {
			pass_x = irandom_range(target.x - 10, target.x + 10);
			pass_y = irandom_range(target.y - 5, target.y + 5);
			pass_zpower = clamp(lerp(2, 5, point_distance(x, y, pass_x, pass_y) / 200), 1, 4);
		} else if (acc == 1) {
			pass_x = irandom_range(target.x - 20, target.x + 20);
			pass_y = irandom_range(target.y - 10, target.y + 10);
			pass_zpower = clamp(lerp(2, 5, point_distance(x, y, pass_x, pass_y) / 200), 1, 4);
		}
		
		pass_power = lerp(2.5, 5, point_distance(x, y, pass_x, pass_y) / 130);
	
		obj_ball.can_be_touched = 5;
		obj_ball.possession = noone;
		obj_ball.direction = point_direction(obj_ball.x,obj_ball.y,pass_x,pass_y);
		obj_ball.speed = pass_power;
		if (point_distance(x, y, pass_x, pass_y) > 115) {
			obj_ball.zspeed = pass_zpower;
		}
		obj_ball.last_touch = id;
		slide_counter = 10;
		action = "kick";
		if (abs(obj_ball.hspeed) > abs(obj_ball.vspeed)) {
			if (obj_ball.hspeed > 0) {
				dir = 7;
			} else {
				dir = 3;
			}
		} else {
			if (obj_ball.vspeed > 0) {
				dir = 1;
			} else {
				dir = 5;
			}
		}
		
	}
	
}

function shoot() {
	
	if (action == "run" || action == "idle") {
		
		// Distances from goalie to each corner
		var dist_left = abs(opponent_gk.x - 150);
		var dist_right = abs(opponent_gk.x - 210);

		// Aim for the farther corner
		if (dist_left > dist_right) {
		    shoot_x = 150;
		} else if (dist_right > dist_left) {
		    shoot_x = 210;
		} else {
		    // If goalie is exactly in the middle, aim slightly left or right
		    shoot_x = choose(150, 210);
		}
	
		if (x < 100) {
			shoot_x = 150;
		} else if (x > 259) {
			shoot_x = 210;
		}
	
		if (tec == 2) {
			shoot_x = irandom_range(shoot_x - 10, shoot_x + 10);
		} else if (tec == 1) {
			shoot_x = irandom_range(shoot_x - 20, shoot_x + 20);
		}
	
		obj_ball.can_be_touched = 5;
		obj_ball.possession = noone;
		obj_ball.direction = point_direction(obj_ball.x, obj_ball.y, shoot_x, other_goal);			
		obj_ball.speed = pow;
		obj_ball.zspeed = 2;
		slide_counter = 10;
		action = "kick";
		if (abs(obj_ball.hspeed) > abs(obj_ball.vspeed)) {
			if (obj_ball.hspeed > 0) {
				dir = 7;
			} else {
				dir = 3;
			}
		} else {
			if (obj_ball.vspeed > 0) {
				dir = 1;
			} else {
				dir = 5;
			}
		}
	
	}
	
}

function dribble() {
	
	var dribble_chance = lerp(0.8, 0, (tec - 1) / 2);
	
	if (stamina > 5) {
		
		if (x < 30 + 5 || x > 329 - 5) {
			// don't dribble
		} else if (nearest_opponent.x > x && hspeed > -0.1) {
			hspeed = -2.5;
		} else if (nearest_opponent.x < x && hspeed < 0.1) {
			hspeed = 2.5;
		}
		
		if (random(1) < dribble_chance) {
			obj_ball.can_be_touched = 5;
			obj_ball.possession = noone;
			obj_ball.hspeed = -hspeed;
			slide_counter = 30;
		}
					
		stamina -= 5;
					
	} else {
		
		obj_ball.can_be_touched = 5;
		obj_ball.possession = noone;
		obj_ball.hspeed = -hspeed;
		slide_counter = 30;
		stamina = 0;
					
	}
	
}

/// pass_is_blocked(opponent, passer, receiver)
function pass_is_blocked(opponent, passer, receiver) {

    var px = passer.x;
    var py = passer.y;
    var rx = receiver.x;
    var ry = receiver.y;
    var ox = opponent.x;
    var oy = opponent.y;

    // vector from passer to receiver
    var dx = rx - px;
    var dy = ry - py;
    
    // vector from passer to opponent
    var ox_dx = ox - px;
    var oy_dy = oy - py;
    
    // Project opponent onto passer->receiver line
    var line_len_sq = dx*dx + dy*dy;
    
    // Avoid division by zero
    if (line_len_sq == 0) return false;
    
    var t = clamp((ox_dx*dx + oy_dy*dy) / line_len_sq, 0, 1);
    
    // Closest point on the line segment
    var closest_x = px + t*dx;
    var closest_y = py + t*dy;
    
    // Distance from opponent to that point
    var dist_to_line = point_distance(ox, oy, closest_x, closest_y);
    
    // Decide a blocking threshold
    var block_radius = 15; // adjust based on how close opponents need to be to block
    
    return dist_to_line <= block_radius;
}

function position_check(x_to_check,y_to_check) {
	
	x_to_check_from_left = abs(0 - x_to_check);
	x_to_check_from_right = abs(room_width - x_to_check);
	y_to_check_from_up = abs(0 - y_to_check);
	y_to_check_from_down = abs(room_height - y_to_check);
	
	if (point_distance(x,y,0,y) <= x_to_check_from_left + mov_speed + 1 && point_distance(x,y,room_width,y) <= x_to_check_from_right + mov_speed + 1 && point_distance(x,y,x,0) <= y_to_check_from_up + mov_speed + 1 && point_distance(x,y,x,room_height) <= y_to_check_from_down + mov_speed + 1) {
		
		return true
		
	} else {
		
		return false;
		
	}
	
}

function position(desired_x,desired_y) {
	
	x_to_check_from_left = abs(0 - desired_x);
	x_to_check_from_right = abs(room_width - desired_x);
	y_to_check_from_up = abs(0 - desired_y);
	y_to_check_from_down = abs(room_height - desired_y);
	
	if (point_distance(x,y,0,y) > x_to_check_from_left + 1 && slide_counter <= 0) { // Too far to the right
		
		action = "run";
		x -= mov_speed;
		dir = 3;
		if (stamina > 1) {
			stamina -= 1;
		}
		
	}
	
	if (point_distance(x,y,room_width,y) > x_to_check_from_right + 1 && slide_counter <= 0) { // Too far to the left
		
		action = "run";
		x += mov_speed;
		dir = 7;
		if (stamina > 1) {
			stamina -= 1;
		}
					
	}
	
	if (point_distance(x,y,x,0) <= y_to_check_from_up + 1 && slide_counter <= 0) { // Too far to the down
		
		action = "run";
		y += mov_speed;
		dir = 1;
		if (stamina > 1) {
			stamina -= 1;
		}
					
	}
	
	if (point_distance(x,y,x,room_height) <= y_to_check_from_down + 1 && slide_counter <= 0) { // Too far to the up
		
		action = "run";
		y -= mov_speed;
		dir = 5;
		if (stamina > 1) {
			stamina -= 1;
		}
					
	}
	
	if (point_distance(x,y,0,y) <= x_to_check_from_left + 1 && point_distance(x,y,room_width,y) <= x_to_check_from_right + 1 && point_distance(x,y,x,0) <= y_to_check_from_up + 1 && point_distance(x,y,x,room_height) <= y_to_check_from_down + 1) {
		
		action = "idle";
		
	}
	
}

function read_situation() {
	
	team_list = [];
	teammate_list =  [];
	opponent_list =  [];
	for (var i = 0; i < array_length(obj_control.player_list); ++i) {
		if (obj_control.player_list[i].team == team) {
			array_push(team_list, obj_control.player_list[i]);
			if (obj_control.player_list[i].id != id) {
				array_push(teammate_list, obj_control.player_list[i]);
			}
		} else {
			array_push(opponent_list, obj_control.player_list[i]);
			if (obj_control.player_list[i].pos == "GK") {
				opponent_gk = obj_control.player_list[i];
			}
		}
	}
	
	nearest_opponent = opponent_list[0];
	opponents_near_me = 0;
	for (var i = 0; i < array_length(opponent_list); ++i) {
	    if (point_distance(x,y,nearest_opponent.x,nearest_opponent.y) > point_distance(x,y, opponent_list[i].x, opponent_list[i].y)) {
			nearest_opponent = opponent_list[i];
		}
		if (point_distance(x,y, opponent_list[i].x, opponent_list[i].y) < 30) {
			opponents_near_me++;
		}
	}
	for (var i = 0; i < array_length(opponent_list); ++i) {
		if (point_distance(x,other_goal,x,y) > point_distance(opponent_list[i].x,other_goal, opponent_list[i].x, opponent_list[i].y) && point_distance(x,y, opponent_list[i].x, opponent_list[i].y) < 25) {
			open = false;
			break;
		} else {
			open = true;
		}
	}
	distance_to_nearest_opponent = distance_to_object(nearest_opponent);
	
	nearest_from_team_to_ball = team_list[0];
	for (var i = 0; i < array_length(team_list); ++i) {
	    if (point_distance(obj_ball.x,obj_ball.y,nearest_from_team_to_ball.x,nearest_from_team_to_ball.y) > point_distance(obj_ball.x,obj_ball.y,team_list[i].x,team_list[i].y)) {
			nearest_from_team_to_ball = team_list[i];
		}
	}
	
	nearest_teammate = teammate_list[0];
	closest_to_goal_teammate = teammate_list[0];
	teammates_in_front_of_me = [];
	teammates_pass_blocked = [];
	pass_target = teammate_list[0];
	pass_options = [];
	decision_options = [];
	for (var i = 0; i < array_length(teammate_list); ++i) {
		
	    if (point_distance(x,y,nearest_teammate.x,nearest_teammate.y) > point_distance(x,y,teammate_list[i].x,teammate_list[i].y)) {
			nearest_teammate = teammate_list[i];
		}
		if (point_distance(teammate_list[i].x,other_goal,teammate_list[i].x,teammate_list[i].y) < point_distance(closest_to_goal_teammate.x,closest_to_goal_teammate.y,180,other_goal)) {
			closest_to_goal_teammate = teammate_list[i];
		}
		if (point_distance(teammate_list[i].x,other_goal,teammate_list[i].x,teammate_list[i].y) < point_distance(x,other_goal,x,y) && abs(point_distance(x,other_goal,x,y) - point_distance(teammate_list[i].x,other_goal,teammate_list[i].x,teammate_list[i].y)) > 15) {
			array_push(teammates_in_front_of_me, teammate_list[i]);
		}
		for (var j = 0; j < array_length(opponent_list); ++j) {
		    if (pass_is_blocked(opponent_list[j], id, teammate_list[i]) || !teammate_list[i].open) {
				array_push(teammates_pass_blocked, teammate_list[i]);
			}
		}
		
		var mate = teammate_list[i];
	    var rating = 0;

	    var dist = point_distance(x, y, mate.x, mate.y);
	    var mate_to_goal = point_distance(mate.x, mate.y, 180, other_goal);

	    // 1. Is the pass blocked?
	    if (!array_contains(teammates_pass_blocked, mate)) {
	        rating += 20;
	    } else {
	        rating -= 20;
	    }

	    // 2. Distance factor (prefer mid-range passes)
	    if (dist < 20) {
	        rating -= 20;
	    } else if (dist < 60) {
	        rating += 20;
	    } else if (dist < 100) {
	        rating += 10;
	    } else {
	        rating -= 10;
	    }

	    // 3. Progressiveness (is he closer to goal than me?)
	    if (mate_to_goal < point_distance(x, y, 180, other_goal)) {
	        rating += 15;
	    } else if (dist > 125) { // He is not closer and he is very far from me
			rating -= 40;
		}
		
		if (mate.pos != "GK") {
			rating += lerp(0, 40, mate.distance_to_nearest_opponent/100);
		}

	    // Store
		pass_info = {target: mate, rating: rating};
	    array_push(pass_options, pass_info);
		
	}
	
	array_sort(pass_options, pass_sort);
	
	
	if (obj_ball.possession == id) { // I HAVE THE BALL
		
		hold_rating = 0;
		run_rating = lerp(0, 10, (tec - 1) / 2);
		run_rating += lerp(0, 10, (spd - 1) / 2);
		shoot_rating = 0;
		clear_rating = 0;
		pass_rating = pass_options[0].rating;
		
		nearest_goal_point = clamp(obj_ball.x,150,210);
		
		if (point_distance(x,y,nearest_goal_point,other_goal) < 70) { 
			shoot_rating += lerp(150, 60, point_distance(x,y,nearest_goal_point,other_goal) / 70);
		}
		
		if (abs(my_goal - y) < 317 * (1/3)) { // BALL IS IN MY THIRD (FIRST THIRD)
			
			clear_rating += 20;
			
			if (point_distance(x,y,nearest_opponent.x,nearest_opponent.y) < 30) {
				clear_rating += lerp(40, 20, (tec - 1) / 2);
			} else {
				hold_rating += 50;
				hold_rating -= lerp(40, 10, point_distance(x,y,nearest_opponent.x,nearest_opponent.y) / 70);
			}
			
		} else {
			
			if (abs(other_goal - nearest_opponent.y) > abs(other_goal - y) || abs(other_goal - y) < 317 * (1/3)) {
				run_rating += 30;
			}
			
		}
		
		if (open) {
			run_rating += 20;
		}

		
		if (opponents_near_me > 1) {
			run_rating -= 50;
		}
		
		decision_info = {decision: "hold", rating: hold_rating}; array_push(decision_options, decision_info);
		decision_info = {decision: "run", rating: run_rating}; array_push(decision_options, decision_info);
		decision_info = {decision: "shoot", rating: shoot_rating}; array_push(decision_options, decision_info);
		decision_info = {decision: "pass", rating: pass_rating}; array_push(decision_options, decision_info);
		decision_info = {decision: "clear", rating: clear_rating}; array_push(decision_options, decision_info);
		
		// distance to goal fator de correr com a bola 
		// comprimento do campo 317
	
		array_sort(decision_options, pass_sort);
		
	} else {
		
		
		
	}
	
}