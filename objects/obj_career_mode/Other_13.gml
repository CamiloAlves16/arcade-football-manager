/// @description PLAYER THINK
	
for (var i = 0; i < array_length(global.player_list); ++i) {
		
	var player = global.player_list[i];
	var player_name = variable_global_get(player + "_firstname") + " " + variable_global_get(player + "_lastname");
	var player_reputation = variable_global_get(player + "_reputation");
	team = variable_global_get(global.player_list[i] + "_team");
	var offers = variable_global_get(global.player_list[i] + "_offers");
		
	if (array_length(offers) > 0) {
		
		if (array_length(offers) > 1) {
			array_sort(offers, offer_choose);
		}
		
		league_reputation = variable_global_get(variable_global_get(offers[0].team + "_league") + "_reputation");
		if (team != "freeagent") {
			my_league_reputation = variable_global_get(variable_global_get(team + "_league") + "_reputation");
		}
		offer_accepted = true;
		if ((player_reputation - league_reputation > 2 || player_reputation - offers[0].team_reputation > 2) && team == "freeagent") {
			
			offer_accepted = false;
			
		} else if (offers[0].type == "TRANSFER" && (player_reputation - league_reputation > 1 || player_reputation - offers[0].team_reputation > 1) && team != "freeagent") {
			
			offer_accepted = false;
			
		} else if (offers[0].type == "LOAN" && my_league_reputation - league_reputation > 2 && team != "freeagent") {
			
			offer_accepted = false;
			
		}
		
		if (offer_accepted) {
			
			if (offers[0].type == "TRANSFER") {
				
				if (team == "freeagent") {
					
					array_delete(global.player_freeagent, array_get_index(global.player_freeagent, player), 1);
					variable_global_set(player + "_team", offers[0].team);
					variable_global_set(player + "_og_team", offers[0].team);
					array_push(variable_global_get(offers[0].team + "_squad"), player);
					variable_global_set(player + "_salary", offers[0].salary);
					variable_global_set(player + "_contract", offers[0].contract);
					calculate_value(player);
					warning_text = player_name + " JOINS " + variable_global_get(offers[0].team + "_name") + " ON A FREE TRANSFER.";
					
				} else if (offers[0].team == variable_global_get(player + "_og_team")) {
					
					variable_global_set(player + "_salary", offers[0].salary);
					variable_global_set(player + "_contract", offers[0].contract);
					calculate_value(player);
					warning_text = player_name + " HAS SIGNED A NEW CONTRACT WITH " + variable_global_get(offers[0].team + "_name") + ".";
					
				} else {
					
					warning_text = player_name + " HAS BEEN SOLD TO " + variable_global_get(offers[0].team + "_name") + " FROM " + variable_global_get(team + "_name") + " FOR A FEE OF " + format_number_dots(round(offers[0].fee)) + ".";
					if (array_contains(variable_global_get(team + "_squad"), player)) {
						array_delete(variable_global_get(team + "_squad"), array_get_index(variable_global_get(team + "_squad"), player), 1);
					}
					if (array_contains(variable_global_get(team + "_u19_squad"), player)) {
						array_delete(variable_global_get(team + "_u19_squad"), array_get_index(variable_global_get(team + "_u19_squad"), player), 1);
					}
					variable_global_set(team + "_budget", variable_global_get(team + "_budget") + offers[0].fee);
					variable_global_set(offers[0].team + "_budget", variable_global_get(offers[0].team + "_budget") - offers[0].fee);
					if (array_contains(global.player_loans, player)) {
						array_delete(global.player_loans, array_get_index(global.player_loans, player), 1);
					}
					if (array_contains(global.player_transfers, player)) {
						array_delete(global.player_transfers, array_get_index(global.player_transfers, player), 1);
					}
					variable_global_set(player + "_team", offers[0].team);
					variable_global_set(player + "_og_team", offers[0].team);
					array_push(variable_global_get(offers[0].team + "_squad"), player);
					variable_global_set(player + "_salary", offers[0].salary);
					variable_global_set(player + "_contract", offers[0].contract);
					calculate_value(player);
					
				}
				
				if (player_reputation < variable_global_get(offers[0].team + "_reputation")) {
			
					rep_diff = ( variable_global_get(offers[0].team + "_reputation") - player_reputation ) / 2;
			
					variable_global_set(player + "_reputation", clamp(round(player_reputation + rep_diff), 1, 5) );
			
				} else if (variable_global_get(offers[0].team + "_reputation") < player_reputation) {
			
					rep_diff = ( player_reputation - variable_global_get(offers[0].team + "_reputation") ) / 2;
			
					variable_global_set(offers[0].team + "_reputation", clamp(round(variable_global_get(offers[0].team + "_reputation") + rep_diff), 1, 5) );
					
					warning_text += " THIS MOVE HAS BOOSTED THE CLUB'S REPUTATION."
			
				}
				
			} else {
				
				warning_text = player_name + " JOINS " + variable_global_get(offers[0].team + "_name") + " ON LOAN FROM " + variable_global_get(team + "_name") + ".";
				array_delete(variable_global_get(team + "_squad"), array_get_index(variable_global_get(team + "_squad"), player), 1);
				variable_global_set(player + "_team", offers[0].team);
				array_push(variable_global_get(offers[0].team + "_squad"), player);
				if (array_contains(global.player_loans, player)) {
					array_delete(global.player_loans, array_get_index(global.player_loans, player), 1);
				}
				if (array_contains(global.player_transfers, player)) {
					array_delete(global.player_transfers, array_get_index(global.player_transfers, player), 1);
				}				
				
			}
			
			warning = {
				warning_title: "TRANSFER MARKET MOVE", warning_text: warning_text, warning_person1: player};
			warning_push(warning);
			
			number_fix(player);
			
			variable_global_set(player + "_transfer_eligible", false);
		
		}
		
		array_delete(offers,0,array_length(offers));
			
	}
}
