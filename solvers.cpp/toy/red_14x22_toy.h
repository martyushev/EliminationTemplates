#pragma once
#include <Eigen/Dense>
#include <Eigen/Sparse>
#include <Eigen/Eigenvalues>



inline Eigen::MatrixXd red_14x22_toy(const Eigen::Matrix3d& C) {
    using Triplet = Eigen::Triplet<double>;
    std::vector<Triplet> T = {
        {0,8,C(0,8)}, {0,11,C(1,4)}, {0,12,C(1,9)}, {1,12,C(0,8)}, {1,13,C(1,10)},
        {1,18,C(1,4)}, {1,20,C(1,9)}, {2,5,C(1,4)}, {2,6,C(0,8)}, {2,7,C(1,10)},
        {2,9,C(1,9)}, {3,10,C(0,8)}, {3,12,C(1,10)}, {3,15,C(1,4)}, {3,17,C(1,9)},
        {4,2,C(1,4)}, {4,16,C(1,9)}, {4,20,C(0,8)}, {4,21,C(1,10)}, {5,1,C(1,4)},
        {5,9,C(0,8)}, {5,11,C(1,10)}, {5,15,C(1,9)}, {6,5,C(0,2)}, {6,10,C(1,5)},
        {6,13,C(2,2)}, {6,19,C(1,7)}, {7,4,C(0,2)}, {7,7,C(2,2)}, {7,18,C(1,7)},
        {8,3,C(0,2)}, {8,6,C(2,2)}, {8,15,C(1,7)}, {9,1,C(0,2)}, {9,14,C(1,7)},
        {9,17,C(1,5)}, {9,21,C(2,2)}, {10,0,C(0,2)}, {10,2,C(1,7)}, {10,11,C(2,2)},
        {11,4,C(0,0)}, {11,19,C(0,6)}, {12,3,C(0,0)}, {12,8,C(2,9)}, {12,16,C(0,6)},
        {13,0,C(0,0)}, {13,13,C(2,9)}, {13,14,C(0,6)}
    };

    Eigen::SparseMatrix<double> M(14,22);
    M.setFromTriplets(T.begin(), T.end());

    Eigen::SparseLU<Eigen::SparseMatrix<double>> solver;
    solver.compute(M.block(0,0,14,9));

    Eigen::VectorXi p = solver.permutationP().indices();
    Eigen::SparseMatrix<double> L = solver.matrixL();
    Eigen::MatrixXd M2 = Eigen::MatrixXd(M.block(0,9,14,13));

    Eigen::MatrixXd M2_p(14,13);
    for(int i=0;i<14;i++) M2_p.row(i)=M2.row(p(i));

    Eigen::MatrixXd temp = L.topLeftCorner(9,9).triangularView<Eigen::Lower>().solve(M2_p.topRows(9));
    Eigen::MatrixXd M_new = M2_p.bottomRows(5) - L.bottomRows(5).leftCols(9) * temp;
    
    Eigen::MatrixXd T0 = Eigen::MatrixXd::Zero(8,8);
    Eigen::MatrixXd T1 = Eigen::MatrixXd::Zero(8,8);

    std::vector<int> idx = {1,3,4,6,7};
    for(int i=0;i<5;i++) {
        T0.row(idx[i]) = -M_new.row(i).tail(8);
        for(int j=0;j<5;j++) T1(idx[i],idx[j]) = M_new(i,j);
    }

    T0(5,1)=T0(6,3)=T0(7,6)=T1(0,0)=T1(2,2)=T1(5,5)=1;

    Eigen::GeneralizedEigenSolver<Eigen::MatrixXd> ges;
    ges.compute(T0,T1);

    Eigen::MatrixXcd V = ges.eigenvectors();
    Eigen::MatrixXd S(3,V.cols());

    int col=0;
    for(int i=0;i<V.cols();i++)
        if(std::abs(V(7,i))>1e-12)
            S.col(col++) = (V.col(i).segment(4,3)/V(7,i)).real();

    return S.leftCols(col);
}