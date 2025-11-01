/// @desc The menu object

function MenuItem(_name, _info, _object) constructor
{
    name = _name;
    info = _info;
    object = _object;
}

menu_items = [
    new MenuItem("wFSM", "A flexible finite state machine library for managing complex object behaviors.", obj_example_wfsm),
    new MenuItem("wTimer", "A timer system for scheduling and delaying function executions.", obj_example_wtimer),
    new MenuItem("wRNG", "A seeded random number generator, supporting multiple independent randomizers.", obj_example_wrng),
    new MenuItem("wEase", "A comprehensive collection of easing functions, based on the work of Robert Penner.", obj_example_wease)
];

selected_item = 0;

// State management
enum MENU_STATE
{
    MENU,
    EXAMPLE
}

state = MENU_STATE.MENU;
current_example = noone; 