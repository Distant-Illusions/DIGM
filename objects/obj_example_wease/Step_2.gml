/// @desc Handle the animation

if (animation_playing)
{
    animation_time += animation_direction;
    
    // Check for bounds and reverse the direction if needed
    if (animation_time >= animation_duration)
    {
        animation_time = animation_duration;
        animation_direction = -1;
    }
    else if (animation_time <= 0)
    {
        animation_time = 0;
        animation_direction = 1;
    }
} 