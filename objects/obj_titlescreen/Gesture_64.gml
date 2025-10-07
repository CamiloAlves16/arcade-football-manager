if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 180-100, option1_y-15, 180+100, option1_y+15) && file_exists("gamesave.sav")) {
	
	global.mainmenu_tutorial = true;
	global.squadpage_tutorial = true;
	global.contacts_tutorial = true;
	global.offers_tutorial = true;
	global.playerpage_tutorial = true;
	audio_play_sound(snd_key,1,false);
	loadgame();
	room = rm_career_mode;
			
} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 180-100, option2_y-15, 180+100, option2_y+15)) {
	
	global.mainmenu_tutorial = false;
	global.squadpage_tutorial = false;
	global.contacts_tutorial = false;
	global.offers_tutorial = false;
	global.playerpage_tutorial = false;
	audio_play_sound(snd_key,1,false);
	room = rm_char_create;
	
} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 180-100, option3_y-15, 180+100, option3_y+15)) {
	
	audio_play_sound(snd_key,1,false);
	room = rm_achievements;
		
} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 180-100, option4_y-15, 180+100, option4_y+15)) {
	
	audio_play_sound(snd_key,1,false);
	room = rm_credits;
		
} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 180-100, option5_y-15, 180+100, option5_y+15)) {
	
	audio_play_sound(snd_key,1,false);
	game_end();
		
} else if (point_in_circle(event_data[?"posX"], event_data[?"posY"], 180, 500, 20)) {
	
	audio_play_sound(snd_menu,1,false);
	url_open_ext("https://discord.gg/gb3XwRPKzv", "_blank");
		
}