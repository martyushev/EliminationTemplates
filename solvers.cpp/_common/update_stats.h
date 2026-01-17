#pragma once
#include "ini_stats.h"
#include <cmath>



inline void update_stats(Stats& stats, const Eigen::VectorXb& Ir, const Eigen::VectorXd& e) {
    int kr = Ir.count();
    int k = e.size()-1;

    double err = log10(e.head(k).norm());
    bool flr = (e.head(k).array() > 1e-3).any();
    double shrp = (e(k) == -1) ? -INFINITY : log10(e(k-1)/e(k));

    stats.err.push_back(err);
    stats.flr.push_back(flr);
    stats.shrp.push_back(shrp);
    stats.k.push_back(k);
    stats.kr.push_back(kr);
}