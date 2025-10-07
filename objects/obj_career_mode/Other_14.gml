/// @description STUFF THAT HAPPENS IN BETWEEN EVERY WEEK
	
if (array_length(global.c10_offers) > 0) {
	array_delete(global.c10_offers, 0, array_length(global.c10_offers));
}

// DEBUG__________________________
/*
for (var i = 0; i < array_length(global.player_list); ++i) {
	player_debug = global.player_list[i];
	if (vgg(player_debug + "_og_team") == "freeagent" && !array_contains(global.player_freeagent, player_debug)) {
		warning = {warning_title: "BUG", warning_text: vgg(player_debug + "_firstname") + " " + vgg(player_debug + "_lastname") + " HAS THE PROBLEM. " + string(vgg(player_debug + "_contract")), warning_person1: player_debug};
		warning_push(warning);
	}
}
*/
//______________________________
	
for (var i = 0; i < array_length(global.team_list); ++i) {
		
	available_players = variable_global_get(global.team_list[i] + "_squad");
	for (var j = 0; j < array_length(available_players); ++j) {
		variable_global_set(global.team_list[i] + "_budget", variable_global_get(global.team_list[i] + "_budget") - vgg(available_players[j] + "_salary"));
	}
		
}

for (var i = 0; i < array_length(global.player_list); ++i) {
		
	team = variable_global_get(global.player_list[i] + "_team");
		
	if (team != "freeagent") {
			
		variable_global_set(global.player_list[i] + "_xp", variable_global_get(global.player_list[i] + "_xp") + lerp(5, 10, (variable_global_get(team + "_training") - 1) / 4)); // TRAINING
			
		if (variable_global_get(global.player_list[i] + "_injury") < 1) {
			injury_chance = lerp(0.05, 0.005, ((variable_global_get(global.player_list[i] + "_sta") - 1) + (variable_global_get(team + "_training") - 1)) / 6);
			randomize();
			random_chance = random(1);
			if (random_chance < injury_chance) {
				injury_time = choose(1,2);
				variable_global_set(global.player_list[i] + "_injury", injury_time);
				warning = { warning_title: "INJURY!", warning_text: vgg(global.player_list[i] + "_firstname") + " " + vgg(global.player_list[i] + "_lastname") + " HAS PICKED UP AN INJURY IN TRAINING. SHOULD BE FULLY RECOVERED IN " + string(injury_time) + " WEEK(S).", warning_person1: global.player_list[i]};	warning_push(warning);
			}
		} else {
			variable_global_set(global.player_list[i] + "_injury", variable_global_get(global.player_list[i] + "_injury") - 1);
		}
			
	}
		
	if (variable_global_get(string(global.player_list[i]) + "_xp") >= 100) { // UPGRADE
		
		if (variable_global_get(global.player_list[i] + "_ca") < variable_global_get(global.player_list[i] + "_potential")) {
				
			if (variable_global_get(global.player_list[i] + variable_global_get(global.player_list[i] + "_training_focus")) < 3) {
				variable_global_set(global.player_list[i] + variable_global_get(global.player_list[i] + "_training_focus"), variable_global_get(global.player_list[i] + variable_global_get(global.player_list[i] + "_training_focus")) + 1);
			}
		
		}
		
		variable_global_set(string(global.player_list[i]) + "_xp", 0);
		variable_global_set(global.player_list[i] + "_ca", variable_global_get(global.player_list[i] + "_spd") + variable_global_get(global.player_list[i] + "_tkl") + variable_global_get(global.player_list[i] + "_sta") + variable_global_get(global.player_list[i] + "_tec") + variable_global_get(global.player_list[i] + "_gk") + variable_global_get(global.player_list[i] + "_def") + variable_global_get(global.player_list[i] + "_mid") + variable_global_get(global.player_list[i] + "_ata"));
		calculate_value(global.player_list[i]);
		
	}
	
}
