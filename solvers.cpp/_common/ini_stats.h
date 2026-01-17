#pragma once
#include <vector>
#include <string>



struct Stats {
    std::string name, solver;
    int nroots = 0, ntrials = 0, iterref = 0;
    std::vector<double> tm, err, shrp;
    std::vector<bool> flr;
    std::vector<int> k, kr;

    Stats(const std::string& prob) : name(prob) {}
};