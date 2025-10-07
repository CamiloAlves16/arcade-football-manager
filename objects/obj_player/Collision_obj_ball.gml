
if (obj_ball.possession == noone && obj_ball.can_be_touched <= 0 && (obj_ball.restart == team || obj_ball.restart == noone)) {
	
	if (action == "save") {
		
		if (save_successful) {
			
			if (tkl == 3) {
				obj_ball.direction = point_direction(obj_ball.x, obj_ball.y, nearest_teammate.x, nearest_teammate.y);
			} else {
				obj_ball.vspeed = -obj_ball.vspeed;
				if (abs(obj_ball.hspeed) < 2) {
					if (obj_ball.x > 180) {
						obj_ball.hspeed += 2;
					} else {
						obj_ball.hspeed -= 2;
					}
				}
			}
			saves++;
			obj_ball.can_be_touched = 10;
			
		}
		
	} else {
		
		if (obj_ball.z < 5) {
		
			if (obj_ball.last_touch != noone && obj_ball.last_touch != id) {
			
				if (obj_ball.last_touch.team == team) {
					assisted_by = obj_ball.last_touch;
				} else {
					assisted_by = noone;
				}
			
			} else {
			
				assisted_by = noone;
			
			}
			obj_ball.zspeed = 0;
			obj_ball.speed = 0;
			obj_ball.possession = id;
			if (obj_ball.restart != noone) {
				pass(nearest_teammate, 3);
				obj_ball.restart = noone;
			}
			slide_counter = 0;
		
		} else if (obj_ball.z < 20) {
			
			obj_ball.speed = 0;
			if (dir == 1) {
				obj_ball.vspeed = 2;
			} else if (dir == 3) {
				obj_ball.hspeed = -2;
			} else if (dir == 5) {
				obj_ball.vspeed = -2;
			} else if (dir == 7) {
				obj_ball.hspeed = 2;
			}
			
		}
	
	}
	
}

if (obj_ball.possession != noone && action == "slide") {
	
	if (tackle_successful) {
		
		obj_ball.possession.slide_counter = 40;
		if (obj_ball.possession.team != team) {
			tackles_won++;
		}
		obj_ball.possession = id;
		slide_counter = 0;
		action = "idle";
		
	}
	
}
