draw_set_font(global.fnt_numbers);
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_text_transformed(350, 10, "WEEK " + string(global.week), 2, 2, 0);
draw_text_transformed(350, 26, global.year, 2, 2, 0);

draw_sprite(spr_back, esc_button_index, 25, 15);

if (global.c10_team != "freeagent") {
	draw_text_transformed(350, 626, "BUDGET: " + format_number_dots(round(variable_global_get(global.c10_team + "_budget"))), 2, 2, 0);

	draw_set_halign(fa_left);
	draw_text_transformed(10, 626, variable_global_get(global.c10_team + "_name"), 2, 2, 0);
}

draw_set_halign(fa_center);
draw_set_color(global.c_bluer);
draw_rectangle(40,40,320,600,false);

draw_set_color(global.c_gold);
draw_rectangle(40,40,320,600,true);
if (array_contains(menu_options, screen) || (screen == "SQUAD PAGE" && current_team == global.c10_team) || screen == "TACTICS" || screen == "U19 SQUAD PAGE" || (screen == "PLAYER PAGE" && selected_team == global.c10_team) || screen == "PLAYER PAGE 2") {
	draw_sprite(spr_arrow, 0, 330, 320);
	draw_sprite_ext(spr_arrow, 0, 30, 320,-1,1,0,c_white,1);
}

