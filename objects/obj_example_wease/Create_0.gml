/// @desc An example object

enum easing_type
{
    linear,
    sine_in,
    sine_out,
    sine_inout,
    quad_in,
    quad_out, 
    quad_inout,
    cubic_in,
    cubic_out,
    cubic_inout,
    quart_in,
    quart_out,
    quart_inout,
    quint_in,
    quint_out,
    quint_inout,
    expo_in,
    expo_out,
    expo_inout,
    circ_in,
    circ_out,
    circ_inout,
    back_in,
    back_out,
    back_inout,
    elastic_in,
    elastic_out,
    elastic_inout,
    bounce_in,
    bounce_out,
    bounce_inout,
    __count
}

easing_names =
[
    "ease_linear",
    "ease_in_sine",
    "ease_out_sine",
    "ease_inout_sine",
    "ease_in_quad",
    "ease_out_quad", 
    "ease_inout_quad",
    "ease_in_cubic",
    "ease_out_cubic",
    "ease_inout_cubic",
    "ease_in_quart",
    "ease_out_quart",
    "ease_inout_quart",
    "ease_in_quint",
    "ease_out_quint",
    "ease_inout_quint",
    "ease_in_expo",
    "ease_out_expo",
    "ease_inout_expo",
    "ease_in_circ",
    "ease_out_circ",
    "ease_inout_circ",
    "ease_in_back",
    "ease_out_back",
    "ease_inout_back",
    "ease_in_elastic",
    "ease_out_elastic",
    "ease_inout_elastic",
    "ease_in_bounce",
    "ease_out_bounce",
    "ease_inout_bounce",
];

current_easing = easing_type.linear;

animation_time = 0;
animation_duration = 180;
animation_playing = true;
animation_direction = 1;

function reset_animation()
{
    animation_time = 0;
    animation_direction = 1;
} 