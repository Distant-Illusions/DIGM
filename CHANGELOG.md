# Changelog

## wFSM

v1.3.0 (01/11/2025):
- Transferred the library over to Distant Illusions.
- Migrated from ds_map to an array-based state storage system for better performance.
- Added "change_once" method to change the state only when it's different from the current state.
- Added "get_previous" method to retrieve the index of the previous state.
- Added GameMaker's "toString" method for easier debugging.
- Removed the "timer" method and the internal state timer.
- Removed the "remove" method, it's kind of a bad practice to remove states after they've been added anyway.
- Removed the "destroy" method, since we're no longer relying on ds_maps anymore.
- Made the state indices validation stricter. They must be non-negative integers now.
- Improved error handling with more descriptive error messages.
- Updated the internal documentation.
- Updated the coding style to be more consistent.

v1.2.1 (31/03/2022):
- Changed the name of the "update" event to "on_update".
- Made the "on_enter" and "on_leave" events pass the index of the last state as a parameter.
- Touched up the internal documentation to work better with the upcoming smart autocompletion feature of GameMaker.

v1.2.0 (09/11/2021):
- Rebranded the library.
- Added the example project to the itch.io page as a playable HTML5 build.
- Added support for custom events with the "add_event" and "run_event" methods.
- Added the ability to pause a StateMachine with the "pause" and "is_paused" methods.
- Removed the draw events from the states. You can use the custom events for the same functionality.
- Fixed minor errors in the documentation and comments.

v1.1.1 (12/03/2021):
- Made some minor changes to the comments and the description.
- Added the [API Reference](https://github.com/MorsGames/wFSM/wiki).

v1.1.0 (07/07/2020):
- Added "draw", "reset", "get", and "timer" methods.
- Slightly improved the code.
- Improved the comments.
- There are now two example objects and rooms. One is more simplistic, while the other one showcases all the functions of the library.

v1.0.1 (27/06/2020):
- Made the code more consistent.
- Made the example look fancier.
- Rewrote the description.
- Changed the license to MPL 2.0.

v1.0.0 (14/06/2020):
- Initial release.


## wTimer

v2.2.0 (01/11/2025):
- Transferred the library over to Distant Illusions.
- Updated the internal JSDoc comments for better GameMaker autocompletion support.
- Updated the coding style to be more consistent.

v2.1.3 (31/03/2022):
- Fixed a bug with persistent timers getting caught in a loop at room end.
- Touched up the internal documentation to work better with the upcoming smart autocompletion feature of GameMaker.
- Moved around the "timer_system_update" call in the controller object.

v2.1.2 (09/11/2021):
- Rebranded the library.
- Added the example project to the itch.io page as a playable HTML5 build.
- Made use of GameMaker's optional arguments when applicable.
- Fixed minor errors in the documentation and comments.

v2.1.1 (25/05/2021):
- Added a workaround for an issue that seems like a GameMaker bug.

v2.1.0 (25/05/2021):
- Added "timer_destroy_object".
- Added "timer_set_paused_object".
- Added "timer_set_multiplier_object".
- Made it so that the timers now freeze when the instance they are assigned to is deactivated.
- Updated the example to showcase how the timers now work properly with deactivated instances.
- Fixed an issue with the "wait" function where it wouldn't work properly.
- Made changes to the documentation and the comments.

v2.0.0 (12/03/2021):
- Split "timer_set" into "timer" and "timer_ms", so it's now possible to use both real-time and frame-based timers together.
- Added "timer_trigger".
- Added "timer_get_time".
- Added "timer_get_type".
- Added "timer_set_multiplier".
- Added "timer_get_multiplier".
- Added "wait".
- Added a new global variable called "current_frames".
- Renamed "timer_pause" to "timer_set_paused" for better consistency.
- Changed some of the argument names.
- Fixed some mistakes with the comments, and tweaked them in general.
- Adjusted the code a bit.
- Fixed a few issues with timers not getting destroyed properly when a room ends.
- Added the [API Reference](https://github.com/MorsGames/wTimer/wiki).

v1.3.1 (02/10/2020):
- Fixed a minor issue that would result in the library not working at all.
- Added "timer_system_get_tickrate".
- Renamed "timer_get_pause" to "timer_get_paused".
- Made some minor optimizations.
- Made some minor reformatting.

v1.3.0 (28/09/2020):
- Renamed "timer_set_pause" to "timer_pause".
- Added "timer_change".
- Added "timer_system_set_tickrate".
- Made it so that if you set the tick rate to -1, the timer system runs independently from the frame rate, using milliseconds instead of frames.
- Fixed a crash that would happen if a room ended with a persistent timer while the instance didn't exist.

v1.2.0 (28/08/2020):
- Added support for up to 16 arguments instead of 1.
- The functions will now run in the instance the timer was created in.
- If the instance cannot be found by the time the timer ends, the timer will get destroyed without running any code.
- You don't have to manually declare timers as persistent anymore, it now depends on the instance running the timer.
- Slightly updated the example.

v1.1.0 (27/06/2020):
- Added "timer_set_pause" and "timer_get_pause" methods.
- Added the "repeat" argument to "timer_set". You can now use the timers the same way you'd use Javascript's "setInterval()".
- Added support for custom tick rates, allowing the use of timers with projects that utilize delta time.
- Removed "timer_system_init".
- Made the code more consistent.
- Made the example look fancier.
- Rewrote the description.
- Changed the license to MPL 2.0.

v1.0.0 (15/06/2020):
- Initial release.


## wRNG

v1.0.0 (01/11/2025):
- Initial release.


## wEase

v1.0.0 (01/11/2025):
- Initial release.