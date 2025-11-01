/// @desc Draw the text

draw_set_font(fnt_example);
draw_set_color($21C7FF);

var _timer_get = timer_get(test_timer)
var _remaining_duration_text = is_method(_timer_get) ? "[trigger]" : string(_timer_get);
var _total_duration_text = string(timer_get_time(test_timer));
var _type_text = ((timer_get_type(test_timer) == 1) ? "milliseconds" : "frames");

draw_text(x, y, "Timer has " + _remaining_duration_text + " out of " + _total_duration_text + " " + _type_text + " left.");

var _pause_text = timer_get_paused(test_timer) ? "unpause" : "pause";
var _slow_down_text = (timer_get_multiplier(test_timer) == 1) ? "slow down" : "speed up";

draw_text_ext(x, y + 128, "<Space> to " + _pause_text + " the timer.\n<S> to " + _slow_down_text + " the timer.\n<D> to destroy the timer.\n<C> to change the timer duration to 60.", -1, room_width - x*2);

// Draw the custom message box
if (message_box_visible)
{
	var _box_width = 640;
	var _box_height = 360;
	var _box_x = (room_width - _box_width) / 2;
	var _box_y = (room_height - _box_height) / 2;
	var _padding = 32;
	
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	
	draw_rectangle(_box_x, _box_y, _box_x + _box_width, _box_y + _box_height, false);
	
	draw_set_color($21C7FF);
	draw_rectangle(_box_x, _box_y, _box_x + _box_width, _box_y + _box_height, true);
	
	draw_set_color(c_white);
	draw_set_font(fnt_example);
	draw_text_ext_transformed(_box_x + _padding, _box_y + _padding, message_box_text, -1, (_box_width - _padding * 2) * 1.25, 0.75, 0.75, 0);
	
	draw_set_alpha(0.5);
    draw_set_valign(fa_bottom);
	draw_text_ext_transformed(_box_x + _padding, _box_y + _box_height - _padding, "Press <Space> to continue.", -1, (_box_width - _padding * 2) * 2, 0.5, 0.5, 0);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
}

draw_set_color(c_white);