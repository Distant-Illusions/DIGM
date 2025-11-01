/// @desc Reseed all randomizers

rng_main.set_seed();

rng_seeded_1.set_seed(seed1);
rng_seeded_2.set_seed(seed1);
rng_seeded_3.set_seed(seed2);

generate_all_numbers();