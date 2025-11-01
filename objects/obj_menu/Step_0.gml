/// @desc Handle the menu states

switch (state)
{
    case MENU_STATE.MENU:
        if (keyboard_check_pressed(vk_up))
        {
            selected_item--;
            if (selected_item < 0)
            {
                selected_item = array_length(menu_items) - 1;
            }
        }

        if (keyboard_check_pressed(vk_down))
        {
            selected_item++;
            if (selected_item >= array_length(menu_items))
            {
                selected_item = 0;
            }
        }

        if (keyboard_check_pressed(vk_space))
        {
            var _item = menu_items[selected_item];
            current_example = instance_create_layer(32, 32, layer, _item.object);
            state = MENU_STATE.EXAMPLE;
        }
        break;
        
    case MENU_STATE.EXAMPLE:
        if (keyboard_check_pressed(vk_escape))
        {
            if (instance_exists(current_example))
            {
                instance_destroy(current_example);
            }
            current_example = noone;
            state = MENU_STATE.MENU;
        }
        break;
} 