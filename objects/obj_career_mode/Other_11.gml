/// @description GM THINK

for (var i = 0; i < array_length(global.team_list); ++i) {
	
	coach = variable_global_get(global.team_list[i] + "_coach");
	var league = variable_global_get(global.team_list[i] + "_league");
	
	var has_made_offer = false;
	var potential_coaches = [];
	for (var j = 0; j < array_length(global.coach_freeagent); ++j) {
	    if (variable_global_get(global.coach_freeagent[j] + "_reputation") - variable_global_get(global.team_list[i] + "_reputation") <= 2) {
			array_push(potential_coaches, global.coach_freeagent[j]);
			potential_coach_offers = variable_global_get(global.coach_freeagent[j] + "_offers");
			for (var k = 0; k < array_length(potential_coach_offers); ++k) {
			    if (potential_coach_offers[k].team == global.team_list[i]) {
					has_made_offer = true;
					break;
				}
			}
			if (has_made_offer) {
				break;
			}
		}
	}
	
	if (coach == "" && array_length(potential_coaches) > 0 && !has_made_offer) {
		
		array_sort(potential_coaches, pick_coach);
		offer = {team: global.team_list[i],	team_reputation: variable_global_get(global.team_list[i] + "_reputation"), contract: choose(2,3)};
		offer_push(potential_coaches[0], offer, global.team_list[i]);
		if (potential_coaches[0] == "c10") {
			warning = {warning_title: "CONTRACT OFFER", warning_text: "YOU HAVE A RECEIVED AN OFFER FROM " + variable_global_get(global.team_list[i] + "_name") + " TO BECOME THEIR COACH. YOU HAVE UNTIL THE END OF THE WEEK TO RESPOND."};
			warning_push(warning);
		}
		
	}
	
	if (global.week == global.max_weeks - 1 && coach != "") {
		
		good_performance = true;
		if (variable_global_exists(league + "_class")) {
			league_table = variable_global_get(league + "_class");
			if (array_get_index(league_table, global.team_list[i]) > (array_length(league_table) / 2) - 1) {
				good_performance = false;
			}
		}
		
		if (variable_global_get(coach + "_contract") <= 1 && good_performance) {
			if (coach != "c10") {
				offer = {team: global.team_list[i],	team_reputation: variable_global_get(global.team_list[i] + "_reputation"), contract: choose(2,3)};
				offer_push(coach, offer, global.team_list[i]);
			} else {
				warning = {warning_title: "CONTRACT OFFER", warning_text: "THE BOARD WANTS TO EXTEND YOUR CONTRACT. TALK TO THE PRESIDENT AS SOON AS YOU CAN."};
				warning_push(warning);
			}
		}
		
	}
	
	if (global.team_list[i] != global.c10_team) {
		
		var minimum_squad_level = lerp(8, 15, (variable_global_get(global.team_list[i] + "_reputation") - 1) / 4);
		available_players = variable_global_get(global.team_list[i] + "_squad");
		gm_tactic = variable_global_get(global.team_list[i] + "_tactic");
			
		if (global.week == global.max_weeks - 1) {
				
			for (var j = 0; j < array_length(available_players); ++j) {
				
				if (variable_global_get(available_players[j] + "_contract") == 1 && variable_global_get(available_players[j] + "_og_team") == global.team_list[i] && variable_global_get(available_players[j] + "_ca") >= minimum_squad_level) {
					
					offer = {team: global.team_list[i], type: "TRANSFER", fee: 0, team_reputation: variable_global_get(global.team_list[i] + "_reputation"), salary: calculate_salary(available_players[j], false), contract: choose(2,3)};
					offer_push(available_players[j], offer, global.team_list[i]);
					
				}
				
			}
			
		}
		
		
		// CALCULATE NEEDS _____________________________________________________________________________________________________________
		
		players_on_the_squad = [];
		array_copy(players_on_the_squad, 0, available_players, 0, array_length(available_players));
		needs = [];
		
		for (var j = 0; j < 10; ++j) {
			
			if (j > 4) {
				t_i = j - 5;
			} else {
				t_i = j;
			}
			
		    if (gm_tactic[t_i].pos == "GK") {
				array_sort(players_on_the_squad, pick_goalkeeper);
				pos_check = "_gk";
			} else if (gm_tactic[t_i].pos == "RD" || gm_tactic[t_i].pos == "CD" || gm_tactic[t_i].pos == "LD") {
				array_sort(players_on_the_squad, pick_defender);
				pos_check = "_def";
			} else if (gm_tactic[t_i].pos == "RM" || gm_tactic[t_i].pos == "CM" || gm_tactic[t_i].pos == "LM") {
				array_sort(players_on_the_squad, pick_midfielder);
				pos_check = "_mid";
			} else if (gm_tactic[t_i].pos == "RF" || gm_tactic[t_i].pos == "CF" || gm_tactic[t_i].pos == "LF") {
				array_sort(players_on_the_squad, pick_forward);
				pos_check = "_ata";
			}
			
			if (array_length(players_on_the_squad) > 0) { // EVALUATE SQUAD PLAYER
				
				if (variable_global_get(players_on_the_squad[0] + pos_check) != 3) {
					need = {pos: gm_tactic[t_i].pos, type: "urgent", degree: 10};
					array_push(needs, need);
				} else if (variable_global_get(players_on_the_squad[0] + "_ca") < minimum_squad_level) {
					need = {pos: gm_tactic[t_i].pos, type: "upgrade", degree: minimum_squad_level - variable_global_get(players_on_the_squad[0] + "_ca")};
					array_push(needs, need);
				} else {
					if (array_contains(global.player_loans, players_on_the_squad[0])) {
						array_delete(global.player_loans, array_get_index(global.player_loans, players_on_the_squad[0]), 1);
					}
					if (array_contains(global.player_transfers, players_on_the_squad[0])) {
						array_delete(global.player_transfers, array_get_index(global.player_transfers, players_on_the_squad[0]), 1);
					}
					array_delete(players_on_the_squad, 0, 1);
				}
				
			} else {
				
				need = {pos: gm_tactic[t_i].pos, type: "urgent", degree: 10};
				array_push(needs, need);
				
			}
			
		}
		
		if (array_length(needs) < 1) { // MY ROSTER FULL LET ME SEE WHAT I DO WITH THE OTHER PLAYERS			
			for (var j = 0; j < array_length(players_on_the_squad); ++j) {
				if (!array_contains(global.player_loans, players_on_the_squad[j]) && variable_global_get(players_on_the_squad[j] + "_og_team") == global.team_list[i] && variable_global_get(players_on_the_squad[j] + "_potential") - variable_global_get(players_on_the_squad[j] + "_ca") > 0) {
					array_push(global.player_loans, players_on_the_squad[j]);
					if (variable_global_get(players_on_the_squad[j] + "_contract") == 1) {
						offer = {team: global.team_list[i], type: "TRANSFER", fee: 0, team_reputation: variable_global_get(global.team_list[i] + "_reputation"), salary: calculate_salary(players_on_the_squad[j], false), contract: choose(2,3)};
						offer_push(players_on_the_squad[j], offer, global.team_list[i]);
					}
				} else if (!array_contains(global.player_transfers, players_on_the_squad[j]) && variable_global_get(players_on_the_squad[j] + "_og_team") == global.team_list[i] && variable_global_get(players_on_the_squad[j] + "_potential") - variable_global_get(players_on_the_squad[j] + "_ca") <= 0 && variable_global_get(players_on_the_squad[j] + "_transfer_eligible")) {
					array_push(global.player_transfers, players_on_the_squad[j]);
				}
			}
		}
		
		// MAKE OFFERS _________________________________________________________________________________________________________________
		
		var salary_budget = lerp(global.min_tickets, global.max_tickets, (variable_global_get(global.team_list[i] + "_reputation") - 1) / 4) + lerp(global.min_tv, global.max_tv, (variable_global_get(variable_global_get(global.team_list[i] + "_league") + "_reputation") - 1) / 4);
		for (var j = 0; j < array_length(available_players); ++j) {
			salary_budget -= variable_global_get(available_players[j] + "_salary");
		}
		var transfer_budget = variable_global_get(global.team_list[i] + "_budget");
		
		var total_score = 0;
		for (var j = 0; j < array_length(needs); j++) {
		    total_score += needs[j].degree;
		}
		for (var j = 0; j < array_length(needs); j++) {
		    needs[j].budget_share = needs[j].degree/total_score;
		}
		
		show_debug_message(variable_global_get(global.team_list[i] + "_name") + "/" + string(global.week));
		
		for (var j = 0; j < array_length(needs); ++j) {
			
			salary_per_need = salary_budget * needs[j].budget_share;
			budget_per_need = transfer_budget * needs[j].budget_share;
			
			show_debug_message(needs[j].pos);
			show_debug_message(round(salary_per_need));
			show_debug_message(round(budget_per_need));
			
			var u19_squad = variable_global_get(global.team_list[i] + "_u19_squad");
				
			transfer_targets = [];
			if (global.week < global.max_weeks/2) {
				
				for (var k = 0; k < array_length(global.player_list); ++k) {
					
					var target_og_team = variable_global_get(global.player_list[k] + "_og_team");
					
					if (variable_global_get(global.player_list[k] + "_transfer_eligible") && !array_contains(variable_global_get(global.player_list[k] + "_offers_received"), global.team_list[i]) && target_og_team != global.team_list[i]) {
						
						var is_target = false;
						var transfer_fee = variable_global_get(global.player_list[k] + "_value");
					
						if (array_length(variable_global_get(target_og_team + "_squad")) < 5) {
							transfer_fee = transfer_fee * 5;
						}
						if (target_og_team != "freeagent") {
							if (array_get_index(variable_global_get(target_og_team + "_squad"), global.player_list[k]) < 5) {
								transfer_fee = transfer_fee * 2.5;
							}
							if (variable_global_get(target_og_team + "_league") == league) {
								transfer_fee = transfer_fee * 4;
							}
						}					
						if (variable_global_get(global.player_list[k] + "_contract") < 1) {
							transfer_fee = transfer_fee / 2;
						}
						if (array_contains(global.player_transfers, global.player_list[k])) {
							transfer_fee = round(transfer_fee * 0.75);
						}
						
						if (array_contains(global.player_freeagent, global.player_list[k])) {
							if (variable_global_get(global.player_list[k] + "_salary") <= salary_per_need) {
								transfer_fee = 0;
								is_target = true;
							}
						} else if (array_contains(global.player_loans, global.player_list[k])) {
							if (variable_global_get(global.player_list[k] + "_salary") <= salary_per_need) {
								transfer_fee = 0;
								is_target = true;
							}
						} else if (transfer_fee <= budget_per_need && calculate_salary(global.player_list[k], false) <= salary_per_need && !array_contains(variable_global_get(target_og_team + "_u19_squad"), global.player_list[k])) {
							is_target = true;
						}
						
						if (is_target) {
							
							var target_offers = variable_global_get(global.player_list[k] + "_offers");
							var target_ca = variable_global_get(global.player_list[k] + "_ca");
							var target_potential = variable_global_get(global.player_list[k] + "_potential");
							var rating = target_ca + target_potential;
							
							if (transfer_fee == 0) {
								rating += 20;
							}
							
							if (array_length(target_offers) > 0) {
								rating -= lerp(0, 25, array_length(target_offers) / 4);
							}
							
							if (needs[j].pos == "GK" && variable_global_get(global.player_list[k] + "_gk") == 3) {
								rating += 50;
							} else if ((needs[j].pos == "RD" || needs[j].pos == "CD" || needs[j].pos == "LD") && variable_global_get(global.player_list[k] + "_def") == 3) {
								rating += 50;
							} else if ((needs[j].pos == "RM" || needs[j].pos == "CM" || needs[j].pos == "LM") && variable_global_get(global.player_list[k] + "_mid") == 3) {
								rating += 50;
							} else if ((needs[j].pos == "RF" || needs[j].pos == "CF" || needs[j].pos == "LF") && variable_global_get(global.player_list[k] + "_ata") == 3) {
								rating += 50;
							}
							
							if (target_ca >= minimum_squad_level) {
								if (needs[j].type == "upgrade") {
									rating += 50;
								} else {
									rating += 25;
								}
							}
							
							var target_info = {idcode: global.player_list[k], rating: rating, fee: transfer_fee};
							array_push(transfer_targets, target_info);
							
						}
						
					}
				
				}
			}
			for (var k = 0; k < array_length(u19_squad); ++k) {
				
				var target_ca = variable_global_get(u19_squad[k] + "_ca");
				var target_potential = variable_global_get(u19_squad[k] + "_potential");
				var rating = target_ca + target_potential;
				rating += 20;
				
				if (needs[j].pos == "GK" && variable_global_get(u19_squad[k] + "_gk") == 3) {
					rating += 50;
				} else if ((needs[j].pos == "RD" || needs[j].pos == "CD" || needs[j].pos == "LD") && variable_global_get(u19_squad[k] + "_def") == 3) {
					rating += 50;
				} else if ((needs[j].pos == "RM" || needs[j].pos == "CM" || needs[j].pos == "LM") && variable_global_get(u19_squad[k] + "_mid") == 3) {
					rating += 50;
				} else if ((needs[j].pos == "RF" || needs[j].pos == "CF" || needs[j].pos == "LF") && variable_global_get(u19_squad[k] + "_ata") == 3) {
					rating += 50;
				}
				
				var target_info = {idcode: u19_squad[k], rating: rating, fee: 0};
				array_push(transfer_targets, target_info);
				
			}
			
			if (array_length(transfer_targets) > 0) {
				
				array_sort(transfer_targets, pick_transfer);
				var transfer_target = transfer_targets[0].idcode;
				var target_ca = variable_global_get(transfer_target + "_ca");
				
				if (needs[j].type == "upgrade" && target_ca < minimum_squad_level) {
					continue;
				} else if (needs[j].type == "urgent" && array_length(available_players) > 5) {
					if (needs[j].pos == "GK" && variable_global_get(transfer_target + "_gk") != 3) {
						continue;
					} else if ((needs[j].pos == "RD" || needs[j].pos == "CD" || needs[j].pos == "LD") && variable_global_get(transfer_target + "_def") != 3) {
						continue;
					} else if ((needs[j].pos == "RM" || needs[j].pos == "CM" || needs[j].pos == "LM") && variable_global_get(transfer_target + "_mid") != 3) {
						continue;
					} else if ((needs[j].pos == "RF" || needs[j].pos == "CF" || needs[j].pos == "LF") && variable_global_get(transfer_target + "_ata") != 3) {
						continue;
					}
				}
				
				show_debug_message(variable_global_get(transfer_target + "_firstname") + " " + variable_global_get(transfer_target + "_lastname"));
				
				if (array_contains(u19_squad, transfer_target)) {
					
					array_push(available_players, transfer_target);
					number_fix(transfer_target);
					array_delete(u19_squad, array_get_index(u19_squad, transfer_target),1);
						
				} else if (array_contains(global.player_loans, transfer_target)) {
					
					offer = { team: global.team_list[i], type: "LOAN", fee: 0, team_reputation: variable_global_get(global.team_list[i] + "_reputation"), salary: variable_global_get(transfer_target + "_salary"), contract: choose(3,4)};
					offer_push(transfer_target, offer, global.team_list[i]);
						
				} else if (array_contains(global.player_freeagent, transfer_target)) {
					
					offer = { team: global.team_list[i], type: "TRANSFER", fee: 0, team_reputation: variable_global_get(global.team_list[i] + "_reputation"), salary: variable_global_get(transfer_target + "_salary"), contract: choose(3,4)};
					offer_push(transfer_target, offer, global.team_list[i]);
					
				} else {
					
					offer = { team: global.team_list[i], type: "TRANSFER", fee: round(transfer_targets[0].fee), team_reputation: variable_global_get(global.team_list[i] + "_reputation"), salary: calculate_salary(transfer_target, false), contract: choose(3,4)};
					offer_push(transfer_target, offer, global.team_list[i]);
					if (variable_global_get(transfer_target + "_og_team") == global.c10_team) {
						warning = {warning_title: "OFFER ACCEPTED!", warning_text: "YOUR BOARD HAS ACCEPTED AN OFFER OF " + format_number_dots(round(transfer_targets[0].fee)) + " FOR " + variable_global_get(transfer_target + "_firstname") + " " + variable_global_get(transfer_target + "_lastname") + " FROM " + variable_global_get(global.team_list[i] + "_name") + ". AS HE IS STILL CONSIDERING, YOU CAN TRY TO CONVINCE HIM TO STAY."};
						warning_push(warning);
					}
						
				}
				
			}
			
		}
		
	}
	
}

