#pragma once
#include "ini_stats.h"
#include <iostream>
#include <algorithm>
#include <numeric>



inline void disp_stats(const Stats& stats, bool plotHist=false, bool saveHist=false) {
    std::cout << "Problem:           " << stats.name << "\n"
              << "Solver:            " << stats.solver << "\n"
              << "Number of trials:  " << stats.ntrials << "\n"
              << "Iterative refinement: " << (stats.iterref ? "yes" : "no") << "\n"
              << "Ave. runtime (ms): " << 1000.0*std::accumulate(stats.tm.begin(),stats.tm.end(),0.0)/stats.tm.size() << "\n";

    if(!stats.err.empty()) {
        auto [min_err, max_err] = std::minmax_element(stats.err.begin(), stats.err.end());
        double mean_err = std::accumulate(stats.err.begin(), stats.err.end(), 0.0)/stats.err.size();
        std::nth_element(stats.err.begin(), stats.err.begin()+stats.err.size()/2, stats.err.end());
        double med_err = stats.err[stats.err.size()/2];

        std::cout << "Max. num. error:   " << *max_err << "\n"
                  << "Ave. num. error:   " << mean_err << "\n"
                  << "Med. num. error:   " << med_err << "\n";
    }

    if(!stats.flr.empty()) {
        double fail_rate = 100.0*std::count(stats.flr.begin(), stats.flr.end(), true)/stats.flr.size();
        std::cout << "Fails (%):         " << fail_rate << "\n";
    }

    if(!stats.shrp.empty() && stats.shrp[0] > -INFINITY) {
        double mean_shrp = std::accumulate(stats.shrp.begin(), stats.shrp.end(), 0.0)/stats.shrp.size();
        std::nth_element(stats.shrp.begin(), stats.shrp.begin()+stats.shrp.size()/2, stats.shrp.end());
        double med_shrp = stats.shrp[stats.shrp.size()/2];

        std::cout << "Ave. sharpness:    " << mean_shrp << "\n"
                  << "Med. sharpness:    " << med_shrp << "\n";
    }

    if(!stats.k.empty() && !stats.kr.empty()) {
        auto [min_k, max_k] = std::minmax_element(stats.k.begin(), stats.k.end());
        auto [min_kr, max_kr] = std::minmax_element(stats.kr.begin(), stats.kr.end());
        double mean_kr = std::accumulate(stats.kr.begin(), stats.kr.end(), 0.0)/stats.kr.size();

        std::cout << "Min. number of roots: " << *min_k << "\n"
                  << "Max. number of real roots: " << *max_kr << "\n"
                  << "Ave. number of real roots: " << mean_kr << "\n";
    }
}