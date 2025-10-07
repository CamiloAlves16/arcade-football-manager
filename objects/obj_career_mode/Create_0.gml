schedule_array = [];
for (var i = 0; i < array_length(global.events); ++i) {
	if (global.events[i].hometeam == global.c10_team || global.events[i].awayteam == global.c10_team) {
		array_push(schedule_array, global.events[i]);
	}
}

what_was_said = [];

screen = "SCHEDULE";
previous_screen = screen;
previous_current_team = global.c10_team;
selected = schedule_array;
selected_team = "";
selected_index = 0;
can_advance = true;
max_display = 0;
previous_pages = [];

simulating = "";

tactic = variable_global_get(global.c10_team + "_tactic");
tactic_selected = undefined;

option = "CHOOSE";

esc_button_index = 0;
option1 = "";
option1_index = 0;
option1_x = 180-65;
option1_y = 540;
option2 = "";
option2_index = 0;
option2_x = 180+65;
option2_y = 540;
option3 = "";
option3_index = 0;
option3_x = 180-65;
option3_y = 580;
option4 = "";
option4_index = 0;
option4_x = 180+65;
option4_y = 580;

warnings = [];
warning_title = "";
warning_text = "";
warning_option = "";

achievements_completed = true;
for (var i = 0; i < array_length(global.achievement_list); ++i) {
	if (!global.achievement_list[i].ach_status) {
		achievements_completed = false;
		break;
	}
}

if (!global.mainmenu_tutorial) {
		
	warning = {warning_title: "TUTORIAL", warning_text: "THIS IS YOUR MAIN MENU. YOU CAN USE THE ARROWS ON THE SIDE TO NAVIGATE BETWEEN SCREENS."};
	warning_push(warning);
	warning = {warning_title: "TUTORIAL", warning_text: "THE LAST PAGE IS WHERE YOU CAN SAVE AND ADJUST SETTINGS."};
	warning_push(warning);
	warning = {warning_title: "TUTORIAL", warning_text: "THE FIRST PAGE IS YOUR SCHEDULE. IT SHOWS YOUR TEAMS GAMES AND ALLOWS YOU TO PROGRESS THROUGH THE WEEKS BY CLICKING 'ADVANCE'."};
	warning_push(warning);
	warning = {warning_title: "TUTORIAL", warning_text: "YOU CAN CHOOSE WHICH GAME IS SELECTED BY CLICKING ON IT OR BY FLICKING THE SCREEN UP AND DOWN."};
	warning_push(warning);
	warning = {warning_title: "TUTORIAL", warning_text: "“CLICK 'PLAY/SIM' TO CHOOSE WHETHER TO PLAY THE SELECTED GAME YOURSELF OR HAVE IT SIMULATED. AFTER THE GAME (PLAYED), PRESS ADVANCE TO MOVE TO THE NEXT WEEK.”"};
	warning_push(warning);
	warning = {warning_title: "TUTORIAL", warning_text: "THE TOP RIGHT CORNER SHOWS THE DATE. IF YOU CLICK IT, YOU ARE TAKEN DIRECTLY TO THE SCHEDULE PAGE."};
	warning_push(warning);
	warning = {warning_title: "TUTORIAL", warning_text: "THE 'BACK' BUTTON ON THE TOP LEFT CORNER ALLOWS YOU TO RETURN TO THE PREVIOUS PAGE."};
	warning_push(warning);
	warning = {warning_title: "TUTORIAL", warning_text: "THE BOTTOM RIGHT CORNER SHOWS YOUR BUDGET. IF YOU CLICK IT, YOU GO TO A PAGE WITH USEFUL TEAM INFORMATION."};
	warning_push(warning);
	warning = {warning_title: "TUTORIAL", warning_text: "THE BOTTOM LEFT CORNER HAS YOUR TEAM'S NAME. IF YOU CLICK IT, YOU ARE TAKEN TO THE SQUAD PAGE. PLEASE GO THERE TO CONTINUE THE TUTORIAL, AFTER PRESSING 'OK'."};
	warning_push(warning);
	global.mainmenu_tutorial = true;
	
}

interaction_dialogue = [];
interaction_write = "";

current_team = global.c10_team;
current_league = variable_global_get(global.c10_team + "_league");

function vgg(variable) {
	
	return variable_global_get(variable); 
	
}

function format_number_dots(num) {
    var str = string(abs(num));
    var len = string_length(str);
    var result = "";
    
    // Insert dots every 3 characters from the right
    for (var i = 0; i < len; i++) {
        var ch = string_char_at(str, len - i);
        result = ch + result;
        
        // Add dot if we’re at a boundary (every 3 digits), but not at the start
        if (((i + 1) mod 3 == 0) && (i != len - 1)) {
            result = "." + result;
        }
    }
    
    // Handle negative numbers
    if (num < 0) {
        result = "-" + result;
    }
    
    return result;
}

function change_screen(new_screen) {
	
	if (new_screen == "SQUAD PAGE" && !global.squadpage_tutorial) {
		
		warning = {warning_title: "TUTORIAL", warning_text: "THIS IS THE SQUAD PAGE, WHERE YOU CAN SEE: THE PLAYERS ON YOUR TEAM, THEIR AGE AND THE YEARS ON THEIR CONTRACTS."};
		warning_push(warning);
		warning = {warning_title: "TUTORIAL", warning_text: "SOMETIMES SYMBOLS MAY APPEAR IN FRONT OF THEIR NAMES TO GIVE YOU EXTRA INFO. 'CROSS' - INJURED; 'L' - LOAN LISTED; 'T' - TRANSFER LISTED; 'O' - RECEIVED OFFER(S)"};
		warning_push(warning);
		warning = {warning_title: "TUTORIAL", warning_text: "THE FIRST FIVE ARE YOUR STARTERS. PRESS 'MOVE UP' OR 'MOVE DOWN' TO MOVE THEM AS YOU WISH. ON THE LEFT SIDE YOU CAN SEE THEIR POSITION IN YOUR TACTIC."};
		warning_push(warning);
		warning = {warning_title: "TUTORIAL", warning_text: "IF YOU PRESS THE ARROWS ON THE SIDE, YOU CAN SEE THE TACTICS PAGE AND YOUR UNDER-19S SQUAD."};
		warning_push(warning);
		warning = {warning_title: "TUTORIAL", warning_text: "IN THE TACTICS PAGE, ADJUST POSITIONS BY DRAGGING THE ONES THAT ARE ALREADY THERE."};
		warning_push(warning);
		warning = {warning_title: "TUTORIAL", warning_text: "AT THE END OF EVERY SEASON, YOU GET NEW YOUTH PROSPECTS IN YOUR UNDER 19S. HOW MANY YOU GET DEPENDS ON HOW MANY ARE ALREADY THERE."};
		warning_push(warning);
		warning = {warning_title: "TUTORIAL", warning_text: "YOU CAN PROMOTE THEM BY TALKING TO THEM, BUT MORE ON THAT LATER. FOR NOW, LET'S PRESS 'SEE PAGE'."};
		warning_push(warning);
		global.squadpage_tutorial = true;
		
	} else if (new_screen == "CONTACTS" && !global.contacts_tutorial) {
		
		warning = {warning_title: "TUTORIAL", warning_text: "THIS IS THE CONTACTS PAGE, WHERE YOU CAN GO TALK TO PEOPLE LIKE YOUR SCOUT, PRESIDENT OR EVEN PLAYERS TO WHOM YOU HAVE SENT AN OFFER."};
		warning_push(warning);
		warning = {warning_title: "TUTORIAL", warning_text: "BY TALKING TO YOUR CLUB'S PRESIDENT, YOU CAN IMPROVE YOUR FACILITIES, GET A NEW CONTRACT OR EVEN QUIT."};
		warning_push(warning);
		warning = {warning_title: "TUTORIAL", warning_text: "WITH YOUR SCOUT, YOU SHOULD PROBABLY ASK FOR A SUGGESTION OR A RECOMMENDATION."};
		warning_push(warning);
		global.contacts_tutorial = true;
		
	} else if (new_screen == "OFFERS" && !global.offers_tutorial) {
		
		warning = {warning_title: "TUTORIAL", warning_text: "THIS PAGE REVEALS TEAMS THAT HAVE SENT YOU OFFERS AND THEIR CURRENT BUDGETS. CHOOSE 'ACCEPT' TO BECOME THE COACH OF THE SELECTED TEAM."};
		warning_push(warning);
		global.offers_tutorial = true;
		
	} else if (new_screen == "PLAYER PAGE" && !global.playerpage_tutorial) {
		
		warning = {warning_title: "TUTORIAL", warning_text: "THIS PAGE SHOWS A REPORT OF THE SELECTED PLAYER. IF THERE ARE ARROWS, CLICK THEM TO SEE MORE DETAILS."};
		warning_push(warning);
		warning = {warning_title: "TUTORIAL", warning_text: "IF HE IS ONE OF YOUR PLAYERS OR A FREE AGENT, YOU CAN TALK TO THEM DIRECTLY BY PRESSING THE 'TALK' BUTTON."};
		warning_push(warning);
		warning = {warning_title: "TUTORIAL", warning_text: "IF HE IS NOT ONE OF YOUR PLAYERS, YOU MAY HAVE TO NEGOTIATE WITH THE OTHER TEAMS DIRECTOR OF FOOTBALL FIRST."};
		warning_push(warning);
		warning = {warning_title: "TUTORIAL", warning_text: "SOME OF THE THINGS YOU CAN DO BY TALKING TO PLAYERS INCLUDES SIGNING THEM, EXTENDING THEIR CONTRACTS, CHANGING THEIR TRAINING FOCUS, CHANGING THEIR NUMBER OR EVEN DISCOURAGING THEM FROM ACCEPTING OTHER TEAMS OFFERS BY ASKING THEM TO STAY."};
		warning_push(warning);
		warning = {warning_title: "TUTORIAL", warning_text: "THE 'TALK' BUTTON WILL BRING UP THE INTERACTION PAGE. IF THE KEYBOARD IS NOT SHOWING YOU BRING IT UP BY PRESSING 'TALK'. GIVE IT A TRY, GO SAY HI! ;)"};
		warning_push(warning);
		global.playerpage_tutorial = true;
		
	}
	
	if (new_screen == "INTERACTION") {
		interaction_dialogue = [];
		keyboard_string = "";
		interaction_write = "";
		negotiation_path = "";
		negotiation_stage = 0;
		can_talk = true;
		scouting_target = undefined;
	}
	
	new_previous = {
		previous_selected_index: selected_index,
		previous_screen: screen,
		previous_current_team: current_team
	};
	array_push(previous_pages, new_previous);
	screen = new_screen;
	
}

