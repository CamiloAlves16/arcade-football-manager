if (screen == "TACTICS") {
	
	if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 40, 0, 120, 160)) {
		
		tactic_selected.pos = "RD";
		array_sort(tactic, tactic_sort);
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 120, 0, 240, 160)) {
			
		tactic_selected.pos = "CD";
		array_sort(tactic, tactic_sort);
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 240, 0, 320, 160)) {
			
		tactic_selected.pos = "LD";
		array_sort(tactic, tactic_sort);
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 40, 160, 120, 260)) {
			
		tactic_selected.pos = "RM";
		array_sort(tactic, tactic_sort);
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 120, 160, 240, 260)) {
			
		tactic_selected.pos = "CM";
		array_sort(tactic, tactic_sort);
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 240, 160, 320, 260)) {
			
		tactic_selected.pos = "LM";
		array_sort(tactic, tactic_sort);
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 40, 260, 120, 380)) {
			
		tactic_selected.pos = "RF";
		array_sort(tactic, tactic_sort);
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 120, 260, 240, 380)) {
			
		tactic_selected.pos = "CF";
		array_sort(tactic, tactic_sort);
			
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 240, 260, 320, 380)) {
			
		tactic_selected.pos = "LF";
		array_sort(tactic, tactic_sort);
		
	} else {
		
		array_sort(tactic, tactic_sort);
		
	}
	
} else {
	
	if (event_data[?"diffY"] > 0 && selected_index < max_display - 1) {
		selected_index++;
	} else if (event_data[?"diffY"] < 0 && selected_index > 0) {
		selected_index--;
	}
	
}