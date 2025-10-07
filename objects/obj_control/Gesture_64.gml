if (screen == "end") { // END/RESTART GAME SCREEN ____________________________________________________________________________________________
	
	stats_update();
	room = rm_career_mode;
		
	if (instance_exists(obj_goal)) {
		instance_destroy(obj_goal);
	}
		
	audio_play_sound(snd_menu,1,false);
	
} else {
	
	
	
}