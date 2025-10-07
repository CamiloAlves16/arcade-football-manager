if (screen == "INTERACTION") {
	
	if (keyboard_check_pressed(vk_enter)) {
		
		array_push(interaction_dialogue, interaction_write);
		keyboard_string = "";
		keyboard_virtual_hide();
		can_talk = false;
		alarm[2] = irandom_range(60,120);
		
	}
	
}

selected_index = clamp(selected_index, 0, max_display);
