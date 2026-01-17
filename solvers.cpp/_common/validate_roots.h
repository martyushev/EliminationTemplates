#pragma once
#include <Eigen/Dense>
#include <functional>
#include <algorithm>



inline std::tuple<Eigen::MatrixXd, Eigen::VectorXb, Eigen::VectorXd>
validate_roots(const Eigen::MatrixXd& S, const Eigen::Matrix3d& C,
               const std::function<Eigen::VectorXd(const Eigen::Vector3d&)>& U,
               const std::function<Eigen::MatrixXd(const Eigen::Vector3d&)>& dU,
               int nroots, int iterref) {

    int n = S.cols();
    int k = std::min(nroots, n);

    Eigen::VectorXd e(n);
    for(int i=0;i<n;i++) {
        Eigen::VectorXd u = U(S.col(i));
        e(i) = (C * u).norm();
    }

    std::vector<int> idx(n);
    std::iota(idx.begin(), idx.end(), 0);
    std::sort(idx.begin(), idx.end(), [&](int i, int j){return e(i)<e(j);});

    Eigen::MatrixXd S_sorted(3,k);
    Eigen::VectorXd e_sorted(k);
    for(int i=0;i<k;i++) {
        S_sorted.col(i) = S.col(idx[i]);
        e_sorted(i) = e(idx[i]);
    }

    Eigen::VectorXb Ir = (S_sorted.array().imag().abs() < 1e-12).rowwise().all();

    Eigen::VectorXd e_result(k+1);
    e_result.head(k) = e_sorted;
    e_result(k) = (n==k) ? -1 : e(idx[k]);

    return {S_sorted, Ir, e_result};
}