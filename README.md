# DIGM - Distant Illusions GameMaker Libraries

**DIGM** is a collection of **GameMaker libraries** that we use at [Distant Illusions](https://distantillusions.com) in our own games.

[![License: MPL 2.0](https://img.shields.io/badge/License-MPL%202.0-brightgreen.svg)](https://opensource.org/licenses/MPL-2.0)
[![GameMaker](https://img.shields.io/badge/GameMaker-Latest-orange.svg)](https://gamemaker.io)
[![Status: Active](https://img.shields.io/badge/Status-Active-green.svg)]()

Right now, DIGM contains four powerful, battle-tested libraries:

- **wFSM** - A flexible finite state machine for managing complex object behaviors.
- **wTimer** - A timer system for scheduling and delaying function executions.
- **wRNG** - A seeded random number generator, supporting multiple independent randomizers.
- **wEase** - A comprehensive collection of easing functions based on the work of Robert Penner.

All these libraries are tested on the **Windows**, **Linux**, **WASM**, **HTML5**, and **Nintendo Switch** targets, but they should (in theory) work on other platforms as well. That said, knowing GameMaker, you shouldn't fully bet on it.

The projects these libraries are used in include (but are not limited to):
- [Operius DX](https://distantillusions.com/games/operius-dx) (Available on Windows, Linux, and Nintendo Switch)
- [Idle Aura](https://store.gx.me/mods/tmrgsl/mini-idle-aura) (Published by Opera GX, Opera being GameMaker's parent company)
- [Cascadence](https://mors-games.itch.io/cascadence)
- [Dormiveglia](https://dormivegliagame.com)
- And many more...

This project is essentially a large showcase of the libraries. You can find the libraries themselves in the `scripts` folder, and the examples in the `objects` folder. Try it out at the project's [itch.io page](https://distantillusions.itch.io/digm)!


## wFSM - Finite State Machine Library

**wFSM** is an easy-to-use and lightweight **Finite State Machine** library for **GameMaker**.

Finite state machines are structures that can exist in a set amount of predefined states, each containing unique behaviors. While finite state machines are used extensively in game development, GameMaker lacks a built-in way to set them up easily. wFSM allows you to set up your own lightweight finite state machines with minimal effort while keeping them organized.

wFSM is designed to be very lightweight and not get in your way as much as possible. If you're looking for a more robust finite state machine library that handles more things by itself, you might want to check out [SnowState](https://github.com/sohomsahaun/SnowState).


### Basic Usage

```gml
// Define your states as an enum
enum test_state
{
    example1,
    example2,
}

// Create the finite state machine
state_machine = new StateMachine();

// Create state 1
var _state1 = new State();

// Set the code that will be executed on the step event
_state1.on_update = function() {
    x += 4;
    if (x > room_width)
        x = -256;
}

// Create state 2
var _state2 = new State();

// Set the code that will be executed on the step event
_state2.on_update = function() {
    x -= 4;
    if (x < -256)
        x = room_width;
}

// Add the states to the finite state machine
state_machine.add(test_state.example1, _state1);
state_machine.add(test_state.example2, _state2);
```


## wTimer - Timer System

**wTimer** is a library that offers a more robust alternative to **GameMaker's built-in alarms**, alongside some extra functionality.

With wTimer, you can create timers that run a specific function after a certain amount of time. Unlike GameMaker's built-in alarms, you don't have to use separate events for each timer, you can just declare timers and define what they do in a single event or script.

The API here is very similar to JavaScript's `setInterval()` and `setTimeout()` methods, so if you're familiar with those then you should feel right at home here.


### Basic Usage

```gml
// Define the callback function
callback = function() {
    show_message("Pretty cool, huh?");
}

// Regular timer
timer(callback, 300);

// Forever repeating timer, using milliseconds instead of frames
timer_ms(function(){ show_message("Forever repeating timer!"); }, 1000, true);

// Trigger that only runs once the right mouse button is pressed
timer_trigger(callback, function(){ return mouse_check_button_pressed(mb_right); });
```

## wRNG - Seeded Random Number Generator

**wRNG** is a seeded random number generator for **GameMaker** that supports multiple independent randomizers.

wRNG provides a more flexible alternative to GameMaker's built-in random functions, allowing you to create separate, independent random number generators with their own seeds for more control over randomization in your games.

The performance here isn't going to be as good as GameMaker's built-in functions (this is a limitation of how GameMaker works), but it's still plenty fast for a vast majority of use cases.


### Basic Usage

```gml
// Create an independent randomizer with a specific seed
enemy_rng = new Randomizer(12345);

// Generate random integers
var _damage = enemy_rng.int_range(5, 15);

// Generate random floats
var _chance = enemy_rng.float();

// Pick a random element from an array
var _loot_table = ["sword", "shield", "potion"];
var _loot_drop = enemy_rng.choose_array(_loot_table);

// Shuffle an array
var _deck = [1, 2, 3, 4, 5];
enemy_rng.shuffle_array(_deck);

// And there's more...
```


## wEase - Easing Functions Library

**wEase** is a comprehensive collection of **easing functions** for **GameMaker**, based on the work of [Robert Penner](https://robertpenner.com). You can see all the included easing functions in action at [easings.net](https://easings.net/).

Easing functions are very useful for creating smooth, natural animations. wEase provides a complete set of easing functions, formatted in a way that's easy to use and understand. If you know how to use lerp, you know how to use wEase.

This also means that unlike many other easing libraries, wEase doesn't handle movement for you. It's as straightforward as it can get, which is exactly what we wanted anyway.


### Basic Usage

```gml
// Linear interpolation
x1 = ease_linear(0, 100, progress);

// Smooth acceleration (slow start, fast end)
x2 = ease_out_quad(0, 100, progress);

// Elastic bounce effect
x3 = ease_out_elastic(0, 100, progress);

// Easing with overshoot
x4 = ease_out_back(0, 100, progress);

// And so on...
```


## License

The main scripts for the libraries are licensed under **MPL 2.0**. You can learn more about it [here](https://www.mozilla.org/en-US/MPL/2.0/FAQ/). If you're lost, Q8 is probably the most relevant part for most game developers.

The rest of the repository is licensed under **public domain**.

If you want to use these libraries under a different license, please get in contact with us at [contact@distantillusions.com](mailto:contact@distantillusions.com).


## Contributing & Issues

Found a bug? Have a question? [Open an issue on GitHub](https://github.com/Distant-Illusions/DIGM/issues) with:
- A clear description of the problem.
- Steps to reproduce (if applicable).
- Your GameMaker version and target platform.
- Any error messages or unexpected behavior.

Please note that we're not qualified to offer support for any platforms other than **Windows**, **Linux**, **WASM**, **HTML5**, and **Nintendo Switch**. Especially not with other consoles.

We're always open to suggestions, but we're currently not accepting any contributions directly. Since this is an open source project, you're welcome to fork the repository and make your own changes if you really want to.


## Credits

- [Mors](https://mors.games) - Creating and maintaining the libraries.
- [Robert Penner](https://robertpenner.com) - Creating the original easing functions that wEase is based on.
- [Yoyo Games](https://www.yoyogames.com) - For developing the GameMaker engine, duh!