if (screen == "SCHEDULE") {
	
	draw_set_color(c_white);
	draw_text_transformed(180,20,"SCHEDULE",4,4,0);
	if (global.c10_team != "freeagent") {
		option1 = "ADVANCE";
		option2 = "PLAY/SIM";
		option3 = "SCOUT";
		option4 = "LEAGUE";
	} else {
		option1 = "ADVANCE";
		option2 = "";
	}
	
	if (array_length(schedule_array) > 23) {
		max_display = 23;
	} else {
		max_display = array_length(schedule_array);
	}
	
	for (var i = 0; i < max_display; ++i) {
		
		if (selected_index == i) {
			draw_set_color(c_yellow);
		} else {
			draw_set_color(c_white);
			if (!schedule_array[i].watch) {
				draw_set_color(c_ltgray);
			}
			
		}
		
		if (schedule_array[i].watch) {
			watch_string = "PLAY";
		} else {
			watch_string = "SIM";
		}
		if (!schedule_array[i].played) {
			text1 = "(" + variable_global_get(schedule_array[i].competition + "_abrv") + ") " + variable_global_get(schedule_array[i].hometeam + "_abrv") + " - " + variable_global_get(string(schedule_array[i].awayteam) + "_abrv") + " (WEEK " + string(schedule_array[i].week) + " - " + watch_string + ")";
		} else {
			text1 = "(" + variable_global_get(schedule_array[i].competition + "_abrv") + ") " + variable_global_get(string(schedule_array[i].hometeam) + "_abrv") + " " + string(schedule_array[i].home_goals) + " - " + string(schedule_array[i].away_goals) + " " + variable_global_get(string(schedule_array[i].awayteam) + "_abrv");
		}
	
		draw_set_halign(fa_center);
	
		draw_text_transformed(180, 50 + ((i)*20), text1, 2, 2, 0);
	
	}
	
} else if (screen == "TACTICS") {
	
	option1 = "";
	
	draw_sprite(spr_tacticsboard,0,180,320);
	
	draw_set_color(c_ltgray);
	draw_line(44,160,315,160);
	draw_line(44,260,315,260);
	draw_line(120,60,120,379);
	draw_line(240,60,240,379);
	
	draw_set_color(c_black);
	for (var i = 0; i < array_length(tactic); ++i) {
	    draw_text_transformed(tactic[i].pos_x + 5, tactic[i].pos_y, tactic[i].pos, 2, 2, 0);
	}
	
} else if (screen == "SQUAD PAGE" || screen == "U19 SQUAD PAGE") {
	
	draw_set_color(c_white);
	
	if (screen == "SQUAD PAGE") {
		squad_array = variable_global_get(current_team + "_squad");
		draw_text_transformed(180,20,"SQUAD",4,4,0);
		if (vgg(current_team + "_coach") != "") {
			draw_text_transformed(180, 450, "COACH: " + vgg(vgg(current_team + "_coach") + "_firstname") + " " + vgg(vgg(current_team + "_coach") + "_lastname"), 2, 2, 0);
		}
		draw_sprite_ext(spr_badge, variable_global_get(current_team + "_badge"), 180, 475, 3, 3, 0, variable_global_get(current_team + "_color1"), 1);
		draw_sprite_ext(spr_badge_accent, variable_global_get(current_team + "_badge"), 180, 475, 3, 3, 0, variable_global_get(current_team + "_color2"), 1);
		draw_text_transformed(180, 500, variable_global_get(current_team + "_name"), 2, 2, 0);
	} else {
		squad_array = variable_global_get(current_team + "_u19_squad");
		draw_text_transformed(180,20,"U19 SQUAD",4,4,0);
	}
	squad_tactic = variable_global_get(current_team + "_tactic");
	
	if (current_team == global.c10_team) {
		option1 = "MOVE UP";
		option2 = "MOVE DOWN";
		option3 = "SEE PAGE";
		option4 = "LEAGUE";
	} else {
		option1 = "PLAYER";
		option2 = "LEAGUE";
		option3 = "";
	}
	
	draw_line_width(50,150,310,150,2);
	
	if (array_length(squad_array) > 23) {
		max_display = 23;
	} else {
		max_display = array_length(squad_array);
	}
	
	for (var i = 0; i < max_display; ++i) {
		
		if (selected_index == i) {
			draw_set_color(c_yellow);
		} else {
			draw_set_color(c_white);
		}
		
		if (i < 5) {
			vertical_separation = 50;
			draw_set_halign(fa_center);
			draw_text_transformed(30, vertical_separation + ((i)*20), squad_tactic[i].pos, 2, 2, 0);
		} else {
			vertical_separation = 70;
		}
		
		text1 = string_copy(variable_global_get(squad_array[i] + "_firstname"), 1, 1) + ". " + variable_global_get(squad_array[i] + "_lastname") + " ";
		if (variable_global_get(squad_array[i] + "_gk") == 3) {
			text1 += "(GK)";
		}
		if (variable_global_get(squad_array[i] + "_def") == 3) {
			text1 += "(D)";
		}
		if (variable_global_get(squad_array[i] + "_mid") == 3) {
			text1 += "(M)";
		}
		if (variable_global_get(squad_array[i] + "_ata") == 3) {
			text1 += "(F)";
		}
		text2 = variable_global_get(squad_array[i] + "_age");
		text3 = string(variable_global_get(squad_array[i] + "_contract")) + "Y";
	
		draw_set_halign(fa_left);
	
		draw_text_transformed(50, vertical_separation + ((i)*20), text1, 2, 2, 0);
		draw_text_transformed(270, vertical_separation + ((i)*20), text2, 2, 2, 0);
		draw_text_transformed(300, vertical_separation + ((i)*20), text3, 2, 2, 0);
		
		info_array = [];
		
		if (variable_global_get(squad_array[i] + "_injury") > 0) {
			array_push(info_array, 0);
		}
		if (array_contains(global.player_loans, squad_array[i])) {
			array_push(info_array, 1);
		}
		if (array_contains(global.player_transfers, squad_array[i])) {
			array_push(info_array, 2);
		}
		if (array_length(variable_global_get(squad_array[i] + "_offers")) > 0) {
			array_push(info_array, 3);
		}
		for (var j = 0; j < array_length(info_array); ++j) {
		    draw_sprite(spr_injured, info_array[j], 60 + string_width(text1)*2 + (15*j), vertical_separation + ((i)*20) + 1);
		}
		
	}	
	
} else if (screen == "LEAGUE PAGE") {
	
	if (variable_global_exists(current_league + "_class")) {
		current_league_array = variable_global_get(current_league + "_class");
		option1 = "SEE PAGE";
		option2 = "";
	} else {
		current_league_array = [];
		for (var i = 0; i < array_length(global.events); ++i) {
			if (global.events[i].competition == current_league) {
				array_push(current_league_array, global.events[i]);
			}
		}
		option1 = "HOME";
		option2 = "AWAY";
		option3 = "PLAY/SIM";
		option4 = "";
	}
	draw_set_color(c_white);
	draw_text_transformed(180,20,variable_global_get(current_league + "_name"),4,4,0);
	
	if (variable_global_exists(current_league + "_class")) {
		
		var last_played_games = [];
		var games_week = 0;
		
		for (var i = 0; i < array_length(global.events); ++i) {
		    if (global.events[i].competition == current_league && !global.events[i].played) {
				break;
			} else if (global.events[i].competition == current_league) {
				games_week = global.events[i].week;
			}
		}
		for (var i = 0; i < array_length(global.events); ++i) {
		    if (global.events[i].week < games_week) {
				continue;
			} else if (global.events[i].week > games_week) {
				break;
			} else if (global.events[i].competition == current_league) {
				array_push(last_played_games, global.events[i]);
			}
		}
		
		if (array_length(current_league_array) > 23) {
			max_display = 23;
		} else {
			max_display = array_length(current_league_array);
		}
	
		for (var i = 0; i < max_display; ++i) {
		
			if (selected_index == i) {
				draw_set_color(c_yellow);
			} else {
				draw_set_color(c_white);
			}
		
			draw_set_halign(fa_left);
		
			if (i == 0) {
				if (string_digits(current_league) < 10) {
					draw_text_transformed(50, 50 + ((i)*20), string(i + 1) + ". " + variable_global_get(string(current_league_array[i]) + "_name") + " (CC)", 2, 2, 0);
				} else {
					draw_text_transformed(50, 50 + ((i)*20), string(i + 1) + ". " + variable_global_get(string(current_league_array[i]) + "_name") + " (P)", 2, 2, 0);
				}
			} else if (i == 1 && string_digits(current_league) < 10) {
				draw_text_transformed(50, 50 + ((i)*20), string(i + 1) + ". " + variable_global_get(string(current_league_array[i]) + "_name") + " (EC)", 2, 2, 0);
			} else if (i == array_length(current_league_array) - 1 && string_digits(current_league) < 10) {
				draw_text_transformed(50, 50 + ((i)*20), string(i + 1) + ". " + variable_global_get(string(current_league_array[i]) + "_name") + " (R)", 2, 2, 0);
			} else {
				draw_text_transformed(50, 50 + ((i)*20), string(i + 1) + ". " + variable_global_get(string(current_league_array[i]) + "_name"), 2, 2, 0);
			}
			draw_set_halign(fa_right);
			draw_text_transformed(285, 50 + ((i)*20), string(variable_global_get(current_league_array[i] + "_goals")) + "G", 2, 2, 0);
			draw_text_transformed(315, 50 + ((i)*20), string(variable_global_get(current_league_array[i] + "_points")) + "P", 2, 2, 0);
		
		}
		
		if (array_length(last_played_games) > 0) {
			
			draw_set_halign(fa_center);
			draw_set_color(c_white);
			
			draw_text_transformed(180, 220, "LATEST RESULTS (WEEK " + string(games_week) + ")", 2, 2, 0);
			
			for (var i = 0; i < array_length(last_played_games); ++i) {
			    
				text1 = variable_global_get(last_played_games[i].hometeam + "_abrv") + " " + string(last_played_games[i].home_goals) + " - " + string(last_played_games[i].away_goals) + " " + variable_global_get(last_played_games[i].awayteam + "_abrv");
				
				draw_text_transformed(180, 250 + ((i)*20), text1, 2, 2, 0);
				
			}
			
		}
		
	} else {
		
		if (array_length(current_league_array) > 23) {
			max_display = 23;
		} else {
			max_display = array_length(current_league_array);
		}
	
		for (var i = 0; i < max_display; ++i) {
		
			if (selected_index == i) {
				draw_set_color(c_yellow);
			} else {
				draw_set_color(c_white);
				if (!current_league_array[i].watch) {
					draw_set_color(c_ltgray);
				}
			
			}
		
			if (current_league_array[i].watch) {
				watch_string = "PLAY";
			} else {
				watch_string = "SIM";
			}
			if (!current_league_array[i].played) {
				text1 = variable_global_get(string(current_league_array[i].hometeam) + "_abrv") + " - " + variable_global_get(string(current_league_array[i].awayteam) + "_abrv") + " (WEEK " + string(current_league_array[i].week) + " - " + watch_string + ")";
			} else {
				text1 = variable_global_get(string(current_league_array[i].hometeam) + "_abrv") + " " + string(current_league_array[i].home_goals) + " - " + string(current_league_array[i].away_goals) + " " + variable_global_get(string(current_league_array[i].awayteam) + "_abrv");
			}
	
			draw_set_halign(fa_center);
	
			draw_text_transformed(180, 50 + ((i)*20), text1, 2, 2, 0);
		
		}
		
	}
	
} else if (screen == "COEFFICIENTS") {
	
	draw_set_color(c_white);
	draw_text_transformed(180,20,"WORLD",4,4,0);
	option1 = "SEE PAGE";
	option2 = "";
	
	if (array_length(coefficient_list) > 23) {
		max_display = 23;
	} else {
		max_display = array_length(coefficient_list);
	}
	
	for (var i = 0; i < max_display; ++i) {
		
		if (selected_index == i) {
			draw_set_color(c_yellow);
		} else {
			draw_set_color(c_white);
		}
		
		draw_set_halign(fa_left);
		
		
		draw_text_transformed(50, 50 + ((i)*20), string(i + 1) + ". " + variable_global_get(string(coefficient_list[i]) + "_name"), 2, 2, 0);
		
	}
	
} else if (screen == "OPTIONS") {
	
	draw_set_color(c_white);
	draw_text_transformed(180,20,"OPTIONS",4,4,0);
	option1 = "SELECT";
	option2 = "";
	
	if (array_length(lastpage_options) > 23) {
		max_display = 23;
	} else {
		max_display = array_length(lastpage_options);
	}
	
	for (var i = 0; i < max_display; ++i) {
		
		if (selected_index == i) {
			draw_set_color(c_yellow);
		} else {
			draw_set_color(c_white);
		}
	
		draw_set_halign(fa_center);
		
		if (lastpage_options[i] == "NOTIFICATIONS") {
			draw_text_transformed(180, 50 + ((i)*20), lastpage_options[i] + ": " + global.warning_mode, 2, 2, 0);
		} else {
			draw_text_transformed(180, 50 + ((i)*20), lastpage_options[i], 2, 2, 0);
		}
		
	}
	
} else if (screen == "OFFERS") {
	
	draw_set_color(c_white);
	draw_text_transformed(180,20,"OFFERS",4,4,0);
	if (array_length(global.c10_offers) > 0) {
		option1 = "SCOUT";
		option2 = "ACCEPT";
		option3 = "";
	} else {
		option1 = "";
	}
	
	if (array_length(global.c10_offers) > 23) {
		max_display = 23;
	} else {
		max_display = array_length(global.c10_offers);
	}
	
	for (var i = 0; i < max_display; ++i) {
		
		if (selected_index == i) {
			draw_set_color(c_yellow);
		} else {
			draw_set_color(c_white);
		}
	
		draw_set_halign(fa_center);
		
		draw_text_transformed(180, 50 + ((i)*20), string(global.c10_offers[i].contract) + " Y - " + variable_global_get(global.c10_offers[i].team + "_name") + " (" + format_number_dots(round(variable_global_get(global.c10_offers[i].team + "_budget"))) + ")", 2, 2, 0);
		
	}
	
} else if (screen == "CONTACTS") {
	
	draw_set_color(c_white);
	draw_text_transformed(180,20,"CONTACTS",4,4,0);
	option1 = "TALK";
	option2 = "";
	
	if (array_length(contacts) > 23) {
		max_display = 23;
	} else {
		max_display = array_length(contacts);
	}
	
	for (var i = 0; i < max_display; ++i) {
		
		if (selected_index == i) {
			draw_set_color(c_yellow);
		} else {
			draw_set_color(c_white);
		}
	
		draw_set_halign(fa_center);
		
		if (variable_global_exists(contacts[i] + "_firstname")) {
			contact_name = variable_global_get(contacts[i] + "_firstname") + " " + variable_global_get(contacts[i] + "_lastname");
		} else {
			contact_name = contacts[i];
		}
	
		draw_text_transformed(180, 50 + ((i)*20), contact_name, 2, 2, 0);
		
	}
	
} else if (screen == "PLAYER PAGE") {
	
	selected_sc = variable_global_get(string(selected) + "_sc");
	selected_team = variable_global_get(string(selected) + "_team");
	selected_og_team = variable_global_get(string(selected) + "_og_team");
	selected_name = variable_global_get(string(selected) + "_firstname") + " " + variable_global_get(string(selected) + "_lastname");
	selected_age = variable_global_get(string(selected) + "_age");
	selected_injury = variable_global_get(string(selected) + "_injury");
	selected_number = variable_global_get(string(selected) + "_number");
	selected_contract = variable_global_get(string(selected) + "_contract");
	selected_salary = variable_global_get(string(selected) + "_salary");
	selected_value = variable_global_get(string(selected) + "_value");
	selected_pos = variable_global_get(string(selected) + "_pos");
	selected_spd = variable_global_get(string(selected) + "_spd");
	selected_tkl = variable_global_get(string(selected) + "_tkl");
	selected_sta = variable_global_get(string(selected) + "_sta");
	selected_tec = variable_global_get(string(selected) + "_tec");
	selected_gk = variable_global_get(string(selected) + "_gk");
	selected_def = variable_global_get(string(selected) + "_def");
	selected_mid = variable_global_get(string(selected) + "_mid");
	selected_ata = variable_global_get(string(selected) + "_ata");
	selected_ca = variable_global_get(string(selected) + "_ca");
	selected_potential = variable_global_get(string(selected) + "_potential");
	selected_reputation = variable_global_get(string(selected) + "_reputation");
	selected_goals = variable_global_get(string(selected) + "_goals");
	selected_assists = variable_global_get(string(selected) + "_assists");
	selected_tackles = variable_global_get(string(selected) + "_tackles");
	selected_offers = variable_global_get(selected + "_offers");
	info_array = [];
	if (variable_global_get(selected + "_injury") > 0) {
		array_push(info_array, 0);
	}
	if (array_contains(global.player_loans, selected)) {
		array_push(info_array, 1);
	}
	if (array_contains(global.player_transfers, selected)) {
		array_push(info_array, 2);
	}	
	
	if (selected_team != "freeagent") {
		
		if (selected_team == global.c10_team || selected_og_team == global.c10_team) {
			option1 = "TALK";
			option2 = "";
		} else {
			option1 = "INQUIRE";
			option2 = "";
		}
		
		if (selected_pos != "GOALKEEPER") {
			selected_team_color1 = variable_global_get(string(selected_team) + "_color1");
			selected_team_color2 = variable_global_get(string(selected_team) + "_color2");
			selected_team_color3 = variable_global_get(string(selected_team) + "_color3");
		} else {
			selected_team_color1 = c_yellow;
			selected_team_color2 = c_yellow;
			selected_team_color3 = c_yellow;
		}
		
	} else {
		
		selected_team_color1 = c_white;
		selected_team_color2 = c_black;
		selected_team_color3 = c_black;
		option1 = "TALK";
		option2 = "";
		option3 = "";
		
	}
	
	draw_set_halign(fa_center);
	draw_sprite_ext(spr_photo_shirt, 0, 100, 110, 4, 4, 0, selected_team_color1, 1);

	if (variable_global_get(selected_team + "_kittype") == "sleeves" || variable_global_get(selected_team + "_kittype") == "sleeves and shorts") {
	    draw_sprite_ext(spr_photo_sleeves,0,100, 110, 4, 4,0,selected_team_color2,1);
	    if (selected_team_color1 != c_white && selected_team_color1 != c_yellow) {
	        draw_set_color(c_white);
	    } else {
	        draw_set_color(c_black);
	    }
	} else if (variable_global_get(selected_team + "_kittype") == "stripes" || variable_global_get(selected_team + "_kittype") == "stripes and shorts") {
	    draw_sprite_ext(spr_photo_stripes,0,100, 110, 4, 4,0,selected_team_color2,1);
	    if (selected_team_color1 != c_white && selected_team_color1 != c_yellow && selected_team_color2 != c_white) {
	        draw_set_color(c_white);
	    } else if (selected_team_color2 == c_black) {
	        draw_set_color(c_red);
	    } else {
	        draw_set_color(c_black);
	    }
	} else if (variable_global_get(selected_team + "_kittype") == "bars" || variable_global_get(selected_team + "_kittype") == "bars and shorts") {
	    draw_sprite_ext(spr_photo_bars,0,100, 110, 4, 4,0,selected_team_color2,1);
	    if (selected_team_color1 != c_white && selected_team_color1 != c_yellow && selected_team_color2 != c_white) {
	        draw_set_color(c_white);
	    } else if (selected_team_color2 == c_black) {
	        draw_set_color(c_red);
	    } else {
	        draw_set_color(c_black);
	    }
	} else if (variable_global_get(selected_team + "_kittype") == "checkers") {
	    draw_sprite_ext(spr_photo_bars,0,100, 110, 4, 4,0,selected_team_color2,1);
	    draw_sprite_ext(spr_photo_stripes,0,100, 110, 4, 4,0,selected_team_color2,1);
	    if (selected_team_color1 != c_white && selected_team_color1 != c_yellow && selected_team_color2 != c_white) {
	        draw_set_color(c_white);
	    } else if (selected_team_color2 == c_black) {
	        draw_set_color(c_red);
	    } else{
	        draw_set_color(c_black);
	    }
	} else {
	    if (selected_team_color1 != c_white && selected_team_color1 != c_yellow) {
	        draw_set_color(c_white);
	    } else {
	        draw_set_color(c_black);
	    }
	}
	draw_text_transformed(104, 93, selected_number, 3, 3, 0);

	draw_set_color(c_green);
	draw_rectangle(180-20,110-50,180+20,110+10,false);
	draw_set_color(global.c_gold);
	draw_rectangle(180-20,110-50,180+20,110+10,true);

	draw_sprite_ext(spr_idle_1,0,180,110,2,2,0,selected_sc,1);
	draw_sprite_ext(spr_idle_1_shirt,0,180,110,2,2,0,selected_team_color1,1);

	if (variable_global_get(string(selected_team) + "_kittype") == "shorts") {
	    draw_sprite_ext(spr_idle_1_shorts,0,180,110,2,2,0,selected_team_color2,1);
	} else if (variable_global_get(string(selected_team) + "_kittype") == "stripes") {
	    draw_sprite_ext(spr_idle_1_stripes,0,180,110,2,2,0,selected_team_color2,1);
	} else if (variable_global_get(string(selected_team) + "_kittype") == "stripes and shorts") {
	    draw_sprite_ext(spr_idle_1_stripes,0,180,110,2,2,0,selected_team_color2,1);
	    draw_sprite_ext(spr_idle_1_shorts,0,180,110,2,2,0,selected_team_color3,1);
	} else if (variable_global_get(string(selected_team) + "_kittype") == "bars and shorts") {
	    draw_sprite_ext(spr_idle_1_bars,0,180,110,2,2,0,selected_team_color2,1);
	    draw_sprite_ext(spr_idle_1_shorts,0,180,110,2,2,0,selected_team_color3,1);
	} else if (variable_global_get(string(selected_team) + "_kittype") == "sleeves") {
	    draw_sprite_ext(spr_idle_1_sleeves,0,180,110,2,2,0,selected_team_color2,1);
	} else if (variable_global_get(string(selected_team) + "_kittype") == "sleeves and shorts") {
	    draw_sprite_ext(spr_idle_1_sleeves,0,180,110,2,2,0,selected_team_color2,1);
	    draw_sprite_ext(spr_idle_1_shorts,0,180,110,2,2,0,selected_team_color3,1);
	} else if (variable_global_get(string(selected_team) + "_kittype") == "checkers") {
	    draw_sprite_ext(spr_idle_1_bars,0,180,110,2,2,0,selected_team_color2,1);
	    draw_sprite_ext(spr_idle_1_stripes,0,180,110,2,2,0,selected_team_color2,1);
	}

	for (var j = 0; j < array_length(info_array); ++j) {
	    draw_sprite(spr_injured, info_array[j], 220, 70 + (j*15));
	}

	draw_set_color(c_white);
	draw_text_transformed(180,135,string(selected_name),2,2,0);
	draw_text_transformed(180,155,string(selected_age) + " YEARS OLD",2,2,0);

	if (selected_team != "freeagent") {
	    draw_text_transformed(180,175,format_number_dots(round(selected_salary)) + "/WEEK - " + string(selected_contract) + " YEAR(S)",2,2,0);
	} else {
	    draw_text_transformed(180,175, "EXPECTS AROUND " + format_number_dots(round(selected_salary)) + "/WEEK",2,2,0);
	}

	if (selected_team != variable_global_get(selected + "_og_team")) {
	    draw_text_transformed(180,195, "VALUE: " + format_number_dots(round(selected_value)) + " (ON LOAN)",2,2,0);
	} else {
	    draw_text_transformed(180,195, "VALUE: " + format_number_dots(round(selected_value)),2,2,0);
	}
	
	draw_set_halign(fa_left);
	
	draw_sprite_ext(spr_ball_7,image_index/10,60,233,2,2,0,c_white,1);
	if (selected_spd >= 3) {
		draw_set_color(c_green);
		draw_text_transformed(80,225,"GREAT SPEED",2,2,0);
	} else if (selected_spd >= 2) {
		draw_set_color(c_yellow);
		draw_text_transformed(80,225,"AVERAGE SPEED",2,2,0);
	} else {
		draw_set_color(c_maroon);
		draw_text_transformed(80,225,"POOR SPEED",2,2,0);
	}
	
	tackling_sentence = "TACKLER";
	if (selected_gk == 3) {
		tackling_sentence = "SHOT STOPPER";
	}
	draw_sprite_ext(spr_ball_7,image_index/10,60,263,2,2,0,c_white,1);
	if (selected_tkl >= 3) {
		draw_set_color(c_green);
		draw_text_transformed(80,255,"GREAT " + tackling_sentence,2,2,0);
	} else if (selected_tkl >= 2) {
		draw_set_color(c_yellow);
		draw_text_transformed(80,255,"AVERAGE " + tackling_sentence,2,2,0);
	} else {
		draw_set_color(c_maroon);
		draw_text_transformed(80,255,"POOR " + tackling_sentence,2,2,0);
	}
	
	draw_sprite_ext(spr_ball_7,image_index/10,60,293,2,2,0,c_white,1);
	if (selected_tec >= 3) {
		draw_set_color(c_green);
		draw_text_transformed(80,285,"GREAT TECHNIQUE",2,2,0);
	} else if (selected_tec >= 2) {
		draw_set_color(c_yellow);
		draw_text_transformed(80,285,"AVERAGE TECHNIQUE",2,2,0);
	} else if (selected_tec >= 1) {
		draw_set_color(c_maroon);
		draw_text_transformed(80,285,"POOR TECHNIQUE",2,2,0);
	}
	
	draw_sprite_ext(spr_ball_7,image_index/10,60,323,2,2,0,c_white,1);
	if (selected_sta >= 3) {
		draw_set_color(c_green);
		draw_text_transformed(80,315,"GREAT ENDURANCE",2,2,0);
	} else if (selected_sta >= 2) {
		draw_set_color(c_yellow);
		draw_text_transformed(80,315,"AVERAGE ENDURANCE",2,2,0);
	} else {
		draw_set_color(c_maroon);
		draw_text_transformed(80,315,"POOR ENDURANCE",2,2,0);
	}
	
	draw_set_color(c_white);
	draw_sprite_ext(spr_ball_7,image_index/10,60,383,2,2,0,c_white,1);
	if (selected_potential - selected_ca > 2) {
		if (selected_potential > 15) {
			draw_text_transformed(80,375,"WORLD CLASS POTENTIAL",2,2,0);
		} else {
			draw_text_transformed(80,375,"LOTS OF ROOM TO GROW",2,2,0);
		}
	} else if (selected_potential - selected_ca > 1) {
		draw_text_transformed(80,375,"CAN IMPROVE QUITE A BIT",2,2,0);
	} else if (selected_potential - selected_ca > 0) {
		draw_text_transformed(80,375,"CLOSE TO FULL POTENTIAL",2,2,0);
	} else {
		draw_text_transformed(80,375,"WON'T IMPROVE ANY MORE",2,2,0);
	}
	
	draw_sprite_ext(spr_ball_7,image_index/10,60,413,2,2,0,c_white,1);
	if (selected_reputation > 4) {
		draw_text_transformed(80,405,"RECOGNIZED ACROSS THE WORLD",2,2,0);
	} else if (selected_reputation > 3) {
		draw_text_transformed(80,405,"RECOGNIZED IN THIS CONTINENT",2,2,0);
	} else if (selected_reputation > 2) {
		draw_text_transformed(80,405,"RECOGNIZED IN THIS COUNTRY",2,2,0);
	} else if (selected_reputation > 1) {
		draw_text_transformed(80,405,"RECOGNIZED IN THIS CITY",2,2,0);
	} else {
		draw_text_transformed(80,405,"NEIGHBORHOOD LEGEND",2,2,0);
	}
	
	if (array_length(selected_offers) > 0) {
		draw_sprite_ext(spr_ball_7,image_index/10,60,443,2,2,0,c_white,1);
		draw_text_transformed(80,435,"MULLING OFFER FROM " + variable_global_get(selected_offers[0].team + "_abrv"),2,2,0);
	}
	

	
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text_transformed(180,345,"MENTAL",2,2,0);
	
	draw_text_transformed(180,465,"GOALS: " + string(selected_goals),2,2,0);
	draw_text_transformed(180,485,"ASSISTS: " + string(selected_assists),2,2,0);
	
	draw_set_halign(fa_center);
	
} else if (screen == "PLAYER PAGE 2") {
	
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text_transformed(180,100,"VERSATILITY",2,2,0);
	
	option1 = "";
	
	// X positions for each circle + label
	var xpos_g = 120;
	var xpos_d = 160;
	var xpos_m = 200;
	var xpos_f = 240;
	var ypos_circle = 150;
	
	// Helper script for circle + label
	function draw_affinity_circle(x, y, value, label) {
		if (value >= 3) {
			color = c_green;
		} else if (value >= 2) {
			color = c_yellow;
		} else if (value >= 1) {
			color = c_maroon;
		}
		draw_sprite_ext(spr_ball_l01, 0, x, y, 2, 2, 0, color, 1);
		draw_set_color(c_white);
		draw_text_transformed(x + 4, y+20, label, 2,2,0);
	}
	
	// Draw circles for each position
	draw_affinity_circle(xpos_g, ypos_circle, selected_gk, "G");
	draw_affinity_circle(xpos_d, ypos_circle, selected_def, "D");
	draw_affinity_circle(xpos_m, ypos_circle, selected_mid, "M");
	draw_affinity_circle(xpos_f, ypos_circle, selected_ata, "F");
	
	// Training focus section
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text_transformed(180,240,"TRAINING",2,2,0);

	training_focus = variable_global_get(string(selected) + "_training_focus");

	// Map suffix -> readable string (all caps)
	var focus_label = "";

	switch (training_focus) {
		case "_gk": focus_label = "GOALKEEPER POSITION"; break;
		case "_def": focus_label = "DEFENDER POSITION"; break;
		case "_mid": focus_label = "MIDFIELDER POSITION"; break;
		case "_ata": focus_label = "FORWARD POSITION"; break;
		case "_spd": focus_label = "SPEED"; break;
		case "_sta": focus_label = "ENDURANCE"; break;
		case "_tec": focus_label = "TECHNIQUE"; break;
		case "_tkl": 
		if (selected_gk == 3) {
			focus_label = "SHOT STOPPING";
		} else {
			focus_label = "TACKLING";
		}
		break;
		default: focus_label = "";
	}

	if (focus_label != "") {
		draw_text_transformed(180,275,"CURRENTLY FOCUSED ON: ",2,2,0);
		draw_text_transformed(180,295,focus_label,2,2,0);
	}
	
	draw_text_transformed(180,340,"HEALTH",2,2,0);
	if (selected_injury <= 0) {
		draw_text_transformed(180,375,"100% CONDITION",2,2,0);
	} else if (selected_injury == 1) {
		draw_text_transformed(180,375,"75% CONDITION (1 WEEK)",2,2,0);
	} else {
		draw_text_transformed(180,375,"50% CONDITION (2 WEEKS)",2,2,0);
	}

	
} else if (screen == "FREE AGENTS" || screen == "LOAN LIST" || screen == "TRANSFER LIST") {
	
	draw_set_color(c_white);
	if (screen == "FREE AGENTS") {
		draw_text_transformed(180,20,"FREE AGENTS",4,4,0);
		squad_array = global.player_freeagent;
	} else if (screen == "LOAN LIST") {
		draw_text_transformed(180,20,"LOAN LIST",4,4,0);
		squad_array = global.player_loans;
	} else {
		draw_text_transformed(180,20,"TRANSFER LIST",4,4,0);
		squad_array = global.player_transfers;
	}
	
	if (array_length(squad_array) > 0) {
		option1 = "SEE PAGE";
		option2 = "SORT";
		option3 = "";
		draw_set_halign(fa_center);
		draw_text_transformed(180, 510, "SORTED BY: " + squad_array_sort, 2, 2, 0);
	} else {
		option1 = "";
	}
	
	if (array_length(squad_array) > 23) {
		max_display = 23;
	} else {
		max_display = array_length(squad_array);
	}
	
	for (var i = 0; i < max_display; ++i) {
		
		if (selected_index == i) {
			draw_set_color(c_yellow);
		} else {
			draw_set_color(c_white);
		}
		
		text1 = string_copy(variable_global_get(squad_array[i] + "_firstname"), 1, 1) + ". " + variable_global_get(squad_array[i] + "_lastname") + " ";
		if (variable_global_get(squad_array[i] + "_gk") == 3) {
			text1 += "(GK)";
		}
		if (variable_global_get(squad_array[i] + "_def") == 3) {
			text1 += "(D)";
		}
		if (variable_global_get(squad_array[i] + "_mid") == 3) {
			text1 += "(M)";
		}
		if (variable_global_get(squad_array[i] + "_ata") == 3) {
			text1 += "(F)";
		}
		text2 = variable_global_get(squad_array[i] + "_age");
		text3 = variable_global_get(squad_array[i] + "_number");
	
		draw_set_halign(fa_left);
	
		draw_text_transformed(50, 50 + ((i)*20), text1, 2, 2, 0);
		draw_text_transformed(270, 50 + ((i)*20), text2, 2, 2, 0);
		draw_text_transformed(300, 50 + ((i)*20), text3, 2, 2, 0);
		
	}
	
} else if (screen == "TEAM INFO") {
	
	option1 = "";
	
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	
	tickets_revenue = lerp(global.min_tickets, global.max_tickets, (variable_global_get(global.c10_team + "_reputation") - 1) / 4);
	tv_revenue = lerp(global.min_tv, global.max_tv, (variable_global_get(vgg(global.c10_team + "_league") + "_reputation") - 1) / 4);
	
	wages = 0;
	available_players = variable_global_get(global.c10_team + "_squad");
	for (var j = 0; j < array_length(available_players); ++j) {
			wages += vgg(available_players[j] + "_salary");
	}
	
	draw_sprite_ext(spr_photo_shirt, 0, 110, 150, 10, 10, 0, variable_global_get(global.c10_team + "_color1"), 1);
	if (variable_global_get(global.c10_team + "_kittype") == "sleeves" || variable_global_get(global.c10_team + "_kittype") == "sleeves and shorts") {
		draw_sprite_ext(spr_photo_sleeves,0, 110, 150, 10, 10, 0, variable_global_get(global.c10_team + "_color2"),1);
	} else if (variable_global_get(global.c10_team + "_kittype") == "stripes" || variable_global_get(global.c10_team + "_kittype") == "stripes and shorts") {
		draw_sprite_ext(spr_photo_stripes,0, 110, 150, 10, 10, 0, variable_global_get(global.c10_team + "_color2"),1);
	} else if (variable_global_get(global.c10_team + "_kittype") == "bars" || variable_global_get(global.c10_team + "_kittype") == "bars and shorts") {
		draw_sprite_ext(spr_photo_bars,0, 110, 150, 10, 10, 0, variable_global_get(global.c10_team + "_color2"),1);
	} else if (variable_global_get(global.c10_team + "_kittype") == "checkers") {
		draw_sprite_ext(spr_photo_bars,0, 110, 150, 10, 10, 0, variable_global_get(global.c10_team + "_color2"),1);
		draw_sprite_ext(spr_photo_stripes,0, 110, 150, 10, 10, 0, variable_global_get(global.c10_team + "_color2"),1);
	}
	
	draw_sprite_ext(spr_photo_shirt, 0, 250, 150, 10, 10, 0, variable_global_get(global.c10_team + "_color3"), 1);
	
	draw_sprite_ext(spr_badge, variable_global_get(global.c10_team + "_badge"), 130, 95, 1, 1, 0, variable_global_get(global.c10_team + "_color1"), 1);
	draw_sprite_ext(spr_badge_accent, variable_global_get(global.c10_team + "_badge"), 130, 95, 1, 1, 0, variable_global_get(global.c10_team + "_color2"), 1);
	
	draw_sprite_ext(spr_badge, variable_global_get(global.c10_team + "_badge"), 270, 95, 1, 1, 0, variable_global_get(global.c10_team + "_color1"), 1);
	draw_sprite_ext(spr_badge_accent, variable_global_get(global.c10_team + "_badge"), 270, 95, 1, 1, 0, variable_global_get(global.c10_team + "_color2"), 1);
	
	sponsor_sprite = asset_get_index("spr_" + variable_global_get(global.c10_team + "_sponsor"));
	draw_sprite_ext(sponsor_sprite, 0, 110, 120, 2, 2, 0, c_white,1);
	draw_sprite_ext(sponsor_sprite, 0, 250, 120, 2, 2, 0, c_white,1);
	
	draw_text_transformed(115, 160, "HOME", 2, 2, 0);
	draw_text_transformed(255, 160, "AWAY", 2, 2, 0);
	
	draw_text_transformed(180, 190, "SPONSORSHIP: " + format_number_dots(variable_global_get(variable_global_get(global.c10_team + "_sponsor") + "_money")) + "/YEAR", 2, 2, 0);
	
	if (variable_global_get(global.c10_team + "_reputation") > 4) {
		draw_text_transformed(180,220,"REPUTATION: WORLDWIDE",2,2,0);
	} else if (variable_global_get(global.c10_team + "_reputation") > 3) {
		draw_text_transformed(180,220,"REPUTATION: CONTINENTAL",2,2,0);
	} else if (variable_global_get(global.c10_team + "_reputation") > 2) {
		draw_text_transformed(180,220,"REPUTATION: COUNTRYWIDE",2,2,0);
	} else if (variable_global_get(global.c10_team + "_reputation") > 1) {
		draw_text_transformed(180,220,"REPUTATION: REGIONAL",2,2,0);
	} else {
		draw_text_transformed(180,220,"REPUTATION: COUPLE DIE HARD FANS",2,2,0);
	}
	
	if (variable_global_get(global.c10_team + "_training") > 4) {
		draw_text_transformed(180,250,"FACILITIES: BEST IN THE WORLD",2,2,0);
	} else if (variable_global_get(global.c10_team + "_training") > 3) {
		draw_text_transformed(180,250,"FACILITIES: VERY GOOD",2,2,0);
	} else if (variable_global_get(global.c10_team + "_training") > 2) {
		draw_text_transformed(180,250,"FACILITIES: DO THE JOB",2,2,0);
	} else if (variable_global_get(global.c10_team + "_training") > 1) {
		draw_text_transformed(180,250,"FACILITIES: ROOM FOR IMPROVEMENT",2,2,0);
	} else {
		draw_text_transformed(180,250,"FACILITIES: NEED URGENT CARE",2,2,0);
	}
	
	draw_text_transformed(180,300,"WEEKLY REPORT",2,2,0);
	
	draw_set_halign(fa_right);
	draw_set_color(c_green);
	draw_text_transformed(240,330, "+ (TV RIGHTS) " + format_number_dots(round(tv_revenue)),2,2,0);
	draw_text_transformed(240,350, "+ (MATCHDAY) " + format_number_dots(round(tickets_revenue)),2,2,0);
	draw_set_color(c_red);
	draw_text_transformed(240,370,"- (WAGES) " + format_number_dots(round(wages)),2,2,0);
	draw_set_color(c_white);
	draw_line_width(100, 390, 250, 390,2);
	if (round(tv_revenue + tickets_revenue - wages) > 0) {
		draw_set_color(c_green);
	} else {
		draw_set_color(c_red);
	}
	draw_text_transformed(240,410,format_number_dots(round(tv_revenue + tickets_revenue - wages)),2,2,0);
	
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	
} else if (screen == "INTERACTION") {
	
	option1 = "TALK";
	option2 = "";
	
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	interaction_write = keyboard_string;
	interaction_write = string_upper(interaction_write);
	
	/*
	if (array_length(what_was_said) > 0) {
		draw_text_ext_transformed(185, 50, what_was_said, 7, 150, 2, 2, 0);
		draw_text(185,75, number);
	}
	*/
	
	if (array_length(interaction_dialogue) > 2) {
		dialogue_max_display = array_length(interaction_dialogue) - 2;
	} else {
		dialogue_max_display = 0;
	}
	
	for (var i = array_length(interaction_dialogue) - 1; i >= dialogue_max_display; --i) {
		
		if (i % 2 == 0) {
			interaction_line = global.c10_lastname + ": " + string_upper(interaction_dialogue[i]);
		} else {
			if (person_im_talking_to == selected) {
				interaction_line = selected_name + ": " + string_upper(interaction_dialogue[i]);
			} else {
				interaction_line = person_im_talking_to + ": " + string_upper(interaction_dialogue[i]);
			}
		}
		
		if (i != array_length(interaction_dialogue) - 1) {
			vertical_separation = string_height_ext(interaction_line, 7, 100)*2 + 15;
		} else {
			vertical_separation = 0;
		}
		
		draw_set_halign(fa_left);
		draw_set_color(c_white);
		draw_rectangle(60, 150 - (vertical_separation*(array_length(interaction_dialogue) - 1 - i)) - 7, 55 + string_width_ext(interaction_line, 7, 100)*2 + 10, 150 - (vertical_separation*(array_length(interaction_dialogue) - 1 - i)) + string_height_ext(interaction_line, 7, 100)*2, false);
		draw_set_color(c_black);
		draw_rectangle(60, 150 - (vertical_separation*(array_length(interaction_dialogue) - 1 - i)) - 7, 55 + string_width_ext(interaction_line, 7, 100)*2 + 10, 150 - (vertical_separation*(array_length(interaction_dialogue) - 1 - i)) + string_height_ext(interaction_line, 7, 100)*2, true);
		draw_text_ext_transformed(65, 150 - (vertical_separation*(array_length(interaction_dialogue) - 1 - i)), interaction_line, 7, 100, 2, 2, 0);		
		
	}
	
	draw_set_color(c_black);
	draw_rectangle(180-50,300-75,180+49,300+74,true);
	draw_sprite(spr_office, 0, 180, 300);
	draw_sprite_ext(spr_office_1, 0, 180, 300, 1, 1, 0, variable_global_get(global.c10_team + "_color1"),1);
	if (variable_global_get(global.c10_team + "_kittype") == "sleeves" || variable_global_get(global.c10_team + "_kittype") == "sleeves and shorts") {
		draw_sprite_ext(spr_photo_sleeves,0,152,257,1,1,0,variable_global_get(global.c10_team + "_color2"),1);
	} else if (variable_global_get(global.c10_team + "_kittype") == "stripes" || variable_global_get(global.c10_team + "_kittype") == "stripes and shorts") {
		draw_sprite_ext(spr_photo_stripes,0,152,257,1,1,0,variable_global_get(global.c10_team + "_color2"),1);
	} else if (variable_global_get(global.c10_team + "_kittype") == "bars" || variable_global_get(global.c10_team + "_kittype") == "bars and shorts") {
		draw_sprite_ext(spr_photo_bars,0,152,257,1,1,0,variable_global_get(global.c10_team + "_color2"),1);
	} else if (variable_global_get(global.c10_team + "_kittype") == "checkers") {
		draw_sprite_ext(spr_photo_bars,0,152,257,1,1,0,variable_global_get(global.c10_team + "_color2"),1);
		draw_sprite_ext(spr_photo_stripes,0,152,257,1,1,0,variable_global_get(global.c10_team + "_color2"),1);
	}
	draw_sprite_ext(spr_idle_1, 0, 180, 328, 1, 1, 0, global.c10_sc,1);
	draw_sprite_ext(spr_idle_1_tracksuit, 0, 180, 328, 1, 1, 0, variable_global_get(global.c10_team + "_color1"),1);
	draw_sprite(spr_office_2, 0, 180, 300);
	if (person_im_talking_to == selected) {
		draw_sprite_ext(spr_idle_5, 0, 180, 358, 1, 1, 0, selected_sc,1);
		draw_sprite_ext(spr_idle_5_tracksuit, 0, 180, 358, 1, 1, 0, selected_team_color1,1);
	} else {
		draw_sprite_ext(spr_idle_5, 0, 180, 358, 1, 1, 0, global.c_whiteskin,1);
		draw_sprite_ext(spr_idle_5_suit, 0, 180, 358, 1, 1, 0, c_white,1);
	}
	draw_sprite(spr_office_3, 0, 180, 300);
	
	draw_set_halign(fa_center);
	if (keyboard_virtual_status()) {
		draw_set_alpha(0.8);
		draw_set_color(c_black);
		draw_rectangle(0, 0, room_width, room_height, false);
		draw_set_color(c_white);
		draw_text_ext_transformed(185, 200, interaction_write, 7, 150, 2, 2, 0);
	}
	
}

