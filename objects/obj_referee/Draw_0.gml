draw_set_alpha(obj_control.general_alpha);

sprite = asset_get_index("spr_" + string(action) + "_" + string(dir));
draw_sprite_ext(sprite, image_index / 10 , x, y,1,1,0,sc,1);
shirt = asset_get_index("spr_" + string(action) + "_" + string(dir) + "_shirt");
draw_sprite_ext(shirt, image_index / 10 , x, y,1,1,0,c_yellow,1);
shorts = asset_get_index("spr_" + string(action) + "_" + string(dir) + "_shorts");
draw_sprite_ext(shorts, image_index / 10 , x, y,1,1,0,c_black,1);