function warning_push(warning) {
	
	warning_names = struct_get_names(warning);
	
	if (!array_contains(warning_names, "warning_person1") || global.warning_mode == "ALL" || global.c10_team == "freeagent") {
		
		array_push(warnings, warning);
		
	} else if (warning.warning_person1 == "c10") {
		
		array_push(warnings, warning);
		
	} else if (global.warning_mode == "WORLDWIDE REPUTATION" && (variable_global_get(warning.warning_person1 + "_reputation") > 4 || variable_global_get(warning.warning_person1 + "_team") == global.c10_team)) {
		
		array_push(warnings, warning);
		
	}
	
}

function offer_push(person_id, offer, team) {
	array_push(vgg(person_id + "_offers"), offer);
	array_push(vgg(person_id + "_offers_received"), team);
	if (team == global.c10_team) {
		array_push(contacts, person_id);
	}
}

function tactic_sort(a,b) {
	
	positions = ["RD", "CD", "LD", "RM", "CM", "LM", "RF", "CF", "LF"];
	positions_x = [75,180,285,75,180,285,75,180,285];
	
	for (var i = 0; i < array_length(positions); ++i) {
		
	    people_in_this_position = [];
		for (var j = 0; j < array_length(tactic); ++j) {
			if (tactic[j].pos == positions[i]) {
				array_push(people_in_this_position, tactic[j]);
			}
		}
		
		if (array_length(people_in_this_position) == 1) {
			people_in_this_position[0].pos_x = positions_x[i];
			if (i < 3) {
				people_in_this_position[0].pos_y = 120;
			} else if (i < 6) {
				people_in_this_position[0].pos_y = 220;
			} else {
				people_in_this_position[0].pos_y = 320;
			}
		} else {
			step = ((positions_x[i] + 30) - (positions_x[i] - 30)) / (array_length(people_in_this_position) - 1);
			for (var j = 0; j < array_length(people_in_this_position); j++) {
			    people_in_this_position[j].pos_x = (positions_x[i] - 30) + step * j;
				if (i < 3) {
					people_in_this_position[j].pos_y = 120;
				} else if (i < 6) {
					people_in_this_position[j].pos_y = 220;
				} else {
					people_in_this_position[j].pos_y = 320;
				}
			}
		}
		
	}
	
	a_x = a.pos_x;
	a_y = a.pos_y;
	
	b_x = b.pos_x;
	b_y = b.pos_y;
	
	if (a_y == b_y) {
		if (a_x == b_x) {
			return 0
		} else if (a_x > b_x) {
			return 1
		} else {
			return -1
		}
	} else if (a_y > b_y) {
		return 1
	} else {
		return -1
	}
	
}

function copy_tactic_array(source) {
    var new_array = [];
    for (var i = 0; i < array_length(source); i++) {
        var s = source[i];
        // Create a new struct with the same fields
        var new_struct = {
            pos: s.pos,
            pos_x: s.pos_x,
            pos_y: s.pos_y,
        };
        array_push(new_array, new_struct);
    }
    return new_array;
}

function pick_transfer(a,b) {
	
	a_rating = a.rating;
	a_fee = a.fee;
	
	b_rating = b.rating;
	b_fee = b.fee;
	
	if (a_rating == b_rating) {
		if (a_fee == b_fee) {
			return 0;
		} else if (a_fee > b_fee) {
			return 1;
		} else {
			return -1;
		}
	} else if (a_rating > b_rating) {
		return -1;
	} else {
		return 1;
	}
	
}

function pick_goalkeeper(a,b) {
	
	a_gk = variable_global_get(a + "_gk") - variable_global_get(a + "_injury");
	a_ca = variable_global_get(a + "_ca");
	a_age = variable_global_get(a + "_age");
	
	b_gk = variable_global_get(b + "_gk") - variable_global_get(b + "_injury");
	b_ca = variable_global_get(b + "_ca");
	b_age = variable_global_get(b + "_age");
	
	if (a_gk == b_gk) {
		if (a_ca == b_ca) {
			if (a_age == b_age) {
				return 0
			} else if (a_age > b_age) {
				return 1
			} else {
				return -1
			}
		} else if (a_ca > b_ca) {
			return -1
		} else {
			return 1
		}
	} else if (a_gk > b_gk) {
		return -1
	} else {
		return 1
	}
	
}

function pick_defender(a,b) {
	
	a_def = variable_global_get(a + "_def") - variable_global_get(a + "_injury");
	a_ca = variable_global_get(a + "_tkl") + variable_global_get(a + "_spd") + variable_global_get(a + "_tec") + variable_global_get(a + "_sta");
	a_age = variable_global_get(a + "_age");
	
	b_def = variable_global_get(b + "_def") - variable_global_get(b + "_injury");
	b_ca = variable_global_get(b + "_tkl") + variable_global_get(b + "_spd") + variable_global_get(b + "_tec") + variable_global_get(b + "_sta");
	b_age = variable_global_get(b + "_age");
	
	if (a_def == b_def) {
		if (a_ca == b_ca) {
			if (a_age == b_age) {
				return 0
			} else if (a_age > b_age) {
				return 1
			} else {
				return -1
			}
		} else if (a_ca > b_ca) {
			return -1
		} else {
			return 1
		}
	} else if (a_def > b_def) {
		return -1
	} else {
		return 1
	}
	
}

function pick_midfielder(a,b) {
	
	a_mid = variable_global_get(a + "_mid") - variable_global_get(a + "_injury");
	a_ca = variable_global_get(a + "_tkl") + variable_global_get(a + "_tec") + variable_global_get(a + "_spd") + variable_global_get(a + "_sta");
	a_age = variable_global_get(a + "_age");
	
	b_mid = variable_global_get(b + "_mid") - variable_global_get(b + "_injury");
	b_ca = variable_global_get(b + "_tkl") + variable_global_get(b + "_tec") + variable_global_get(a + "_spd") + variable_global_get(b + "_sta");
	b_age = variable_global_get(b + "_age");
	
	if (a_mid == b_mid) {
		if (a_ca == b_ca) {
			if (a_age == b_age) {
				return 0
			} else if (a_age > b_age) {
				return 1
			} else {
				return -1
			}
		} else if (a_ca > b_ca) {
			return -1
		} else {
			return 1
		}
	} else if (a_mid > b_mid) {
		return -1
	} else {
		return 1
	}
	
}