draw_set_halign(fa_center);
draw_set_color(c_white);



if (array_length(warnings) > 0) {
	
	if (array_length(warnings) > 1) {
		option1 = "NEXT";
	} else {
		option1 = "CLOSE";
	}
	option2 = "SKIP";
	option3 = "";
	
	draw_set_alpha(0.8);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
	
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	
	draw_text_transformed(185, 50, warnings[0].warning_title, 3, 3, 0);
	draw_text_ext_transformed(185, 100, warnings[0].warning_text, 11, 100, 2, 2, 0);
	
	draw_text_ext_transformed(185, 600, "NOTIFICATION(S) LEFT: " + string(array_length(warnings)), 11, 100, 2, 2, 0);
	
	if (warnings[0].warning_title == "BALL OF GOLD") {
		
		draw_sprite(spr_bog_stage, 0,180,360);
		draw_sprite_ext(spr_idle_1, 0, 180, 380, 1, 1 ,0, variable_global_get(ball_of_gold_winner + "_sc"), 1);
		draw_sprite(spr_idle_1_suit, 0, 180, 380);
		draw_sprite(spr_bog_ball,0,175,375);
		
	} else if (warnings[0].warning_title == "TRANSFER MARKET MOVE") {
		
		player = warnings[0].warning_person1;
		team = variable_global_get(player + "_team");
		draw_sprite(spr_signing_stage, 0,180,360);
		draw_sprite_ext(spr_signing_stage_1, 0, 180, 360,1,1,0,variable_global_get(team + "_color1"),1);
		draw_sprite_ext(spr_badge, variable_global_get(team + "_badge"), 180,330,1,1,0,variable_global_get(team + "_color1"),1);
		draw_sprite_ext(spr_badge_accent, variable_global_get(team + "_badge"), 180,330,1,1,0,variable_global_get(team + "_color2"),1);
		draw_sprite_ext(spr_idle_1, 0, 180, 390, 1, 1 ,0, variable_global_get(player + "_sc"), 1);
		draw_sprite_ext(spr_idle_1_tracksuit, 0, 180, 390,1,1,0,variable_global_get(team + "_color1"),1);
		draw_sprite_ext(spr_photo_shirt,0,173,387,1,1,0,variable_global_get(team + "_color1"),1);
		if (variable_global_get(team + "_kittype") == "sleeves" || variable_global_get(team + "_kittype") == "sleeves and shorts") {
			draw_sprite_ext(spr_photo_sleeves,0,173,387,1,1,0,variable_global_get(team + "_color2"),1);
		} else if (variable_global_get(team + "_kittype") == "stripes" || variable_global_get(team + "_kittype") == "stripes and shorts") {
			draw_sprite_ext(spr_photo_stripes,0,173,387,1,1,0,variable_global_get(team + "_color2"),1);
		} else if (variable_global_get(team + "_kittype") == "bars" || variable_global_get(team + "_kittype") == "bars and shorts") {
			draw_sprite_ext(spr_photo_bars,0,173,387,1,1,0,variable_global_get(team + "_color2"),1);
		} else if (variable_global_get(team + "_kittype") == "checkers") {
			draw_sprite_ext(spr_photo_bars,0,173,387,1,1,0,variable_global_get(team + "_color2"),1);
			draw_sprite_ext(spr_photo_stripes,0,173,387,1,1,0,variable_global_get(team + "_color2"),1);
		}
		draw_sprite(spr_signing_stage_2, 0,180,360);
		
	} else if (warnings[0].warning_title == "RETIREMENT") {
		
		draw_sprite(spr_beach, 0,180,360);
		
	} else if (warnings[0].warning_title == "CHAMPIONS!!!") {
		
		draw_sprite(spr_champions_win, 0,180,360);
		if (variable_global_get(warnings[0].warning_team + "_coach") != "") {
			draw_sprite_ext(spr_waive_1, 0, 180, 360,1,1,45,c_black,0.3);
			draw_sprite_ext(spr_waive_1, 0, 180, 360,1,1,0,variable_global_get(variable_global_get(warnings[0].warning_team + "_coach") + "_sc"),1);
			draw_sprite_ext(spr_waive_1_tracksuit, 0, 180, 360,1,1,0,variable_global_get(warnings[0].warning_team + "_color1"),1);
		}
		draw_sprite_ext(spr_champions_win_1, 0, 180, 360,1,1,0,variable_global_get(warnings[0].warning_team + "_color1"),1);
		draw_sprite_ext(spr_champions_win_2, 0, 180, 360,1,1,0,variable_global_get(warnings[0].warning_team + "_color2"),1);
		
	}
	
}

