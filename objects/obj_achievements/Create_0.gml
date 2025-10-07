selected_index = 0;
max_display = 0;

warnings = [];

option1 = "DETAILS";
option1_x = 180;
option1_y = 570;
option1_index = 0;

esc_option_index = 0;

ach_completed = 0;

for (var i = 0; i < array_length(global.achievement_list); ++i) {
    if (global.achievement_list[i].ach_status) {
		ach_completed++;
	}
}

completed_pct = round((ach_completed/array_length(global.achievement_list)) * 100);

screen = "ACHIEVEMENTS";