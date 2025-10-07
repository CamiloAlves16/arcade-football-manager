depth = -y;

if (possession != noone) {
	
	if (possession.dir == 1) {
		x = possession.x;
		y = possession.y + (possession.mov_speed + 1);
		if (possession.action != "idle") {
			sprite = sprite1;
		} else {
			sprite = idle_sprite;
		}
	} else if (possession.dir == 3) {
		x = possession.x - (possession.mov_speed + 1);
		y = possession.y + (possession.mov_speed + 1);
		if (possession.action != "idle") {
			sprite = sprite3;
		} else {
			sprite = idle_sprite;
		}
	} else if (possession.dir == 5) {
		x = possession.x;
		y = possession.y - (possession.mov_speed + 1);
		if (possession.action != "idle") {
			sprite = sprite5;
		} else {
			sprite = idle_sprite;
		}
	} else if (possession.dir == 7) {
		x = possession.x + (possession.mov_speed + 1);
		y = possession.y + (possession.mov_speed + 1);
		if (possession.action != "idle") {
			sprite = sprite7;
		} else {
			sprite = idle_sprite;
		}
	}
	
	last_touch = possession;
	
	if (possession.team == obj_control.teamA) {
		teamA_possession++;
	} else {
		teamB_possession++;
	}
	
}

if (can_be_touched > 0) {
	can_be_touched--;
}

if (y >= 350 && can_be_goal) {
	
	can_be_goal = false;
	
	if (x < 213 && x > 146 && possession == noone) { // GOAL
		
		possession = noone;
		restart = obj_control.teamB;
		obj_control.teamA_goals += 1;
		audio_play_sound(snd_goal,1,false);
		if (last_touch.team == obj_control.teamA) {
			last_touch.goals++;
			if (last_touch.assisted_by != noone) {
				last_touch.assisted_by.assists++;
			}
		}
		x = 180;
		y = 190;
		z = 0;
		speed = 0;
		zspeed = 0;
		reset();
		audio_play_sound(snd_whistle,1,false);
		
	} else if (((x > 213 && x < 218) || (x > 141 && x < 146))) { // POST
	
		y = 349;
		reflective_force = speed*0.7;
		speed = 0;
		speed = -reflective_force;
		audio_play_sound(snd_post,1,false);
	
	} else { // OUT
		
		possession = noone;
		restart = obj_control.teamB;
		x = 210;
		y = 340;
		z = 0;
		speed = 0;
		zspeed = 0;
		reset();
		audio_play_sound(snd_whistle,1,false);
		
	}
	
	can_be_goal = true;
	
} else if (y <= 31 && can_be_goal) {
	
	can_be_goal = false;
	
	if (x < 213 && x > 146 && possession == noone) {
		
		possession = noone;
		restart = obj_control.teamA;
		obj_control.teamB_goals += 1;
		audio_play_sound(snd_goal,1,false);
		if (last_touch.team == obj_control.teamB) {
			last_touch.goals++;
			if (last_touch.assisted_by != noone) {
				last_touch.assisted_by.assists++;
			}
		}
		x = 180;
		y = 190;
		z = 0;
		speed = 0;
		zspeed = 0;
		reset();
		audio_play_sound(snd_whistle,1,false);
		can_be_goal = true;
	
	} else if (((x > 213 && x < 218) || (x > 141 && x < 146))) { 
	
		y = 32;
		reflective_force = speed*0.7;
		speed = 0;
		speed = -reflective_force;
		audio_play_sound(snd_post,1,false);
	
	} else {
		
		can_be_goal = false;
		possession = noone;
		restart = obj_control.teamA;
		x = 150;
		y = 41;
		z = 0;
		speed = 0;
		zspeed = 0;
		reset();
		audio_play_sound(snd_whistle,1,false);
		
	}
	
	can_be_goal = true;
	
}

if (x >= 329 - 4) {
	x = 324;
	speed = 0;
} else if (x <= 30 + 4) {
	x = 35;
	speed = 0;
}

if (abs(speed) > fric) {
	speed -= fric * sign(speed);
} else {
    speed = 0;
}

z += zspeed;
zspeed -= grav;  // subtract so gravity pulls down

if (z <= 0) {
    z = 0;
    zspeed = -zspeed * bounce;

    if (abs(zspeed) < 0.5) {
        zspeed = 0;
    }
}

if (vspeed > 0) {
	sprite = sprite1;
} else if (vspeed < 0) {
	sprite = sprite5;
} else if (hspeed > 0) {
	sprite = sprite7;
} else if (hspeed < 0) {
	sprite = sprite3;
} else if (possession == noone) {
	sprite = idle_sprite;
}