if (screen == "FIRST NAME" || screen == "LAST NAME" || screen == "COUNTRY") {
	
	if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 0, 0, room_width, room_height/2)) {
		
		if (!keyboard_virtual_status()) {
			keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_characters, false);
		} else {
			keyboard_virtual_hide();
		}
		
	}
	
} else if (screen == "CHARACTERISTICS") {
	
	if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 250, 155, 40)) {
	
		if (global.c10_sc == global.c_whiteskin) {
			global.c10_sc = global.c_lightskin;
		} else if (global.c10_sc == global.c_lightskin) {
			global.c10_sc = global.c_darkskin;
		} else {
			global.c10_sc = global.c_whiteskin;
		}
		audio_play_sound(snd_menu,1,false);

	} else if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 110, 135, 40)) {
	
		if (global.c10_sc == global.c_whiteskin) {
			global.c10_sc = global.c_darkskin;
		} else if (global.c10_sc == global.c_lightskin) {
			global.c10_sc = global.c_whiteskin;
		} else {
			global.c10_sc = global.c_lightskin;
		}
		audio_play_sound(snd_menu,1,false);

	} else if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 250, 285, 40)) {
	
		global.c10_age++;
		audio_play_sound(snd_menu,1,false);

	} else if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 110, 285, 40)) {
	
		global.c10_age--;
		audio_play_sound(snd_menu,1,false);

	}
	
} else if (screen == "TEAM") {

	if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 250, 135, 40)) {
	
		if (create_league_index < array_length(global.league_list) - 1) {
			create_league_index++;
		} else {
			create_league_index = 0;
		}
		create_league_array = variable_global_get(global.league_list[create_league_index] + "_class");
		create_team_index = 0;
		create_team = create_league_array[create_team_index];
		audio_play_sound(snd_menu,1,false);

	} else if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 110, 135, 40)) {
	
		if (create_league_index > 0) {
			create_league_index--;
		} else {
			create_league_index = array_length(global.league_list) - 1;
		}
		create_league_array = variable_global_get(global.league_list[create_league_index] + "_class");
		create_team_index = 0;
		create_team = create_league_array[create_team_index];
		audio_play_sound(snd_menu,1,false);

	} else if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 250, 255, 40)) {
	
		if (create_team_index < array_length(create_league_array) - 1) {
			create_team_index++;
		} else {
			create_team_index = 0;
		}
		create_team = create_league_array[create_team_index];
		audio_play_sound(snd_menu,1,false);

	} else if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 110, 255, 40)) {
	
		if (create_team_index > 0) {
			create_team_index--;
		} else {
			create_team_index = array_length(create_league_array) - 1;
		}
		create_team = create_league_array[create_team_index];
		audio_play_sound(snd_menu,1,false);

	}
	
} else if (screen == "SHOW TUTORIALS?") {
	
	if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 250, 285, 40)) {
	
		if (tutorial_state == "NO") {
			tutorial_state = "YES";
		} else {
			tutorial_state = "NO";
		}
		audio_play_sound(snd_menu,1,false);

	} else if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 110, 285, 40)) {
	
		if (tutorial_state == "NO") {
			tutorial_state = "YES";
		} else {
			tutorial_state = "NO";
		}
		audio_play_sound(snd_menu,1,false);

	}
	
}

if (!keyboard_virtual_status()) {
	
	if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 180-100, 570-15, 180+100, 570+15)) {
		
		if (screen != array_last(screens)) {
			
			audio_play_sound(snd_key,1,false);
			keyboard_string = "";
			screen = screens[array_get_index(screens, screen) + 1];
			
			if (screen == "LAST NAME" || screen == "COUNTRY") {
				keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_characters, false);
			}
			
		} else {
			
			if (tutorial_state == "NO") {
				global.mainmenu_tutorial = true;
				global.squadpage_tutorial = true;
				global.contacts_tutorial = true;
				global.offers_tutorial = true;
				global.playerpage_tutorial = true;
			}
			
			global.c10_contract = 2;
			global.c10_team = create_team;
			coach_replacing = variable_global_get(create_team + "_coach");
		
			if (create_team != "freeagent") {
			
				if (coach_replacing != "") {
				
					variable_global_set(coach_replacing + "_team", "freeagent");
					variable_global_set(coach_replacing + "_contract", 0);
					array_push(global.coach_freeagent, coach_replacing);
				}
				variable_global_set(create_team + "_coach", "c10");
			
				if (array_contains(global.coach_freeagent, "c10")) {
					array_delete(global.coach_freeagent, array_get_index(global.coach_freeagent, "c10"), 1);
				}
				global.c10_reputation = variable_global_get(create_team + "_reputation");
			
			}
		
	
			for (var i = 0; i < array_length(global.events); ++i) {
				if (global.events[i].hometeam == create_team || global.events[i].awayteam == create_team) {
					global.events[i].watch = true;
				}
			}
			
			audio_play_sound(snd_key,1,false);
			event_user(1);
			room = rm_career_mode;
		
		}
	
	}
	
}

if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 0, 0, 60, 40)) {
	
	esc_option_index = 1;
	audio_play_sound(snd_key,1,false);
	keyboard_virtual_hide();
	room = rm_titlescreen;
	
}