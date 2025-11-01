// wFSM by Distant Illusions
// A flexible finite state machine library for managing complex object behaviors.
// https://distantillusions.com/

/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

#macro __WFSM_VERSION "1.3.0"

show_debug_message("wFSM v" + __WFSM_VERSION + " by Distant Illusions");

/// @func State()
/// @desc A state that can be added to a StateMachine.
function State() constructor
{
    // The state that will come after this one when the "next" fuction of the StateMachine is called.
    next = -1;

    /// @func on_enter()
    /// @desc The event that gets called when StateMachine enters the current state.
    static on_enter = function() {}
    
    /// @func on_leave()
    /// @desc The event that gets called when StateMachine leaves the current state.
    static on_leave = function() {}
    
    /// @func on_update()
    /// @desc The event that gets called when the "update" method of the StateMachine is called.
    static on_update = function() {}
}

/// @func StateMachine()
/// @desc A finite state machine.
function StateMachine() constructor
{
    // Variables that are intended to be private. GameMaker doesn't have private variables yet, so I'm just putting 2 underscores before their names.
    __states = [];
    __current_state = -1;
    __index = -1;
    __previous_state = -1;
	__state_count = 0;
    
    /// @func add(index, state)
    /// @desc Adds a state to the finite state machine.
    /// @param {real} index The unique index used to keep track of the state. Using enums is recommended, but you can also use a regular integers if you really want to.
    /// @param {struct} state The state to be added.
    static add = function(index, state)
    { 
		if (!is_numeric(index) || index < 0)
		{
			throw ("wFSM Error: State index must be a non-negative integer! Got: " + string(index));
		}
		if (!is_struct(state))
		{
			throw ("wFSM Error: Provided state must be a struct! Got: " + typeof(state));
		}
		
        if (index >= __state_count)
		{
			__state_count = index + 1;
		}
		
        __states[index] = state;
		
        if (__current_state == -1)
        {
            __current_state = state;
            __index = index;
            __current_state.on_enter();
        }
    }
    
    /// @func change(index)
    /// @desc Changes the current state of StateMachine to the provided index.
    /// @param {real} index Index of the state that's going to be set as the new one.
    static change = function(index)
    {
        var _next_state = (index < array_length(__states)) ? __states[index] : undefined;

		if (is_undefined(_next_state))
			throw ("wFSM Error: Cannot change to a non-existent state! Got index: " + string(index));

        __current_state.on_leave(__index);
        __current_state = _next_state;
		__previous_state = __index;
        __index = index;
        __current_state.on_enter(__previous_state);
    }
	
	/// @func change_once(index)
    /// @desc Changes the current state of StateMachine to the provided index only when the new state is different than the previous one.
    /// @param {real} index Index of the state that's going to be set as the new one.
    static change_once = function(index)
    {
		if (index == __index)
			return;

        change(index);
    }
    
    /// @func next()
    /// @desc Changes the current state of the current StateMachine to the next one.
    static next = function()
    {
        var _next_index = __current_state.next;

		if (_next_index == -1)
			throw ("wFSM Error: The current state does not have a 'next' state defined.");

        change(_next_index);
    }
    
    /// @func reset()
    /// @desc Works similarly to "change(index)" but it will "change" to the state that is already running, essentially resetting the current state. 
    static reset = function()
    {
		if (__current_state == -1)
			throw ("wFSM Error: Cannot reset the state! No states have been added to the state machine.");

        __current_state.on_leave(__index);
        __current_state.on_enter(__index);
    }
    
    /// @func get()
    /// @desc Returns the current state index of the current StateMachine.
    /// @returns {real} The current state index of the current StateMachine.
    static get = function()
    {
        return __index;
    }
    
    /// @func get_previous()
    /// @desc Returns the previous state index of the current StateMachine.
    /// @returns {real} The previous state index of the current StateMachine.
    static get_previous = function()
    {
        return __previous_state;
    }
    
    /// @func count()
    /// @desc Returns the number of states within the current StateMachine.
    /// @returns {real} The number of states within the current StateMachine.
    static count = function()
    {
        return __state_count;
    }
    
    /// @func clear()
    /// @desc Clears all the states from the current StateMachine.
    static clear = function()
    {
        __states = [];
		__state_count = 0;
    }
	    
    /// @func update()
    /// @desc Executes the "update" event of the current State.
    static update = function()
    {
        __current_state.on_update();
    }
	
    /// @func run_event(event_name)
    /// @desc Executes a specific event of the current State.
    /// @param {string} event_name Name of the event to execute.
    static run_event = function(event_name)
    {
		if (!is_string(event_name))
			throw ("wFSM Error: event_name must be a string! Got: " + typeof(event_name));

		if (variable_struct_exists(__current_state, event_name))
			variable_struct_get(__current_state, event_name)();
    }

    // Used by GameMaker to implicitly convert structs into strings in certain scenarios.
    // Useful for debugging.
    // https://manual.gamemaker.io/beta/en/GameMaker_Language/GML_Reference/Strings/Strings.htm#tostring_method
    static toString = function()
    {
        var _current_index = (__current_state == -1) ? "none" : string(__index);
        var _previous_index = (__previous_state == -1) ? "none" : string(__previous_state);
        var _total_states = string(array_length(__states));
        
        return "StateMachine with the current state: " + _current_index + ", previous state: " + _previous_index + ", total states: " + _total_states + ".";
    }
}