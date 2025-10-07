screen = "FIRST NAME";
screens = ["FIRST NAME", "LAST NAME", "CHARACTERISTICS", "COUNTRY", "TEAM", "SHOW TUTORIALS?"];

cursor_alpha = 1;
alarm[1] = 30;

tutorial_state = "YES";
esc_option_index = 0;

keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_characters, false);

create_name1 = "A";
create_name2 = "A";
create_sc = global.c_whiteskin;
create_league = "l02";
create_league_index = 0;
create_team_index = 0;
create_league_array = variable_global_get(global.league_list[create_league_index] + "_class");
create_team = create_league_array[create_team_index];
coach_replacing = "";

function vgg(variable) {
	
	return variable_global_get(variable); 
	
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
	
	a_gk = variable_global_get(a + "_gk") - variable_global_get(b + "_injury");
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

function offer_push(person_id, offer, team) {
	array_push(vgg(person_id + "_offers"), offer);
	array_push(vgg(person_id + "_offers_received"), team);
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

function calculate_salary(player, set) {
	
	player_salary = lerp(global.min_wage, global.max_wage, (variable_global_get(player + "_ca") - 8) / (22 - 8));
	player_salary = lerp(player_salary/5, player_salary, (variable_global_get(player + "_reputation") - 1) / 4);
	if (set) {
		variable_global_set(player + "_salary", abs(player_salary));
	} else {
		return player_salary;
	}
	
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