function pick_winger(a,b) {
	
	a_ata = variable_global_get(a + "_ata") - variable_global_get(a + "_injury");
	a_ca = variable_global_get(a + "_spd") + variable_global_get(a + "_tec") + variable_global_get(b + "_mid") + variable_global_get(b + "_sta");
	a_age = variable_global_get(a + "_age");
	
	b_ata = variable_global_get(b + "_ata") - variable_global_get(b + "_injury");
	b_ca = variable_global_get(b + "_spd") + variable_global_get(b + "_tec") + variable_global_get(b + "_mid") + variable_global_get(b + "_sta");
	b_age = variable_global_get(b + "_age");
	
	if (a_ata == b_ata) {
		if (a_ca == b_ca) {
			if (a_age == b_age) {
				return 0
			} else if (a_age > b_age) {
				return 1
			} else {
				return -1
			}
		} else if (a_ca > b_ca) {
			return -1
		} else {
			return 1
		}
	} else if (a_ata > b_ata) {
		return -1
	} else {
		return 1
	}
	
}

function pick_forward(a,b) {
	
	a_ata = variable_global_get(a + "_ata") - variable_global_get(a + "_injury");
	a_ca = variable_global_get(a + "_spd") + variable_global_get(a + "_tec") + variable_global_get(a + "_sta") + variable_global_get(a + "_tkl");
	a_age = variable_global_get(a + "_age");
	
	b_ata = variable_global_get(b + "_ata") - variable_global_get(b + "_injury");
	b_ca = variable_global_get(b + "_spd") + variable_global_get(b + "_tec") + variable_global_get(b + "_sta") + variable_global_get(b + "_tkl");
	b_age = variable_global_get(b + "_age");
	
	if (a_ata == b_ata) {
		if (a_ca == b_ca) {
			if (a_age == b_age) {
				return 0
			} else if (a_age > b_age) {
				return 1
			} else {
				return -1
			}
		} else if (a_ca > b_ca) {
			return -1
		} else {
			return 1
		}
	} else if (a_ata > b_ata) {
		return -1
	} else {
		return 1
	}
	
}

function pick_coach(a,b) {
	
	a_reputation = variable_global_get(string(a) + "_reputation");
	a_offers = array_length(variable_global_get(a + "_offers"));
	
	b_reputation = variable_global_get(string(b) + "_reputation");
	b_offers = array_length(variable_global_get(b + "_offers"));
	
	if (a_reputation == b_reputation) {
		if (a_offers == b_offers) {
			return 0
		} else if (a_offers > b_offers) {
			return 1
		} else {
			return -1
		}
	} else if (a_reputation > b_reputation) {
		return -1
	} else {
		return 1
	}
	
}

function calculate_value(player) {
	
	max_age = 16;
	min_age = 40;
	max_ca = 7;
	min_ca = 32;
	
	for (var p_i = 0; p_i < array_length(global.player_list); ++p_i) {
	    if (vgg(global.player_list[p_i] + "_age") < min_age) {
			min_age = vgg(global.player_list[p_i] + "_age");
		} else if (vgg(global.player_list[p_i] + "_age") > max_age) {
			max_age = vgg(global.player_list[p_i] + "_age");
		}
		if (vgg(global.player_list[p_i] + "_ca") < min_ca) {
			min_ca = vgg(global.player_list[p_i] + "_ca");
		} else if (vgg(global.player_list[p_i] + "_ca") > max_ca) {
			max_ca = vgg(global.player_list[p_i] + "_ca");
		}
	}
	
	team = variable_global_get(player + "_team");
	player_value = lerp(100000, 100000000, (variable_global_get(player + "_ca") - min_ca) / (max_ca-min_ca));
	player_value = lerp(player_value, 1000000, (variable_global_get(player + "_age") - min_age) / (max_age-min_age));
	diff = variable_global_get(player + "_potential") - variable_global_get(player + "_ca");
	player_value = player_value * (1 + diff/10); // Only a 10% increase per point of potential difference´
	if (team != "freeagent") {
		player_value = lerp(player_value/5, player_value, (variable_global_get(team + "_reputation") - 1) / 4);
	}
	variable_global_set(player + "_value", clamp(player_value, 100000, 200000000));
	
}

function calculate_salary(player, set) {
	
	player_salary = lerp(global.min_wage, global.max_wage, (variable_global_get(player + "_ca") - 8) / (22 - 8));
	player_salary = lerp(player_salary/5, player_salary, (variable_global_get(player + "_reputation") - 1) / 4);
	if (set) {
		variable_global_set(player + "_salary", abs(player_salary));
	} else {
		return player_salary;
	}
	
}

function offer_choose(a, b) {
	
	a_reputation = round(a.team_reputation);
	a_playing_reputation = variable_global_get(variable_global_get(a.team + "_league") + "_reputation");
	
	b_reputation = round(b.team_reputation);
	b_playing_reputation = variable_global_get(variable_global_get(b.team + "_league") + "_reputation");
	
	if (a_reputation == b_reputation) {
		if (a_playing_reputation == b_playing_reputation) {
			return 0
		} else if (a_playing_reputation > b_playing_reputation) {
			return -1
		} else {
			return 1
		}
	} else if (a_reputation > b_reputation) {
		return -1
	} else {
		return 1
	}
	
}

