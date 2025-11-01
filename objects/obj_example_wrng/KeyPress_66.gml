/// @desc Run the benchmark

var _array = ["A", "B", "C", "D", "E"];

// Benchmark wRNG
var _start_time = get_timer();
repeat (benchmark_iterations)
{
    rng_main.float(1);
    rng_main.int_range(-10, 10);
    rng_main.bool(0.75);
    rng_main.choose_array(_array);
    rng_main.choose(1, 2, 3, 4);
    rng_main.shuffle_array(_array);
}
wrng_time = get_timer() - _start_time;

// Benchmark the built-in functions
var _start_time_2 = get_timer();
repeat (benchmark_iterations)
{
    random(1);
    irandom_range(-10, 10);
    bool(random(1) < 0.75);
    _array[irandom(array_length(_array) - 1)];
    choose(1, 2, 3, 4);
    array_shuffle(_array);
}
builtin_time = get_timer() - _start_time_2; 