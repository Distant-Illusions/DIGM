/// @desc An example object

// We will use a custom message box system to display the messages
message_box_visible = false;
message_box_text = "";
message_box_dismiss_callback = undefined;

message_box = function(_text, _on_dismiss)
{
	message_box_visible = true;
	message_box_text = _text;
	message_box_dismiss_callback = _on_dismiss;
}

// The callbacks as a part of the example
callback1 = function()
{
	message_box("The next timer will be completed in 200 frames.", function()
	{
		// Start the next timer
		test_timer = timer(callback2, 200);
	});
}
callback2 = function()
{
	message_box("The next timer will run in real time, independently from the frame rate.", function()
	{
		// Start the next timer (uses milliseconds)
		test_timer = timer_ms(callback3, 2000);
	});
}
callback3 = function()
{
	message_box("The next timer isn't exactly a timer. It only completes once a function returns true. Right click anywhere to make it return true.", function()
	{
		// Start the next timer (trigger)
		test_timer = timer_trigger(callback4, function(){ return mouse_check_button_pressed(mb_right); });
	});
}
callback4 = function()
{
	message_box("Did you notice that we can use inline functions? The next timer will repeat forever at the same interval.", function()
	{
		// Start the next timer (repeats forever)
		test_timer = timer(callback5, 120, true);
	});
}
callback5 = function()
{
	message_box("I told you it would repeat! In fact, it's still going!", undefined);
}

test_timer = timer(callback1, 120);