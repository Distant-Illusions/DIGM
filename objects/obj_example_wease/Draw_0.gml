/// @desc Draw the easing demonstration with graph visualization

draw_set_font(fnt_example);
draw_set_color($21C7FF);

draw_text(x, y, "Current function: " + easing_names[current_easing]);

var _scale = 1;
draw_text_ext_transformed(x, y + 128, "<Left> and <Right> to switch.", -1, (room_width - x*2) / _scale, _scale, _scale, 0);

var _margin = 32;
var _total_height = 400;
var _grid_size = 8;

var _bar_size = 16;

var _bar_width = room_width - x*2;
var _bar_height = _total_height - _bar_size - _margin;

var _bar_y = room_height - y - _bar_size;

var _graph_width = room_width - x*2;
var _graph_height = _total_height - _bar_size - _margin;

var _graph_x = x;
var _graph_y = _bar_y - _graph_height - _margin;

draw_set_color(c_dkgray);
draw_rectangle(_graph_x, _graph_y, _graph_x + _graph_width, _graph_y + _graph_height, false);
draw_set_color(c_white);
draw_rectangle(_graph_x, _graph_y, _graph_x + _graph_width, _graph_y + _graph_height, true);

draw_set_color(c_gray);
for (var i = 1; i < _grid_size; i++)
{
    var _grid_x = _graph_x + (_graph_width / _grid_size) * i;
    var _grid_y = _graph_y + (_graph_height / _grid_size) * i;
    draw_line_width(_grid_x, _graph_y, _grid_x, _graph_y + _graph_height, 1);
    draw_line_width(_graph_x, _grid_y, _graph_x + _graph_width, _grid_y, 1);
}

draw_set_color($21C7FF);
var _prev_x = _graph_x;
var _prev_y = _graph_y + _graph_height;

var _progress = animation_time / animation_duration;

for (var i = 1; i <= _graph_width; i++)
{
    var _curve_progress = i / _graph_width;
    var _eased_value = 0;
    
    switch(current_easing)
    {
        case easing_type.linear:
            _eased_value = ease_linear(0, 1, _curve_progress);
            break;
        case easing_type.sine_in:
            _eased_value = ease_in_sine(0, 1, _curve_progress);
            break;
        case easing_type.sine_out:
            _eased_value = ease_out_sine(0, 1, _curve_progress);
            break;
        case easing_type.sine_inout:
            _eased_value = ease_inout_sine(0, 1, _curve_progress);
            break;
        case easing_type.quad_in:
            _eased_value = ease_in_quad(0, 1, _curve_progress);
            break;
        case easing_type.quad_out:
            _eased_value = ease_out_quad(0, 1, _curve_progress);
            break;
        case easing_type.quad_inout:
            _eased_value = ease_inout_quad(0, 1, _curve_progress);
            break;
        case easing_type.cubic_in:
            _eased_value = ease_in_cubic(0, 1, _curve_progress);
            break;
        case easing_type.cubic_out:
            _eased_value = ease_out_cubic(0, 1, _curve_progress);
            break;
        case easing_type.cubic_inout:
            _eased_value = ease_inout_cubic(0, 1, _curve_progress);
            break;
        case easing_type.quart_in:
            _eased_value = ease_in_quart(0, 1, _curve_progress);
            break;
        case easing_type.quart_out:
            _eased_value = ease_out_quart(0, 1, _curve_progress);
            break;
        case easing_type.quart_inout:
            _eased_value = ease_inout_quart(0, 1, _curve_progress);
            break;
        case easing_type.quint_in:
            _eased_value = ease_in_quint(0, 1, _curve_progress);
            break;
        case easing_type.quint_out:
            _eased_value = ease_out_quint(0, 1, _curve_progress);
            break;
        case easing_type.quint_inout:
            _eased_value = ease_inout_quint(0, 1, _curve_progress);
            break;
        case easing_type.expo_in:
            _eased_value = ease_in_expo(0, 1, _curve_progress);
            break;
        case easing_type.expo_out:
            _eased_value = ease_out_expo(0, 1, _curve_progress);
            break;
        case easing_type.expo_inout:
            _eased_value = ease_inout_expo(0, 1, _curve_progress);
            break;
        case easing_type.circ_in:
            _eased_value = ease_in_circ(0, 1, _curve_progress);
            break;
        case easing_type.circ_out:
            _eased_value = ease_out_circ(0, 1, _curve_progress);
            break;
        case easing_type.circ_inout:
            _eased_value = ease_inout_circ(0, 1, _curve_progress);
            break;
        case easing_type.back_in:
            _eased_value = ease_in_back(0, 1, _curve_progress);
            break;
        case easing_type.back_out:
            _eased_value = ease_out_back(0, 1, _curve_progress);
            break;
        case easing_type.back_inout:
            _eased_value = ease_inout_back(0, 1, _curve_progress);
            break;
        case easing_type.elastic_in:
            _eased_value = ease_in_elastic(0, 1, _curve_progress);
            break;
        case easing_type.elastic_out:
            _eased_value = ease_out_elastic(0, 1, _curve_progress);
            break;
        case easing_type.elastic_inout:
            _eased_value = ease_inout_elastic(0, 1, _curve_progress);
            break;
        case easing_type.bounce_in:
            _eased_value = ease_in_bounce(0, 1, _curve_progress);
            break;
        case easing_type.bounce_out:
            _eased_value = ease_out_bounce(0, 1, _curve_progress);
            break;
        case easing_type.bounce_inout:
            _eased_value = ease_inout_bounce(0, 1, _curve_progress);
            break;
    }
    
    var _curr_x = _graph_x + i;
    var _curr_y = _graph_y + _graph_height - (_eased_value * _graph_height);
    
    draw_line_width(_prev_x, _prev_y, _curr_x, _curr_y, 2);
    _prev_x = _curr_x;
    _prev_y = _curr_y;
}

