
if (speech_cooldown > 0) {
	speech_cooldown--;
	alarm[0] = 60;
}
if (speech_cooldown < 3) {
	coach_speech = "";
}
