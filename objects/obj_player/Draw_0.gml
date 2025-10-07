/// @description 
draw_set_font(global.fnt_numbers);
draw_set_alpha(obj_control.general_alpha);
draw_set_color(c_black);

draw_set_halign(fa_center);
if (obj_ball.possession == id) {
	//for (var i = 0; i < array_length(pass_options); ++i) {
	    //draw_text_transformed(pass_options[i].target.x, pass_options[i].target.y + 10, round(pass_options[i].rating), 2, 2, 0);
	//}
	draw_set_color(c_yellow);
} else {
	draw_set_color(c_black);
}

draw_text(x,y-25, name + " " + string(number));

if (injury > 0) {
	draw_sprite(spr_injured, 0, x + 5 + string_width(name + " " + string(number))/2, y-25);
}

sprite = asset_get_index("spr_" + string(action) + "_" + string(dir));
draw_sprite_ext(sprite, image_index / 10 , x, y,1,1,0,sc,obj_control.general_alpha);

shirt = asset_get_index("spr_" + string(action) + "_" + string(dir) + "_shirt");
draw_sprite_ext(shirt, image_index / 10 , x, y,1,1,0,team_color1,obj_control.general_alpha);
if (variable_global_get(string(team) + "_kittype") == "shorts") {
	shorts = asset_get_index("spr_" + string(action) + "_" + string(dir) + "_" + string(kittype));
	draw_sprite_ext(shorts, image_index / 10 , x, y,1,1,0,team_color2,obj_control.general_alpha);
} else if (variable_global_get(string(team) + "_kittype") == "stripes") {
	shorts = asset_get_index("spr_" + string(action) + "_" + string(dir) + "_" + string(kittype));
	draw_sprite_ext(shorts, image_index / 10 , x, y,1,1,0,team_color2,obj_control.general_alpha);
} else if (variable_global_get(string(team) + "_kittype") == "stripes and shorts") {
	stripes = asset_get_index("spr_" + string(action) + "_" + string(dir) + "_stripes");
	shorts = asset_get_index("spr_" + string(action) + "_" + string(dir) + "_shorts");
	draw_sprite_ext(stripes, image_index / 10 , x, y,1,1,0,team_color2,obj_control.general_alpha);
	draw_sprite_ext(shorts, image_index / 10 , x, y,1,1,0,team_color3,obj_control.general_alpha);
} else if (variable_global_get(string(team) + "_kittype") == "bars and shorts") {
	stripes = asset_get_index("spr_" + string(action) + "_" + string(dir) + "_bars");
	shorts = asset_get_index("spr_" + string(action) + "_" + string(dir) + "_shorts");
	draw_sprite_ext(stripes, image_index / 10 , x, y,1,1,0,team_color2,obj_control.general_alpha);
	draw_sprite_ext(shorts, image_index / 10 , x, y,1,1,0,team_color3,obj_control.general_alpha);
} else if (variable_global_get(string(team) + "_kittype") == "sleeves") {
	shorts = asset_get_index("spr_" + string(action) + "_" + string(dir) + "_" + string(kittype));
	draw_sprite_ext(shorts, image_index / 10 , x, y,1,1,0,team_color2,obj_control.general_alpha);
} else if (variable_global_get(string(team) + "_kittype") == "sleeves and shorts") {
	stripes = asset_get_index("spr_" + string(action) + "_" + string(dir) + "_sleeves");
	shorts = asset_get_index("spr_" + string(action) + "_" + string(dir) + "_shorts");
	draw_sprite_ext(stripes, image_index / 10 , x, y,1,1,0,team_color2,obj_control.general_alpha);
	draw_sprite_ext(shorts, image_index / 10 , x, y,1,1,0,team_color3,obj_control.general_alpha);
} else if (variable_global_get(string(team) + "_kittype") == "checkers") {
	stripes = asset_get_index("spr_" + string(action) + "_" + string(dir) + "_stripes");
	shorts = asset_get_index("spr_" + string(action) + "_" + string(dir) + "_shorts");
	draw_sprite_ext(stripes, image_index / 10 , x, y,1,1,0,team_color2,obj_control.general_alpha);
	stripes = asset_get_index("spr_" + string(action) + "_" + string(dir) + "_bars");
	draw_sprite_ext(stripes, image_index / 10 , x, y,1,1,0,team_color2,obj_control.general_alpha);
	draw_sprite_ext(shorts, image_index / 10 , x, y,1,1,0,team_color2,obj_control.general_alpha);
}

