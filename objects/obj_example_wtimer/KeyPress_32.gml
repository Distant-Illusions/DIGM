/// @desc Pause or unpause the timer, or dismiss message box

if (message_box_visible)
{
	message_box_visible = false;
	if (message_box_dismiss_callback != undefined)
	{
		message_box_dismiss_callback();
	}
}
else
{
	timer_set_paused(test_timer);
}