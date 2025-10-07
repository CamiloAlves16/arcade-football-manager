if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 0, 0, 60, 40)) {
	
	esc_option_index = 1;
	audio_play_sound(snd_key,1,false);
	keyboard_virtual_hide();
	room = rm_titlescreen;
	
}

if (array_length(warnings) > 0) {
	
	if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 180-100, option1_y-15, 180+100, option1_y+15)) {
		
		audio_play_sound(snd_key,1,false);
		option1_index = 1;
		alarm[1] = 15;
		
	}
	
} else {
	
	if (screen == "ACHIEVEMENTS") {
	
		for (var i = 0; i < max_display; ++i) {
			
			if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 50, 50 + ((i)*20) - 6, 300, 50 + ((i)*20) + 6)) {
				selected_index = i;
			}
			
		}
		
		if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 180-100, option1_y-15, 180+100, option1_y+15)) {
	
			if (screen == "ACHIEVEMENTS") {
			
				audio_play_sound(snd_key,1,false);
				option1_index = 1;
				alarm[0] = 15;
		
			}
	
		}		
	
	}

}
