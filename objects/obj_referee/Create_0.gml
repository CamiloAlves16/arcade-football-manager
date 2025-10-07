mov_speed = 0.8;
slide_counter = 0;
sprite = spr_idle_7;
action = "idle";
dir = 7;
ref_speech = "";
randomize();
sc = choose(global.c_whiteskin, global.c_lightskin, global.c_darkskin);

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
		
	}
	
	if (point_distance(x,y,room_width,y) > x_to_check_from_right + 1 && slide_counter <= 0) { // Too far to the left
		
		action = "run";
		x += mov_speed;
		dir = 7;
					
	}
	
	if (point_distance(x,y,x,0) <= y_to_check_from_up + 1 && slide_counter <= 0) { // Too far to the down
		
		action = "run";
		y += mov_speed;
		dir = 1;
					
	}
	
	if (point_distance(x,y,x,room_height) <= y_to_check_from_down + 1 && slide_counter <= 0) { // Too far to the up
		
		action = "run";
		y -= mov_speed;
		dir = 5;
					
	}
	
	if (point_distance(x,y,0,y) <= x_to_check_from_left + 1 && point_distance(x,y,room_width,y) <= x_to_check_from_right + 1 && point_distance(x,y,x,0) <= y_to_check_from_up + 1 && point_distance(x,y,x,room_height) <= y_to_check_from_down + 1) {
		
		action = "idle";
		
	}
	
}
