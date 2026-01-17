#pragma once
#include <Eigen/Dense>
#include <random>



inline Eigen::Vector3d inidata_num_toy() {
    static std::mt19937 gen(23);
    std::normal_distribution<double> dist;
    return {dist(gen), dist(gen), dist(gen)};
}