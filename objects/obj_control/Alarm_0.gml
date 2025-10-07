/// @description GAMECLOCK

if (gameclock > 0) {
	
	gameclock--;
	alarm[0] = 60;
	
} else if (teamA_goals == teamB_goals && (game.competition == "l00" || game.competition == "l01")) {
	
	gameclock += 20;
	alarm[0] = 60;
	
} else {
	
	if (teamA_goals < teamB_goals) {
		winner = teamB;
		winner_sentence = variable_global_get(string(winner) + "_name") + " WINS!";
	} else if (teamA_goals > teamB_goals) {
		winner = teamA;
		winner_sentence = variable_global_get(string(winner) + "_name") + " WINS!";
	} else {
		winner = noone;
		winner_sentence = "IT'S A DRAW!";
	}
	
	best_player = player_list[0];
	
	if (winner != noone) {
	
		for (var i = 0; i < array_length(player_list); ++i) {
	    
			if (best_player.tackles_won + (best_player.goals*5) + (best_player.assists*3) - best_player.own_goals <= player_list[i].tackles_won + (player_list[i].goals*5) + (player_list[i].assists*3) - player_list[i].own_goals && player_list[i].team == winner) {
				best_player = player_list[i];
			}
		
		}
	
	} else {
		
		for (var i = 0; i < array_length(player_list); ++i) {
	    
			if (best_player.tackles_won + (best_player.goals*5) + (best_player.assists*3) - best_player.own_goals <= player_list[i].tackles_won + (player_list[i].goals*5) + (player_list[i].assists*3) - player_list[i].own_goals) {
				best_player = player_list[i];
			}
		
		}
		
	}
	best_player_name = best_player.name;
	best_player_sc = best_player.sc;
	best_player_team_color1 = best_player.team_color1;
	best_player_team_color2 = best_player.team_color2;
	best_player_team_color3 = best_player.team_color3;
	best_player_kittype = best_player.kittype;
	best_player_number = best_player.number;
	best_player_tackles = best_player.tackles_won;
	best_player_goals = best_player.goals;
	
	teamA_possession = obj_ball.teamA_possession;
	teamB_possession = obj_ball.teamB_possession;
	
	screen = "end";
	
	instance_destroy(obj_player);
	instance_destroy(obj_ball);
	instance_destroy(obj_referee);
	instance_destroy(obj_coach);
	
	if (audio_is_playing(snd_crowd)) {
		audio_stop_sound(snd_crowd);
	}	
	
}