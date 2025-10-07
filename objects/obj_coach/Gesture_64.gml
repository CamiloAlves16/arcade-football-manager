if (team == obj_control.teamA) {
	my_goals = obj_control.teamA_goals;
	other_goals = obj_control.teamB_goals;
} else {
	my_goals = obj_control.teamB_goals;
	other_goals = obj_control.teamA_goals;
}

for (var i = 0; i < array_length(things_you_can_say); ++i) {

	if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 70, 435 + (i*40), 360-70, 455 + (i*40)) && coach_id == "c10" && speech_cooldown <= 0) {
		
		coach_speech = things_you_can_say[i];
		speech_cooldown = 5;
		alarm[0] = 60;
		
		if (coach_speech == "C'MON GUYS, GIVE IT ALL YOU GOT!!") {
			
			for (var j = 0; j < array_length(my_players); ++j) {
			    my_players[j].stamina += 5;
			}
			
		} else if (coach_speech == "DON'T WORRY, WE GOT THIS!" && my_goals < other_goals) {
			
			for (var j = 0; j < array_length(my_players); ++j) {
			    my_players[j].stamina += 10;
			}
			
		} else if (coach_speech == "I AM THE SPECIAL ONE :)") {
			
			if (!achievements_completed) {
				achievement_set_completed("THE SPECIAL ONE, PT. 3");
			}
			
		} else if (coach_speech == "CAN'T BELIEVE I'M COACHING THIS STUPID TEAM...") {
			
			for (var j = 0; j < array_length(my_players); ++j) {
			    my_players[j].stamina = 6;
			}
			
		} else if (coach_speech == "RRRREEEEEEFFFFF!!!!!!") {
			
			ref_count++;
			if (ref_count == 3) {
				obj_referee.ref_speech = "ARE YOU LOOKING FOR A CARD?";
				obj_referee.alarm[0] = 120;
			} else if (ref_count == 4) {
				obj_referee.ref_speech = "THAT'S A YELLOW FOR YOU.";
				obj_referee.alarm[0] = 120;
				carded = true;
				if (!achievements_completed) {
					achievement_set_completed("THE REF IS THE PROBLEM!");
				}
			}
			
		}
		
	}

}