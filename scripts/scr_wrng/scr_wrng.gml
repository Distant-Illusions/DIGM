// wRNG by Distant Illusions
// A seeded random number generator supporting multiple independent randomizers.
// https://distantillusions.com/

/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

#macro __WRNG_VERSION "1.0.0"

show_debug_message("wRNG v" + __WRNG_VERSION + " by Distant Illusions");

// LCG constants that are intended to be private. GameMaker macros are global, so I'm just putting 2 underscores before their names.
#macro __WRNG_LCG_A 1103515245
#macro __WRNG_LCG_C 12345
#macro __WRNG_ADVANCE_STATE __state = (__state * int64(__WRNG_LCG_A) + int64(__WRNG_LCG_C)) & 0xFFFFFFFF

/// @func Randomizer(seed[OPTIONAL])
/// @desc A random number generator.
/// @param {real} seed[OPTIONAL] The seed value. If not provided, uses current datetime.
function Randomizer(_seed = undefined) constructor
{
    // Variables that are intended to be private. GameMaker doesn't have private variables yet, so I'm just putting 2 underscores before their names.
    __seed = int64(0);
    __state = int64(0);

    static __init = function(_seed_val = undefined)
    {
        if (_seed_val == undefined)
        {
            _seed_val = date_get_second_of_year(date_current_datetime());
        }
        
        __seed = int64(floor(abs(_seed_val))) & 0xFFFFFFFF;
        __state = __seed;
        
        // Warm up the generator by calling it a few times
        repeat(8)
        {
            __WRNG_ADVANCE_STATE;
        }
    }

    /// @func get_seed()
    /// @desc Get the current seed value
    /// @returns {real} The current seed
    static get_seed = function()
    {
        return __seed;
    }

    /// @func set_seed(new_seed[OPTIONAL])
    /// @desc Set a new seed and reinitialize
    /// @param {real} new_seed[OPTIONAL] The new seed value
    static set_seed = function(_new_seed = undefined)
    {
        __init(_new_seed);
    }

    /// @func get_state()
    /// @desc Get the current state of the random generator
    /// @returns {real} The current state
    static get_state = function()
    {
        return __state;
    }

    /// @func set_state(state)
    /// @desc Set the state of the random generator directly
    /// @param {real} state The __state value to set
    static set_state = function(_new_state)
    {
        __state = int64(floor(abs(_new_state))) & 0xFFFFFFFF;
    }

    /// @func float(max_val)
    /// @desc Generate a random float between 0 and max_val
    /// @param {real} max_val Maximum value (inclusive)
    /// @returns {real} Random float [0, max_val]
    static float = function(_max_val = 1)
    {
        __WRNG_ADVANCE_STATE;
        return (__state / 0xFFFFFFFF) * _max_val;
    }

    /// @func float_range(min_val, max_val)
    /// @desc Generate a random float in a range
    /// @param {real} min_val Minimum value (inclusive)
    /// @param {real} max_val Maximum value (inclusive)
    /// @returns {real} Random float [_min_val, _max_val]
    static float_range = function(_min_val, _max_val)
    {
        if (_min_val > _max_val)
        {
            var _temp = _min_val;
            _min_val = _max_val;
            _max_val = _temp;
        }
        
        __WRNG_ADVANCE_STATE;
        return _min_val + (__state / 0xFFFFFFFF) * (_max_val - _min_val);
    }

    /// @func int(max_val)
    /// @desc Generate a random integer from 0 to max_val
    /// @param {real} max_val Maximum value (inclusive)
    /// @returns {real} Random integer [0, max_val]
    static int = function(_max_val)
    {
        var _sign = sign(_max_val);
        _max_val = floor(abs(_max_val));
        
        __WRNG_ADVANCE_STATE;
        return (__state % (_max_val + 1)) * _sign;
    }
    
    /// @func int_range(min_val, max_val)
    /// @desc Generate a random integer in a range
    /// @param {real} min_val Minimum value (inclusive)
    /// @param {real} max_val Maximum value (inclusive)
    /// @returns {real} Random integer [_min_val, _max_val]
    static int_range = function(_min_val, _max_val)
    {
        _min_val = floor(_min_val);
        _max_val = floor(_max_val);
        
        if (_min_val > _max_val)
        {
            var _temp = _min_val;
            _min_val = _max_val;
            _max_val = _temp;
        }
    
        var _range = _max_val - _min_val + 1;
        __WRNG_ADVANCE_STATE;
        return _min_val + (__state % _range);
    }

    /// @func bool(probability[OPTIONAL])
    /// @desc Generate a random boolean
    /// @param {real} probability[OPTIONAL] Probability of returning true [0, 1] (default: 0.5)
    /// @returns {bool} Random boolean
    static bool = function(_probability = 0.5)
    {
        return float() < _probability;
    }

    /// @func choose_array(array)
    /// @desc Choose a random element from an array
    /// @param {array} array Array to choose from
    /// @returns {any} Random element from array
    static choose_array = function(_array)
    {
        var _len = array_length(_array);
        if (_len == 0)
        {
            return undefined;
        }
    
        var _index = int(_len - 1);
        return _array[_index];
    }

    /// @func choose(values...)
    /// @desc Choose a random value from the given arguments
    /// @param {mixed} values... Values to choose from
    /// @returns {any} Random value from arguments
    static choose = function()
    {
        var _count = argument_count;
        if (_count == 0)
        {
            return undefined;
        }
    
        var _index = int(_count - 1);
        return argument[_index];
    }

    /// @func shuffle_array(array)
    /// @desc Shuffle an array in place using Fisher-Yates algorithm
    /// @param {array} array Array to shuffle
    /// @returns {array} The shuffled array (same reference)
    static shuffle_array = function(_array)
    {
        for (var _i = array_length(_array) - 1; _i > 0; _i--)
        {
            var _j = int(_i);
        
            // Swap elements
            var _temp = _array[_i];
            _array[_i] = _array[_j];
            _array[_j] = _temp;
        }
    
        return _array;
    }

    /// @func weighted_choose(values, weights)
    /// @desc Generate a weighted random choice
    /// @param {array} values Array of values to choose from
    /// @param {array} weights Array of weights (same length as values)
    /// @returns {any} Weighted random choice
    static weighted_choose = function(_values, _weights)
    {
        var _len = array_length(_values);
        if (_len == 0 || _len != array_length(_weights))
        {
            return undefined;
        }

        var _total_weight = 0;
        for (var i = 0; i < _len; i++)
        {
            _total_weight += _weights[i];
        }

        if (_total_weight <= 0)
        {
            return undefined;
        }

        var _random_val = float() * _total_weight;
        var _current_weight = 0;

        for (var i = 0; i < _len; i++)
        {
            _current_weight += _weights[i];
            if (_random_val <= _current_weight)
            {
                return _values[i];
            }
        }

        // Fallback (shouldn't happen)
        return _values[_len - 1];
    }
    
    /// @func string(length, charset[OPTIONAL])
    /// @desc Generate a random string
    /// @param {real} length Length of string
    /// @param {string} charset[OPTIONAL] Character set to use (defaults to alphanumeric characters)
    /// @returns {string} Random string
    static str = function(_length, _charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789")
    {
        var _result = "";
        var _charset_len = string_length(_charset);
        
        if (_charset_len == 0)
        {
            return "";
        }

        repeat(_length)
        {
            var _index = int(_charset_len - 1);
            _result += string_char_at(_charset, _index + 1);
        }
        
        return _result;
    }

    // Used by GameMaker to implicitly convert structs into strings in certain scenarios.
    // Useful for debugging.
    // https://manual.gamemaker.io/beta/en/GameMaker_Language/GML_Reference/Strings/Strings.htm#tostring_method
    static toString = function()
    {
        return "Randomizer with seed: " + string(__seed) + ", current state: " + string(__state) + ".";
    }

    // Let's rock
    __init(_seed);
}
