/// @description TIMECLOCK

if (timeclock > 0) {
	
	timeclock--;
	alarm[1] = 60;
	
	if (timeclock == 0) {
		audio_play_sound(snd_whistle,1,false);
	}
	
} else {
	
	alarm[0] = 1;
	
}