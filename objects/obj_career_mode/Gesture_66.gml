if (screen == "TACTICS") {
	
	if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 40, 0, 120, 160)) {
		
		for (var i = 0; i < array_length(tactic); ++i) {
		    if (tactic[i].pos == "RD") {
				tactic_selected = tactic[i];
				break;
			}
		}
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 120, 0, 240, 160)) {
		
		for (var i = 0; i < array_length(tactic); ++i) {
		    if (tactic[i].pos == "CD") {
				tactic_selected = tactic[i];
				break;
			}
		}
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 240, 0, 320, 160)) {
		
		for (var i = 0; i < array_length(tactic); ++i) {
		    if (tactic[i].pos == "LD") {
				tactic_selected = tactic[i];
				break;
			}
		}
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 0, 160, 120, 260)) {
		
		for (var i = 0; i < array_length(tactic); ++i) {
		    if (tactic[i].pos == "RM") {
				tactic_selected = tactic[i];
				break;
			}
		}
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 120, 160, 240, 260)) {
		
		for (var i = 0; i < array_length(tactic); ++i) {
		    if (tactic[i].pos == "CM") {
				tactic_selected = tactic[i];
				break;
			}
		}
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 240, 160, 320, 260)) {
		
		for (var i = 0; i < array_length(tactic); ++i) {
		    if (tactic[i].pos == "LM") {
				tactic_selected = tactic[i];
				break;
			}
		}
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 0, 260, 120, 380)) {
		
		for (var i = 0; i < array_length(tactic); ++i) {
		    if (tactic[i].pos == "RF") {
				tactic_selected = tactic[i];
				break;
			}
		}
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 120, 260, 240, 380)) {
		
		for (var i = 0; i < array_length(tactic); ++i) {
		    if (tactic[i].pos == "CF") {
				tactic_selected = tactic[i];
				break;
			}
		}
		
	} else if (point_in_rectangle(event_data[?"posX"], event_data[?"posY"], 240, 260, 320, 380)) {
		
		for (var i = 0; i < array_length(tactic); ++i) {
		    if (tactic[i].pos == "LF") {
				tactic_selected = tactic[i];
				break;
			}
		}
		
	}
	
}