if (keyboard_check_pressed(vk_enter)) {
	
	keyboard_virtual_hide();
	
	if (screen != array_last(screens)) {
			
		keyboard_string = "";
		screen = screens[array_get_index(screens, screen) + 1];
			
		if (screen == "LAST NAME" || screen == "COUNTRY") {
			keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_characters, false);
		}
			
	}
	
}
	

