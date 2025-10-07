/// @description ADVANCE

can_advance = false;

current_day_games = [];

for (var i = 0; i < array_length(global.events); ++i) {
	if (global.events[i].week == global.week && !global.events[i].played) {
		array_push(current_day_games, global.events[i]);
	}
}

for (var i = 0; i < array_length(current_day_games); ++i) {
	if (!current_day_games[i].watch) {
		game_sim(current_day_games[i]);
	}
}

sim_real_game = false;

for (var i = 0; i < array_length(current_day_games); ++i) {
	if (current_day_games[i].watch && array_length(variable_global_get(current_day_games[i].hometeam + "_squad")) >= 5 && array_length(variable_global_get(current_day_games[i].awayteam + "_squad")) >= 5) {
		global.game_to_play = current_day_games[i];
		room = rm_game;
		sim_real_game = true;
		break;
	} else if (current_day_games[i].watch) {
		game_sim(current_day_games[i]);
	}
}

if (!sim_real_game) {
	
	for (var i = 0; i < array_length(global.league_list); ++i) {
		league_table = variable_global_get(global.league_list[i] + "_class");
		array_sort(league_table, league_sort);
	}

	array_sort(player_stats_list, top_scorers_sort);

	if (global.week < global.max_weeks) {
	
		global.week++;
		simulating = "PAYING SALARIES...";
		event_user(4);
		simulating = "PLAYERS TRAINING...";
		event_user(3);
		simulating = "D.O.F.'S MAKING DECISIONS...";
		event_user(1);
		simulating = "COACHES WORKING...";
		event_user(2);
	
	} else {
		
		if (variable_global_get(global.c10_team + "_budget") < 0) { // EXPERIMENTAL FIRING________________________________________________________________________
			
			variable_global_set(global.c10_team + "_coach", "");
			global.c10_team = "freeagent";
			array_push(global.coach_freeagent, "c10");
			
			warning = {
				warning_title: "YOU'RE FIRED!",
				warning_text: "DUE TO BUDGET CONCERNS, THE BOARD HAS DECIDED TO LET YOU GO. GOOD LUCK ON YOUR NEXT VENTURE!"
			};
			warning_push(warning);
			
		}
		
		global.week = 1;
		global.year++;	
		global.events = [];
		
		ball_of_gold_winner = global.player_list[0];

		for (var i = 0; i < array_length(global.player_list); ++i) {
		
			ball_of_gold_winner_team = variable_global_get(ball_of_gold_winner + "_team");
			ball_of_gold_winner_score = variable_global_get(ball_of_gold_winner + "_goals") + variable_global_get(ball_of_gold_winner + "_assists");
			if (ball_of_gold_winner_team != "freeagent") {
				ball_of_gold_winner_score += variable_global_get(ball_of_gold_winner_team + "_reputation");
				ball_of_gold_winner_score += variable_global_get(variable_global_get(ball_of_gold_winner_team + "_league") + "_reputation");
			}
		
			nominee_team = variable_global_get(global.player_list[i] + "_team");
			nominee_score = variable_global_get(global.player_list[i] + "_goals") + variable_global_get(global.player_list[i] + "_assists");
			if (nominee_team != "freeagent") {
				nominee_score += variable_global_get(nominee_team + "_reputation");
				nominee_score += variable_global_get(variable_global_get(nominee_team + "_league") + "_reputation");
			}
	
			if (ball_of_gold_winner_score < nominee_score) {
				ball_of_gold_winner = global.player_list[i];
			}
	
		}
		
		warning = {
			warning_title: "BALL OF GOLD",
			warning_text: variable_global_get(ball_of_gold_winner + "_firstname") + " " + variable_global_get(ball_of_gold_winner + "_lastname") + " IS THIS SEASON'S BALL OF GOLD WINNER. THE " + string(variable_global_get(ball_of_gold_winner + "_age")) + " YEAR OLD SCORED " + string(variable_global_get(ball_of_gold_winner + "_goals")) + " GOALS AND ASSISTED " + string(variable_global_get(ball_of_gold_winner + "_assists")) + " TIMES."
		};
		warning_push(warning);
	
		for (var i = 0; i < array_length(global.league_list); ++i) {
			
			teams = [];
			array_copy(teams, 0, variable_global_get(string(global.league_list[i]) + "_class"), 0, array_length(variable_global_get(string(global.league_list[i]) + "_class")));
			
			winner = teams[0];
			
			if (variable_global_get(winner + "_reputation") < variable_global_get(global.league_list[i] + "_reputation")) {
			
				rep_diff = ( variable_global_get(global.league_list[i] + "_reputation") - variable_global_get(winner + "_reputation") ) / 2;
			
				variable_global_set(winner + "_reputation", clamp(round(variable_global_get(winner + "_reputation") + rep_diff), 1, 5) );
			
			}
			
			winner_coach = variable_global_get(teams[0] + "_coach");
			
			if (winner_coach != "") {
				if (variable_global_get(winner_coach + "_reputation") < variable_global_get(global.league_list[i] + "_reputation")) {
			
					rep_diff = ( variable_global_get(global.league_list[i] + "_reputation") - variable_global_get(winner_coach + "_reputation") ) / 2;
			
					variable_global_set(winner_coach + "_reputation", clamp(round(variable_global_get(winner_coach + "_reputation") + rep_diff), 1, 5) );
			
				}
			}
			
			winner_squad = variable_global_get(winner + "_squad");
			
			for (var j = 0; j < array_length(winner_squad); ++j) {
			
				if (variable_global_get(winner_squad[j] + "_reputation") < variable_global_get(global.league_list[i] + "_reputation")) {
			
					rep_diff = ( variable_global_get(global.league_list[i] + "_reputation") - variable_global_get(winner_squad[j] + "_reputation") ) / 2;
			
					variable_global_set(winner_squad[j] + "_reputation", clamp(round(variable_global_get(winner_squad[j] + "_reputation") + rep_diff), 1, 5) );
			
				}
			
			}
						
			if (string_digits(global.league_list[i]) < 10 && variable_global_exists(global.league_list[i] + "_class")) { // PROMOTION / RELEGATION
				
				other_league = "l" + string(real(string_digits(global.league_list[i])) + 10);
				temp = array_last(variable_global_get(global.league_list[i] + "_class"));
				variable_global_set(temp + "_league", other_league);
				array_delete(variable_global_get(global.league_list[i] + "_class"), array_length(variable_global_get(global.league_list[i] + "_class")) - 1, 1);
				variable_global_set(array_first(variable_global_get(other_league + "_class")) + "_league", global.league_list[i]);
				array_push(variable_global_get(global.league_list[i] + "_class"), array_first(variable_global_get(other_league + "_class")));
				array_delete(variable_global_get(other_league + "_class"), 0, 1);
				array_push(variable_global_get(other_league + "_class"), temp);
				
			}
			
			teams = [];
			array_copy(teams, 0, variable_global_get(string(global.league_list[i]) + "_class"), 0, array_length(variable_global_get(string(global.league_list[i]) + "_class")));
	
			if (array_length(teams) mod 2 != 0) {
				array_push(teams, "BYE");
			}
			
			n2 = array_length(teams);
			n3 = array_length(teams)/2;
	
			for (var w_i = 0; w_i < 5; ++w_i) {
		
				w = w_i + 3;
	
				array_insert(teams,1,"");
				teams[1] = teams[n2];
				array_delete(teams,n2,1);
	
				for (var g_i = 0; g_i < n3; ++g_i) {
		
					if (teams[0+g_i] == "BYE" || teams[(n2-1)-g_i] == "BYE") {
						// BYE WEEK FOR THIS TEAM
					} else {
						game_push(w,global.league_list[i],"REGULAR SEASON",teams[0+g_i],teams[(n2-1)-g_i]);
					}
		
				}

			}
			
		}

		game_push(8,"l00","SEMIFINAL",global.l02_class[0],global.l06_class[0]);
		game_push(8,"l00","SEMIFINAL",global.l03_class[0],global.l04_class[0]);
		game_push(9,"l00","FINAL","TBD","TBD");

		game_push(8,"l01","SEMIFINAL",global.l02_class[1],global.l06_class[1]);
		game_push(8,"l01","SEMIFINAL",global.l03_class[1],global.l04_class[1]);
		game_push(9,"l01","FINAL","TBD","TBD");
		
		for (var i = array_length(global.coach_list) - 1; i >= 0; --i) {
			
			randomize();
			
			var coach = global.coach_list[i];
			team = variable_global_get(global.coach_list[i] + "_team");
			
			variable_global_set(global.coach_list[i] + "_age", variable_global_get(global.coach_list[i] + "_age") + 1);
			variable_global_set(global.coach_list[i] + "_contract", variable_global_get(global.coach_list[i] + "_contract") - 1);
			array_delete(variable_global_get(global.coach_list[i] + "_offers_received"), 0, array_length(variable_global_get(global.coach_list[i] + "_offers_received")));
			
			if (variable_global_get(global.coach_list[i] + "_contract") <= 0 && team != "freeagent") {
				variable_global_set(team + "_coach", "");
				variable_global_set(global.coach_list[i] + "_team", "freeagent");
				array_push(global.coach_freeagent, global.coach_list[i]);
				if (global.coach_list[i] == "c10") {
					warning = {
						warning_title: "OUT OF A JOB",
						warning_text: "YOUR CONTRACT HAS RUN OUT. YOU'RE FREE TO FIND ANOTHER JOB."
					};
					warning_push(warning);
				}
			}
		
			if (variable_global_get(global.coach_list[i] + "_age") > 65 && global.coach_list[i] != "c10") {
				
				if (random(1) < (1/3)) {
					
					team = variable_global_get(global.coach_list[i] + "_team");
			
					array_delete(global.coach_list,i,1);
					if (team != "freeagent") {
						variable_global_set(team + "_coach", "");
					} else {
						array_delete(global.coach_freeagent, array_get_index(global.coach_freeagent, coach), 1);
					}
					
					warning = {
						warning_title: "RETIREMENT",
						warning_text: variable_global_get(coach + "_firstname") + " " + variable_global_get(coach + "_lastname") + " RETIRES FROM THE GAME OF FOOTBALL AT THE AGE OF " + string(variable_global_get(coach + "_age")) + ".",
						warning_person1: coach
					};
					warning_push(warning);
				
				}
			
			}
		
		}
	
		for (var i = array_length(global.player_list) - 1; i >= 0; --i) {
			
			randomize();
			
			var player = global.player_list[i];
			var player_name = variable_global_get(player + "_firstname") + " " + variable_global_get(player + "_lastname");
			team = variable_global_get(global.player_list[i] + "_team");
			retiring = false;
			
			variable_global_set(global.player_list[i] + "_age", variable_global_get(global.player_list[i] + "_age") + 1);
			variable_global_set(global.player_list[i] + "_contract", variable_global_get(global.player_list[i] + "_contract") - 1);
			variable_global_set(global.player_list[i] + "_transfer_eligible", true);
			array_delete(variable_global_get(global.player_list[i] + "_offers_received"), 0, array_length(variable_global_get(global.player_list[i] + "_offers_received")));
			calculate_value(global.player_list[i]);
			
			if (variable_global_get(global.player_list[i] + "_contract") <= 0 && team != "freeagent") {
				if (array_contains(variable_global_get(team + "_squad"), global.player_list[i])) {
					array_delete(variable_global_get(team + "_squad"), array_get_index(variable_global_get(team + "_squad"), global.player_list[i]), 1);
				} else if (array_contains(variable_global_get(team + "_u19_squad"), global.player_list[i])) {
					array_delete(variable_global_get(team + "_u19_squad"), array_get_index(variable_global_get(team + "_u19_squad"), global.player_list[i]), 1);
					retiring = true;
				}
				variable_global_set(global.player_list[i] + "_team", "freeagent");
				variable_global_set(global.player_list[i] + "_og_team", "freeagent");
				if (array_contains(global.player_loans, player)) {
					array_delete(global.player_loans, array_get_index(global.player_loans, player), 1);
				}
				if (array_contains(global.player_transfers, player)) {
					array_delete(global.player_transfers, array_get_index(global.player_transfers, player), 1);
				}
				array_push(global.player_freeagent, global.player_list[i]);
				calculate_salary(global.player_list[i], true);
			}
		
			if (variable_global_get(global.player_list[i] + "_team") != variable_global_get(global.player_list[i] + "_og_team")) {
				
				og_team = variable_global_get(global.player_list[i] + "_og_team");
				loaned_team = variable_global_get(global.player_list[i] + "_team");
				variable_global_set(global.player_list[i] + "_team", og_team);
				array_delete(variable_global_get(loaned_team + "_squad"), array_get_index(variable_global_get(loaned_team + "_squad"), global.player_list[i]), 1);
				array_push(variable_global_get(og_team + "_squad"), global.player_list[i]);
				number_fix(global.player_list[i]);
				
			}
			
			variable_global_set(global.player_list[i] + "_injury", 0);
			variable_global_set(global.player_list[i] + "_goals", 0);
			variable_global_set(global.player_list[i] + "_assists", 0);
			variable_global_set(global.player_list[i] + "_tackles", 0);
			variable_global_set(global.player_list[i] + "_cleansheets", 0);
		
			if (variable_global_get(global.player_list[i] + "_age") > 37) {
				
				retiring = true;
			
			} else if (variable_global_get(global.player_list[i] + "_age") > 33) {
			
				random_chance = random(1);
				
				if (random_chance < (1/5)) {
			
					retiring = true;
				
				} else if (random_chance < (1/3) && variable_global_get(global.player_list[i] + "_sta") > 1) {
			
					variable_global_set(global.player_list[i] + "_sta", variable_global_get(global.player_list[i] + "_sta") - 1);
					variable_global_set(global.player_list[i] + "_ca", variable_global_get(global.player_list[i] + "_spd") + variable_global_get(global.player_list[i] + "_tkl") + variable_global_get(global.player_list[i] + "_sta") + variable_global_get(global.player_list[i] + "_tec") + variable_global_get(global.player_list[i] + "_gk") + variable_global_get(global.player_list[i] + "_def") + variable_global_get(global.player_list[i] + "_mid") + variable_global_get(global.player_list[i] + "_ata"));
					variable_global_set(global.player_list[i] + "_potential", variable_global_get(global.player_list[i] + "_ca"));
					calculate_value(global.player_list[i]);
				
				}
			
			}
			
			if (retiring) {
				
				team = variable_global_get(player + "_team");
				
				if (team != "freeagent") {
					if (array_contains(variable_global_get(team + "_squad"), player)) {
						array_delete(variable_global_get(team + "_squad"), array_get_index(variable_global_get(team + "_squad"), player), 1);
					} else if (array_contains(variable_global_get(team + "_u19_squad"), player)) {
						array_delete(variable_global_get(team + "_u19_squad"), array_get_index(variable_global_get(team + "_u19_squad"), player), 1);
					}
				} else {
					array_delete(global.player_freeagent, array_get_index(global.player_freeagent, player), 1);
				}
				if (array_contains(global.player_loans, player)) {
					array_delete(global.player_loans, array_get_index(global.player_loans, player), 1);
				}
				if (array_contains(global.player_transfers, player)) {
					array_delete(global.player_transfers, array_get_index(global.player_transfers, player), 1);
				}
				array_delete(global.player_list, i, 1);
				
				if (variable_global_get(player + "_age") > 33) {
					
					coach_chance = 1/7;
					
					warning = {
						warning_title: "RETIREMENT",
						warning_text: player_name + " RETIRES FROM THE GAME OF FOOTBALL AT THE AGE OF " + string(variable_global_get(player + "_age")) + ".",
						warning_person1: player
					};
					warning_push(warning);
					
				} else {
					
					coach_chance = 1/25;
					
				}
					
				if (random(1) <= coach_chance) {
						
					regen_coach_push(player);
						
					warning = { warning_title: "NEW LIFE!", warning_text: player_name + " HAS BE DECIDED HIS FUTURE IS ON THE SIDELINES. HE NOW BECOMES A COACH. WHERE WILL HE GO FIRST?", warning_person1: player};
					warning_push(warning);
						
				}
					
				
				
			}
		
		}
		
		for (var i = 0; i < array_length(global.team_list); ++i) {
			
			variable_global_set(global.team_list[i] + "_points", 0);
			variable_global_set(global.team_list[i] + "_goals", 0);
			
			if (array_length(variable_global_get(global.team_list[i] + "_u19_squad")) < 5) {
				
				needs = 5 - array_length(variable_global_get(global.team_list[i] + "_u19_squad"));
				
				for (var j = 0; j < needs; ++j) {
					regen_push(global.team_list[i]);
				}
				
			}
			
			if (round(variable_global_get(global.team_list[i] + "_reputation")) > 3) {
			
				randomize();
				new_sponsor = choose("zola","nobet","l8te");
				if (variable_global_get(global.team_list[i] + "_sponsor") != new_sponsor) {
					
					variable_global_set(global.team_list[i] + "_sponsor", new_sponsor);
			
					if (global.team_list[i] == global.c10_team) {
						warning = {
							warning_title: "NEW SPONSORSHIP DEAL",
							warning_text: variable_global_get(global.team_list[i] + "_name") + " HAVE SIGNED A NEW SPONSORSHIP DEAL WITH " + string_upper(variable_global_get(global.team_list[i] + "_sponsor")) + "."
						};
						warning_push(warning);
					}
					
				}
			} else if (round(variable_global_get(global.team_list[i] + "_reputation")) > 2) {
			
				randomize();
				new_sponsor = choose("gulp","feel");
				if (variable_global_get(global.team_list[i] + "_sponsor") != new_sponsor) {
					
					variable_global_set(global.team_list[i] + "_sponsor", new_sponsor);
			
					if (global.team_list[i] == global.c10_team) {
						warning = {warning_title: "NEW SPONSORSHIP DEAL", warning_text: variable_global_get(global.team_list[i] + "_name") + " HAVE SIGNED A NEW SPONSORSHIP DEAL WITH " + string_upper(variable_global_get(global.team_list[i] + "_sponsor")) + "."};
						warning_push(warning);
					}
					
				}
			}
			
			variable_global_set(global.team_list[i] + "_budget", variable_global_get(global.team_list[i] + "_budget") + variable_global_get(variable_global_get(global.team_list[i] + "_sponsor") + "_money"));
			
		}
	
		array_sort(global.events, calendar_sort);
		
		for (var i = 0; i < array_length(global.events); ++i) {
			if (global.events[i].hometeam == global.c10_team || global.events[i].awayteam == global.c10_team) {
				global.events[i].watch = true;
			}
		}
		
		event_user(1);
	
	}

	can_advance = true;
	simulating = "";

	schedule_array = [];
	for (var i = 0; i < array_length(global.events); ++i) {
		if (global.events[i].hometeam == global.c10_team || global.events[i].awayteam == global.c10_team) {
			array_push(schedule_array, global.events[i]);
		}
	}
	
	contacts = ["SCOUT", "PRESIDENT"];

	if (global.c10_team != "freeagent") {
		menu_options = ["SCHEDULE", "FREE AGENTS", "TRANSFER LIST", "LOAN LIST", "COEFFICIENTS", "CONTACTS", "OPTIONS"];
	} else {
		menu_options = ["SCHEDULE", "COEFFICIENTS", "OFFERS", "OPTIONS"];
	}
	selected = menu_options[0];
	selected_index = 0;
	previous_pages = [];
	
}