if (event_data[?"diffY"] > 0 && selected_index < max_display - 1) {
	selected_index++;
} else if (event_data[?"diffY"] < 0 && selected_index > 0) {
	selected_index--;
}