/// @desc Next easing type

current_easing++;
if (current_easing >= easing_type.__count)
{
    current_easing = 0;
}
reset_animation(); 