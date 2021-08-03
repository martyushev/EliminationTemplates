warning ('off', 'all');

%clear
%clc
rng(23);

%N = 10000;

Err = [];
Tm = [];

for i = 1:N

q1 = rand(2,7);
q2 = rand(2,7);

try
    tic;
    C = coefs_relpose_7p_fr(q1,q2); % coefficients of polynomial system
    [vv,ww,xx,yy,zz] = std_relpose_7p_fr_v4(C);
    tm = toc;
catch ME
    continue;
end

M = [];
for j=1:length(vv)
    v = vv(j);
    w = ww(j);
    x = xx(j);
    y = yy(j);
    z = zz(j);
    m = [v*w^3*z^3, v*w^2*z^3*x, v*w*z^3*x^2, v*x^3*z^3, v*w^2*z^3*y, v*x*z^3*y*w, v*x^2*z^3*y, v*w*z^3*y^2, v*x*z^3*y^2, v*y^3*z^3, v*w^3*z^2, v*x*w^2*z^2, v*w*z^2*x^2, v*x^3*z^2, v*y*w^2*z^2, v*y*w*z^2*x, v*y*x^2*z^2, v*w*z^2*y^2, v*x*z^2*y^2, v*y^3*z^2, v*w^2*z^3, w^3*z^3, v*w*z^3*x, w^2*z^3*x, v*x^2*z^3, w*z^3*x^2, x^3*z^3, v*w*z^3*y, w^2*z^3*y, v*x*z^3*y, x*z^3*y*w, x^2*z^3*y, v*y^2*z^3, w*z^3*y^2, x*z^3*y^2, y^3*z^3, z*w^3*v, x*v^2*w*z, v*w^2*x*z, x^2*v^2*z, x^2*v*w*z, x^3*v*z, v^2*y*w*z, v*y*w^2*z, x*v^2*y*z, x*v*y*w*z, x^2*v*y*z, z*y^2*v^2, v*y^2*w*z, x*v*y^2*z, z*y^3*v, z^2*w^2*v, z^2*w^3, v*w*z^2*x, x*w^2*z^2, v*x^2*z^2, w*z^2*x^2, x^3*z^2, v*w*z^2*y, y*w^2*z^2, v*x*z^2*y, y*w*z^2*x, y*x^2*z^2, z^2*y^2*v, w*z^2*y^2, x*z^2*y^2, z^2*y^3, z^3*w*v, z^3*w^2, v*z^3*x, w*z^3*x, x^2*z^3, z^3*y*v, w*z^3*y, x*z^3*y, z^3*y^2, v*w^3, w*x*v^2, x*w^2*v, x^2*v^2, w*x^2*v, x^3*v, w*y*v^2, y*w^2*v, x*y*v^2, w*x*y*v, x^2*y*v, y^2*v^2, w*y^2*v, x*y^2*v, v*y^3, z*w*v^2, v*w^2*z, w^3*z, z*x*v^2, z*w*x*v, z*w^2*x, x^2*v*z, w*x^2*z, x^3*z, z*v^2*y, v*y*w*z, y*w^2*z, z*y*x*v, y*w*x*z, y*x^2*z, v*y^2*z, y^2*w*z, z*y^2*x, y^3*z, v*w*z^2, w^2*z^2, v*x*z^2, w*z^2*x, x^2*z^2, v*y*z^2, w*z^2*y, x*z^2*y, y^2*z^2, v*z^3, z^3*w, z^3*x, z^3*y, v^2*w, v*w^2, w^3, v^2*x, x*v*w, w^2*x, x^2*v, w*x^2, x^3, v^2*y, v*y*w, y*w^2, x*v*y, y*w*x, y*x^2, y^2*v, y^2*w, x*y^2, y^3, z*v^2, v*w*z, w^2*z, x*v*z, w*x*z, z*x^2, v*y*z, y*w*z, x*y*z, y^2*z, v*z^2, w*z^2, z^2*x, y*z^2, z^3, v^2, v*w, w^2, x*v, w*x, x^2, y*v, y*w, x*y, y^2, v*z, z*w, x*z, z*y, z^2, v, w, x, y, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
err = log10(norm(C*M','fro'));

Err = [Err err];
Tm = [Tm tm];

end

Err_relpose_7p_fr = Err;
Tm_relpose_7p_fr = Tm;
%folder = fileparts(which('test_num_all.m'));
save(strcat(folder, '\_results\Err_relpose_7p_fr.mat'),'Err_relpose_7p_fr');
save(strcat(folder, '\_results\Tm_relpose_7p_fr.mat'),'Tm_relpose_7p_fr');

sprintf('%0.1f, %0.2e', 10^3*median(Tm), 10^median(Err))

warning ('on', 'all');