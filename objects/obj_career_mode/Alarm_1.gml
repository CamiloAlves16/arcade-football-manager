/// @description WARNING RESET

if (option1_index == 1) {
	
	array_delete(warnings, 0, 1);
	
} else {
	
	if (array_length(warnings) > 0) {
		
		var skip_title = warnings[0].warning_title;
		
		for (var i = array_length(warnings) - 1; i >= 0; i--) {
			if (warnings[i].warning_title == skip_title) {
				array_delete(warnings, i, 1);
			}
		}
		
	} else {
		
		array_delete(warnings, 0, 1);
		
	}
	
}

option1_index = 0;
option2_index = 0;