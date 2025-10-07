if (array_length(warnings) < 1) {
	
	if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 0, 0, 60, 40) && array_length(previous_pages) > 0) {
		go_back = array_pop(previous_pages);
		if (go_back.previous_screen == "SQUAD PAGE") {
			current_team = go_back.previous_current_team;
		}
		selected_index = go_back.previous_selected_index;
		screen = go_back.previous_screen;
		esc_button_index = 1;
		keyboard_virtual_hide();
		audio_play_sound(snd_key,1,false);
		alarm[0] = 15;
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 0, 600, 150, 640) && global.c10_team != "freeagent") {
	
		selected_index = 0;
		change_screen("SQUAD PAGE");
		tactic = variable_global_get(global.c10_team + "_tactic");
		tactic_selected = undefined;
		current_team = global.c10_team;
		audio_play_sound(snd_menu,1,false);
	
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 300, 0, 360, 40)) {
		
		if (global.c10_team != "freeagent") {
			current_league = variable_global_get(global.c10_team + "_league");
		}
		selected_index = 0;
		change_screen("SCHEDULE");
		audio_play_sound(snd_menu,1,false);
	
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 210, 600, 360, 640) && global.c10_team != "freeagent") {
		
		change_screen("TEAM INFO");
		audio_play_sound(snd_menu,1,false);
	
	} else if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 350, 320, 40) && array_contains(menu_options, screen)) {

		selected_index = 0;
		if (array_contains(menu_options, screen) && array_get_index(menu_options, screen) + 1 < array_length(menu_options)) {
			change_screen(menu_options[array_get_index(menu_options, screen) + 1]);
		} else {
			change_screen(menu_options[0]);
		}
		audio_play_sound(snd_menu,1,false);

	} else if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 10, 320, 40) && array_contains(menu_options, screen)) {

		selected_index = 0;
		if (array_contains(menu_options, screen) && array_get_index(menu_options, screen) > 0) {
			change_screen(menu_options[array_get_index(menu_options, screen) - 1]);
		} else {
			change_screen(menu_options[array_length(menu_options) - 1]);
		}
		audio_play_sound(snd_menu,1,false);

	} else if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 350, 320, 40) && (screen == "TACTICS" || screen == "SQUAD PAGE" || screen == "U19 SQUAD PAGE")) {
		
		selected_index = 0;
		if (current_team == global.c10_team) {
			if (screen == "SQUAD PAGE") {
				screen = "TACTICS";
			} else if (screen == "TACTICS") {
				screen = "U19 SQUAD PAGE";
			} else {
				screen = "SQUAD PAGE";
			}
			audio_play_sound(snd_menu,1,false);
		}

	} else if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 10, 320, 40) && (screen == "TACTICS" || screen == "SQUAD PAGE" || screen == "U19 SQUAD PAGE")) {
		
		selected_index = 0;
		if (current_team == global.c10_team) {
			if (screen == "SQUAD PAGE") {
				screen = "U19 SQUAD PAGE";
			} else if (screen == "U19 SQUAD PAGE") {
				screen = "TACTICS";
			} else {
				screen = "SQUAD PAGE";
			}
			audio_play_sound(snd_menu,1,false);
		}

	} else if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 350, 320, 40) && (screen == "PLAYER PAGE" || screen == "PLAYER PAGE 2")) {

		if (current_team == global.c10_team) {
			if (screen == "PLAYER PAGE") {
				screen = "PLAYER PAGE 2";
			} else {
				screen = "PLAYER PAGE";
			}
			audio_play_sound(snd_menu,1,false);
		}

	} else if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 10, 320, 40) && (screen == "PLAYER PAGE" || screen == "PLAYER PAGE 2")) {

		if (current_team == global.c10_team) {
			if (screen == "PLAYER PAGE") {
				screen = "PLAYER PAGE 2";
			} else {
				screen = "PLAYER PAGE";
			}
			audio_play_sound(snd_menu,1,false);
		}

	}	
	
	
	if (screen == "SCHEDULE") {
		
		for (var i = 0; i < max_display; ++i) {
			
			if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 50, 50 + ((i)*20) - 6, 300, 50 + ((i)*20) + 6)) {
				selected_index = i;
			}
		
		}
	
		if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option1_x - 70, option1_y - 15, option1_x + 70, option1_y + 15)) {
		
			if (can_advance) {
				option1_index = 1;
				audio_play_sound(snd_key,1,false);
				can_advance = false;
				alarm[0] = 15;
			}
		
		} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option2_x - 70, option2_y - 15, option2_x + 70, option2_y + 15) && array_length(schedule_array) > 0) {
			
			if (!schedule_array[selected_index].played) {
				if (schedule_array[selected_index].watch) {
					schedule_array[selected_index].watch = false;
				} else {
					schedule_array[selected_index].watch = true;
				}
			}
		
			audio_play_sound(snd_key,1,false);
			option2_index = 1;
			alarm[0] = 15;
		
		} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option3_x - 70, option3_y - 15, option3_x + 70, option3_y + 15) && array_length(schedule_array) > 0) {
		
			change_screen("SQUAD PAGE");
			if (schedule_array[selected_index].hometeam == global.c10_team) {
				current_team = schedule_array[selected_index].awayteam;
			} else {
				current_team = schedule_array[selected_index].hometeam;
			}
			selected_index = 0;
		
			audio_play_sound(snd_key,1,false);
			option3_index = 1;
			alarm[0] = 15;
		
		} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option4_x - 70, option4_y - 15, option4_x + 70, option4_y + 15) && global.c10_team != "freeagent") {
		
			change_screen("LEAGUE PAGE");
			current_league = variable_global_get(global.c10_team + "_league");
			selected_index = 0;
			audio_play_sound(snd_key,1,false);
			option4_index = 1;
			alarm[0] = 15;
		
		}

	} else if (screen == "SQUAD PAGE" || screen == "U19 SQUAD PAGE") {
		
		for (var i = 0; i < max_display; ++i) {
			
			if (i < 5) {
				vertical_separation = 50;
			} else {
				vertical_separation = 70;
			}
			
			if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 50, vertical_separation + ((i)*20) - 6, 300, vertical_separation + ((i)*20) + 6)) {
				selected_index = i;
			}
		
		}
	
		if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option1_x - 70, option1_y - 15, option1_x + 70, option1_y + 15)) {
		
			if (current_team == global.c10_team) {
		
				if (selected_index > 0) {
					temp = squad_array[selected_index - 1];
					squad_array[selected_index - 1] = squad_array[selected_index];
					squad_array[selected_index] = temp;
					selected_index--;
				}
		
			} else if (array_length(squad_array) > 0) {
			
				change_screen("PLAYER PAGE");
				selected = squad_array[selected_index];
				selected_index = 0;
			
			}
		
			audio_play_sound(snd_key,1,false);
			option1_index = 1;
			alarm[0] = 15;
		
		} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option2_x - 70, option2_y - 15, option2_x + 70, option2_y + 15)) {
		
			if (current_team == global.c10_team) {
		
				if (selected_index < array_length(squad_array) - 1) {
					temp = squad_array[selected_index + 1];
					squad_array[selected_index + 1] = squad_array[selected_index];
					squad_array[selected_index] = temp;
					selected_index++;
				}
			
			} else {
			
				if (variable_global_exists(variable_global_get(current_team + "_league") + "_class")) {
					selected_index = 0;
					change_screen("LEAGUE PAGE");
					current_league = variable_global_get(current_team + "_league");
				} else {
					warning = {
						warning_title: "LEAGUE UNAVAILABLE",
						warning_text: "CONGRATULATIONS! YOU FOUND AN EASTER EGG. SORRY ;)"
					};
					warning_push(warning);
				}
			
			}
		
			audio_play_sound(snd_key,1,false);
			option2_index = 1;
			alarm[0] = 15;
		
		} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option3_x - 70, option3_y - 15, option3_x + 70, option3_y + 15) && current_team == global.c10_team) {
			
			if (array_length(squad_array) > 0) {
			
				change_screen("PLAYER PAGE");
				selected = squad_array[selected_index];
				selected_index = 0;
			
			}
		
			audio_play_sound(snd_key,1,false);
			option3_index = 1;
			alarm[0] = 15;
		
		} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option4_x - 70, option4_y - 15, option4_x + 70, option4_y + 15) && current_team == global.c10_team) {
		
			change_screen("LEAGUE PAGE");
			current_league = variable_global_get(global.c10_team + "_league");
			selected_index = 0;
			audio_play_sound(snd_key,1,false);
			option4_index = 1;
			alarm[0] = 15;
		
		}
				
	} else if (screen == "LEAGUE PAGE") {
		
		for (var i = 0; i < max_display; ++i) {
			
			if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 50, 50 + ((i)*20) - 6, 300, 50 + ((i)*20) + 6)) {
				selected_index = i;
			}
		
		}
	
		if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option1_x - 70, option1_y - 15, option1_x + 70, option1_y + 15)) {
			
			if (variable_global_exists(current_league + "_class")) {
				change_screen("SQUAD PAGE");
				current_team = current_league_array[selected_index];
				selected_index = 0;
				audio_play_sound(snd_key,1,false);
				option1_index = 1;
				alarm[0] = 15;
			} else {
				if (current_league_array[selected_index].hometeam != "TBD") {
					change_screen("SQUAD PAGE");
					current_team = current_league_array[selected_index].hometeam;
					selected_index = 0;
					audio_play_sound(snd_key,1,false);
					option1_index = 1;
					alarm[0] = 15;
				}
			}
		
		} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option2_x - 70, option2_y - 15, option2_x + 70, option2_y + 15)) {
			
			if (!variable_global_exists(current_league + "_class") && current_league_array[selected_index].awayteam != "TBD") {
				change_screen("SQUAD PAGE");
				current_team = current_league_array[selected_index].awayteam;
				selected_index = 0;
				audio_play_sound(snd_key,1,false);
				option2_index = 1;
				alarm[0] = 15;
			}
			
		} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option3_x - 70, option3_y - 15, option3_x + 70, option3_y + 15)) {
			
			if (!variable_global_exists(current_league + "_class")) {
				if (!current_league_array[selected_index].played) {
					
					if (current_league_array[selected_index].watch) {
						current_league_array[selected_index].watch = false;
					} else {
						current_league_array[selected_index].watch = true;
					}
					
				}
				audio_play_sound(snd_key,1,false);
				option3_index = 1;
				alarm[0] = 15;
			}
			
		}
	
	} else if (screen == "COEFFICIENTS") {
		
		for (var i = 0; i < max_display; ++i) {
			
			if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 50, 50 + ((i)*20) - 6, 300, 50 + ((i)*20) + 6)) {
				selected_index = i;
			}
		
		}
	
		if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option1_x - 70, option1_y - 15, option1_x + 70, option1_y + 15)) {
		
			change_screen("LEAGUE PAGE");
			current_league = coefficient_list[selected_index];
			selected_index = 0;
		
			audio_play_sound(snd_key,1,false);
			option1_index = 1;
			alarm[0] = 15;
		
		}
	
	} else if (screen == "FREE AGENTS" || screen == "LOAN LIST" || screen == "TRANSFER LIST") {
		
		for (var i = 0; i < max_display; ++i) {
			
			if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 50, 50 + ((i)*20) - 6, 300, 50 + ((i)*20) + 6)) {
				selected_index = i;
			}
			
		}
	
		if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option1_x - 70, option1_y - 15, option1_x + 70, option1_y + 15) && array_length(squad_array) > 0) {
			
			change_screen("PLAYER PAGE");
			selected = squad_array[selected_index];
			selected_index = 0;
		
			audio_play_sound(snd_key,1,false);
			option1_index = 1;
			alarm[0] = 15;
		
		} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option2_x - 70, option2_y - 15, option2_x + 70, option2_y + 15) && array_length(squad_array) > 0) {
			
			if (squad_array_sort == "CURRENT ABILITY") {
				array_sort(squad_array, pick_goalkeeper);
				squad_array_sort = "GOALKEEPER(S)";
			} else if (squad_array_sort == "GOALKEEPER(S)") {
				array_sort(squad_array, pick_defender);
				squad_array_sort = "DEFENDER(S)";
			} else if (squad_array_sort == "DEFENDER(S)") {
				array_sort(squad_array, pick_midfielder);
				squad_array_sort = "MIDFIELDER(S)";
			} else if (squad_array_sort == "MIDFIELDER(S)") {
				array_sort(squad_array, pick_forward);
				squad_array_sort = "FORWARD(S)";
			} else {
				array_sort(squad_array, ca_sort);
				squad_array_sort = "CURRENT ABILITY";
			}
			selected_index = 0;
			audio_play_sound(snd_key,1,false);
			option2_index = 1;
			alarm[0] = 15;
			
		}
	
	} else if (screen == "OPTIONS") {
		
		for (var i = 0; i < max_display; ++i) {
			
			if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 50, 50 + ((i)*20) - 6, 300, 50 + ((i)*20) + 6)) {
				selected_index = i;
			}
		
		}
	
		if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option1_x - 70, option1_y - 15, option1_x + 70, option1_y + 15)) {
		
			if (lastpage_options[selected_index] == "SAVE") {
				savegame();
				warning = {
					warning_title: "GAME SAVED",
					warning_text: ""
				};
				warning_push(warning);
			} else if (lastpage_options[selected_index] == "EXIT") {
				room = rm_titlescreen;
			} else if (lastpage_options[selected_index] == "NOTIFICATIONS") {
				if (global.warning_mode == "ALL") {
					global.warning_mode = "WORLDWIDE REPUTATION";
				} else {
					global.warning_mode = "ALL";
				}
			}
			
			audio_play_sound(snd_key,1,false);
			option1_index = 1;
			alarm[0] = 15;
		
		}
				
	} else if (screen == "OFFERS") {
		
		for (var i = 0; i < max_display; ++i) {
			
			if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 50, 50 + ((i)*20) - 6, 300, 50 + ((i)*20) + 6)) {
				selected_index = i;
			}
		
		}
	
		if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option1_x - 70, option1_y - 15, option1_x + 70, option1_y + 15) && array_length(global.c10_offers) > 0) {
		
			change_screen("SQUAD PAGE");
			current_team = global.c10_offers[selected_index].team;
			selected_index = 0;
			option1_index = 1;
			audio_play_sound(snd_key,1,false);
			alarm[0] = 15;
		
		} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option2_x - 70, option2_y - 15, option2_x + 70, option2_y + 15) && array_length(global.c10_offers) > 0) {
		
			array_delete(global.coach_freeagent, array_get_index(global.coach_freeagent, "c10"), 1);
			global.c10_team = global.c10_offers[selected_index].team;
			variable_global_set(global.c10_offers[selected_index].team + "_coach", "c10");
			global.c10_contract = global.c10_offers[selected_index].contract;
			warning_text = global.c10_firstname + " " + global.c10_lastname + " HAS BECOME THE NEW COACH OF " + variable_global_get(global.c10_offers[selected_index].team + "_name") + ".";
					
			if (global.c10_reputation < variable_global_get(global.c10_offers[selected_index].team + "_reputation")) {
			
				rep_diff = ( variable_global_get(global.c10_offers[selected_index].team + "_reputation") - global.c10_reputation ) / 2;
			
				global.c10_reputation = clamp(round(global.c10_reputation + rep_diff), 1, 5);
			
			} else if (variable_global_get(global.c10_offers[selected_index].team + "_reputation") < global.c10_reputation) {
			
				rep_diff = (global.c10_reputation - variable_global_get(global.c10_offers[selected_index].team + "_reputation") ) / 2;
			
				variable_global_set(global.c10_offers[selected_index].team + "_reputation", clamp(round(variable_global_get(global.c10_offers[selected_index].team + "_reputation") + rep_diff), 1, 5) );
					
				warning_text += " THIS MOVE HAS BOOSTED THE CLUB'S REPUTATION."
			
			}
			
			warning = {	warning_title: "NEW COACH ALERT!", warning_text: warning_text};
			warning_push(warning);
			
			schedule_array = [];
			for (var i = 0; i < array_length(global.events); ++i) {
				if (global.events[i].hometeam == global.c10_team || global.events[i].awayteam == global.c10_team) {
					array_push(schedule_array, global.events[i]);
					global.events[i].watch = true;
				}
			}
			
			menu_options = ["SCHEDULE", "FREE AGENTS", "LOAN LIST", "COEFFICIENTS", "CONTACTS", "OPTIONS"];
			screen = "SCHEDULE";
			
			array_delete(global.c10_offers,selected_index,array_length(global.c10_offers));
			
			audio_play_sound(snd_key,1,false);
			option2_index = 1;
			alarm[0] = 15;
		
		}

	} else if (screen == "CONTACTS") {
		
		for (var i = 0; i < max_display; ++i) {
			
			if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 50, 50 + ((i)*20) - 6, 300, 50 + ((i)*20) + 6)) {
				selected_index = i;
			}
		
		}
	
		if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option1_x - 70, option1_y - 15, option1_x + 70, option1_y + 15)) {
			
			
			if (variable_global_exists(contacts[selected_index] + "_firstname")) {
				
				selected = contacts[selected_index];
				change_screen("PLAYER PAGE");
				
			} else {
				
				person_im_talking_to = contacts[selected_index];
				if (person_im_talking_to == "SCOUT") {
					scout_list = [];
					array_copy(scout_list, 0, global.player_list, 0, array_length(global.player_list));
				}
				change_screen("INTERACTION");
				
			}
			audio_play_sound(snd_key,1,false);
			option1_index = 1;
			alarm[0] = 15;
		
		}
				
	} else if (screen == "PLAYER PAGE") { // PLAYER PAGE
	
		if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option1_x - 70, option1_y - 15, option1_x + 70, option1_y + 15)) {
		
			if (selected_team == global.c10_team) { // TALK
				
				person_im_talking_to = selected;
				change_screen("INTERACTION");
			
			} else {
				
				if (global.c10_team == "freeagent") {
					
					warning = { warning_title: "UNEMPLOYED", warning_text: "YOU DON'T HAVE A TEAM TO SIGN THIS PLAYER."};
					warning_push(warning);
					
				} else if (global.week < global.max_weeks/2) {
					
					if (selected_team == "freeagent") {
					
						person_im_talking_to = selected;
						change_screen("INTERACTION");
						
					} else {
						
						person_im_talking_to = variable_global_get(selected_team + "_abrv") + " D.O.F.";
						change_screen("INTERACTION");
						array_push(interaction_dialogue, "HI, WE WANT TO TALK ABOUT " + selected_name + ".");
						can_talk = false;
						alarm[2] = irandom_range(60,120);
						
					}
				
				} else {
						
					warning = { warning_title: "TRANSFER WINDOW CLOSED", warning_text: "THE TRANSFER WINDOW IS ONLY OPEN UNTIL WEEK " + string(global.max_weeks/2) + "."};
					warning_push(warning);
			
				}
			
			}
		
		} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 180-20, 120-50, 180+20, 120+10)) { // PLAYER SQUARE
		
			if (selected_team != "freeagent") {
				
				if (array_contains(vgg(selected_team + "_u19_squad"), selected)) {
					change_screen("U19 SQUAD PAGE");
				} else {
					change_screen("SQUAD PAGE");
				}
				current_team = selected_team;
			
			} else {
				
				change_screen("FREE AGENTS");
				
			}
			
			audio_play_sound(snd_menu,1,false);
		
		}
	
	} else if (screen == "INTERACTION") {
		
		if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option1_x - 70, option1_y - 15, option1_x + 70, option1_y + 15) && can_talk) {
			
			keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_characters, false);
			
		}
		
	}
	
} else {
	
	if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option1_x - 70, option1_y - 15, option1_x + 70, option1_y + 15)) {
		
		audio_play_sound(snd_key,1,false);
		option1_index = 1;
		alarm[1] = 15;
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], option2_x - 70, option2_y - 15, option2_x + 70, option2_y + 15)) {
		
		audio_play_sound(snd_key,1,false);
		option2_index = 1;
		alarm[1] = 15;
		
	}
	
}