var _current_eased_progress = 0;
switch(current_easing)
{
    case easing_type.linear:
        _current_eased_progress = ease_linear(0, 1, _progress);
        break;
    case easing_type.sine_in:
        _current_eased_progress = ease_in_sine(0, 1, _progress);
        break;
    case easing_type.sine_out:
        _current_eased_progress = ease_out_sine(0, 1, _progress);
        break;
    case easing_type.sine_inout:
        _current_eased_progress = ease_inout_sine(0, 1, _progress);
        break;
    case easing_type.quad_in:
        _current_eased_progress = ease_in_quad(0, 1, _progress);
        break;
    case easing_type.quad_out:
        _current_eased_progress = ease_out_quad(0, 1, _progress);
        break;
    case easing_type.quad_inout:
        _current_eased_progress = ease_inout_quad(0, 1, _progress);
        break;
    case easing_type.cubic_in:
        _current_eased_progress = ease_in_cubic(0, 1, _progress);
        break;
    case easing_type.cubic_out:
        _current_eased_progress = ease_out_cubic(0, 1, _progress);
        break;
    case easing_type.cubic_inout:
        _current_eased_progress = ease_inout_cubic(0, 1, _progress);
        break;
    case easing_type.quart_in:
        _current_eased_progress = ease_in_quart(0, 1, _progress);
        break;
    case easing_type.quart_out:
        _current_eased_progress = ease_out_quart(0, 1, _progress);
        break;
    case easing_type.quart_inout:
        _current_eased_progress = ease_inout_quart(0, 1, _progress);
        break;
    case easing_type.quint_in:
        _current_eased_progress = ease_in_quint(0, 1, _progress);
        break;
    case easing_type.quint_out:
        _current_eased_progress = ease_out_quint(0, 1, _progress);
        break;
    case easing_type.quint_inout:
        _current_eased_progress = ease_inout_quint(0, 1, _progress);
        break;
    case easing_type.expo_in:
        _current_eased_progress = ease_in_expo(0, 1, _progress);
        break;
    case easing_type.expo_out:
        _current_eased_progress = ease_out_expo(0, 1, _progress);
        break;
    case easing_type.expo_inout:
        _current_eased_progress = ease_inout_expo(0, 1, _progress);
        break;
    case easing_type.circ_in:
        _current_eased_progress = ease_in_circ(0, 1, _progress);
        break;
    case easing_type.circ_out:
        _current_eased_progress = ease_out_circ(0, 1, _progress);
        break;
    case easing_type.circ_inout:
        _current_eased_progress = ease_inout_circ(0, 1, _progress);
        break;
    case easing_type.back_in:
        _current_eased_progress = ease_in_back(0, 1, _progress);
        break;
    case easing_type.back_out:
        _current_eased_progress = ease_out_back(0, 1, _progress);
        break;
    case easing_type.back_inout:
        _current_eased_progress = ease_inout_back(0, 1, _progress);
        break;
    case easing_type.elastic_in:
        _current_eased_progress = ease_in_elastic(0, 1, _progress);
        break;
    case easing_type.elastic_out:
        _current_eased_progress = ease_out_elastic(0, 1, _progress);
        break;
    case easing_type.elastic_inout:
        _current_eased_progress = ease_inout_elastic(0, 1, _progress);
        break;
    case easing_type.bounce_in:
        _current_eased_progress = ease_in_bounce(0, 1, _progress);
        break;
    case easing_type.bounce_out:
        _current_eased_progress = ease_out_bounce(0, 1, _progress);
        break;
    case easing_type.bounce_inout:
        _current_eased_progress = ease_inout_bounce(0, 1, _progress);
        break;
}

var _ball_x = _graph_x + (_progress * _graph_width);
var _ball_y = _graph_y + _graph_height - (_current_eased_progress * _graph_height);

draw_set_color(c_red);
draw_circle(_ball_x, _ball_y, 8, false);

draw_set_color($21C7FF);
draw_set_alpha(0.5);
draw_line_width(_graph_x, _ball_y, _ball_x, _ball_y, 1);
draw_line_width(_ball_x, _graph_y + _graph_height, _ball_x, _ball_y, 1);
draw_set_alpha(1.0);


draw_set_color(c_dkgray);
draw_rectangle(_graph_x, _bar_y, _graph_x + _graph_width, _bar_y + _bar_size, false);

draw_set_color($21C7FF);
draw_rectangle(_graph_x, _bar_y, _graph_x + (_current_eased_progress * _graph_width), _bar_y + _bar_size, false);

draw_set_color(c_white);
draw_rectangle(_graph_x, _bar_y, _graph_x + _graph_width, _bar_y + _bar_size, true);
