/// @description COACH THINK

for (var i = 1; i < array_length(global.coach_list); ++i) {
		
	var coach = global.coach_list[i];
	var coach_name = variable_global_get(coach + "_firstname") + " " + variable_global_get(coach + "_lastname");
	var coach_reputation = variable_global_get(coach + "_reputation");
	var offers = variable_global_get(global.coach_list[i] + "_offers");
	var team = variable_global_get(global.coach_list[i] + "_team");
		
	if (array_length(offers) > 0) {
		
		if (array_length(offers) > 1) {
			array_sort(offers, offer_choose);
		}
		
		offer_accepted = true;
		if (coach_reputation - offers[0].team_reputation > 2) {
			offer_accepted = false;
		}
		
		if (offer_accepted) {
			
			array_delete(global.coach_freeagent, array_get_index(global.coach_freeagent, coach), 1);
			variable_global_set(coach + "_team", offers[0].team);
			variable_global_set(offers[0].team + "_coach", coach);
			variable_global_set(coach + "_contract", offers[0].contract);
			if (team == offers[0].team) {
				warning_text = coach_name + " HAS SIGNED A DEAL TO CONTINUE AS COACH OF " + variable_global_get(offers[0].team + "_name") + ".";
			} else {
				warning_text = coach_name + " HAS BECOME THE NEW COACH OF " + variable_global_get(offers[0].team + "_name") + ".";
			}
		
			if (coach_reputation < variable_global_get(offers[0].team + "_reputation")) {
			
				rep_diff = ( variable_global_get(offers[0].team + "_reputation") - coach_reputation ) / 2;
			
				variable_global_set(coach + "_reputation", clamp(round(coach_reputation + rep_diff), 1, 5) );
			
			} else if (variable_global_get(offers[0].team + "_reputation") < coach_reputation) {
			
				rep_diff = (coach_reputation - variable_global_get(offers[0].team + "_reputation") ) / 2;
			
				variable_global_set(offers[0].team + "_reputation", clamp(round(variable_global_get(offers[0].team + "_reputation") + rep_diff), 1, 5) );
					
				warning_text += " THIS MOVE HAS BOOSTED THE CLUB'S REPUTATION."
			
			}
			
			warning = {	warning_title: "COACH NEWS!", warning_text: warning_text, warning_person1: coach};
			warning_push(warning);
		
		
			array_delete(offers,0,array_length(offers));
			
		}
			
	}
	
	team = variable_global_get(global.coach_list[i] + "_team");
		
	if (team != "freeagent") {
			
		if (variable_global_get(coach + "_mentality") == "defensive") {
			tactic = [{pos: "GK", pos_x: 180, pos_y: 75}, {pos: "CD", pos_x: 150, pos_y: 120}, {pos: "CD", pos_x: 210, pos_y: 120}, {pos: "CM", pos_x: 180, pos_y: 220}, {pos: "CF", pos_x: 180, pos_y: 320}];
			variable_global_set(team + "_tactic", copy_tactic_array(tactic));
		} else if (variable_global_get(coach + "_mentality") == "balanced") {
			tactic = [{pos: "GK", pos_x: 180, pos_y: 75}, {pos: "CD", pos_x: 180, pos_y: 120}, {pos: "CM", pos_x: 150, pos_y: 220}, {pos: "CM", pos_x: 210, pos_y: 220}, {pos: "CF", pos_x: 180, pos_y: 320}];
			variable_global_set(team + "_tactic", copy_tactic_array(tactic));
		} else if (variable_global_get(coach + "_mentality") == "attacking") {
			tactic = [{pos: "GK", pos_x: 180, pos_y: 75}, {pos: "CD", pos_x: 180, pos_y: 120}, {pos: "CM", pos_x: 180, pos_y: 220}, {pos: "RF", pos_x: 75, pos_y: 320}, {pos: "CF", pos_x: 180, pos_y: 320}];
			variable_global_set(team + "_tactic", copy_tactic_array(tactic));
		}
			
		available_players = variable_global_get(team + "_squad");
		tactic = variable_global_get(team + "_tactic");
			
		if (array_length(available_players) > 4) {
				
			matchday_players = [];
			array_copy(matchday_players, 0, available_players, 0, array_length(available_players));
			array_delete(available_players, 0, array_length(available_players));
				
			for (var j = 0; j < 5; ++j) {
				    
				if (tactic[j].pos == "GK") {
					array_sort(matchday_players, pick_goalkeeper);
					array_push(available_players, matchday_players[0]);
					array_delete(matchday_players, 0, 1);
				} else if (tactic[j].pos == "RD" || tactic[j].pos == "CD" || tactic[j].pos == "LD") {
					array_sort(matchday_players, pick_defender);
					array_push(available_players, matchday_players[0]);
					array_delete(matchday_players, 0, 1);
				} else if (tactic[j].pos == "RM" || tactic[j].pos == "CM" || tactic[j].pos == "LM") {
					array_sort(matchday_players, pick_midfielder);
					array_push(available_players, matchday_players[0]);
					array_delete(matchday_players, 0, 1);
				} else if (tactic[j].pos == "RF" || tactic[j].pos == "LF") {
					array_sort(matchday_players, pick_winger);
					array_push(available_players, matchday_players[0]);
					array_delete(matchday_players, 0, 1);
				} else if (tactic[j].pos == "CF") {
					array_sort(matchday_players, pick_forward);
					array_push(available_players, matchday_players[0]);
					array_delete(matchday_players, 0, 1);
				}
					
			}
				
			array_sort(matchday_players, ca_sort);				
			if (array_length(matchday_players) > 0) {
					
				for (var j = 0; j < array_length(matchday_players); ++j) {
					array_push(available_players, matchday_players[j]);
				}
				
			}
			
		}
			
		for (var j = 0; j < array_length(available_players); ++j) {
					
			if (variable_global_get(available_players[j] + "_ca") < variable_global_get(available_players[j] + "_potential") && variable_global_get(available_players[j] + variable_global_get(available_players[j] + "_training_focus")) >= 3) {
				if (variable_global_get(available_players[j] + "_def") == 2) {
					variable_global_set(available_players[j] + "_training_focus", "_def");
				} else if (variable_global_get(available_players[j] + "_mid") == 2) {
					variable_global_set(available_players[j] + "_training_focus", "_mid");
				} else if (variable_global_get(available_players[j] + "_ata") == 2) {
					variable_global_set(available_players[j] + "_training_focus", "_ata");
				} else {
					variable_global_set(available_players[j] + "_training_focus", choose("_spd", "_tkl", "_sta", "_tec"));
				}
			}
				
		}
			
	}
		
}
	