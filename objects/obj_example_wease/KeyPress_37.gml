/// @desc Previous easing type

current_easing--;
if (current_easing < 0)
{
    current_easing = easing_type.__count - 1;
}
reset_animation(); 