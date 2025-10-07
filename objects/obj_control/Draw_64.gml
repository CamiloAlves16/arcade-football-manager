if (screen == "game") {
	
	if (game.competition == "l00") {
		
		draw_set_color(c_white);
		draw_rectangle(60,10,90,20,false);
		draw_set_color(c_black);
		draw_rectangle(0,10,29,20,false);
		draw_set_color(c_blue);
		draw_rectangle(30,10,60,20,false);
		draw_rectangle(90,10,120,20,false);
		
		draw_set_color(c_black);
		draw_set_halign(fa_center);
		draw_text(76,15,string(teamA_goals) + " - " + string(teamB_goals));
		
		draw_set_color(c_white);
		
		seconds = gameclock % 60;
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		draw_text(16,15,string(gameclock div 60) + ":" + string(seconds));
		
		draw_text(46,15, variable_global_get(game.hometeam + "_abrv"));
		draw_text(106,15, variable_global_get(game.awayteam + "_abrv"));
		
	} else if (game.competition == "l01") {
		
		draw_set_color(c_white);
		draw_rectangle(60,10,90,20,false);
		draw_set_color(c_black);
		draw_rectangle(0,10,29,20,false);
		draw_set_color(c_orange);
		draw_rectangle(30,10,60,20,false);
		draw_rectangle(90,10,120,20,false);
		
		draw_set_color(c_black);
		draw_set_halign(fa_center);
		draw_text(76,15,string(teamA_goals) + " - " + string(teamB_goals));
		
		draw_set_color(c_white);
		
		seconds = gameclock % 60;
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		draw_text(16,15,string(gameclock div 60) + ":" + string(seconds));
		
		draw_text(46,15, variable_global_get(game.hometeam + "_abrv"));
		draw_text(106,15, variable_global_get(game.awayteam + "_abrv"));
		
	} else if (game.competition == "l02" || game.competition == "l12") {
		
		draw_set_color(c_lime);
		draw_rectangle(60,10,90,20,false);
		draw_set_color(c_white);
		draw_rectangle(61,21,89,30,false);
		draw_set_color(c_purple);
		draw_rectangle(30,10,60,20,false);
		draw_rectangle(90,10,120,20,false);
		
		draw_set_color(c_black);
		draw_set_halign(fa_center);
		draw_text(76,15,string(teamA_goals) + " - " + string(teamB_goals));
	
		seconds = gameclock % 60;
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		draw_text(76,25,string(gameclock div 60) + ":" + string(seconds));
		
		draw_set_color(c_white);
		draw_text(46,15, variable_global_get(game.hometeam + "_abrv"));
		draw_text(106,15, variable_global_get(game.awayteam + "_abrv"));
		
	} else if (game.competition == "l03" || game.competition == "l13") {
		
		draw_set_color(c_black);
		draw_rectangle(60,10,90,30,false);
		draw_set_color(c_white);
		draw_rectangle(91,10,105,30,false);
		draw_set_color(c_orange);
		draw_rectangle(30,10,60,20,false);
		draw_set_color(c_white);
		draw_rectangle(30,21,60,30,false);
		
		draw_set_color(c_black);
		draw_set_halign(fa_center);
		draw_text(98,15,string(teamA_goals));
		draw_text(98,25,string(teamB_goals));
	
		seconds = gameclock % 60;
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		draw_text(46,25,string(gameclock div 60) + ":" + string(seconds));
		
		draw_set_color(c_white);
		draw_text(76,15, variable_global_get(game.hometeam + "_abrv"));
		draw_text(76,25, variable_global_get(game.awayteam + "_abrv"));
		
	} else if (game.competition == "l04" || game.competition == "l14") {
		
		draw_set_color(c_white);
		draw_rectangle(60,10,90,20,false);
		draw_set_color(c_aqua);
		draw_rectangle(121,10,150,20,false);
		draw_set_color(c_blue);
		draw_rectangle(30,10,60,20,false);
		draw_rectangle(90,10,120,20,false);
		
		draw_set_color(c_black);
		draw_set_halign(fa_center);
		draw_text(76,15,string(teamA_goals) + " - " + string(teamB_goals));
		
		seconds = gameclock % 60;
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		draw_text(136,15,string(gameclock div 60) + ":" + string(seconds));
		
		draw_set_color(c_white);
		draw_text(46,15, variable_global_get(game.hometeam + "_abrv"));
		draw_text(106,15, variable_global_get(game.awayteam + "_abrv"));
		
	} else if (game.competition == "l06" || game.competition == "l16") {
		
		draw_set_color(c_dkgray);
		draw_rectangle(60,10,90,20,false);
		draw_set_color(global.c_gold);
		draw_rectangle(121,10,150,20,false);
		draw_set_color(c_dkgray);
		draw_rectangle(30,10,60,20,false);
		draw_rectangle(90,10,120,20,false);
		
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_text(76,15,string(teamA_goals) + " - " + string(teamB_goals));
		
		draw_set_color(c_black);
		
		seconds = gameclock % 60;
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		draw_text(136,15,string(gameclock div 60) + ":" + string(seconds));
		
		draw_set_color(c_white);
		draw_text(46,15, variable_global_get(game.hometeam + "_abrv"));
		draw_text(106,15, variable_global_get(game.awayteam + "_abrv"));
		
	} else {
	
		draw_set_color(c_black);
		draw_rectangle(60,10,90,30,false);
		
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_text(76,15,string(teamA_goals) + " - " + string(teamB_goals));
	
		seconds = gameclock % 60;
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		draw_text(76,25,string(gameclock div 60) + ":" + string(seconds));
	
	}
	
}
