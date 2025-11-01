/// @desc An example object

// Main randomizer, random seed
rng_main = new Randomizer();

// Two randomizers with the same seed, to show they produce the same sequence
seed1 = 12345;
rng_seeded_1 = new Randomizer(seed1);
rng_seeded_2 = new Randomizer(seed1);

// An independent randomizer with a different seed
seed2 = 54321;
rng_seeded_3 = new Randomizer(seed2);

// The shuffled array
shuffled_array = ["A", "B", "C", "D", "E"];

// Weighted choose
weighted_values = ["Common", "Uncommon", "Rare"];
weighted_weights = [10, 5, 1];
weighted_result = "";

// Benchmarking
benchmark_iterations = 100000;
wrng_time = -1;
builtin_time = -1;

// Generate the initial values
generate_all_numbers = function()
{
    float_val = rng_main.float(100);
    int_range_val = rng_main.int_range(-10, 10);
    bool_val = rng_main.bool(0.75);
    choose_val = rng_main.choose("Operius DX", "Cascadence", "Dormiveglia", "Grapple Tongue");
    string_val = rng_main.str(8);
    shuffled_array = rng_main.shuffle_array(shuffled_array);
    weighted_result = rng_main.weighted_choose(weighted_values, weighted_weights);
    
    seeded_1_val = rng_seeded_1.int(100);
    seeded_2_val = rng_seeded_2.int(100);
    seeded_3_val = rng_seeded_3.int(100);
}

generate_all_numbers();