#pragma once
#include <Eigen/Dense>
#include <functional>



inline std::tuple<Eigen::Matrix3d, 
                  std::function<Eigen::VectorXd(const Eigen::Vector3d&)>,
                  std::function<Eigen::MatrixXd(const Eigen::Vector3d&)>>
coefs_toy(const Eigen::Vector3d& A) {

    Eigen::Matrix3d C = Eigen::Matrix3d::Zero();
    C(0,0)=1; C(0,2)=1; C(0,4)=1; C(1,3)=1; C(1,5)=1; 
    C(1,7)=1; C(1,9)=1; C(2,1)=1; C(2,8)=A(0);
    C(2,9)=A.segment<2>(1).norm();

    auto U = [](const Eigen::Vector3d& s) -> Eigen::VectorXd {
        Eigen::VectorXd v(10);
        v << s(0)*s(0)*s(0), s(1)*s(1)*s(1), s(2)*s(2)*s(0),
             s(0)*s(0), s(1)*s(0), s(1)*s(1), s(1)*s(2),
             s(2)*s(2), s(2), 1.0;
        return v;
    };

    auto dU = [](const Eigen::Vector3d& s) -> Eigen::MatrixXd {
        Eigen::MatrixXd J(10,3);
        J << 3*s(0)*s(0), 0, 0,
             0, 3*s(1)*s(1), 0,
             s(2)*s(2), 0, 2*s(2)*s(0),
             2*s(0), 0, 0,
             s(1), s(0), 0,
             0, 2*s(1), 0,
             0, s(2), s(1),
             0, 0, 2*s(2),
             0, 0, 1,
             0, 0, 0;
        return J;
    };

    return {C, U, dU};
}