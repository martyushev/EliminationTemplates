#include "../_common/ini_stats.h"
#include "../_common/validate_roots.h"
#include "../_common/update_stats.h"
#include "../_common/disp_stats.h"
#include "inidata_num_toy.h"
#include "coefs_toy.h"
#include "red_14x22_toy.h"
#include <chrono>
#include <random>
#include <iostream>



int main() {
    Stats stats("toy");
    stats.solver = "red_14x22_toy";
    stats.nroots = 8;
    stats.ntrials = 10000;
    stats.iterref = 0;

    std::mt19937 gen(23);

    for(int i=0;i<stats.ntrials;i++) {
        auto start = std::chrono::high_resolution_clock::now();

        auto data = inidata_num_toy();
        auto [C,U,dU] = coefs_toy(data);
        auto S = red_14x22_toy(C);

        auto [S_val, Ir, e] = validate_roots(S, C, U, dU, stats.nroots, stats.iterref);

        auto end = std::chrono::high_resolution_clock::now();
        stats.tm.push_back(std::chrono::duration<double>(end-start).count());

        update_stats(stats, Ir, e);
    }

    disp_stats(stats);

    return 0;
}