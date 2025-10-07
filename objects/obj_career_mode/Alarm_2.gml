/// @description INTERACTION AI

randomize();
what_was_said = [];
word = "";
number = undefined;

original_sentence = array_last(interaction_dialogue) + "!";

contains_number = false;

function read_word(character, position) {
	
	if (character != " " && character != "," && character != "." && character != "!" && character != "?") {
		
	    if (word == "") {
			word = character;
		} else {
			word += character;
		}
		
		if (string_length(string_digits(character)) > 0) {
			contains_number = true;
		}
		
	} else {
		
		
		if (character == "." && string_length(string_digits(word)) > 0) { // Is the dot in the middle of a number?
			
			word += character;
			
		} else {
		
			if (word != "") {
				array_push(what_was_said, word);
			}
		
			
			if (character == "." || character == "!" || character == "?") {
				array_push(what_was_said, character);
			}
		
			word = "";
		
		}
		
	}
	
}

string_foreach(original_sentence, read_word);

function safe_real(_str) {
    var len = string_length(_str);
    var start_index = 1;

    // Find first valid numeric character
    while (start_index <= len) {
        var ch = string_char_at(_str, start_index);
        if (ch == "." || ch == "+" || ch == "-" || (ch >= "0" && ch <= "9")) {
            break;
        }
        start_index++;
    }

    // Substring from first valid numeric character onward
    if (start_index > len) {
        return 0; // no number at all
    }

    var numeric_str = string_copy(_str, start_index, len - start_index + 1);
    return real(numeric_str);
}

if (contains_number) {
	
	number = 0;
	for (var i = 0; i < array_length(what_was_said); ++i) {
		
	    if (string_length(string_digits(what_was_said[i])) > 0) {
			number_string = what_was_said[i];
			number = safe_real(what_was_said[i]);
			break;
		}
		
	}
	
	if (array_contains(what_was_said, "TRILLION") || array_contains(what_was_said, "TRILLIONS")) {
		number = real(number) * 1000000000000;
	} else if (array_contains(what_was_said, "BILLION") || array_contains(what_was_said, "BILLIONS") || array_contains(what_was_said, "B") || string_pos("B", number_string) > 0) {
		number = real(number) * 1000000000;
	} else if (array_contains(what_was_said, "MILLION") || array_contains(what_was_said, "MILLIONS") || array_contains(what_was_said, "M") || string_pos("M", number_string) > 0) {
		number = real(number) * 1000000;
	} else if (array_contains(what_was_said, "THOUSAND") || array_contains(what_was_said, "K") || string_pos("K", number_string) > 0) {
		number = real(number) * 1000;
	}
	
	number = clamp(number, 0, 1000000000);
	
}