if (option1 != "") {
	
	draw_sprite(spr_box, option1_index, option1_x, option1_y);
	if (option1_index == 0) {
		draw_text_transformed(option1_x+5, option1_y-4, option1, 3, 3, 0);
	} else {
		draw_text_transformed(option1_x+5, option1_y, option1, 3, 3, 0);
	}
	
	// OPTION 2__________________________________________________________
	if (option2 != "") {
		
		draw_sprite(spr_box, option2_index, option2_x, option2_y);
		if (option2_index == 0) {
			draw_text_transformed(option2_x+5, option2_y-4, option2, 3, 3, 0);
		} else {
			draw_text_transformed(option2_x+5, option2_y, option2, 3, 3, 0);
		}
		
		// OPTION 3__________________________________________________________
		if (option3 != "") {
			
			draw_sprite(spr_box, option3_index, option3_x, option3_y);
			if (option3_index == 0) {
				draw_text_transformed(option3_x+5, option3_y-4, option3, 3, 3, 0);
			} else {
				draw_text_transformed(option3_x+5, option3_y, option3, 3, 3, 0);
			}
			
			// OPTION 4__________________________________________________________
			if (option4 != "") {
			
				draw_sprite(spr_box, option4_index, option4_x, option4_y);
				if (option4_index == 0) {
					draw_text_transformed(option4_x+5, option4_y-4, option4, 3, 3, 0);
				} else {
					draw_text_transformed(option4_x+5, option4_y, option4, 3, 3, 0);
				}
			
			}
			
		}
		
	}
	
}

if (can_advance == false) {
	
	draw_set_alpha(0.8);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
	
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	
	draw_text_transformed(185, 50, "ADVANCING...", 3, 3, 0);
	
	draw_sprite(spr_loading, image_index/10, 180, 500);
	
}