function number_fix(player) {
	
	new_team = variable_global_get(player + "_team");
	new_team_squad = variable_global_get(new_team + "_squad");
	number = variable_global_get(player + "_number");
	number_is_free = true;
	
	for (var i = 0; i < array_length(new_team_squad); ++i) {
		
		number_on_the_team = variable_global_get(new_team_squad[i] + "_number");
		
		if (number == number_on_the_team && new_team_squad[i] != player) {
			
			number_is_free = false;
			break;
			
		}
			
	}
		
	while (!number_is_free) {
		
		number += 1;
			
		number_is_free = true;
			
		for (var i = 0; i < array_length(new_team_squad); ++i) {
			
			number_on_the_team = variable_global_get(string(new_team_squad[i]) + "_number");
			
			if (number == number_on_the_team && new_team_squad[i] != player) {
				
				number_is_free = false;
				break;
				
			}
			
		}
			
		variable_global_set(player + "_number", number);
	}
			
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

function reputation_sort(a,b) {
	
	a_reputation = variable_global_get(string(a) + "_reputation");
	
	b_reputation = variable_global_get(string(b) + "_reputation");
	
	if (a_reputation == b_reputation) {
		return 0
	} else if (a_reputation > b_reputation) {
		return -1
	} else {
		return 1
	}
	
}

function needs_sort(a,b) {
	
	a_type = a.type;
	a_degree = a.degree;
	
	b_type = b.type;
	b_degree = b.degree;
	
	if (a_type == b_type) {
		if (a_degree == b_degree) {
			return 0
		} else if (a_degree > b_degree) {
			return -1
		} else {
			return 1
		}
	} else if (a_type == "urgent" && b_type != "urgent") {
		return -1
	} else if (a_type != "urgent" && b_type == "urgent") {
		return 1
	}
	
}

function team_ca_sort(a,b) {
	
	a_reputation = variable_global_get(string(a) + "_reputation");
	a_array = variable_global_get(string(a) + "_squad");
	a_ca = 0;
	for (var i = 0; i < array_length(a_array); ++i) {
	    a_ca += variable_global_get(string(a_array[i]) + "_ca");
	}
	
	b_reputation = variable_global_get(string(b) + "_reputation");
	b_array = variable_global_get(string(b) + "_squad");
	b_ca = 0;
	for (var i = 0; i < array_length(b_array); ++i) {
	    b_ca += variable_global_get(string(b_array[i]) + "_ca");
	}
	
	if (a_reputation == b_reputation) {
		if (a_ca == b_ca) {
			return 0
		} else if (a_ca > b_ca) {
			return -1
		} else {
			return 1
		}
	} else if (a_reputation > b_reputation) {
		return -1
	} else {
		return 1
	}
	
}

function ca_sort(a,b) {
	
	a_ca = variable_global_get(string(a) + "_ca");
	b_ca = variable_global_get(string(b) + "_ca");
	
	if (a_ca == b_ca) {
		return 0
	} else if (a_ca > b_ca) {
		return -1
	} else {
		return 1
	}
	
}

function top_scorers_sort(a,b) {
	
	a_goals = variable_global_get(string(a) + "_goals");
	b_goals = variable_global_get(string(b) + "_goals");
	
	if (a_goals == b_goals) {
		return 0
	} else if (a_goals > b_goals) {
		return -1
	} else {
		return 1
	}
	
}

function game_push(week, competition, phase, hometeam, awayteam) {
	
	newgame =
	{
		week: week,
		type: "GAME",
		competition: competition,
		phase: phase,
		played: false,
		watch: false,
		hometeam: hometeam,
		awayteam: awayteam,
		home_goals: 0,
		away_goals: 0
	};
	array_push(global.events,newgame);
	
}

function calendar_sort(a,b) {
	
	a_week = a.week;
	b_week = b.week;
	a_league = string_digits(a.competition);
	b_league = string_digits(b.competition);
	
	if (a_week == b_week) {
		if (a_league == b_league) {
			return 0
		} else if (a_league > b_league) {
			return 1
		} else {
			return -1
		}
	} else if (a_week > b_week) {
		return 1
	} else {
		return -1
	}
}

function game_sim(game) {
	
	if (array_length(variable_global_get(game.hometeam + "_squad")) >= 5 && array_length(variable_global_get(game.awayteam + "_squad")) >= 5) {
		
		teamA_list = [];
		array_copy(teamA_list, 0, variable_global_get(game.hometeam + "_squad"), 0, 5);
		teamA_tactic = variable_global_get(game.hometeam + "_tactic");
		teamA_def = 0;
		teamA_mid = 0;
		teamA_for = 0;
	
		teamB_list = [];
		array_copy(teamB_list, 0, variable_global_get(game.awayteam + "_squad"), 0, 5);
		teamB_tactic = variable_global_get(game.awayteam + "_tactic");
		teamB_def = 0;
		teamB_mid = 0;
		teamB_for = 0;
	
		for (var i = 0; i < 5; ++i) {
		
			if (teamA_tactic[i].pos == "GK" || teamA_tactic[i].pos == "RD" || teamA_tactic[i].pos == "CD" || teamA_tactic[i].pos == "LD") {
				if (variable_global_get(teamA_list[i] + "_def") == 3 && variable_global_get(teamA_list[i] + "_injury") < 1) {
					teamA_def += variable_global_get(teamA_list[i] + "_ca") + variable_global_get(teamA_list[i] + "_spd") + variable_global_get(teamA_list[i] + "_tkl");
				} else if (variable_global_get(teamA_list[i] + "_def") == 2 && variable_global_get(teamA_list[i] + "_injury") < 1) {
					teamA_def += variable_global_get(teamA_list[i] + "_ca") + variable_global_get(teamA_list[i] + "_spd") + variable_global_get(teamA_list[i] + "_tkl") - 2;
				} else if (variable_global_get(teamA_list[i] + "_def") == 1 || variable_global_get(teamA_list[i] + "_injury") > 0) {
					teamA_def += variable_global_get(teamA_list[i] + "_ca") + variable_global_get(teamA_list[i] + "_spd") + variable_global_get(teamA_list[i] + "_tkl") - 8;
				}
			} else if (teamA_tactic[i].pos == "RM" || teamA_tactic[i].pos == "CM" || teamA_tactic[i].pos == "LM") {
				if (variable_global_get(teamA_list[i] + "_mid") == 3 && variable_global_get(teamA_list[i] + "_injury") < 1) {
					teamA_mid += variable_global_get(teamA_list[i] + "_ca") + variable_global_get(teamA_list[i] + "_tec") + variable_global_get(teamA_list[i] + "_tkl");
				} else if (variable_global_get(teamA_list[i] + "_mid") == 2 && variable_global_get(teamA_list[i] + "_injury") < 1) {
					teamA_mid += variable_global_get(teamA_list[i] + "_ca") + variable_global_get(teamA_list[i] + "_tec") + variable_global_get(teamA_list[i] + "_tkl") - 2;
				} else if (variable_global_get(teamA_list[i] + "_mid") == 1 || variable_global_get(teamA_list[i] + "_injury") > 0) {
					teamA_mid += variable_global_get(teamA_list[i] + "_ca") + variable_global_get(teamA_list[i] + "_tec") + variable_global_get(teamA_list[i] + "_tkl") - 8;
				}
			} else if (teamA_tactic[i].pos == "RF" || teamA_tactic[i].pos == "CF" || teamA_tactic[i].pos == "LF") {
				if (variable_global_get(teamA_list[i] + "_ata") == 3 && variable_global_get(teamA_list[i] + "_injury") < 1) {
					teamA_for += variable_global_get(teamA_list[i] + "_ca") + variable_global_get(teamA_list[i] + "_tec") + variable_global_get(teamA_list[i] + "_spd");
				} else if (variable_global_get(teamA_list[i] + "_ata") == 2 && variable_global_get(teamA_list[i] + "_injury") < 1) {
					teamA_for += variable_global_get(teamA_list[i] + "_ca") + variable_global_get(teamA_list[i] + "_tec") + variable_global_get(teamA_list[i] + "_spd") - 2;
				} else if (variable_global_get(teamA_list[i] + "_ata") == 1 || variable_global_get(teamA_list[i] + "_injury") > 0) {
					teamA_for += variable_global_get(teamA_list[i] + "_ca") + variable_global_get(teamA_list[i] + "_tec") + variable_global_get(teamA_list[i] + "_spd") - 8;
				}
			}
		
			if (teamB_tactic[i].pos == "GK" || teamB_tactic[i].pos == "RD" || teamB_tactic[i].pos == "CD" || teamB_tactic[i].pos == "LD") {
				if (variable_global_get(teamB_list[i] + "_def") == 3 && variable_global_get(teamB_list[i] + "_injury") < 1) {
					teamB_def += variable_global_get(teamB_list[i] + "_ca") + variable_global_get(teamB_list[i] + "_spd") + variable_global_get(teamB_list[i] + "_tkl");
				} else if (variable_global_get(teamB_list[i] + "_def") == 2 && variable_global_get(teamB_list[i] + "_injury") < 1) {
					teamB_def += variable_global_get(teamB_list[i] + "_ca") + variable_global_get(teamB_list[i] + "_spd") + variable_global_get(teamB_list[i] + "_tkl") - 2;
				} else if (variable_global_get(teamB_list[i] + "_def") == 1 || variable_global_get(teamB_list[i] + "_injury") > 0) {
					teamB_def += variable_global_get(teamB_list[i] + "_ca") + variable_global_get(teamB_list[i] + "_spd") + variable_global_get(teamB_list[i] + "_tkl") - 8;
				}
			} else if (teamB_tactic[i].pos == "RM" || teamB_tactic[i].pos == "CM" || teamB_tactic[i].pos == "LM") {
				if (variable_global_get(teamB_list[i] + "_mid") == 3 && variable_global_get(teamB_list[i] + "_injury") < 1) {
					teamB_mid += variable_global_get(teamB_list[i] + "_ca") + variable_global_get(teamB_list[i] + "_tec") + variable_global_get(teamB_list[i] + "_tkl");
				} else if (variable_global_get(teamB_list[i] + "_mid") == 2 && variable_global_get(teamB_list[i] + "_injury") < 1) {
					teamB_mid += variable_global_get(teamB_list[i] + "_ca") + variable_global_get(teamB_list[i] + "_tec") + variable_global_get(teamB_list[i] + "_tkl") - 2;
				} else if (variable_global_get(teamB_list[i] + "_mid") == 1 || variable_global_get(teamB_list[i] + "_injury") > 0) {
					teamB_mid += variable_global_get(teamB_list[i] + "_ca") + variable_global_get(teamB_list[i] + "_tec") + variable_global_get(teamB_list[i] + "_tkl") - 8;
				}
			} else if (teamB_tactic[i].pos == "RF" || teamB_tactic[i].pos == "CF" || teamB_tactic[i].pos == "LF") {
				if (variable_global_get(teamB_list[i] + "_ata") == 3 && variable_global_get(teamB_list[i] + "_injury") < 1) {
					teamB_for += variable_global_get(teamB_list[i] + "_ca") + variable_global_get(teamB_list[i] + "_tec") + variable_global_get(teamB_list[i] + "_spd");
				} else if (variable_global_get(teamB_list[i] + "_ata") == 2 && variable_global_get(teamB_list[i] + "_injury") < 1) {
					teamB_for += variable_global_get(teamB_list[i] + "_ca") + variable_global_get(teamB_list[i] + "_tec") + variable_global_get(teamB_list[i] + "_spd") - 2;
				} else if (variable_global_get(teamB_list[i] + "_ata") == 1 || variable_global_get(teamB_list[i] + "_injury") > 0) {
					teamB_for += variable_global_get(teamB_list[i] + "_ca") + variable_global_get(teamB_list[i] + "_tec") + variable_global_get(teamB_list[i] + "_spd") - 8;
				}
			}
		
		}
	
		randomize();
		number_of_possessions = irandom_range(20, 25);
	
		for (var i = 0; i < number_of_possessions; ++i) {
		
			randomize();
		
			if (teamA_mid > teamB_mid) {
				chanceA = 0.6;
			} else if (teamB_mid > teamA_mid) {
				chanceA = 0.4;
			} else {
				chanceA = 0.5;
			}
		
			random_chance = random(1);
        
	        if (random_chance < chanceA) {
	            attacking_team = "A";
	            att_strength = teamA_for;
	            def_strength = teamB_def;
	        } else {
	            attacking_team = "B";
	            att_strength = teamB_for;
	            def_strength = teamA_def;
	        }
		
			attack_roll = random(1);
	        defense_roll = def_strength + irandom_range(0,10);
		
			if (att_strength > def_strength) {
				defense_roll = 0.3;
			} else if (def_strength > att_strength) {
				defense_roll = 0.1;
			} else {
				defense_roll = 0.2;
			}
        
	        if (attack_roll < defense_roll) { // margin makes goals rarer
	            if (attacking_team == "A") { game.home_goals++; } else { game.away_goals++; }
	        }
		
		}
	
		if (game.competition == "l00" || game.competition == "l01") {
		
			current_overtime = 0;
			max_overtime = 10;
		
			while (game.home_goals == game.away_goals) {
			
				if (current_overtime < max_overtime) {
				
				    randomize();
		
				    chanceA = teamA_mid + irandom_range(0, 5);
			        chanceB = teamB_mid + irandom_range(0, 5);
        
			        if (chanceA > chanceB) {
			            attacking_team = "A";
			            att_strength = teamA_for;
			            def_strength = teamB_def;
			        } else {
			            attacking_team = "B";
			            att_strength = teamB_for;
			            def_strength = teamA_def;
			        }
		
					attack_roll = att_strength + irandom_range(0, 10);
			        defense_roll = def_strength + irandom_range(0, 10);
        
			        if (attack_roll > defense_roll) { // margin makes goals rarer
			            if (attacking_team == "A") { game.home_goals++; } else { game.away_goals++; }
			        }
				
					current_overtime++;
				
				} else {
				
					winner = choose(game.hometeam, game.awayteam);
					if (winner == game.hometeam) {
						game.home_goals++;
					} else {
						game.away_goals++;
					}
				
				}
		
			}
	
		}
	
		if (game.home_goals > game.away_goals) {
			winner = game.hometeam;
		} else if (game.home_goals < game.away_goals) {
			winner = game.awayteam;
		} else {
			winner = noone;
		}
	
		for (var i = 0; i < game.home_goals; ++i) {
		
			needs_attributing = true;
		
			assist_list = [];
			array_copy(assist_list, 0, teamA_list, 0, array_length(teamA_list));
		
			for (var j = 0; j < array_length(teamA_list); ++j) {
			
				if (needs_attributing) {
				
					if (variable_global_get(teamA_list[j] + "_pos") == "GOALKEEPER") { scoring_chance = 0; 
					} else if (variable_global_get(teamA_list[j] + "_pos") == "DEFENDER") { scoring_chance = 0.1;
					} else if (variable_global_get(teamA_list[j] + "_pos") == "MIDFIELDER") { scoring_chance = 0.3;
					} else if (variable_global_get(teamA_list[j] + "_pos") == "FORWARD") { scoring_chance = 0.5; 
					}
				
					randomize();
					random_chance = random(1);
				
					if (random_chance < scoring_chance || teamA_list[j] == array_last(teamA_list)) {
						needs_attributing = false;
						variable_global_set(teamA_list[j] + "_goals", variable_global_get(teamA_list[j] + "_goals") + 1);
						array_delete(assist_list, array_get_index(assist_list, teamA_list[j]), 1);
					
						needs_assist = true;
					
						for (var k = 0; k < array_length(assist_list); ++k) {
					
							if (needs_assist) {
					
								if (variable_global_get(assist_list[k] + "_pos") == "GOALKEEPER") { assist_chance = 0; 
								} else if (variable_global_get(assist_list[k] + "_pos") == "DEFENDER") { assist_chance = 0.2;
								} else if (variable_global_get(assist_list[k] + "_pos") == "MIDFIELDER") { assist_chance = 0.7;
								} else if (variable_global_get(assist_list[k] + "_pos") == "FORWARD") { assist_chance = 0.5; 
								}
				
								randomize();
								random_chance = random(1);
				
								if (random_chance < assist_chance) {
									needs_assist = false;
									variable_global_set(assist_list[k] + "_assists", variable_global_get(assist_list[k] + "_assists") + 1);
								}
					
							}
			
						}
				
					}
				
				}
			
			}
		
		}
	
		for (var i = 0; i < game.away_goals; ++i) {
		
			needs_attributing = true;
		
			assist_list = [];
			array_copy(assist_list, 0, teamB_list, 0, array_length(teamB_list));
		
			for (var j = 0; j < array_length(teamB_list); ++j) {
			
				if (needs_attributing) {
				
					if (variable_global_get(teamB_list[j] + "_pos") == "GOALKEEPER") { scoring_chance = 0; 
					} else if (variable_global_get(teamB_list[j] + "_pos") == "DEFENDER") { scoring_chance = 0.1;
					} else if (variable_global_get(teamB_list[j] + "_pos") == "MIDFIELDER") { scoring_chance = 0.3;
					} else if (variable_global_get(teamB_list[j] + "_pos") == "FORWARD") { scoring_chance = 0.6; 
					}
				
					randomize();
					random_chance = random(1);
				
					if (random_chance < scoring_chance || teamB_list[j] == array_last(teamB_list)) {
						needs_attributing = false;
						variable_global_set(teamB_list[j] + "_goals", variable_global_get(teamB_list[j] + "_goals") + 1);
						array_delete(assist_list, array_get_index(assist_list, teamB_list[j]), 1);
					
						needs_assist = true;
					
						for (var k = 0; k < array_length(assist_list); ++k) {
					
							if (needs_assist) {
					
								if (variable_global_get(assist_list[k] + "_pos") == "GOALKEEPER") { assist_chance = 0; 
								} else if (variable_global_get(assist_list[k] + "_pos") == "DEFENDER") { assist_chance = 0.2;
								} else if (variable_global_get(assist_list[k] + "_pos") == "MIDFIELDER") { assist_chance = 0.7;
								} else if (variable_global_get(assist_list[k] + "_pos") == "FORWARD") { assist_chance = 0.5; 
								}
				
								randomize();
								random_chance = random(1);
				
								if (random_chance < assist_chance) {
									needs_assist = false;
									variable_global_set(assist_list[k] + "_assists", variable_global_get(assist_list[k] + "_assists") + 1);
								}
					
							}
			
						}
					
					}
				
				}
			
			}
		
		}
	
		player_list = array_concat(teamA_list, teamB_list);
	
		for (var i = 0; i < array_length(player_list); ++i) {
		
		    variable_global_set(string(player_list[i]) + "_xp", variable_global_get(string(player_list[i]) + "_xp") + irandom_range(8,25));
			if (variable_global_get(player_list[i] + "_team") == game.hometeam && game.away_goals == 0) {
				variable_global_set(player_list[i] + "_cleansheets", variable_global_get(player_list[i] + "_cleansheets") + 1); 
			} else if (variable_global_get(player_list[i] + "_team") == game.awayteam && game.home_goals == 0) {
				variable_global_set(player_list[i] + "_cleansheets", variable_global_get(player_list[i] + "_cleansheets") + 1); 
			}
		
		}
	
	} else if (array_length(variable_global_get(game.awayteam + "_squad")) < 5) {
		winner = game.hometeam;
		loser = game.awayteam;
		game.home_goals = 3;
	} else if (array_length(variable_global_get(game.hometeam + "_squad")) < 5) {
		winner = game.awayteam;
		loser = game.hometeam;
		game.away_goals = 3;
	}
	
	if (game.phase == "REGULAR SEASON") {
		
		variable_global_set(game.hometeam + "_budget", variable_global_get(game.hometeam + "_budget") + lerp(global.min_tickets, global.max_tickets, (variable_global_get(game.hometeam + "_reputation") - 1) / 4) + lerp(global.min_tv, global.max_tv, (variable_global_get(game.competition + "_reputation") - 1) / 4));
		variable_global_set(game.awayteam + "_budget", variable_global_get(game.awayteam + "_budget") + lerp(global.min_tickets, global.max_tickets, (variable_global_get(game.awayteam + "_reputation") - 1) / 4) + lerp(global.min_tv, global.max_tv, (variable_global_get(game.competition + "_reputation") - 1) / 4));
		
		if (winner != noone) {
			variable_global_set(string(winner) + "_points", variable_global_get(string(winner) + "_points") + 3);
		} else {
			variable_global_set(string(game.hometeam) + "_points", variable_global_get(string(game.hometeam) + "_points") + 1);
			variable_global_set(string(game.awayteam) + "_points", variable_global_get(string(game.awayteam) + "_points") + 1);
		}
		
		variable_global_set(string(game.hometeam) + "_goals", variable_global_get(string(game.hometeam) + "_goals") + game.home_goals);
		variable_global_set(string(game.awayteam) + "_goals", variable_global_get(string(game.awayteam) + "_goals") + game.away_goals);
		
		if (variable_global_exists(game.competition + "_class")) {
			array_sort(variable_global_get(game.competition + "_class"), league_sort);
		}
	
	} else if (game.phase == "SEMIFINAL") {
		
		variable_global_set(game.hometeam + "_budget", variable_global_get(game.hometeam + "_budget") + lerp(global.min_tickets, global.max_tickets, (variable_global_get(game.hometeam + "_reputation") - 1) / 4) + lerp(global.min_tv, global.max_tv, (variable_global_get(game.competition + "_reputation") - 1) / 4));
		variable_global_set(game.awayteam + "_budget", variable_global_get(game.awayteam + "_budget") + lerp(global.min_tickets, global.max_tickets, (variable_global_get(game.awayteam + "_reputation") - 1) / 4) + lerp(global.min_tv, global.max_tv, (variable_global_get(game.competition + "_reputation") - 1) / 4));
		
		if (game.competition == "l00") {
		
			if (winner == game.hometeam) {
				variable_global_set(string(game.hometeam) + "_budget", variable_global_get(string(game.hometeam) + "_budget") + 10000000);
				variable_global_set(string(game.awayteam) + "_budget", variable_global_get(string(game.awayteam) + "_budget") + 5000000);
			} else {
				variable_global_set(string(game.hometeam) + "_budget", variable_global_get(string(game.hometeam) + "_budget") + 5000000);
				variable_global_set(string(game.awayteam) + "_budget", variable_global_get(string(game.awayteam) + "_budget") + 10000000);
			}
		
		} else if (game.competition == "l01") {
			
			if (winner == game.hometeam) {
				variable_global_set(string(game.hometeam) + "_budget", variable_global_get(string(game.hometeam) + "_budget") + 5000000);
				variable_global_set(string(game.awayteam) + "_budget", variable_global_get(string(game.awayteam) + "_budget") + 2500000);
			} else {
				variable_global_set(string(game.hometeam) + "_budget", variable_global_get(string(game.hometeam) + "_budget") + 2500000);
				variable_global_set(string(game.awayteam) + "_budget", variable_global_get(string(game.awayteam) + "_budget") + 5000000);
			}
			
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
		
		winner_coach = vgg(winner + "_coach");
			
		if (winner_coach != "") {
			if (variable_global_get(winner_coach + "_reputation") < variable_global_get(game.competition + "_reputation")) {
			
				rep_diff = ( variable_global_get(game.competition + "_reputation") - variable_global_get(winner_coach + "_reputation") ) / 2;
			
				variable_global_set(winner_coach + "_reputation", clamp(round(variable_global_get(winner_coach + "_reputation") + rep_diff), 1, 5) );
			
			}
		}
		
		if (game.competition == "l00") {
		
			if (winner == game.hometeam) {
				winner_squad = teamA_list;
				variable_global_set(string(game.hometeam) + "_budget", variable_global_get(string(game.hometeam) + "_budget") + 20000000);
				variable_global_set(string(game.awayteam) + "_budget", variable_global_get(string(game.awayteam) + "_budget") + 10000000);
			} else {
				winner_squad = teamB_list;
				variable_global_set(string(game.hometeam) + "_budget", variable_global_get(string(game.hometeam) + "_budget") + 10000000);
				variable_global_set(string(game.awayteam) + "_budget", variable_global_get(string(game.awayteam) + "_budget") + 20000000);
			}
		
		} else if (game.competition == "l01") {
			
			if (winner == game.hometeam) {
				winner_squad = teamA_list;
				variable_global_set(string(game.hometeam) + "_budget", variable_global_get(string(game.hometeam) + "_budget") + 10000000);
				variable_global_set(string(game.awayteam) + "_budget", variable_global_get(string(game.awayteam) + "_budget") + 5000000);
			} else {
				winner_squad = teamB_list;
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
		
		warning = {
			warning_title: "CHAMPIONS!!!",
			warning_text: variable_global_get(winner + "_name") + " ARE THE WINNERS OF THE " + variable_global_get(game.competition + "_name") + "!",
			warning_team: winner
		};
		warning_push(warning);
		
	}
	
	game.played = true;
	
}

function regen_push(team) {
	
	// Calculate the new player ID
	idnumber = 100;
	idcode = "p" + string(idnumber);
	while (array_contains(global.player_list, idcode)) {
		idnumber++;
		idcode = "p" + string(idnumber);
	}
	randomize();
	
	var country = vgg(vgg(team + "_league") + "_country");
	
	names_from_country = [];
	for (var n_t_i = 0; n_t_i < array_length(global.player_list); ++n_t_i) {
		if (variable_global_get(string(global.player_list[n_t_i]) + "_country") == country) {
			array_push(names_from_country,global.player_list[n_t_i]);
		}
	}
	for (var n_t_i = 0; n_t_i < array_length(global.coach_list); ++n_t_i) {
		if (variable_global_get(string(global.coach_list[n_t_i]) + "_country") == country) {
			array_push(names_from_country,global.coach_list[n_t_i]);
		}
	}
	
	name_index = irandom(array_length(names_from_country)-1);
	variable_global_set(string(idcode) + "_firstname", variable_global_get(string(names_from_country[name_index]) + "_firstname"));
	if (array_length(names_from_country) > 1) {
		array_delete(names_from_country,name_index,1);
	}
	variable_global_set(string(idcode) + "_lastname", variable_global_get(string(names_from_country[irandom(array_length(names_from_country)-1)]) + "_lastname"));
	variable_global_set(idcode + "_age", 17);
	variable_global_set(string(idcode) + "_sc", variable_global_get(string(names_from_country[irandom(array_length(names_from_country)-1)]) + "_sc"));
	variable_global_set(idcode + "_country", country);
	variable_global_set(idcode + "_team", team);
	variable_global_set(idcode + "_og_team", team);
	variable_global_set(idcode + "_pos", choose("GOALKEEPER", "DEFENDER", "MIDFIELDER", "FORWARD"));
	variable_global_set(idcode + "_spd", 1);
	variable_global_set(idcode + "_tkl", 1);
	variable_global_set(idcode + "_sta", 1);
	variable_global_set(idcode + "_tec", 1);
	variable_global_set(idcode + "_gk", 1);
	variable_global_set(idcode + "_def", 1);
	variable_global_set(idcode + "_mid", 1);
	variable_global_set(idcode + "_ata", 1);
	variable_global_set(idcode + "_number", irandom_range(2,99));
	if (vgg(idcode + "_pos") == "GOALKEEPER") {
		variable_global_set(idcode + "_tkl", 2);
		variable_global_set(idcode + "_gk", 3);
		variable_global_set(idcode + "_number", choose(1, 12, 22, 99));
		variable_global_set(idcode + "_training_focus", "_tkl");
	} else if (vgg(idcode + "_pos") == "DEFENDER") {
		variable_global_set(idcode + "_tkl", 2);
		variable_global_set(idcode + "_def", 3);
		variable_global_set(idcode + "_training_focus", "_tkl");
	} else if (vgg(idcode + "_pos") == "MIDFIELDER") {
		variable_global_set(idcode + "_tec", 2);
		variable_global_set(idcode + "_mid", 3);
		variable_global_set(idcode + "_training_focus", "_tec");
	} else if (vgg(idcode + "_pos") == "FORWARD") {
		variable_global_set(idcode + "_spd", 2);
		variable_global_set(idcode + "_ata", 3);
		variable_global_set(idcode + "_training_focus", "_tec");
	}
	variable_global_set(idcode + "_ca", vgg(idcode + "_spd") + vgg(idcode + "_tkl") + variable_global_get(idcode + "_sta") + variable_global_get(idcode + "_tec") + variable_global_get(idcode + "_gk") + variable_global_get(idcode + "_def") + variable_global_get(idcode + "_mid") + variable_global_get(idcode + "_ata"));
	max_potential = round(lerp(0, 7, (vgg(team + "_reputation") + vgg(team + "_training") - 2) / 8));
	variable_global_set(idcode + "_potential", variable_global_get(idcode + "_ca") + irandom(max_potential));
	variable_global_set(idcode + "_reputation", round(vgg(team + "_reputation") / 2));
	variable_global_set(idcode + "_xp", 0);
	variable_global_set(idcode + "_injury", 0);
	variable_global_set(idcode + "_goals", 0);
	variable_global_set(idcode + "_assists", 0);
	variable_global_set(idcode + "_tackles", 0);
	variable_global_set(idcode + "_cleansheets", 0);
	variable_global_set(idcode + "_transfer_eligible", true);
	variable_global_set(idcode + "_offers_received", array_create(0));
	calculate_value(idcode);
	variable_global_set(idcode + "_offers", array_create(0));
	// Add player to the global list
	array_push(global.player_list, idcode);
	var player_team = variable_global_get(string(idcode) + "_team");
	variable_global_set(idcode + "_contract", 2);
	var team_array = variable_global_get(string(player_team) + "_u19_squad");
	array_push(team_array, idcode);
	calculate_salary(idcode, true);
	
}

function regen_coach_push(former_idcode) {
	
	// Calculate the new player ID
	idnumber = 10;
	idcode = "c" + string(idnumber);
	while (array_contains(global.coach_list, idcode)) {
		idnumber++;
		idcode = "c" + string(idnumber);
	}
	// Set player attributes dynamically
	variable_global_set(idcode + "_firstname", variable_global_get(former_idcode + "_firstname"));
	variable_global_set(idcode + "_lastname", variable_global_get(former_idcode + "_lastname"));
	variable_global_set(idcode + "_age", variable_global_get(former_idcode + "_age"));
	variable_global_set(idcode + "_sc", variable_global_get(former_idcode + "_sc"));
	variable_global_set(idcode + "_country", variable_global_get(former_idcode + "_country"));
	variable_global_set(idcode + "_team", "freeagent");
	variable_global_set(idcode + "_mentality", choose("defensive", "balanced", "attacking"));
	variable_global_set(idcode + "_reputation", variable_global_get(former_idcode + "_reputation"));
	variable_global_set(idcode + "_goals", 0);
	variable_global_set(idcode + "_assists", 0);
	variable_global_set(idcode + "_tackles", 0);
	variable_global_set(idcode + "_cleansheets", 0);
	variable_global_set(idcode + "_offers_received", array_create(0));
	variable_global_set(idcode + "_offers", array_create(0));
	// Add player to the global list
	array_push(global.coach_list, idcode);
	coach_team = variable_global_get(string(idcode) + "_team");
	if (coach_team == "freeagent") {
		array_push(global.coach_freeagent, idcode);
		variable_global_set(idcode + "_contract", 0);
	} else {
		variable_global_set(coach_team + "_coach", idcode);
		variable_global_set(idcode + "_contract", irandom_range(2,4));
	}
	
}

function savegame() {
	
	ini_open("gamesave1.sav");
	
	ini_write_real("GameData","week",global.week);
	ini_write_real("GameData","year",global.year);
	ini_write_string("GameData","warning_mode",global.warning_mode);
	
	ini_write_real("GameData", "event_count", array_length(global.events));
	for (var i = 0; i < array_length(global.events); i++) {
	    var event = global.events[i];
		
	    ini_write_real("GameData", "event" + string(i) + "_week", event.week);
	    ini_write_string("GameData", "event" + string(i) + "_type", event.type);
	    ini_write_string("GameData", "event" + string(i) + "_competition", event.competition);
	    ini_write_string("GameData", "event" + string(i) + "_phase", event.phase);
	    ini_write_real("GameData", "event" + string(i) + "_played", event.played);
		ini_write_real("GameData", "event" + string(i) + "_watch", event.watch);
	    ini_write_string("GameData", "event" + string(i) + "_hometeam", event.hometeam);
	    ini_write_string("GameData", "event" + string(i) + "_awayteam", event.awayteam);
	    ini_write_real("GameData", "event" + string(i) + "_home_goals", event.home_goals);
	    ini_write_real("GameData", "event" + string(i) + "_away_goals", event.away_goals);
		
	}
	
	ini_write_real("league_list", "league_count", array_length(global.league_list));
	for (var i = 0; i < array_length(global.league_list); i++) {
	    ini_write_string("league_list", "league" + string(i), global.league_list[i]);
	}
	
	for (var i = 0; i < array_length(global.league_list); ++i) {
	    
		var league = string(global.league_list[i]);

		ini_write_string("league_list", string(league) + "_name", variable_global_get(string(league) + "_name"));
		
		var league_list = variable_global_get(league + "_class");
		ini_write_real("league_list", string(league) + "team_count", array_length(league_list));
		for (var f = 0; f < array_length(league_list); f++) {
		    ini_write_string("league_list", string(league) + "_team" + string(f), league_list[f]);
		}
		
	}
	
	ini_write_real("team_list", "team_count", array_length(global.team_list));
	for (var i = 0; i < array_length(global.team_list); i++) {
	    ini_write_string("team_list", "team" + string(i), global.team_list[i]);
	}
	
	for (var i = 0; i < array_length(global.team_list); ++i) {
		
		var team = string(global.team_list[i]);

		ini_write_string("team_list", string(team) + "_name", variable_global_get(string(team) + "_name"));
		ini_write_string("team_list", string(team) + "_abrv", variable_global_get(string(team) + "_abrv"));
		ini_write_string("team_list", string(team) + "_league", variable_global_get(string(team) + "_league"));
		ini_write_string("team_list", string(team) + "_country", variable_global_get(string(team) + "_country"));
		ini_write_string("team_list", string(team) + "_sponsor", variable_global_get(string(team) + "_sponsor"));
		ini_write_string("team_list", string(team) + "_coach", variable_global_get(string(team) + "_coach"));
		ini_write_real("team_list", string(team) + "_badge", variable_global_get(string(team) + "_badge"));
		ini_write_real("team_list", string(team) + "_budget", variable_global_get(string(team) + "_budget"));
		ini_write_string("team_list", string(team) + "_type", variable_global_get(string(team) + "_type"));
		ini_write_string("team_list", string(team) + "_kittype", variable_global_get(string(team) + "_kittype"));
		ini_write_real("team_list", string(team) + "_color1", variable_global_get(string(team) + "_color1"));
		ini_write_real("team_list", string(team) + "_color2", variable_global_get(string(team) + "_color2"));
		ini_write_real("team_list", string(team) + "_color3", variable_global_get(string(team) + "_color3"));
		ini_write_real("team_list", string(team) + "_reputation", variable_global_get(string(team) + "_reputation"));
		ini_write_real("team_list", string(team) + "_training", variable_global_get(string(team) + "_training"));
	    ini_write_real("team_list", string(team) + "_goals", variable_global_get(string(team) + "_goals"));
	    ini_write_real("team_list", string(team) + "_points", variable_global_get(string(team) + "_points"));
		
		team_squad = variable_global_get(string(team) + "_squad");
		ini_write_real("team_list", string(team) + "squad_count", array_length(team_squad));
		for (var f = 0; f < array_length(team_squad); f++) {
		    ini_write_string("team_list", string(team) + "_squad" + string(f), team_squad[f]);
		}
		
		var u19_team_squad = variable_global_get(string(team) + "_u19_squad");
		ini_write_real("team_list", string(team) + "u19_squad_count", array_length(u19_team_squad));
		for (var f = 0; f < array_length(u19_team_squad); f++) {
		    ini_write_string("team_list", string(team) + "_u19_squad" + string(f), u19_team_squad[f]);
		}
		
		tactic_positions = variable_global_get(string(team) + "_tactic");
		for (var f = 0; f < 5; f++) {
		    var current_pos = tactic_positions[f];
    
		    ini_write_string("team_list", string(team) + "position" + string(f) + "_pos", current_pos.pos);
			ini_write_real("team_list", string(team) + "position" + string(f) + "_pos_x", current_pos.pos_x);
		    ini_write_real("team_list", string(team) + "position" + string(f) + "_pos_y", current_pos.pos_y);
			
		}
		
	}
	
	ini_write_real("coach_list", "coach_count", array_length(global.coach_list));
	for (var i = 0; i < array_length(global.coach_list); i++) {
	    ini_write_string("coach_list", "coach" + string(i), global.coach_list[i]);
	}
	
	ini_write_real("coach_list", "freeagent_count", array_length(global.coach_freeagent));
	for (var i = 0; i < array_length(global.coach_freeagent); i++) {
	    ini_write_string("coach_list", "freeagent" + string(i), global.coach_freeagent[i]);
	}
	
	for (var i = 0; i < array_length(global.coach_list); ++i) {
		
		var coach = string(global.coach_list[i]);

		ini_write_string("coach_list", string(coach) + "_firstname", variable_global_get(string(coach) + "_firstname"));
		ini_write_string("coach_list", string(coach) + "_lastname", variable_global_get(string(coach) + "_lastname"));
		ini_write_string("coach_list", string(coach) + "_country", variable_global_get(string(coach) + "_country"));
		ini_write_real("coach_list", string(coach) + "_age", variable_global_get(string(coach) + "_age"));
		ini_write_real("coach_list", string(coach) + "_contract", variable_global_get(string(coach) + "_contract"));
		ini_write_real("coach_list", string(coach) + "_sc", variable_global_get(string(coach) + "_sc"));
		ini_write_string("coach_list", string(coach) + "_team", variable_global_get(string(coach) + "_team"));
		ini_write_string("coach_list", string(coach) + "_mentality", variable_global_get(string(coach) + "_mentality"));
		ini_write_real("coach_list", string(coach) + "_reputation", variable_global_get(string(coach) + "_reputation"));
		
		coach_offers = variable_global_get(string(coach) + "_offers");
		ini_write_real("coach_list", string(coach) + "offers_count", array_length(coach_offers));
		for (var f = 0; f < array_length(coach_offers); f++) {
		    var offer = coach_offers[f];
    
		    ini_write_string("coach_list", string(coach) + "offer" + string(f) + "_team", offer.team);
		    ini_write_real("coach_list", string(coach) + "offer" + string(f) + "_team_reputation", offer.team_reputation);
			ini_write_real("coach_list", string(coach) + "offer" + string(f) + "_contract", offer.contract);
		}
		
		coach_offers_received = variable_global_get(string(coach) + "_offers_received");
		ini_write_real("coach_list", string(coach) + "coach_offers_received_count", array_length(coach_offers_received));
		for (var f = 0; f < array_length(coach_offers_received); f++) {
		    ini_write_string("coach_list", string(coach) + "_offers_received" + string(f), coach_offers_received[f]);
		}
		
	}
	
	ini_write_real("player_list", "player_count", array_length(global.player_list));
	for (var i = 0; i < array_length(global.player_list); i++) {
	    ini_write_string("player_list", "player" + string(i), global.player_list[i]);
	}
	
	ini_write_real("player_list", "freeagent_count", array_length(global.player_freeagent));
	for (var i = 0; i < array_length(global.player_freeagent); i++) {
	    ini_write_string("player_list", "freeagent" + string(i), global.player_freeagent[i]);
	}
	
	ini_write_real("player_list", "loans_count", array_length(global.player_loans));
	for (var i = 0; i < array_length(global.player_loans); i++) {
	    ini_write_string("player_list", "loans" + string(i), global.player_loans[i]);
	}
	
	ini_write_real("player_list", "transfers_count", array_length(global.player_transfers));
	for (var i = 0; i < array_length(global.player_transfers); i++) {
	    ini_write_string("player_list", "transfers" + string(i), global.player_transfers[i]);
	}
	
	for (var i = 0; i < array_length(global.player_list); ++i) {
		
		var player = string(global.player_list[i]);

		ini_write_string("player_list", string(player) + "_firstname", variable_global_get(string(player) + "_firstname"));
		ini_write_string("player_list", string(player) + "_lastname", variable_global_get(string(player) + "_lastname"));
		ini_write_real("player_list", string(player) + "_age", variable_global_get(string(player) + "_age"));
		ini_write_string("player_list", string(player) + "_country", variable_global_get(string(player) + "_country"));
		ini_write_real("player_list", string(player) + "_reputation", variable_global_get(string(player) + "_reputation"));
		ini_write_real("player_list", string(player) + "_contract", variable_global_get(string(player) + "_contract"));
		ini_write_real("player_list", string(player) + "_salary", variable_global_get(string(player) + "_salary"));
		ini_write_real("player_list", string(player) + "_sc", variable_global_get(string(player) + "_sc"));
		ini_write_real("player_list", string(player) + "_number", variable_global_get(string(player) + "_number"));
		ini_write_string("player_list", string(player) + "_team", variable_global_get(string(player) + "_team"));
		ini_write_string("player_list", string(player) + "_og_team", variable_global_get(string(player) + "_og_team"));
		ini_write_string("player_list", string(player) + "_pos", variable_global_get(string(player) + "_pos"));
		ini_write_string("player_list", string(player) + "_training_focus", variable_global_get(string(player) + "_training_focus"));
		ini_write_real("player_list", string(player) + "_spd", variable_global_get(string(player) + "_spd"));
		ini_write_real("player_list", string(player) + "_tkl", variable_global_get(string(player) + "_tkl"));
		ini_write_real("player_list", string(player) + "_sta", variable_global_get(string(player) + "_sta"));
		ini_write_real("player_list", string(player) + "_tec", variable_global_get(string(player) + "_tec"));
		ini_write_real("player_list", string(player) + "_gk", variable_global_get(string(player) + "_gk"));
		ini_write_real("player_list", string(player) + "_def", variable_global_get(string(player) + "_def"));
		ini_write_real("player_list", string(player) + "_mid", variable_global_get(string(player) + "_mid"));
		ini_write_real("player_list", string(player) + "_ata", variable_global_get(string(player) + "_ata"));
		ini_write_real("player_list", string(player) + "_ca", variable_global_get(string(player) + "_ca"));
		ini_write_real("player_list", string(player) + "_xp", variable_global_get(string(player) + "_xp"));
		ini_write_real("player_list", string(player) + "_potential", variable_global_get(string(player) + "_potential"));
		ini_write_real("player_list", string(player) + "_injury", variable_global_get(string(player) + "_injury"));
		ini_write_real("player_list", string(player) + "_goals", variable_global_get(string(player) + "_goals"));
		ini_write_real("player_list", string(player) + "_assists", variable_global_get(string(player) + "_assists"));
		ini_write_real("player_list", string(player) + "_tackles", variable_global_get(string(player) + "_tackles"));
		ini_write_real("player_list", string(player) + "_cleansheets", variable_global_get(string(player) + "_cleansheets"));
		ini_write_real("player_list", string(player) + "_transfer_eligible", variable_global_get(string(player) + "_transfer_eligible"));
		ini_write_real("player_list", string(player) + "_value", variable_global_get(string(player) + "_value"));
		
		player_offers = variable_global_get(string(player) + "_offers");
		ini_write_real("player_list", string(player) + "offers_count", array_length(player_offers));
		for (var f = 0; f < array_length(player_offers); f++) {
		    var offer = player_offers[f];
    
		    ini_write_string("player_list", string(player) + "offer" + string(f) + "_team", offer.team);
			ini_write_string("player_list", string(player) + "offer" + string(f) + "_type", offer.type);
			ini_write_real("player_list", string(player) + "offer" + string(f) + "_fee", offer.fee);
		    ini_write_real("player_list", string(player) + "offer" + string(f) + "_team_reputation", offer.team_reputation);
			ini_write_real("player_list", string(player) + "offer" + string(f) + "_salary", offer.salary);
			ini_write_real("player_list", string(player) + "offer" + string(f) + "_contract", offer.contract);
		}
		
		player_offers_received = variable_global_get(string(player) + "_offers_received");
		ini_write_real("player_list", string(player) + "player_offers_received_count", array_length(player_offers_received));
		for (var f = 0; f < array_length(player_offers_received); f++) {
		    ini_write_string("player_list", string(player) + "_offers_received" + string(f), player_offers_received[f]);
		}
		
	}
	
	ini_close();
	
	if (file_exists("gamesave.sav")) {
		file_delete("gamesave.sav");
	}
	
	file_rename("gamesave1.sav" ,"gamesave.sav");
	
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
			warning = {warning_title: "ACHIEVEMENT UNLOCKED!", warning_text: global.achievement_list[i].ach_text};
			warning_push(warning);
			save_achievements();
			break;
		}
	}
	
}

squad_array_sort = "CURRENT ABILITY";
array_sort(global.player_freeagent, ca_sort);
array_sort(global.player_loans, ca_sort);
array_sort(global.player_transfers, ca_sort);

coefficient_list = ["l00", "l01","l02","l03","l04","l06", "l12", "l13", "l14", "l16"];

player_stats_list = [];
array_copy(player_stats_list, 0, global.player_list, 0, array_length(global.player_list));
array_sort(player_stats_list, top_scorers_sort);

contacts = ["SCOUT", "PRESIDENT"];

lastpage_options = ["NOTIFICATIONS", "SAVE", "EXIT"];

if (global.c10_team != "freeagent") {
	menu_options = ["SCHEDULE", "FREE AGENTS", "TRANSFER LIST", "LOAN LIST", "COEFFICIENTS", "CONTACTS", "OPTIONS"];
} else {
	menu_options = ["SCHEDULE", "COEFFICIENTS", "OFFERS", "OPTIONS"];
}