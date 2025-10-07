screen = "game";

achievements_completed = true;
for (var i = 0; i < array_length(global.achievement_list); ++i) {
	if (!global.achievement_list[i].ach_status) {
		achievements_completed = false;
		break;
	}
}

randomize();

general_alpha = 1;

rain = choose(true, false);

game = global.game_to_play;

gameclock = 120;
timeclock = 3;
alarm[1] = 60;
substitutions = [];

player_list = [];
coach_list = [];

teamA_goals = 0;
teamB_goals = 0;

teamA = game.hometeam;
teamB = game.awayteam;

audio_play_sound(snd_crowd,1,true);

instance_create_layer(180, 350, "Instances", obj_goal);

instance_create_layer(180, 190, "Instances", obj_ball);

instance_create_layer(20, 190, "Instances", obj_referee);

teamA_squad = variable_global_get(string(teamA) + "_squad");
teamA_tactic = variable_global_get(string(teamA) + "_tactic");

for (var i = 0; i < 5; ++i) {
	
	og_y = lerp(40, 160, (teamA_tactic[i].pos_y - 75) / (320 - 75));
	target_y = lerp(47, 269, (teamA_tactic[i].pos_y - 75) / (320 - 75));
	
	info_to_send = {
		baller_id: teamA_squad[i],
		pos: teamA_tactic[i].pos,
		my_goal: 31,
		other_goal: 350,
		og_y: og_y,
		target_x: teamA_tactic[i].pos_x,
		target_y: target_y
	}
	
	player = instance_create_layer(teamA_tactic[i].pos_x,og_y,"Instances",obj_player,info_to_send);
	
	array_push(player_list, player);
	
}

teamB_squad = variable_global_get(string(teamB) + "_squad");
teamB_tactic = variable_global_get(string(teamB) + "_tactic");

for (var i = 0; i < 5; ++i) {
	
	og_y = lerp(330, 220, (teamB_tactic[i].pos_y - 75) / (320 - 75));
	target_y = lerp(333, 112, (teamB_tactic[i].pos_y - 75) / (320 - 75));
	
	info_to_send = {
		baller_id: teamB_squad[i],
		pos: teamB_tactic[i].pos,
		my_goal: 350,
		other_goal: 31,
		og_y: og_y,
		target_x: room_width - teamB_tactic[i].pos_x,
		target_y: target_y
	}
	
	player = instance_create_layer(room_width - teamB_tactic[i].pos_x,og_y,"Instances",obj_player,info_to_send);
	
	array_push(player_list, player);
	
}

// COACHES

if (variable_global_get(teamA + "_coach") != "") {
	info_to_send = {
		coach_id: variable_global_get(teamA + "_coach")
	}
	coach = instance_create_layer(350, 120, "Instances_Over", obj_coach, info_to_send);
	array_push(coach_list, coach);
}

if (variable_global_get(teamB + "_coach") != "") {
	info_to_send = {
		coach_id: variable_global_get(teamB + "_coach")
	}
	coach = instance_create_layer(350, 260, "Instances_Over", obj_coach, info_to_send);
	array_push(coach_list, coach);
}

function league_sort(a,b) {
	
	a_points = variable_global_get(string(a) + "_points");
	b_points = variable_global_get(string(b) + "_points");
	a_goals = variable_global_get(string(a) + "_goals");
	b_goals = variable_global_get(string(b) + "_goals");
	
	if (a_points == b_points) {
		if (a_goals == b_goals) {
		return 0
		} else if (a_goals > b_goals) {
			return -1
		} else {
			return 1
		}
	} else if (a_points > b_points) {
		return -1
	} else {
		return 1
	}
	
}

