clear
clc
%rng(23);

Kgt = cell([1,2]);
Kgt{1} = [rand rand rand; 0 rand rand; 0 0 1];
Kgt{2} = [rand rand rand; 0 rand rand; 0 0 1];
Zgt = [-0.02, -0.05]; % radial distortion coefficients

NP = 9; % number of point correspondences
NOISE = 0; % image noise level

[Pgt,~] = synth_cameras(2,Kgt); % ground truth camera matrices
[q,~] = synth_points(Pgt,NP,NOISE,Zgt); % synthetic image points

C = coefs_rdist9p(q{1},q{2}); % coefficients of polynomial system
[ww,xx,yy,zz] = std_rdist9p(C);

%w = ww(1);
%x = xx(1);
%y = yy(1);
%z = zz(1);
%mon = [z^2*w^2*x, y*z^2*w^2, y*x*z^2*w, y^2*z^2*w, x*y^2*z^2, y^3*z^2, z*w^2*x, z*w*x^2, y*z*w^2, z*w*x*y, x^2*z*y, z*w*y^2, x*z*y^2, y^3*z, z^2*w^2, x*z^2*w, z^2*w*y, y*x*z^2, y^2*z^2, w^2*x, w*x^2, x^3, y*w^2, w*y*x, y*x^2, y^2*w, x*y^2, y^3, w^2*z, x*z*w, z*x^2, w*y*z, z*x*y, y^2*z, z^2*w, x*z^2, y*z^2, w^2, w*x, x^2, y*w, x*y, y^2, z*w, x*z, y*z, z^2, w, x, y, z, 1];
%mon = mon./norm(mon,'fro');
%disp(C*mon'); 

[errz1,~] = rel_error(zz,Zgt(1));
[errz2,~] = rel_error(ww,Zgt(2));

disp("Numerical error in z:");
disp([errz1, errz2]);