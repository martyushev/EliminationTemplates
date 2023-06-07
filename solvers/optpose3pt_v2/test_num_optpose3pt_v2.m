rng(23);
N = 10000;
d = 48;

stats = struct('problem','optpose3pt_v2','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_optpose3pt_v2(); % generate initial data

    try
        C = coefs_optpose3pt_v2(data); % compute coefficients of polynomial system
        tic;
        S = red_297x356_optpose3pt_v2(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(v,w,x,y,z) [v^3,v^2*w,v*w^2,w^3,v^2*x,v*w*x,w^2*x,v*x^2,w*x^2,x^3,v^2*y,v*w*y,w^2*y,v*y*x,w*x*y,y*x^2,v*y^2,w*y^2,x*y^2,y^3,v^2*z,v*z*w,w^2*z,v*z*x,w*z*x,z*x^2,z*y*v,y*w*z,y*x*z,y^2*z,v*z^2,w*z^2,x*z^2,y*z^2,z^3,v^2,v*w,w^2,v*x,w*x,x^2,v*y,y*w,y*x,y^2,v*z,z*w,z*x,y*z,z^2,v,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);