function save_achievements() {
	
	ini_open("achievements1.sav");
	
	for (var i = 0; i < array_length(global.achievement_list); ++i) {
	    ini_write_real("ach", global.achievement_list[i].ach_title + "_status", global.achievement_list[i].ach_status);
	}
	
	ini_close();
	
	if (file_exists("achievements.sav")) {
		file_delete("achievements.sav");
	}
	
	file_rename("achievements1.sav" ,"achievements.sav");
	
}

function achievement_set_completed(ach_title) {
	
	for (var i = 0; i < array_length(global.achievement_list); ++i) {
	    if (global.achievement_list[i].ach_title == ach_title && !global.achievement_list[i].ach_status) {
			global.achievement_list[i].ach_status = true;
			save_achievements();
			break;
		}
	}
	
}

function stats_update() {
	
	game.home_goals = teamA_goals;
	game.away_goals = teamB_goals;
	
	if (game.phase == "REGULAR SEASON") {
		
		variable_global_set(game.hometeam + "_budget", variable_global_get(game.hometeam + "_budget") + lerp(global.min_tickets, global.max_tickets, (variable_global_get(game.hometeam + "_reputation") - 1) / 4) + lerp(global.min_tv, global.max_tv, (variable_global_get(game.competition + "_reputation") - 1) / 4));
		variable_global_set(game.awayteam + "_budget", variable_global_get(game.awayteam + "_budget") + lerp(global.min_tickets, global.max_tickets, (variable_global_get(game.awayteam + "_reputation") - 1) / 4) + lerp(global.min_tv, global.max_tv, (variable_global_get(game.competition + "_reputation") - 1) / 4));
		
		if (winner != noone) { 
			variable_global_set(string(winner) + "_points", variable_global_get(string(winner) + "_points") + 3);
		} else {
			variable_global_set(string(game.hometeam) + "_points", variable_global_get(string(game.hometeam) + "_points") + 1);
			variable_global_set(string(game.awayteam) + "_points", variable_global_get(string(game.awayteam) + "_points") + 1);
		}
		variable_global_set(string(game.hometeam) + "_goals", variable_global_get(string(game.hometeam) + "_goals") + teamA_goals);
		variable_global_set(string(game.awayteam) + "_goals", variable_global_get(string(game.awayteam) + "_goals") + teamB_goals);
		
		if (variable_global_exists(game.competition + "_class")) {
			array_sort(variable_global_get(game.competition + "_class"), league_sort);
		}
	
	} else if (game.phase == "SEMIFINAL") {
		
		variable_global_set(game.hometeam + "_budget", variable_global_get(game.hometeam + "_budget") + lerp(global.min_tickets, global.max_tickets, (variable_global_get(game.hometeam + "_reputation") - 1) / 4) + lerp(global.min_tv, global.max_tv, (variable_global_get(game.competition + "_reputation") - 1) / 4));
		variable_global_set(game.awayteam + "_budget", variable_global_get(game.awayteam + "_budget") + lerp(global.min_tickets, global.max_tickets, (variable_global_get(game.awayteam + "_reputation") - 1) / 4) + lerp(global.min_tv, global.max_tv, (variable_global_get(game.competition + "_reputation") - 1) / 4));
		
		if (winner == game.hometeam) {
			variable_global_set(string(game.hometeam) + "_budget", variable_global_get(string(game.hometeam) + "_budget") + 5000000);
			variable_global_set(string(game.awayteam) + "_budget", variable_global_get(string(game.awayteam) + "_budget") + 2500000);
		} else {
			variable_global_set(string(game.hometeam) + "_budget", variable_global_get(string(game.hometeam) + "_budget") + 2500000);
			variable_global_set(string(game.awayteam) + "_budget", variable_global_get(string(game.awayteam) + "_budget") + 5000000);
		}
			
		semifinal = [];
			
		for (var i = 0; i < array_length(global.events); ++i) {
				
			if (global.events[i].phase == "SEMIFINAL" && global.events[i].competition == game.competition) {
						
				array_push(semifinal, global.events[i]);
					
			}
				
		}
			
		game_with_my_place = "";
				
		for (var i = 0; i < array_length(global.events); ++i) {
				
			if (global.events[i].phase == "FINAL" && global.events[i].competition == game.competition) {
				game_with_my_place = global.events[i];
				break;
			}
				
		}
			
		if (game == semifinal[0]) {
				
			game_with_my_place.hometeam = winner;
				
		} else if (game == semifinal[1]) {
				
			game_with_my_place.awayteam = winner;
				
		}
		
		if (game_with_my_place.hometeam == global.c10_team || game_with_my_place.awayteam == global.c10_team) {
			game_with_my_place.watch = true;
		}
		
	} else if (game.phase == "FINAL") {
		
		if (variable_global_get(winner + "_reputation") < variable_global_get(game.competition + "_reputation")) {
			
			rep_diff = ( variable_global_get(game.competition + "_reputation") - variable_global_get(winner + "_reputation") ) / 2;
			
			variable_global_set(winner + "_reputation", clamp(round(variable_global_get(winner + "_reputation") + rep_diff), 1, 5) );
			
		}
		
		winner_coach = variable_global_get(winner + "_coach");
			
		if (winner_coach != "") {
			if (variable_global_get(winner_coach + "_reputation") < variable_global_get(game.competition + "_reputation")) {
			
				rep_diff = ( variable_global_get(game.competition + "_reputation") - variable_global_get(winner_coach + "_reputation") ) / 2;
			
				variable_global_set(winner_coach + "_reputation", clamp(round(variable_global_get(winner_coach + "_reputation") + rep_diff), 1, 5) );
			
			}
		}
		
		if (game.competition == "l00") {
		
			if (winner == game.hometeam) {
				winner_squad = teamA_squad;
				variable_global_set(string(game.hometeam) + "_budget", variable_global_get(string(game.hometeam) + "_budget") + 20000000);
				variable_global_set(string(game.awayteam) + "_budget", variable_global_get(string(game.awayteam) + "_budget") + 10000000);
			} else {
				winner_squad = teamB_squad;
				variable_global_set(string(game.hometeam) + "_budget", variable_global_get(string(game.hometeam) + "_budget") + 10000000);
				variable_global_set(string(game.awayteam) + "_budget", variable_global_get(string(game.awayteam) + "_budget") + 20000000);
			}
		
		} else if (game.competition == "l01") {
			
			if (winner == game.hometeam) {
				winner_squad = teamA_squad;
				variable_global_set(string(game.hometeam) + "_budget", variable_global_get(string(game.hometeam) + "_budget") + 10000000);
				variable_global_set(string(game.awayteam) + "_budget", variable_global_get(string(game.awayteam) + "_budget") + 5000000);
			} else {
				winner_squad = teamB_squad;
				variable_global_set(string(game.hometeam) + "_budget", variable_global_get(string(game.hometeam) + "_budget") + 5000000);
				variable_global_set(string(game.awayteam) + "_budget", variable_global_get(string(game.awayteam) + "_budget") + 10000000);
			}
			
		}
		
		for (var i = 0; i < array_length(winner_squad); ++i) {
			
		    if (variable_global_get(winner_squad[i] + "_reputation") < variable_global_get(game.competition + "_reputation")) {
			
				rep_diff = ( variable_global_get(game.competition + "_reputation") - variable_global_get(winner_squad[i] + "_reputation") ) / 2;
			
				variable_global_set(winner_squad[i] + "_reputation", clamp(round(variable_global_get(winner_squad[i] + "_reputation") + rep_diff), 1, 5) );
			
			}
			
		}
		
		if (!achievements_completed && winner == global.c10_team) {
			if (game.competition == "l00") {
				achievement_set_completed("THE SPECIAL ONE, PT. 1");
			} else if (game.competition == "l01") {
				achievement_set_completed("THE SPECIAL ONE, PT. 2");
			}
		}
		
	}
	
	game.played = true;
	
}