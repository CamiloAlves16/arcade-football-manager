if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 0, 0, 60, 40)) {
	
	room = rm_titlescreen;
	audio_play_sound(snd_key,1,false);
	
}