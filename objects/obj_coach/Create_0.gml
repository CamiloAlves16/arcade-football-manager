name = string_copy(variable_global_get(coach_id + "_firstname"), 1, 1) + "." + string_copy(variable_global_get(coach_id + "_lastname"), 1, 1) + ".";
sc = variable_global_get(coach_id + "_sc");
team = variable_global_get(coach_id + "_team");
team_color1 = variable_global_get(team + "_color1");
carded = false;

sprite = spr_idle_3;
dir = 3;

coach_thougth = "";
coach_speech = "";
speech_cooldown = 0;
option1_index = 0;
ref_count = 0;

my_players = [];
for (var i = 0; i < array_length(obj_control.player_list); ++i) {
	
    if (variable_global_get(obj_control.player_list[i].team) == team) {
		array_push(my_players, obj_control.player_list[i]);
	}
	
}

squad = variable_global_get(team + "_squad");

things_you_can_say = ["C'MON GUYS, GIVE IT ALL YOU GOT!!", "DON'T WORRY, WE GOT THIS!", "I AM THE SPECIAL ONE :)", "CAN'T BELIEVE I'M COACHING THIS STUPID TEAM...", "RRRREEEEEEFFFFF!!!!!!"];

achievements_completed = true;
for (var i = 0; i < array_length(global.achievement_list); ++i) {
	if (!global.achievement_list[i].ach_status) {
		achievements_completed = false;
		break;
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