/// @description INTERACTION NEXT STEP

if (can_talk) {
	if (!keyboard_virtual_status()) {
		keyboard_string = "";
		keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_characters, false);
	}
	
} else {
	
	if (array_last(interaction_dialogue) == "WE ACCEPT. WE'LL SET UP A MEETING TO DISCUSS TERMS WITH THE PLAYER." || array_last(interaction_dialogue) == "GREAT. WE'LL SET UP A MEETING TO DISCUSS TERMS WITH THE PLAYER.") {
		
		person_im_talking_to = selected;
		screen = "INTERACTION";
		interaction_dialogue = [];
		keyboard_string = "";
		interaction_write = "";
		negotiation_path = "";
		negotiation_stage = 0;
		can_talk = true;
		array_push(interaction_dialogue, "HI, " + variable_global_get(selected + "_firstname") + ". WE'RE LOOKING TO SIGN YOU.");
		can_talk = false;
		alarm[2] = irandom_range(60,120);
		
	} else if (array_last(interaction_dialogue) == "YES, LET'S TAKE A LOOK AT OUR YOUTH TEAM.") {
		
		current_team = global.c10_team;
		screen = "U19 SQUAD PAGE";
		selected_index = 0;
		
	} else if (array_last(interaction_dialogue) == "WELL, OKAY. GOOD LUCK ON YOUR NEXT VENTURE.") {
		
		for (var i = 0; i < array_length(global.events); ++i) {
			if (global.events[i].hometeam == global.c10_team || global.events[i].awayteam == global.c10_team) {
				global.events[i].watch = false;
			}
		}		
		variable_global_set(global.c10_team + "_coach", "");
		global.c10_team = "freeagent";
		global.c10_contract = 0;
		array_push(global.coach_freeagent, "c10");
		schedule_array = [];
		
		menu_options = ["SCHEDULE", "COEFFICIENTS", "OFFERS", "OPTIONS"];
		screen = "SCHEDULE";
		
	} else if (array_last(interaction_dialogue) == "YEAH, I'M PROBABLY NOT CUT OUT TO BE A PLAYER ANYWAY...") {
		
		array_delete(variable_global_get(selected_team + "_u19_squad"), array_get_index(variable_global_get(selected_team + "_u19_squad"), selected), 1);
		array_delete(global.player_list, array_get_index(global.player_list, selected), 1);
		warning = {warning_title: "RETIREMENT", warning_text: variable_global_get(selected + "_firstname") + " " + variable_global_get(selected + "_lastname") + " RETIRES FROM THE GAME OF FOOTBALL AT THE AGE OF " + string(variable_global_get(selected + "_age")) + ".",	warning_person1: selected};
		warning_push(warning);
		current_team = global.c10_team;
		screen = "U19 SQUAD PAGE";
		selected_index = 0;
		
	} else if (!is_undefined(scouting_target) && scouting_target != "") {
		
		selected = scouting_target;
		screen = "PLAYER PAGE";
		selected_index = 0;
		
	} else {
		
		if (array_length(previous_pages) > 0) {
			
			go_back = array_pop(previous_pages);
			if (go_back.previous_screen == "SQUAD PAGE") {
				current_team = go_back.previous_current_team;
			}
			selected_index = go_back.previous_selected_index;
			screen = go_back.previous_screen;
			keyboard_virtual_hide();
		
		}
		
	}
	
}