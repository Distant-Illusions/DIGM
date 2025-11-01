/// @desc Draw the example text
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _lines = [
    "<SPACE> to generate new random values.",
    "<R> to reset the randomizers.",
    "<B> to run a benchmark.",
    "",
    "Main Randomizer (seed is time based):",
    "  - Float (0-100): " + string(float_val),
    "  - Int (-10 to 10): " + string(int_range_val),
    "  - Bool (75% true): " + (bool_val ? "True!" : "False..."),
    "  - Choose: " + choose_val,
    "  - Shuffled Array: " + string(shuffled_array),
    "  - Weighted Choose: " + weighted_result,
    "  - String: " + string_val,
    "",
    "Seeded Randomizer 1 (seed is 12345): " + string(seeded_1_val),
    "Seeded Randomizer 2 (seed is 12345): " + string(seeded_2_val),
    "Seeded Randomizer 3 (seed is 54321): " + string(seeded_3_val),
    "",
]; 

if (wrng_time != -1 && builtin_time != -1)
{
    var _speedup = builtin_time / wrng_time;
    array_push(_lines, "Benchmark Results (" + string(benchmark_iterations) + " iterations):");
    array_push(_lines, "  - wRNG: " + string(wrng_time / 1000) + "ms");
    array_push(_lines, "  - Built-in: " + string(builtin_time / 1000) + "ms");

    // Let's get the platform name
    var _platform_name = "";

    if (os_browser == browser_not_a_browser)
    {
        switch (os_type)
        {
            case os_windows:
                _platform_name = "Windows";
                break;
            case os_gxgames:
                _platform_name = "WASM/GX.games";
                break;
            case os_linux:
                _platform_name = "Linux";
                break;
            case os_macosx:
                _platform_name = "macOS";
                break;
            case os_ios:
                _platform_name = "iOS";
                break;
            case os_tvos:
                _platform_name = "tvOS";
                break;
            case os_android:
                _platform_name = "Android";
                break;
            case os_ps4:
                _platform_name = "Sony PlayStation 4";
                break;
            case os_ps5:
                _platform_name = "Sony PlayStation 5";
                break;
            case os_gdk:
                _platform_name = "Microsoft GDK";
                break;
            case os_switch:
                _platform_name = "Nintendo Switch";
                break;
            default:
                _platform_name = "Unknown";
                break;
        }

        if (code_is_compiled())
            _platform_name += " (YYC)";
        else
            _platform_name += " (VM)";
    }
    else
    {
        _platform_name = "Browser (JavaScript)";
    }
    
    if (_speedup > 1)
    {
        array_push(_lines, "  - Using wRNG is " + string_format(_speedup, 1, 1) + "x faster on " + _platform_name + "!");
    }
    else if (_speedup < 1)
    {
        array_push(_lines, "  - Using the built-in functions is " + string_format(1/_speedup, 1, 1) + "x faster on " + _platform_name + "!");
    }
    else
    {
        array_push(_lines, "  - Performance is pretty much equal on " + _platform_name + "!");
    }
    
    array_push(_lines, "\n  Please note that these numbers will change depending on the platform!");
}

for (var i = 0; i < array_length(_lines); i++)
{
    draw_set_color($21C7FF);
    var _scale = 0.5;
    draw_text_transformed(x, y + i * 52 * _scale, _lines[i], _scale, _scale, 0);
    draw_set_color(c_white);
} 