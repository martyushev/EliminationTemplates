clear
clc
%rng(23);

E12 = rand(3,3);
E23 = rand(3,3);
u = rand(2,3);

C = coefs_l2_3view_triang(E12,E23,u); % coefficients of polynomial system
[xx1,xx2,xx3,xx4,xx5,xx6,xx7,xx8] = std_l2_3view_triang(C);

M = [];
for j=1:length(xx1)
    x1 = xx1(j);
    x2 = xx2(j);
    x3 = xx3(j);
    x4 = xx4(j);
    x5 = xx5(j);
    x6 = xx6(j);
    x7 = xx7(j);
    x8 = xx8(j);
    m = [x1*x3, x2*x3, x4*x1, x4*x2, x3*x5, x4*x5, x3*x6, x6*x4, x7*x1, x7*x2, x3*x7, x4*x7, x3*x8, x4*x8, x5*x8, x6*x8, x1, x2, x3, x4, x5, x6, x7, x8, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
disp("log10 of normalized residual:");
disp(log10(norm(C*M','fro')));