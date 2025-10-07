global.fnt_numbers = font_add_sprite_ext(spr_numbers,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,:-+/%'?!()[]{}|;",1,1);

global.alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

global.c_gold = make_color_rgb(255,215,0);

global.c_bluer = make_color_rgb(32,34,102);

global.c_whiteskin = make_color_rgb(255,170,85);

global.c_lightskin = make_color_rgb(189,136,99);

global.c_darkskin = make_color_rgb(90,26,0);

global.warning_mode = "ALL";
global.gamemode = "career mode";
global.TBD_name = "TO BE DETERMINED";
global.TBD_abrv = "T.B.D.";

global.achievement_list = [
{ach_title: "THE SPECIAL ONE, PT. 1", ach_text: "WIN THE CHAMPIONS CUP.", ach_status: false},
{ach_title: "THE SPECIAL ONE, PT. 2", ach_text: "WIN THE EUROPE CUP.", ach_status: false},
{ach_title: "THE SPECIAL ONE, PT. 3", ach_text: "CLAIM TO BE THE SPECIAL ONE.", ach_status: false},
{ach_title: "YOU'RE NOT THE BOSS OF ME!", ach_text: "RESIGN FROM YOUR JOB AS MANAGER.", ach_status: false},
{ach_title: "THE REF IS THE PROBLEM!", ach_text: "RECEIVE A YELLOW CARD, DURING A GAME.", ach_status: false},
{ach_title: "YOUNG PEOPLE ARE THE FUTURE!", ach_text: "PROMOTE A YOUTH PLAYER TO THE FIRST TEAM.", ach_status: false},
{ach_title: "CLASSIC NUMBER 10", ach_text: "CHANGE ONE OF YOUR PLAYER'S NUMBER TO 10.", ach_status: false}
];



option1_y = 200;
option2_y = 250;
option3_y = 300;
option4_y = 350;
option5_y = 400;

teamcode = "t10";
tactic1 = [];
gk = {pos: "GK", pos_x: 180, pos_y: 75};array_push(tactic1, gk);
cd = {pos: "CD", pos_x: 180, pos_y: 120};array_push(tactic1, cd);
cm = {pos: "CM", pos_x: 180, pos_y: 220};array_push(tactic1, cm);
rf = {pos: "RF", pos_x: 75, pos_y: 320};array_push(tactic1, rf);
cf = {pos: "CF", pos_x: 180, pos_y: 320};array_push(tactic1, cf);

function vgg(variable) {
	
	return variable_global_get(variable); 
	
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

function calculate_salary(player) {
	
	player_salary = lerp(global.min_wage, global.max_wage, (variable_global_get(player + "_ca") - 8) / (22 - 8));
	player_salary = lerp(player_salary/5, player_salary, (variable_global_get(player + "_reputation") - 1) / 4);
	variable_global_set(player + "_salary", abs(player_salary));
	
}

function db_team_push(name, abrv, color1, color2, color3, kittype, badge, league, budget, reputation) {
	
	randomize();
	// Calculate the new team ID
	idnumber = 10 + array_length(global.team_list);
	idcode = "t" + string(idnumber);
	// Set team info dynamically
	variable_global_set(idcode + "_name", name);
	if (league == "l100") {
		variable_global_set(idcode + "_type", "national team");
		variable_global_set(idcode + "_country", name);
	} else {
		variable_global_set(idcode + "_type", "normal");
		variable_global_set(idcode + "_country", vgg(league + "_country"));
	}
	variable_global_set(idcode + "_abrv", abrv);
	variable_global_set(idcode + "_league", league);
	variable_global_set(idcode + "_sponsor", "afm");
	if (reputation > 3) {
		variable_global_set(idcode + "_sponsor", choose("zola","nobet","l8te"));
	} else if (reputation > 2) {
		variable_global_set(idcode + "_sponsor", choose("gulp","feel"));
	}
	variable_global_set(idcode + "_coach", "");
	variable_global_set(idcode + "_color1", color1);
	variable_global_set(idcode + "_color2", color2);
	variable_global_set(idcode + "_color3", color3);
	variable_global_set(idcode + "_kittype", kittype);
	variable_global_set(idcode + "_badge", badge);
	variable_global_set(idcode + "_budget", budget);
	variable_global_set(idcode + "_reputation", reputation);
	variable_global_set(idcode + "_training", reputation);
	variable_global_set(idcode + "_points", 0);
	variable_global_set(idcode + "_goals", 0);
	variable_global_set(idcode + "_squad", array_create(0));
	variable_global_set(idcode + "_u19_squad", array_create(0));
	array_push(global.team_list, idcode);
	if (variable_global_exists(league + "_class")) {
		array_push(variable_global_get(string(league) + "_class"), idcode);
	}
	variable_global_set(idcode + "_tactic", copy_tactic_array(tactic1));
	
}

function db_coach_push(firstname, lastname, age, sc, country, team, reputation, mentality) {
	
	// Calculate the new player ID
	idnumber = 10 + array_length(global.coach_list);
	idcode = "c" + string(idnumber);
	// Set player attributes dynamically
	variable_global_set(idcode + "_firstname", firstname);
	variable_global_set(idcode + "_lastname", lastname);
	variable_global_set(idcode + "_age", age);
	variable_global_set(idcode + "_sc", sc);
	variable_global_set(idcode + "_country", country);
	variable_global_set(idcode + "_team", team);
	variable_global_set(idcode + "_mentality", mentality);
	variable_global_set(idcode + "_reputation", reputation);
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
		array_push(global.coach_freeagent,idcode);
		variable_global_set(idcode + "_contract", 0);
	} else {
		variable_global_set(coach_team + "_coach", idcode);
		variable_global_set(idcode + "_contract", irandom_range(2,4));
	}
	
}

function db_player_push(firstname, lastname, age, sc, country, team, pos, number, spd, tkl, sta, tec, gk, def, mid, ata, potential, reputation) {
	
	// Calculate the new player ID
	idnumber = 100 + array_length(global.player_list);
	idcode = "p" + string(idnumber);
	// Set player attributes dynamically
	variable_global_set(idcode + "_firstname", firstname);
	variable_global_set(idcode + "_lastname", lastname);
	variable_global_set(idcode + "_age", age);
	variable_global_set(idcode + "_sc", sc);
	variable_global_set(idcode + "_country", country);
	variable_global_set(idcode + "_team", team);
	variable_global_set(idcode + "_og_team", team);
	variable_global_set(idcode + "_pos", pos);
	variable_global_set(idcode + "_number", number);
	variable_global_set(idcode + "_spd", spd);
	variable_global_set(idcode + "_tkl", tkl);
	variable_global_set(idcode + "_sta", sta);
	variable_global_set(idcode + "_tec", tec);
	variable_global_set(idcode + "_gk", gk);
	variable_global_set(idcode + "_def", def);
	variable_global_set(idcode + "_mid", mid);
	variable_global_set(idcode + "_ata", ata);
	if (gk == 3) {
		variable_global_set(idcode + "_training_focus", "_tkl");
	} else {
		variable_global_set(idcode + "_training_focus", "_tec");
	}
	variable_global_set(idcode + "_ca", vgg(idcode + "_spd") + vgg(idcode + "_tkl") + variable_global_get(idcode + "_sta") + variable_global_get(idcode + "_tec") + variable_global_get(idcode + "_gk") + variable_global_get(idcode + "_def") + variable_global_get(idcode + "_mid") + variable_global_get(idcode + "_ata"));
	variable_global_set(idcode + "_potential", variable_global_get(idcode + "_ca") + potential);
	variable_global_set(idcode + "_reputation", reputation);
	variable_global_set(idcode + "_xp", 0);
	variable_global_set(idcode + "_injury", 0);
	variable_global_set(idcode + "_goals", 0);
	variable_global_set(idcode + "_assists", 0);
	variable_global_set(idcode + "_tackles", 0);
	variable_global_set(idcode + "_cleansheets", 0);
	variable_global_set(idcode + "_transfer_eligible", true);
	variable_global_set(idcode + "_offers_received", array_create(0));
	variable_global_set(idcode + "_offers", array_create(0));
	// Add player to the global list
	array_push(global.player_list, idcode);
	player_team = variable_global_get(string(idcode) + "_team");
	if (player_team == "freeagent") {
		array_push(global.player_freeagent,idcode);
		variable_global_set(idcode + "_contract", 0);
	} else {
		team_array = variable_global_get(string(player_team) + "_squad");
		array_push(team_array,idcode);
		variable_global_set(idcode + "_contract", choose(2, 3));
	}
	calculate_salary(idcode);
	
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

function loadgame() {
	
	ini_open("gamesave.sav");

	// Read GameData
	global.week = ini_read_real("GameData", "week", 1);
	global.year = ini_read_real("GameData", "year", 2026);
	global.warning_mode = ini_read_string("GameData", "warning_mode", "ALL");

	var event_count = ini_read_real("GameData", "event_count", 0);
	global.events = [];
	for (var i = 0; i < event_count; i++) {
	    event = {
	        week: ini_read_real("GameData", "event" + string(i) + "_week", 0),
	        type: ini_read_string("GameData", "event" + string(i) + "_type", ""),
	        competition: ini_read_string("GameData", "event" + string(i) + "_competition", ""),
	        phase: ini_read_string("GameData", "event" + string(i) + "_phase", ""),
	        played: ini_read_real("GameData", "event" + string(i) + "_played", 0),
			watch: ini_read_real("GameData", "event" + string(i) + "_watch", 0),
	        hometeam: ini_read_string("GameData", "event" + string(i) + "_hometeam", ""),
	        awayteam: ini_read_string("GameData", "event" + string(i) + "_awayteam", ""),
	        home_goals: ini_read_real("GameData", "event" + string(i) + "_home_goals", 0),
	        away_goals: ini_read_real("GameData", "event" + string(i) + "_away_goals", 0)
	    };

	    array_push(global.events,event);
	}

	// Read league data	
	var league_count = ini_read_real("league_list", "league_count", 0);
	global.league_list = array_create(league_count);
	for (var i = 0; i < league_count; i++) {
	    global.league_list[i] = ini_read_string("league_list", "league" + string(i), "");
	}
	
	for (var i = 0; i < league_count; ++i) {
		
	    var league = string(global.league_list[i]);
		
		var league_team_count = ini_read_real("league_list", string(league) + "team_count", 0);
	    variable_global_set(league + "_class", array_create(0));
	    for (var f = 0; f < league_team_count; f++) {
	        array_push(variable_global_get(league + "_class"), ini_read_string("league_list", string(league) + "_team" + string(f), ""));
	    }
		
	}
	
	// Read team list
	var team_list_count = ini_read_real("team_list", "team_count", 0);
	global.team_list = array_create(team_list_count);
	for (var i = 0; i < team_list_count; i++) {
	    global.team_list[i] = ini_read_string("team_list", "team" + string(i), "");
	}

	// Read each team
	for (var i = 0; i < team_list_count; ++i) {
	    var team = string(global.team_list[i]);

	    variable_global_set(string(team) + "_name", ini_read_string("team_list", string(team) + "_name", ""));
	    variable_global_set(string(team) + "_abrv", ini_read_string("team_list", string(team) + "_abrv", ""));
		variable_global_set(string(team) + "_country", ini_read_string("team_list", string(team) + "_country", ""));
		variable_global_set(string(team) + "_league", ini_read_string("team_list", string(team) + "_league", ""));
		variable_global_set(string(team) + "_sponsor", ini_read_string("team_list", string(team) + "_sponsor", ""));
		variable_global_set(string(team) + "_coach", ini_read_string("team_list", string(team) + "_coach", ""));
	    variable_global_set(string(team) + "_badge", ini_read_real("team_list", string(team) + "_badge", 0));
		variable_global_set(string(team) + "_budget", ini_read_real("team_list", string(team) + "_budget", 0));
		variable_global_set(string(team) + "_type", ini_read_string("team_list", string(team) + "_type", ""));
		variable_global_set(string(team) + "_kittype", ini_read_string("team_list", string(team) + "_kittype", ""));
	    variable_global_set(string(team) + "_color1", ini_read_real("team_list", string(team) + "_color1", 0));
	    variable_global_set(string(team) + "_color2", ini_read_real("team_list", string(team) + "_color2", 0));
		variable_global_set(string(team) + "_color3", ini_read_real("team_list", string(team) + "_color3", 0));
		variable_global_set(string(team) + "_reputation", ini_read_real("team_list", string(team) + "_reputation", 1));
		variable_global_set(string(team) + "_training", ini_read_real("team_list", string(team) + "_training", 1));
	    variable_global_set(string(team) + "_goals", ini_read_real("team_list", string(team) + "_goals", 0));
	    variable_global_set(string(team) + "_points", ini_read_real("team_list", string(team) + "_points", 0));

	    var team_squad_count = ini_read_real("team_list", string(team) + "squad_count", 0);
	    variable_global_set(string(team) + "_squad", array_create(0));
	    for (var f = 0; f < team_squad_count; f++) {
	        array_push(variable_global_get(string(team) + "_squad"), ini_read_string("team_list", string(team) + "_squad" + string(f), ""));
	    }
		
		var team_u19_squad_count = ini_read_real("team_list", string(team) + "u19_squad_count", 0);
	    variable_global_set(string(team) + "_u19_squad", array_create(0));
	    for (var f = 0; f < team_u19_squad_count; f++) {
	        array_push(variable_global_get(string(team) + "_u19_squad"), ini_read_string("team_list", string(team) + "_u19_squad" + string(f), ""));
	    }
		
	    var tactic = [];
	    for (var f = 0; f < 5; f++) {
			current_pos = {
				pos: ini_read_string("team_list", string(team) + "position" + string(f) + "_pos", ""),
				pos_x: ini_read_real("team_list", string(team) + "position" + string(f) + "_pos_x", 180),
				pos_y: ini_read_real("team_list", string(team) + "position" + string(f) + "_pos_y", 190)
			}
			array_push(tactic, current_pos);
	    }
	    variable_global_set(string(team) + "_tactic", tactic);
	    
	}
	
	// Read coach list
	var coach_list_count = ini_read_real("coach_list", "coach_count", 0);
	global.coach_list = array_create(coach_list_count);
	for (var i = 0; i < coach_list_count; i++) {
	    global.coach_list[i] = ini_read_string("coach_list", "coach" + string(i), "");
	}

	// Read free agents
	var freeagent_count = ini_read_real("coach_list", "freeagent_count", 0);
	global.coach_freeagent = array_create(freeagent_count);
	for (var i = 0; i < freeagent_count; i++) {
	    global.coach_freeagent[i] = ini_read_string("coach_list", "freeagent" + string(i), "");
	}

	// Read each coach
	for (var i = 0; i < coach_list_count; ++i) {
	    var coach = string(global.coach_list[i]);

	    variable_global_set(string(coach) + "_firstname", ini_read_string("coach_list", string(coach) + "_firstname", ""));
		variable_global_set(string(coach) + "_lastname", ini_read_string("coach_list", string(coach) + "_lastname", ""));
	    variable_global_set(string(coach) + "_age", ini_read_real("coach_list", string(coach) + "_age", 20));
	    variable_global_set(string(coach) + "_contract", ini_read_real("coach_list", string(coach) + "_contract", 0));
	    variable_global_set(string(coach) + "_sc", ini_read_real("coach_list", string(coach) + "_sc", 0));
		variable_global_set(string(coach) + "_country", ini_read_string("coach_list", string(coach) + "_country", ""));
	    variable_global_set(string(coach) + "_team", ini_read_string("coach_list", string(coach) + "_team", "freeagent"));
	    variable_global_set(string(coach) + "_xp", ini_read_string("coach_list", string(coach) + "_mentality", "balanced"));
		variable_global_set(string(coach) + "_reputation", ini_read_real("coach_list", string(coach) + "_reputation", 0));
		
		var coach_offers_count = ini_read_real("coach_list", string(coach) + "offers_count", 0);
	    var coach_offers = [];
	    for (var f = 0; f < coach_offers_count; f++) {
			offer = {
				team: ini_read_string("coach_list", string(coach) + "offer" + string(f) + "_team", ""),
				team_reputation: ini_read_real("coach_list", string(coach) + "offer" + string(f) + "_team_reputation", 0),
				contract: ini_read_real("coach_list", string(coach) + "offer" + string(f) + "_contract", 0)
			}
			array_push(coach_offers,offer);
	    }
	    variable_global_set(string(coach) + "_offers", coach_offers);
		
		var coach_offers_received_count = ini_read_real("coach_list", string(coach) + "coach_offers_received_count", 0);
	    variable_global_set(string(coach) + "_offers_received", array_create(0));
	    for (var f = 0; f < coach_offers_received_count; f++) {
	        array_push(variable_global_get(string(coach) + "_offers_received"), ini_read_string("coach_list", string(coach) + "_offers_received" + string(f), ""));
	    }
		
	}

	// Read player list
	var player_list_count = ini_read_real("player_list", "player_count", 0);
	global.player_list = array_create(player_list_count);
	for (var i = 0; i < player_list_count; i++) {
	    global.player_list[i] = ini_read_string("player_list", "player" + string(i), "");
	}

	// Read free agents
	var freeagent_count = ini_read_real("player_list", "freeagent_count", 0);
	global.player_freeagent = array_create(freeagent_count);
	for (var i = 0; i < freeagent_count; i++) {
	    global.player_freeagent[i] = ini_read_string("player_list", "freeagent" + string(i), "");
	}
	
	// Read free agents
	var loans_count = ini_read_real("player_list", "loans_count", 0);
	global.player_loans = array_create(loans_count);
	for (var i = 0; i < loans_count; i++) {
	    global.player_loans[i] = ini_read_string("player_list", "loans" + string(i), "");
	}
	
	var transfers_count = ini_read_real("player_list", "transfers_count", 0);
	global.player_transfers = array_create(transfers_count);
	for (var i = 0; i < transfers_count; i++) {
	    global.player_transfers[i] = ini_read_string("player_list", "transfers" + string(i), "");
	}

	// Read each player
	for (var i = 0; i < player_list_count; ++i) {
	    var player = string(global.player_list[i]);

	    variable_global_set(string(player) + "_firstname", ini_read_string("player_list", string(player) + "_firstname", ""));
		variable_global_set(string(player) + "_lastname", ini_read_string("player_list", string(player) + "_lastname", ""));
	    variable_global_set(string(player) + "_age", ini_read_real("player_list", string(player) + "_age", 16));
		variable_global_set(string(player) + "_country", ini_read_string("player_list", string(player) + "_country", ""));
		variable_global_set(string(player) + "_reputation", ini_read_real("player_list", string(player) + "_reputation", 5));
	    variable_global_set(string(player) + "_contract", ini_read_real("player_list", string(player) + "_contract", 0));
		variable_global_set(string(player) + "_salary", ini_read_real("player_list", string(player) + "_salary", 10000));
	    variable_global_set(string(player) + "_sc", ini_read_real("player_list", string(player) + "_sc", 0));
	    variable_global_set(string(player) + "_number", ini_read_real("player_list", string(player) + "_number", 0));
	    variable_global_set(string(player) + "_team", ini_read_string("player_list", string(player) + "_team", ""));
		variable_global_set(string(player) + "_og_team", ini_read_string("player_list", string(player) + "_og_team", ""));
		variable_global_set(string(player) + "_pos", ini_read_string("player_list", string(player) + "_pos", ""));
		variable_global_set(string(player) + "_training_focus", ini_read_string("player_list", string(player) + "_training_focus", ""));
	    variable_global_set(string(player) + "_spd", ini_read_real("player_list", string(player) + "_spd", 0));
	    variable_global_set(string(player) + "_tkl", ini_read_real("player_list", string(player) + "_tkl", 0));
		variable_global_set(string(player) + "_sta", ini_read_real("player_list", string(player) + "_sta", 0));
		variable_global_set(string(player) + "_tec", ini_read_real("player_list", string(player) + "_tec", 0));
		variable_global_set(string(player) + "_gk", ini_read_real("player_list", string(player) + "_gk", 1));
	    variable_global_set(string(player) + "_def", ini_read_real("player_list", string(player) + "_def", 1));
		variable_global_set(string(player) + "_mid", ini_read_real("player_list", string(player) + "_mid", 1));
		variable_global_set(string(player) + "_ata", ini_read_real("player_list", string(player) + "_ata", 1));
		variable_global_set(string(player) + "_ca", ini_read_real("player_list", string(player) + "_ca", 0));
	    variable_global_set(string(player) + "_xp", ini_read_real("player_list", string(player) + "_xp", 0));
		variable_global_set(string(player) + "_potential", ini_read_real("player_list", string(player) + "_potential", 0));
		variable_global_set(string(player) + "_injury", ini_read_real("player_list", string(player) + "_injury", 0));
		variable_global_set(string(player) + "_goals", ini_read_real("player_list", string(player) + "_goals", 0));
		variable_global_set(string(player) + "_assists", ini_read_real("player_list", string(player) + "_assists", 0));
		variable_global_set(string(player) + "_tackles", ini_read_real("player_list", string(player) + "_tackles", 0));
		variable_global_set(string(player) + "_cleansheets", ini_read_real("player_list", string(player) + "_cleansheets", 0));
		variable_global_set(string(player) + "_transfer_eligible", ini_read_real("player_list", string(player) + "_transfer_eligible", 0));
		variable_global_set(string(player) + "_value", ini_read_real("player_list", string(player) + "_value", 1000000));
		
		var player_offers_count = ini_read_real("player_list", string(player) + "offers_count", 0);
	    var player_offers = [];
	    for (var f = 0; f < player_offers_count; f++) {
			offer = {
				team: ini_read_string("player_list", string(player) + "offer" + string(f) + "_team", ""),
				type: ini_read_string("player_list", string(player) + "offer" + string(f) + "_type", "LOAN"),
				fee: ini_read_real("player_list", string(player) + "offer" + string(f) + "_fee", 0),
				team_reputation: ini_read_real("player_list", string(player) + "offer" + string(f) + "_team_reputation", 0),
				salary: ini_read_real("player_list", string(player) + "offer" + string(f) + "_salary", 0),
				contract: ini_read_real("player_list", string(player) + "offer" + string(f) + "_contract", 0)
			}
			array_push(player_offers,offer);
	    }
	    variable_global_set(string(player) + "_offers", player_offers);
		
		var player_offers_received_count = ini_read_real("player_list", string(player) + "player_offers_received_count", 0);
	    variable_global_set(string(player) + "_offers_received", array_create(0));
	    for (var f = 0; f < player_offers_received_count; f++) {
	        array_push(variable_global_get(string(player) + "_offers_received"), ini_read_string("player_list", string(player) + "_offers_received" + string(f), ""));
	    }
		
	}

	ini_close();
}

if (file_exists("achievements.sav")) {
	
	ini_open("achievements.sav");
	
	for (var i = 0; i < array_length(global.achievement_list); ++i) {
	    
		global.achievement_list[i].ach_status = ini_read_real("ach", global.achievement_list[i].ach_title + "_status", 0);
		
	}
	
	ini_close();
	
}

event_user(0);
array_sort(global.events, calendar_sort);