if (person_im_talking_to == selected) {
	
	// CONTEXT
	has_offer_currently = false;
	offer_index = 0;
	for (var i = 0; i < array_length(selected_offers); ++i) {
	    if (selected_offers[i].team == global.c10_team) {
			has_offer_currently = true;
			offer_index = i;
			break;
		}
		
	}

	if (contains_number && negotiation_path == "THE CONTRACT OFFER") {
	
		if (negotiation_stage == 0) { // SALARY DISCUSSION
		
			if (number <= wanted_salary * 0.6) {
			
				array_push(interaction_dialogue, "THAT'S JUST INSULTING...");
				can_talk = true;
			
			} else if (number < wanted_salary * 0.9) {
			
				array_push(interaction_dialogue, "MAYBE JUST A LITTLE BIT MORE...");
				can_talk = true;
			
			} else {
		
				array_push(interaction_dialogue, format_number_dots(number) + "/WEEK? OKAY AND HOW MANY YEARS?");
				
				if (selected_team == "freeagent" || selected_team == global.c10_team) {
					
					offer = {team: global.c10_team, type: "TRANSFER", fee: 0, team_reputation: variable_global_get(global.c10_team + "_reputation"), salary: number, contract: 0};
					
				} else {
					
					offer.salary = number;
					
				}
				negotiation_stage++;
				can_talk = true;
		
			}
		
		} else if (negotiation_stage == 1) { // LENGTH DISCUSSION
		
			if (number > 5) {
			
				array_push(interaction_dialogue, string(number) + " YEARS IS TOO LONG. TRY AGAIN...");
				can_talk = true;
			
			} else if (number < 1) {
			
				array_push(interaction_dialogue, "PLEASE BE SERIOUS. HOW MANY YEARS OF CONTRACT?");
				can_talk = true;
			
			} else {
			
				array_push(interaction_dialogue, string(number) + ", HUH? OKAY, I'LL GIVE YOU AN ANSWER WITHIN THE WEEK.");
				offer.contract = number;
				offer_push(selected, offer, global.c10_team);
				selected_offers = variable_global_get(selected + "_offers");
				array_sort(selected_offers, offer_choose);
				
			}
		
		}
	
	} else if (contains_number && negotiation_path == "CHANGE NUMBER") {
		
		if (number < 1 || number > 99) {
			
			array_push(interaction_dialogue, "PLEASE CHOOSE A LEGAL NUMBER...");
			can_talk = true;
			
		} else {
			
			selected_team_squad = variable_global_get(selected_team + "_squad");
			number_is_free = true;
				
			for (var i = 0; i < array_length(selected_team_squad); ++i) {
		
				number_on_the_team = variable_global_get(selected_team_squad[i] + "_number");
		
				if (number == number_on_the_team && selected_team_squad[i] != selected) {
			
					number_is_free = false;
					break;
			
				}
			
			}
			
			if (number_is_free) {
				
				array_push(interaction_dialogue, "OKAY, I'LL CHANGE TO NUMBER " + string(number) + ".");
				variable_global_set(selected + "_number", number);
				negotiation_path = "";
				if (!achievements_completed && number == 10) {
					achievement_set_completed("CLASSIC NUMBER 10");
				}
				
			} else {
				
				array_push(interaction_dialogue, string(number) + " IS TAKEN. PLEASE PICK ANOTHER.");
				can_talk = true;
				
			}
		
		}
	
	} else if ( (array_contains(what_was_said, "OKAY") || array_contains(what_was_said, "OK") || array_contains(what_was_said, "FINE") || array_contains(what_was_said, "SURE") ) && negotiation_path == "THE CONTRACT OFFER" && negotiation_stage == 0) {
	
		array_push(interaction_dialogue, "GREAT! AND HOW MANY YEARS?");
		
		if (selected_team == "freeagent" || selected_team == global.c10_team) {
			
			offer = {team: global.c10_team, type: "TRANSFER", fee: 0, team_reputation: variable_global_get(global.c10_team + "_reputation"), salary: wanted_salary, contract: 0};
					
		} else {
					
			offer.salary = wanted_salary;
			
		}
		negotiation_stage++;
		can_talk = true;
	
	} else if (array_contains(what_was_said, "MUCH") && negotiation_path == "THE CONTRACT OFFER") {
		
		array_push(interaction_dialogue, "AROUND " + format_number_dots(wanted_salary) + "/WEEK.");
		can_talk = true;
	
	} else if (negotiation_path == "BEING CUT") {
	
		if (array_contains(what_was_said, "YES") || array_contains(what_was_said, "YEAH")) {
		
			if (selected_team == selected_og_team) {	
		
				if (array_contains(variable_global_get(selected_team + "_squad"), selected)) {
				
					array_push(interaction_dialogue, "OH, OK... SEE YOU AROUND OR NOT, I GUESS...");
					array_delete(variable_global_get(selected_team + "_squad"), array_get_index(variable_global_get(selected_team + "_squad"), selected), 1);
					variable_global_set(global.c10_team + "_budget", variable_global_get(global.c10_team + "_budget") - money_to_cut);
					variable_global_set(selected + "_team", "freeagent");
					variable_global_set(selected + "_og_team", "freeagent");
					array_push(global.player_freeagent, selected);
				
				} else if (array_contains(variable_global_get(selected_team + "_u19_squad"), selected)) {
				
					array_push(interaction_dialogue, "YEAH, I'M PROBABLY NOT CUT OUT TO BE A PLAYER ANYWAY...");
					
				}
			
				if (array_contains(global.player_loans, selected)) {
					array_delete(global.player_loans, array_get_index(global.player_loans, selected), 1);
				}
				if (array_contains(global.player_transfers, selected)) {
					array_delete(global.player_transfers, array_get_index(global.player_transfers, selected), 1);
				}
			
			} else {
				
				negotiation_path = "";
				array_push(interaction_dialogue, "I CAN ONLY BE CUT AFTER I COME BACK FROM BEING THE LOAN.");
				can_talk = true;
				
			}
		
		} else {
		
			negotiation_path = "";
			array_push(interaction_dialogue, "LET'S JUST RESTART THIS CONVERSATION...");
			can_talk = true;
		
		}
	
	} else if (negotiation_path == "MY TRANSFER LIST STATUS") {
	
		if (array_contains(what_was_said, "YES") || array_contains(what_was_said, "YEAH") || array_contains(what_was_said, "YUP")) {
		
			if (selected_team == global.c10_team) {
		
				if (!array_contains(global.player_transfers, selected)) {
					array_push(global.player_transfers, selected);
					array_push(interaction_dialogue, "FOOTBALL A BUSINESS, I GUESS...");
				} else {
					array_delete(global.player_transfers, array_get_index(global.player_transfers, selected), 1);
					array_push(interaction_dialogue, "OKAY. GOT IT, COACH.");
				}
				
				negotiation_path = "";
				can_talk = true;
		
			}
		
		} else {
		
			negotiation_path = "";
			array_push(interaction_dialogue, "OKAY, WHAT DID YOU WANT TO TALK ABOUT THEN?");
			can_talk = true;
		
		}
	
	} else if (negotiation_path == "MY LOAN STATUS") {
	
		if (array_contains(what_was_said, "YES") || array_contains(what_was_said, "YEAH") || array_contains(what_was_said, "YUP")) {
		
			if (selected_team == global.c10_team) {
		
				if (!array_contains(global.player_loans, selected)) {
					array_push(global.player_loans, selected);
					array_push(interaction_dialogue, "I WAS HOPING TO PLAY HERE, BUT I UNDERSTAND.");
				} else {
					array_delete(global.player_loans, array_get_index(global.player_loans, selected), 1);
					array_push(interaction_dialogue, "OKAY. GOT IT, COACH.");
				}
				
				negotiation_path = "";
				can_talk = true;
		
			}
		
		} else {
		
			negotiation_path = "";
			array_push(interaction_dialogue, "OKAY, WHAT DID YOU WANT TO TALK ABOUT THEN?");
			can_talk = true;
		
		}
	
	} else if (negotiation_path == "ME STAYING WITH THE TEAM") {
	
		if (array_contains(what_was_said, "IMPORTANT") || array_contains(what_was_said, "PLEASE") || array_contains(what_was_said, "TIME")) {
			
			if (selected_offers[0].team_reputation > variable_global_get(global.c10_team + "_reputation")) {
				
				array_push(interaction_dialogue, "I'M SORRY, IT'S A CHANCE TO GET MORE RECOGNITION.");
				can_talk = true;
				
			} else if (variable_global_get(variable_global_get(selected_offers[0].team + "_league") + "_reputation") > variable_global_get(variable_global_get(global.c10_team + "_league") + "_reputation")) {
				
				array_push(interaction_dialogue, "I'M SORRY, IT'S A CHANCE TO PLAY IN A BETTER LEAGUE.");
				can_talk = true;
				
			} else {
				
				array_push(interaction_dialogue, "IF YOU THINK I'M THAT IMPORTANT, I'LL STAY.");
				array_delete(selected_offers, 0, array_length(selected_offers));
				
			}
		
		} else if (array_contains(what_was_said, "MONEY") || array_contains(what_was_said, "SALARY") || array_contains(what_was_said, "WAGE")) {
		
			array_push(interaction_dialogue, "THEY WILL BE PAYING ME A GOOD WAGE TOO.");
			can_talk = true;
		
		} else if (array_contains(what_was_said, "WHICH") && array_contains(what_was_said, "?")) {
		
			array_push(interaction_dialogue, "THE ONE FROM " + variable_global_get(selected_offers[0].team + "_name"));
			can_talk = true;
		
		} else if (array_contains(what_was_said, "MUCH") && array_contains(what_was_said, "?")) {
		
			array_push(interaction_dialogue, "THE FEE IS " + string(selected_offers[0].fee) + ", I HEARD. THE SALARY IS " + format_number_dots(round(selected_offers[0].salary)) + ".");
			can_talk = true;
		
		} else {
		
			array_push(interaction_dialogue, "COME BACK ONCE YOU HAVE FOUND A BETTER REASON.");
		
		}
	
	} else if (array_contains(what_was_said, "FUCK") || array_contains(what_was_said, "SHIT") || array_contains(what_was_said, "FUCKING") || array_contains(what_was_said, "BITCH") || array_contains(what_was_said, "CUNT")) {
	
		array_push(interaction_dialogue, "THAT WAS RUDE! PLEASE BE MORE RESPECTFUL.");
		can_talk = true;
	
	} else if (array_contains(what_was_said, "DOING") && (array_contains(what_was_said, "HOW") || array_contains(what_was_said, "?")) ) {
	
		array_push(interaction_dialogue, choose("YEAH, I'M DOING OKAY.", "I'M ALRIGHT!"));
		can_talk = true;
	
	} else if (array_contains(what_was_said, "DOING") && !array_contains(what_was_said, "?")) {
	
		array_push(interaction_dialogue, choose("OKAY, COOL.", "THAT'S GOOD TO HEAR!"));
		can_talk = true;
	
	} else if (array_contains(what_was_said, "PLAYING") && !array_contains(what_was_said, "NOT") && array_contains(what_was_said, "WELL")) {
	
		array_push(interaction_dialogue, choose("YEAH, I'M IN FORM.", "THANKS, COACH!"));
		can_talk = true;
	
	} else if ( array_contains(what_was_said, "PLAYING") && ( (array_contains(what_was_said, "NOT") && array_contains(what_was_said, "WELL")) || (array_contains(what_was_said, "BAD") || array_contains(what_was_said, "POORLY")  || array_contains(what_was_said, "BADLY")) ) ) {
	
		array_push(interaction_dialogue, choose("I'LL TRY HARDER!", "THANKS FOR THE FEEDBACK, COACH!"));
		can_talk = true;
	
	} else if ((array_contains(what_was_said, "CUTTING") || array_contains(what_was_said, "CUT") || array_contains(what_was_said, "FIRED") || array_contains(what_was_said, "REMOVE") || array_contains(what_was_said, "OFF")) && !array_contains(what_was_said, "NOT") && selected_team == global.c10_team) {
	
		if (selected_team == global.c10_team) {
		
			money_to_cut = format_number_dots(round(selected_salary * global.max_weeks * selected_contract));
			array_push(interaction_dialogue, "YOU'RE WILLING TO PAY " + string(money_to_cut) + " TO CUT ME FROM THE TEAM? YES OR NO?");
			negotiation_path = "BEING CUT";
			can_talk = true;
		
		}
	
	} else if ( (array_contains(what_was_said, "STAY") || array_contains(what_was_said, "DON'T") || (array_contains(what_was_said, "NOT") && array_contains(what_was_said, "LEAVE"))) && array_length(selected_offers) > 0 && !has_offer_currently && selected_og_team == global.c10_team) {
		
		array_sort(selected_offers, offer_choose);
		
		if (selected_offers[0].type == "TRANSFER" && selected_reputation - selected_offers[0].team_reputation > 1 && selected_team != "freeagent") {
			
			array_push(interaction_dialogue, "I'M NOT GONNA ACCEPT. I THINK I CAN PLAY AT A HIGHER LEVEL THAN THAT TEAM.");
			
		} else if (selected_offers[0].type == "TRANSFER" && selected_reputation - selected_offers[0].team_reputation > 2) {
			
			array_push(interaction_dialogue, "I'M NOT GONNA ACCEPT. I THINK I CAN PLAY AT A HIGHER LEVEL THAN THAT TEAM.");
			
		} else {
			
			negotiation_path = "ME STAYING WITH THE TEAM";
			array_push(interaction_dialogue, "WHY SHOULD I STAY?");
			can_talk = true;
		
		}
	
	} else if (array_contains(what_was_said, "WHAT") && array_contains(what_was_said, "OFFER") && array_length(selected_offers) > 0) {
		
		if (random(1) < 0.5 || selected_og_team == global.c10_team) {
			
			array_sort(selected_offers, offer_choose);
			array_push(interaction_dialogue, "I'M LEANING TOWARDS JOINING " + variable_global_get(selected_offers[0].team + "_name") + ".");
			can_talk = true;
			
		} else {
			
			array_push(interaction_dialogue, choose("I DON'T HAVE TO TELL YOU THAT...", "A BIT INTRUSIVE, DON'T YOU THINK?"));
			
		}
	
	} else if (array_contains(what_was_said, "JOIN") || array_contains(what_was_said, "SIGN") || array_contains(what_was_said, "RENEW") || array_contains(what_was_said, "EXTEND") || array_contains(what_was_said, "EXTENSION") || array_contains(what_was_said, "CONTRACT") || (array_contains(what_was_said, "PLAY") && array_contains(what_was_said, "US"))) {
		
		league_reputation = variable_global_get(variable_global_get(global.c10_team + "_league") + "_reputation");
		offer_accepted = true;
		if ((selected_reputation - league_reputation > 2 || selected_reputation - variable_global_get(global.c10_team + "_reputation") > 2) && selected_team == "freeagent") {
			offer_accepted = false;
		} else if ((selected_reputation - league_reputation > 1 || selected_reputation - variable_global_get(global.c10_team + "_reputation") > 1) && selected_team != "freeagent") {
			offer_accepted = false;
		}
		
		if (offer_accepted) {
			
			negotiation_path = "THE CONTRACT OFFER";
			wanted_salary = round(calculate_salary(selected, false));
			array_push(interaction_dialogue, choose("HOW MUCH PER WEEK ARE WE TALKING?", "WHAT WOULD BE THE WEEKLY SALARY?"));
			can_talk = true;
			
		} else {
			
			array_push(interaction_dialogue, "I'M SORRY, I FEEL I CAN PLAY AT A HIGHER LEVEL.");
			
		}
	
	} else if ( ( array_contains(what_was_said, "CANCEL") || array_contains(what_was_said, "REMOVE") ) && has_offer_currently) {
		
		array_delete(selected_offers, offer_index, 1);
		array_push(interaction_dialogue, "OK. OFFER CANCELED. SEE YOU LATER");
	
	} else if ( ( array_contains(what_was_said, "PROMOTE") || array_contains(what_was_said, "PROMOTED") || array_contains(what_was_said, "PROMOTING") || array_contains(what_was_said, "DEMOTE") || array_contains(what_was_said, "DEMOTED") || array_contains(what_was_said, "DEMOTING") || array_contains(what_was_said, "U19S") || (array_contains(what_was_said, "FIRST") && array_contains(what_was_said, "TEAM")) ) && selected_og_team == global.c10_team) {
		
		u19_squad = variable_global_get(global.c10_team + "_u19_squad");

		if (array_contains(u19_squad, selected)) {
			
			array_push(interaction_dialogue, "THANKS FOR THE OPPORTUNITY, BOSS!");
			array_push(variable_global_get(global.c10_team + "_squad"), selected);
			number_fix(selected);
			array_delete(u19_squad, array_get_index(u19_squad, selected), 1);
			if (!achievements_completed) {
				achievement_set_completed("YOUNG PEOPLE ARE THE FUTURE!");
			}
			
		} else if (selected_age > 19) {
			
			array_push(interaction_dialogue, "I CAN'T PLAY FOR THE U19S. I'M TOO OLD.");
			can_talk = true;
			
		} else {
			
			array_push(interaction_dialogue, "OK, COACH. I'LL TRY TO CLIMB BACK UP!");
			array_push(u19_squad, selected);
			array_delete(variable_global_get(global.c10_team + "_squad"), array_get_index(variable_global_get(global.c10_team + "_squad"), selected), 1);
			
		}
	
	} else if ( ( array_contains(what_was_said, "TRANSFER") || array_contains(what_was_said, "SELL") ) && selected_og_team == global.c10_team) {
		
		negotiation_path = "MY TRANSFER LIST STATUS";
		if (!array_contains(global.player_transfers, selected)) {
			array_push(interaction_dialogue, "SO YOU'RE GOING TO TRY TO SELL ME?");
		} else {
			array_push(interaction_dialogue, "SO YOU WANT ME TO STAY?");
		}
		
		can_talk = true;
	
	} else if ( ( array_contains(what_was_said, "LOAN") || array_contains(what_was_said, "LOANING") ) && selected_og_team == global.c10_team) {
		
		negotiation_path = "MY LOAN STATUS";
		if (!array_contains(global.player_loans, selected)) {
			array_push(interaction_dialogue, "SO YOU'RE GOING TO LOAN ME OUT?");
		} else {
			array_push(interaction_dialogue, "SO I'M NOT GOING TO BE LOANED OUT ANYMORE?");
		}
		
		can_talk = true;
	
	} else if ( (array_contains(what_was_said, "TACKLING") || array_contains(what_was_said, "SHOT STOPPING")) && selected_team == global.c10_team) {
	
		if (selected_tkl >= 3) {
			array_push(interaction_dialogue, "I DON'T SEE MYSELF MAKING MORE IMPROVEMENTS IN THAT AREA.");
		} else {
			if (selected_gk >= 3) {
				array_push(interaction_dialogue, "OKAY, I'LL FOCUS ON MY SHOT STOPPING.");
			} else {
				array_push(interaction_dialogue, "OKAY, I'LL FOCUS ON MY TACKLING.");
			}
			variable_global_set(selected + "_training_focus", "_tkl");
		}
		can_talk = true;
	
	} else if (array_contains(what_was_said, "SPEED") && selected_team == global.c10_team) {
	
		if (selected_spd >= 3) {
			array_push(interaction_dialogue, "I DON'T SEE MYSELF MAKING MORE IMPROVEMENTS IN THAT AREA.");
		} else {
			array_push(interaction_dialogue, "OKAY, I'LL FOCUS ON MY SPEED.");
			variable_global_set(selected + "_training_focus", "_spd");
		}
		can_talk = true;
	
	} else if (array_contains(what_was_said, "ENDURANCE") && selected_team == global.c10_team) {
	
		if (selected_sta >= 3) {
			array_push(interaction_dialogue, "I DON'T SEE MYSELF MAKING MORE IMPROVEMENTS IN THAT AREA.");
		} else {
			array_push(interaction_dialogue, "OKAY, I'LL FOCUS ON MY ENDURANCE.");
			variable_global_set(selected + "_training_focus", "_sta");
		}
		can_talk = true;
	
	} else if (array_contains(what_was_said, "TECHNIQUE") && selected_team == global.c10_team) {
	
		if (selected_tec >= 3) {
			array_push(interaction_dialogue, "I DON'T SEE MYSELF MAKING MORE IMPROVEMENTS IN THAT AREA.");
		} else {
			array_push(interaction_dialogue, "OKAY, I'LL FOCUS ON MY TECHNIQUE.");
			variable_global_set(selected + "_training_focus", "_tec");
		}
		can_talk = true;
	
	} else if (array_contains(what_was_said, "DEFENDER") && selected_team == global.c10_team) {
	
		if (selected_def >= 3) {
			array_push(interaction_dialogue, "I'M ALREADY A NATURAL AT THAT POSITION.");
		} else {
			array_push(interaction_dialogue, "OKAY, I'LL STUDY THAT POSITION MORE.");
			variable_global_set(selected + "_training_focus", "_def");
		}
		can_talk = true;
	
	} else if (array_contains(what_was_said, "MIDFIELDER") && selected_team == global.c10_team) {
	
		if (selected_mid >= 3) {
			array_push(interaction_dialogue, "I'M ALREADY A NATURAL AT THAT POSITION.");
		} else {
			array_push(interaction_dialogue, "OKAY, I'LL STUDY THAT POSITION MORE.");
			variable_global_set(selected + "_training_focus", "_mid");
		}
		can_talk = true;
	
	} else if (array_contains(what_was_said, "FORWARD") && selected_team == global.c10_team) {
	
		if (selected_ata >= 3) {
			array_push(interaction_dialogue, "I'M ALREADY A NATURAL AT THAT POSITION.");
		} else {
			array_push(interaction_dialogue, "OKAY, I'LL STUDY THAT POSITION MORE.");
			variable_global_set(selected + "_training_focus", "_ata");
		}
		can_talk = true;
		
	} else if (array_contains(what_was_said, "NUMBER") && selected_team == global.c10_team) {
	
		negotiation_path = "CHANGE NUMBER";
		array_push(interaction_dialogue, "YOU THINK I SHOULD CHANGE MY NUMBER? TO WHAT?");
		can_talk = true;
	
	} else if (array_contains(what_was_said, "HEY") || array_contains(what_was_said, "HI") || array_contains(what_was_said, "HELLO")) {
	
		array_push(interaction_dialogue, "HI, WHAT'S UP?");
		can_talk = true;
	
	} else if (array_contains(what_was_said, "SORRY")) {
	
		array_push(interaction_dialogue, "APOLOGY ACCEPTED.");
		can_talk = true;
	
	} else if (array_contains(what_was_said, "BYE") || (array_contains(what_was_said, "SEE") && array_contains(what_was_said, "LATER")) || array_contains(what_was_said, "GOODBYE")) {
	
		array_push(interaction_dialogue, choose("SEE YOU LATER.", "UNTIL NEXT TIME.", "GOODBYE"));
	
	} else {
	
		array_push(interaction_dialogue, choose("WHAT DO YOU MEAN?", "I'M CONFUSED."));
		can_talk = true;
	
	}

} else if (person_im_talking_to == "PRESIDENT") {
	
	//CONTEXT
	league = variable_global_get(global.c10_team + "_league");
	good_performance = true;
	if (variable_global_exists(league + "_class")) {
		league_table = variable_global_get(league + "_class");
		if (array_get_index(league_table, global.c10_team) > (array_length(league_table) / 2) - 1) {
			good_performance = false;
		}
	}
	
	if (array_contains(what_was_said, "FUCK") || array_contains(what_was_said, "SHIT") || array_contains(what_was_said, "FUCKING") || array_contains(what_was_said, "BITCH") || array_contains(what_was_said, "CUNT")) {
	
		array_push(interaction_dialogue, "UNPROFESSIONAL... I'LL COME BACK WHEN YOUR IN A BETTER MOOD.");
	
	} else if (negotiation_path == "YOUR RESIGNATION") {
	
		if (array_contains(what_was_said, "YES") || array_contains(what_was_said, "YEAH")) {
			
			array_push(interaction_dialogue, "WELL, OKAY. GOOD LUCK ON YOUR NEXT VENTURE.");
			if (!achievements_completed) {
				achievement_set_completed("YOU'RE NOT THE BOSS OF ME!");
			}
		
		} else {
		
			array_push(interaction_dialogue, "WHAT A WASTE OF TIME...");
		
		}
	
	} else if (negotiation_path == "YOUR NEW CONTRACT") {
	
		if (array_contains(what_was_said, "YES") || array_contains(what_was_said, "YEAH") || array_contains(what_was_said, "OKAY") || array_contains(what_was_said, "OK")) {
			
			global.c10_contract = 4;
			array_push(interaction_dialogue, "LET'S HOPE FOR 3 MORE YEARS OF GREAT WORK!");
		
		} else {
		
			array_push(interaction_dialogue, "COME BACK IF YOU CHANGE YOUR MIND...");
		
		}
	
	} else if (negotiation_path == "IMPROVING THE TRAINING FACILITIES") {
	
		if (array_contains(what_was_said, "YES") || array_contains(what_was_said, "YEAH") || array_contains(what_was_said, "OKAY") || array_contains(what_was_said, "OK")) {
			
			variable_global_set(global.c10_team + "_training", variable_global_get(global.c10_team + "_training") + 1);
			variable_global_set(global.c10_team + "_budget", variable_global_get(global.c10_team + "_budget") - cost_of_renovation);
			array_push(interaction_dialogue, "WE'LL GET IT DONE!");
		
		} else {
		
			array_push(interaction_dialogue, "MAYBE SOME OTHER TIME THEN...");
		
		}
	
	} else if (array_contains(what_was_said, "SHIRTS") || array_contains(what_was_said, "MERCHANDISE") || array_contains(what_was_said, "TICKETS") || array_contains(what_was_said, "MATCHDAY")) {
		
		revenue = lerp(global.min_tickets, global.max_tickets, (variable_global_get(global.c10_team + "_reputation") - 1) / 4);
		array_push(interaction_dialogue, "WE RECEIVE ROUGHLY " + format_number_dots(round(revenue)) + " FROM TICKETS AND MERCHANDISE PER MATCHDAY.");
		can_talk = true;
	
	} else if (array_contains(what_was_said, "TV") || array_contains(what_was_said, "REVENUE") || array_contains(what_was_said, "MONEY")) {
		
		revenue = lerp(global.min_tv, global.max_tv, (variable_global_get(vgg(global.c10_team + "_league") + "_reputation") - 1) / 4);
		array_push(interaction_dialogue, "WE RECEIVE ROUGHLY " + format_number_dots(round(revenue)) + " FROM TV RIGHTS PER MATCH.");
		can_talk = true;
	
	} else if (array_contains(what_was_said, "WAGES")) {
		
		wages = 0;
		available_players = variable_global_get(global.c10_team + "_squad");
		for (var j = 0; j < array_length(available_players); ++j) {
			   wages += vgg(available_players[j] + "_salary");
		}
	
		array_push(interaction_dialogue, "WE'RE PAYING " + format_number_dots(round(wages)) + "/WEEK IN WAGES.");
		can_talk = true;
	
	} else if (array_contains(what_was_said, "SPONSOR") || array_contains(what_was_said, "SPONSORSHIP") || array_contains(what_was_said, "SPONSORS")) {
	
		array_push(interaction_dialogue, "WE RECEIVE " + string(variable_global_get(variable_global_get(global.c10_team + "_sponsor") + "_money")) + " AT THE START OF EVERY SEASON.");
		can_talk = true;
	
	} else if (array_contains(what_was_said, "TRAINING") || array_contains(what_was_said, "YOUTH") || array_contains(what_was_said, "FACILITIES")) {
		
		if (variable_global_get(global.c10_team + "_training") == 1) {
			cost_of_renovation = 10000000;
		} else if (variable_global_get(global.c10_team + "_training") == 2) {
			cost_of_renovation = 30000000;
		} else if (variable_global_get(global.c10_team + "_training") == 3) {
			cost_of_renovation = 60000000;
		} else if (variable_global_get(global.c10_team + "_training") == 4) {
			cost_of_renovation = 100000000;
		}
		
		if (variable_global_get(global.c10_team + "_training") >= 5) {
			array_push(interaction_dialogue, "THEY'RE THE BEST THEY CAN BE.");
		} else if (variable_global_get(global.c10_team + "_budget") >= cost_of_renovation) {
			negotiation_path = "IMPROVING THE TRAINING FACILITIES";
			array_push(interaction_dialogue, "IT WILL COST " + format_number_dots(cost_of_renovation) + ". SHOULD WE DO IT?");
		} else {
			array_push(interaction_dialogue, "IT WOULD COST " + format_number_dots(cost_of_renovation) + ". WE CAN'T DO IT RIGHT NOW.");
		}
		can_talk = true;
	
	} else if (array_contains(what_was_said, "QUIT") || array_contains(what_was_said, "RESIGN")) {
		
		negotiation_path = "YOUR RESIGNATION";
		array_push(interaction_dialogue, "ARE YOU SURE YOU WANT TO QUIT?");
		can_talk = true;
	
	} else if (array_contains(what_was_said, "CONTRACT")) {
		
		if (global.c10_contract <= 1 && good_performance) {
			negotiation_path = "YOUR NEW CONTRACT";
			array_push(interaction_dialogue, "A NEW 3 YEAR DEAL. YES OR NO?");
		} else if (global.c10_contract <= 1 && !good_performance) {
			array_push(interaction_dialogue, "WE CAN ONLY GIVE YOU A NEW CONTRACT IF YOU FINISH AT LEAST IN THE TOP HALF OF THE LEAGUE TABLE.");
		} else {
			array_push(interaction_dialogue, "THERE ARE STILL " + string(global.c10_contract) + " YEARS ON YOUR CONTRACT.");
		}
		can_talk = true;
	
	} else if (array_contains(what_was_said, "DOING") && (array_contains(what_was_said, "HOW") || array_contains(what_was_said, "?")) ) {
	
		array_push(interaction_dialogue, choose("YEAH, I'M DOING OKAY.", "I'M ALRIGHT!"));
		can_talk = true;
	
	} else if (array_contains(what_was_said, "DOING") && !array_contains(what_was_said, "?")) {
	
		array_push(interaction_dialogue, choose("OKAY, COOL.", "THAT'S GOOD TO HEAR!"));
		can_talk = true;
	
	} else if (array_contains(what_was_said, "HEY") || array_contains(what_was_said, "HI") || array_contains(what_was_said, "HELLO")) {
	
		array_push(interaction_dialogue, "HI, WHAT'S UP?");
		can_talk = true;
	
	} else if (array_contains(what_was_said, "SORRY")) {
	
		array_push(interaction_dialogue, "APOLOGY ACCEPTED.");
		can_talk = true;
	
	} else if (array_contains(what_was_said, "BYE") || (array_contains(what_was_said, "SEE") && array_contains(what_was_said, "LATER")) || array_contains(what_was_said, "GOODBYE")) {
	
		array_push(interaction_dialogue, choose("SEE YOU LATER.", "UNTIL NEXT TIME.", "GOODBYE"));
	
	} else {
	
		array_push(interaction_dialogue, choose("WHAT DO YOU MEAN?", "I'M CONFUSED."));
		can_talk = true;
	
	}
	
} else if (person_im_talking_to == "SCOUT") {
	
	if (array_contains(what_was_said, "FUCK") || array_contains(what_was_said, "SHIT") || array_contains(what_was_said, "FUCKING") || array_contains(what_was_said, "BITCH") || array_contains(what_was_said, "CUNT")) {
	
		array_push(interaction_dialogue, "UNPROFESSIONAL... I'LL COME BACK WHEN YOUR IN A BETTER MOOD.");
	
	} else if (array_contains(what_was_said, "RECOMMEND") || array_contains(what_was_said, "RECOMMENDATION") || array_contains(what_was_said, "SUGGEST") || array_contains(what_was_said, "SUGGESTION")) {
	
		scouting_target = "";
		scouting_targets = [];
		minimum_squad_level = lerp(8, 15, (variable_global_get(global.c10_team + "_reputation") - 1) / 4);
		available_players = variable_global_get(global.c10_team + "_squad");
		
		for (var k = 0; k < array_length(global.player_list); ++k) {
			
			if (!array_contains(available_players, global.player_list[k]) && variable_global_get(global.player_list[k] + "_ca") >= minimum_squad_level) {
				array_push(scouting_targets, global.player_list[k]);
			}
			
		}
		randomize();
		if (array_length(scouting_targets) > 0) {
			scouting_target = scouting_targets[irandom(array_length(scouting_targets) - 1)];
		}
		
		if (scouting_target == "") {
			
			negotiation_path = "";
			array_push(interaction_dialogue, "I HAVE NO RECOMMENDATIONS AT THIS TIME.");
			can_talk = true;
			
		} else {
			
			array_push(interaction_dialogue, "MY SUGGESTION: " + variable_global_get(scouting_target + "_firstname") + " " + variable_global_get(scouting_target + "_lastname"));
	
		}
	
	} else if (array_contains(what_was_said, "FREE") || array_contains(what_was_said, "EXPIRING")) {
		
		number_of_freeagents = 0;
		number_of_resigning = 0;
		for (var i = 0; i < array_length(global.player_list); ++i) {
		    if (variable_global_get(global.player_list[i] + "_contract") == 1) {
				number_of_freeagents++;
				if (variable_global_get(global.player_list[i] + "_goals") > 0 || variable_global_get(global.player_list[i] + "_assists") > 0 || variable_global_get(global.player_list[i] + "_tackles") > 0 || variable_global_get(global.player_list[i] + "_cleansheets") > 0) {
					number_of_resigning++;
				}
			}
		}
		if (number_of_freeagents > 0) {
			array_push(interaction_dialogue, "WE HAVE KNOWLEDGE OF " + string(number_of_freeagents) + " PLAYER(S) ON EXPIRING CONTRACTS. IT'S LIKELY THAT ABOUT " + string(number_of_resigning) + " END UP EXTENDING THEIR CONTRACTS.");
			can_talk = true;
		} else {
			array_push(interaction_dialogue, "WE HAVE NO KNOWLEDGE OF PLAYERS ON EXPIRING CONTRACTS, AT THIS TIME.");
			can_talk = true;
		}
	
	} else if (array_contains(what_was_said, "YOUTH")) {
	
		array_push(interaction_dialogue, "YES, LET'S TAKE A LOOK AT OUR YOUTH TEAM.");
	
	} else if (array_contains(what_was_said, "DOING") && (array_contains(what_was_said, "HOW") || array_contains(what_was_said, "?")) ) {
	
		array_push(interaction_dialogue, choose("YEAH, I'M DOING OKAY.", "I'M ALRIGHT, BOSS!"));
		can_talk = true;
	
	} else if (array_contains(what_was_said, "DOING") && !array_contains(what_was_said, "?")) {
	
		array_push(interaction_dialogue, choose("OKAY, COOL.", "THAT'S GOOD TO HEAR!"));
		can_talk = true;
	
	} else if (array_contains(what_was_said, "HEY") || array_contains(what_was_said, "HI") || array_contains(what_was_said, "HELLO")) {
	
		array_push(interaction_dialogue, "HI, WHAT'S UP?");
		can_talk = true;
	
	} else if (array_contains(what_was_said, "SORRY")) {
	
		array_push(interaction_dialogue, "APOLOGY ACCEPTED.");
		can_talk = true;
	
	} else if (array_contains(what_was_said, "BYE") || (array_contains(what_was_said, "SEE") && array_contains(what_was_said, "LATER")) || array_contains(what_was_said, "GOODBYE")) {
	
		array_push(interaction_dialogue, choose("SEE YOU LATER.", "UNTIL NEXT TIME.", "GOODBYE"));
	
	} else {
	
		array_push(interaction_dialogue, choose("WHAT DO YOU MEAN?", "I'M CONFUSED."));
		can_talk = true;
	
	}
	
} else if (person_im_talking_to == variable_global_get(selected_team + "_abrv") + " D.O.F.") {
	
	// CONTEXT
	has_offer_currently = false;
	offer_index = 0;
	for (var i = 0; i < array_length(selected_offers); ++i) {
	    if (selected_offers[i].team == global.c10_team) {
			has_offer_currently = true;
			offer_index = i;
			break;
		}
		
	}
	
	if (contains_number && negotiation_path == "THE TRANSFER MOVE") {
	
		if (number <= transfer_fee * 0.6) {
			
			array_push(interaction_dialogue, "THAT'S JUST INSULTING...");
			can_talk = true;
			
		} else if (number < transfer_fee * 0.9) {
			
			array_push(interaction_dialogue, "WE'RE CLOSE TO AN AGREEMENT...");
			can_talk = true;
			
		} else {
		
			array_push(interaction_dialogue, "WE ACCEPT. WE'LL SET UP A MEETING TO DISCUSS TERMS WITH THE PLAYER.");
			offer = {team: global.c10_team, type: "TRANSFER", fee: number, team_reputation: variable_global_get(global.c10_team + "_reputation"), salary: number, contract: 0};
		
		}
	
	} else if ((array_contains(what_was_said, "CONTRACT") || array_contains(what_was_said, "FREE")) && selected_contract < 2 && negotiation_path == "THE TRANSFER MOVE") {
		
		if (array_get_index(variable_global_get(variable_global_get(selected + "_og_team") + "_squad"), selected) < 5) {
			array_push(interaction_dialogue, "THAT'S TRUE, BUT WE INTEND TO EXTEND HIS CONTRACT.");
		} else {
			transfer_fee = transfer_fee / 2;
			array_push(interaction_dialogue, "THAT'S TRUE. WE'LL COME DOWN TO " + format_number_dots(round(transfer_fee)));
		}
		can_talk = true;
	
	} else if ((array_contains(what_was_said, "OKAY") || array_contains(what_was_said, "OK") || array_contains(what_was_said, "ACCEPT") || array_contains(what_was_said, "AGREED")) && negotiation_path == "THE TRANSFER MOVE") {
	
		array_push(interaction_dialogue, "GREAT. WE'LL SET UP A MEETING TO DISCUSS TERMS WITH THE PLAYER.");
		offer = {team: global.c10_team, type: "TRANSFER", fee: transfer_fee, team_reputation: variable_global_get(global.c10_team + "_reputation"), salary: 0,	contract: 0};
	
	} else if (array_contains(what_was_said, "FUCK") || array_contains(what_was_said, "SHIT") || array_contains(what_was_said, "FUCKING") || array_contains(what_was_said, "BITCH") || array_contains(what_was_said, "CUNT")) {
	
		array_push(interaction_dialogue, "UNPROFESSIONAL... NO DEAL FOR YOU.");
	
	} else if ( ( array_contains(what_was_said, "CANCEL") || array_contains(what_was_said, "REMOVE") ) && has_offer_currently) {
		
		array_delete(selected_offers, offer_index, 1);
		array_push(interaction_dialogue, "OK. OFFER CANCELED. SEE YOU LATER");
	
	} else if (array_contains(what_was_said, "TRANSFER") || array_contains(what_was_said, "BUY") || array_contains(what_was_said, "PERMANENT")) {
		
		transfer_fee = round(selected_value);
		response = "";
					
		if (array_length(variable_global_get(selected_og_team + "_squad")) < 5) {
			transfer_fee = transfer_fee * 5;
			response = "HE IS VERY IMPORTANT TO US, SO ";
		}
					
		if (array_get_index(variable_global_get(selected_og_team + "_squad"), selected) < 5) {
			transfer_fee = transfer_fee * 2.5;
			response = "HE IS VERY IMPORTANT TO US, SO ";
		}
		
		if (variable_global_get(selected + "_age") < 20) {
			response = "WE BELIEVE IN HIS POTENTIAL, SO ";
		}
		
		if (array_contains(global.player_transfers, selected)) {
			transfer_fee = transfer_fee * 0.75;
			response = "WE'RE OPEN TO SELLING HIM, SO ";
		}
		
		if (variable_global_get(selected_og_team + "_league") == variable_global_get(global.c10_team + "_league")) {
			transfer_fee = transfer_fee * 4;
			response = "WE DON'T WANT TO SELL HIM TO SOMEONE IN OUR LEAGUE, SO ";
		}
		
		negotiation_path = "THE TRANSFER MOVE";
		response += "WE'RE EXPECTING AROUND " + format_number_dots(round(transfer_fee)) + ".";
		array_push(interaction_dialogue, response);
		can_talk = true;
	
	} else if (array_contains(what_was_said, "LOAN") || array_contains(what_was_said, "LOANING") || array_contains(what_was_said, "LOANED")) {
		
		if (array_contains(global.player_loans, selected)) {
			
			my_league_reputation = variable_global_get(variable_global_get(selected_team + "_league") + "_reputation");
			league_reputation = variable_global_get(variable_global_get(global.c10_team + "_league") + "_reputation");
			offer_accepted = true;
			if (my_league_reputation - league_reputation > 2) {
				offer_accepted = false;
			}
			
			if (offer_accepted) {
				
				array_push(interaction_dialogue, "WE WILL CONSIDER THIS LOAN MOVE. HIS FATE WILL BE DECIDED WITHIN THE WEEK.");
					
				offer = {team: global.c10_team, type: "LOAN", fee: 0, team_reputation: variable_global_get(global.c10_team + "_reputation"), salary: 0, contract: 0};
				offer_push(selected, offer, global.c10_team);
				
			} else {
				
				array_push(interaction_dialogue, "WE'D LIKE HIM TO PLAY AT A HIGHER LEVEL.");
				
			}
				
		} else {
			
			array_push(interaction_dialogue, "WE ARE NOT LOOKING TO LOAN THIS PLAYER RIGHT NOW.");
					
		}
	
	} else if (array_contains(what_was_said, "HI") && array_contains(what_was_said, "WANT") && array_contains(what_was_said, "TALK") && array_contains(what_was_said, "ABOUT") ) {
	
		array_push(interaction_dialogue, "ARE YOU THINKING OF A LOAN OR PERMANENT TRANSFER?");
		can_talk = true;
	
	} else if (array_contains(what_was_said, "DOING") && (array_contains(what_was_said, "HOW") || array_contains(what_was_said, "?")) ) {
	
		array_push(interaction_dialogue, choose("YEAH, I'M DOING OKAY.", "I'M ALRIGHT!"));
		can_talk = true;
	
	} else if (array_contains(what_was_said, "DOING") && !array_contains(what_was_said, "?")) {
	
		array_push(interaction_dialogue, choose("OKAY, COOL.", "THAT'S GOOD TO HEAR!"));
		can_talk = true;
	
	} else if (array_contains(what_was_said, "HEY") || array_contains(what_was_said, "HI") || array_contains(what_was_said, "HELLO")) {
	
		array_push(interaction_dialogue, "HI, WHAT'S UP?");
		can_talk = true;
	
	} else if (array_contains(what_was_said, "SORRY")) {
	
		array_push(interaction_dialogue, "APOLOGY ACCEPTED.");
		can_talk = true;
	
	} else if (array_contains(what_was_said, "BYE") || (array_contains(what_was_said, "SEE") && array_contains(what_was_said, "LATER")) || array_contains(what_was_said, "GOODBYE")) {
	
		array_push(interaction_dialogue, choose("SEE YOU LATER.", "UNTIL NEXT TIME.", "GOODBYE"));
	
	} else {
	
		array_push(interaction_dialogue, choose("WHAT DO YOU MEAN?", "I'M CONFUSED."));
		can_talk = true;
	
	}
	
}

alarm[3] = 90;

