/// @description AI

depth = -y;

if (instance_exists(obj_ball) && obj_control.timeclock <= 0) {
	
	read_situation();
	
	if (obj_ball.possession == noone) { // What if noone has the ball?
		
		if (point_in_circle(obj_ball.x, obj_ball.y,x, y, 40) && pos == "GK" && gk > 1 && obj_ball.speed > 0.1 && slide_counter <= 0 && obj_ball.last_touch != id && obj_ball.last_touch.team != team && action != "save") {
			
			save_prob = lerp(0.3, 0.9, (sav-1) / 2);
			
			randomize();
			random_result = random(1);
			
			if (random_result <= save_prob) {
				save_successful = true;
			} else {
				save_successful = false;
			}
			
			var dy = y - obj_ball.y;
			var intercept_x = obj_ball.x;
			if (obj_ball.vspeed != 0) {
		        var t = dy / obj_ball.vspeed; // time until ball reaches GK’s y
		        intercept_x = obj_ball.x + obj_ball.hspeed * t;
		    }
			
			if (intercept_x < x - 12) {
				dir = 3;
				hspeed = -2;
				action = "save";
				slide_counter = 20;
			} else if (intercept_x > x + 12) {
				dir = 7;
				hspeed = 2;
				action = "save";
				slide_counter = 20;
			}
			
		}
		
		if (pos == "GK") {
			if (obj_ball.x > 220) {
				target_x = 210;
			} else if (obj_ball.x < 140) {
				target_x = 150;
			} else {
				target_x = 180;
			}
		}
		
		if (!position_check(obj_ball.x,obj_ball.y) && (obj_ball.restart == team || obj_ball.restart == noone) && nearest_from_team_to_ball == id) {
			
			position(obj_ball.x,obj_ball.y);
			
		} else if (!position_check(target_x, target_y) && obj_ball.restart == noone) {
			
			position(target_x,target_y);
			
		} else {
			
			action = "idle";
			if (other_goal > 190) {
				dir = 1;
			}
			
		}
			
	} else if (obj_ball.possession.team != team) {
		
		if (point_in_circle(obj_ball.x,obj_ball.y,x,target_y,radius)) { // THE OPPOSITION HAS THE BALL IN MY RANGE
		
			if (point_distance(obj_ball.x,obj_ball.y,x,y) > 20) {
			
				position(obj_ball.x,obj_ball.y);
			
			} else if (slide_counter <= 0) {
			
				tackle_prob = lerp(0.2, 0.8, (tkl-1) / 2);
			
				randomize();
				random_result = random(1);
			
				if (random_result <= tackle_prob) {
					tackle_successful = true;
				} else {
					tackle_successful = false;
				}
			
				action = "slide";
				direction = point_direction(x,y,obj_ball.x,obj_ball.y);
				speed = 2.5;
				slide_counter = 35;
			
			}
		
		} else { // THE OPPOSITION HAS THE BALL BUT NOT IN RANGE
			
			if (!position_check(target_x, target_y)) {
			
				position(target_x,target_y);
			
				} else {
			
				action = "idle";
			
			}
			
		}
		
	} else if (obj_ball.possession.team == team) {
	
		if (obj_ball.possession == id) { // I HAVE THE BALL
		
			if (decision_options[0].decision == "shoot") { 
			
				shoot();
			
			} else if (decision_options[0].decision == "pass") {
			
				pass(pass_options[0].target, tec);
				
			} else if (decision_options[0].decision == "clear") {
			
				pass(closest_to_goal_teammate, tec);
						
			
			} else if (decision_options[0].decision == "run") {
			
				shooting_position_x = clamp(obj_ball.x,145,215);
				
				if (point_distance(x,y,nearest_opponent.x,nearest_opponent.y) < 20 && nearest_opponent.action == "slide") {
					
					dribble();
				
				}
				
				if (!position_check(shooting_position_x,other_goal)) {
				
					position(shooting_position_x,other_goal);
				
				}
			
			} else if (decision_options[0].decision == "hold") {
			
				action = "idle";
				if (other_goal > 190) {
					dir = 1;
				} else {
					dir = 5;
				}
			
			}
			
		} else { // TEMPORARY TEAMMATES HAVE BALL
			
			var get_open_x = target_x;
			var get_open_y = target_y;
			if (pos != "GK") {
				if (nearest_opponent.x > x) {
					get_open_x = target_x - 40;
				} else if (nearest_opponent.x < x) {
					get_open_x = target_x + 40;
				}
				if (obj_ball.y > y) {
					get_open_y = target_y + 20;
				} else if (obj_ball.y < y) {
					get_open_y = target_y - 20;
				}
			}
			
			if (!position_check(get_open_x, get_open_y)) {
			
				position(get_open_x, get_open_y);
			
			} else {
			
				action = "idle";
				if (other_goal > 190) {
					dir = 1;
				}
			
			}
		
		}
	
	}
			
}


if (y >= 350) {
	speed = 0;
} else if (y <= 31) {
	speed = 0;
} else if (x >= 329 - 4) {
	speed = 0;
} else if (x <= 30 + 4) {
	speed = 0;
}

if (abs(speed) > 0.1) {
	speed -= 0.1 * sign(speed);
} else {
    speed = 0;
}

if (stamina < max_stamina && action == "idle") {
	stamina += 4;
}

if (stamina < max_stamina*0.5) {
	mov_speed = og_mov_speed * 0.6;
} else {
	mov_speed = og_mov_speed;
}

if (slide_counter > 0) {
	slide_counter--;
} else if (action == "slide" || action == "save") {
	action = "idle";
}

if (obj_ball.restart != noone && obj_ball.restart != team) {
	slide_counter = 2;
}

if (action == "save") {
	if (dir == 3) {
		mask_index = spr_save_3;
	} else {
		mask_index = spr_save_7;
	}
	
} else {
	mask_index = spr_idle_1;
}