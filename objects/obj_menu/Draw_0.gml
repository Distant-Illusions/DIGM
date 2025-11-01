/// @desc Drawing the menu and the prompt

switch (state)
{
    case MENU_STATE.MENU:
        draw_set_font(fnt_example);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);

        var _center_x = room_width * 0.5;
        var _center_y = room_height * 0.46875;
        var _item_height = 48;
        var _start_y = _center_y - (array_length(menu_items) / 2 * _item_height);

        for (var i = 0; i < array_length(menu_items); i++)
        {
            var item = menu_items[i];
            var _y = _start_y + i * _item_height;
            
            if (i == selected_item)
            {
                draw_set_color($21C7FF);
                draw_text(_center_x, _y, "> " + item.name + " <");
            }
            else
            {
                draw_set_color(c_white);
                draw_text(_center_x, _y, item.name);
            }
        }

        draw_set_font(fnt_example);
        draw_set_color(c_white);

        var _selected = menu_items[selected_item];
        
        var _scale = 0.75;
        draw_set_alpha(0.75);
        draw_set_valign(fa_middle);

        draw_text_ext_transformed(_center_x, room_height * 0.75, _selected.info, -1, (room_width - 64) / _scale, _scale, _scale, 0);

        _scale = 0.5;
        draw_set_alpha(0.5);
        draw_set_valign(fa_bottom);

        draw_text_ext_transformed(_center_x, room_height - 16, "Press <SPACE> to select.", -1, (room_width - 64) / _scale, _scale, _scale, 0);

        draw_set_valign(fa_top);
        draw_text_ext_transformed(_center_x, 16, "DIGM by Distant Illusions.", -1, (room_width - 64) / _scale, _scale, _scale, 0);

        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_set_halign(fa_left);
        break;
        
    case MENU_STATE.EXAMPLE:
        draw_set_font(fnt_example);

        var _top = instance_exists(obj_example_wease);

        draw_set_alpha(0.5);
        draw_set_halign(fa_right);
        draw_set_valign(_top ? fa_top : fa_bottom);

        draw_text_transformed(room_width - 16, _top ? 16 : (room_height - 16), "Press <ESC> to return.", 0.5, 0.5, 0);
        
        draw_set_alpha(1);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        break;
} 