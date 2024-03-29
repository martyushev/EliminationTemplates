rng(23);
N = 10000;
d = 140;

stats = struct('problem','gen_relpose_scale','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_gen_relpose_scale(); % generate initial data

    try
        C = coefs_gen_relpose_scale(data); % compute coefficients of polynomial system
        tic;
        S = red_114x274_gen_relpose_scale(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [x^8,y*x^7,y^2*x^6,y^3*x^5,y^4*x^4,y^5*x^3,y^6*x^2,y^7*x,y^8,z*x^7,z*y*x^6,z*y^2*x^5,z*y^3*x^4,z*y^4*x^3,z*y^5*x^2,z*y^6*x,z*y^7,z^2*x^6,z^2*y*x^5,z^2*y^2*x^4,z^2*y^3*x^3,z^2*y^4*x^2,z^2*y^5*x,z^2*y^6,z^3*x^5,z^3*y*x^4,z^3*y^2*x^3,z^3*y^3*x^2,x*y^4*z^3,y^5*z^3,x^4*z^4,x^3*y*z^4,x^2*y^2*z^4,x*y^3*z^4,y^4*z^4,x^3*z^5,x^2*y*z^5,x*y^2*z^5,y^3*z^5,x^2*z^6,x*y*z^6,y^2*z^6,x*z^7,y*z^7,z^8,x^7,x^6*y,x^5*y^2,x^4*y^3,x^3*y^4,x^2*y^5,x*y^6,y^7,x^6*z,x^5*y*z,x^4*y^2*z,x^3*y^3*z,x^2*y^4*z,x*y^5*z,y^6*z,x^5*z^2,x^4*y*z^2,x^3*y^2*z^2,x^2*y^3*z^2,x*y^4*z^2,y^5*z^2,x^4*z^3,x^3*y*z^3,x^2*y^2*z^3,x*y^3*z^3,y^4*z^3,x^3*z^4,x^2*y*z^4,x*y^2*z^4,y^3*z^4,x^2*z^5,x*y*z^5,y^2*z^5,x*z^6,y*z^6,z^7,x^6,x^5*y,x^4*y^2,x^3*y^3,x^2*y^4,y^5*x,y^6,x^5*z,x^4*y*z,x^3*y^2*z,x^2*y^3*z,y^4*x*z,y^5*z,x^4*z^2,x^3*z^2*y,x^2*y^2*z^2,y^3*z^2*x,y^4*z^2,x^3*z^3,x^2*z^3*y,y^2*z^3*x,y^3*z^3,x^2*z^4,z^4*x*y,y^2*z^4,z^5*x,z^5*y,z^6,x^5,x^4*y,x^3*y^2,y^3*x^2,x*y^4,y^5,x^4*z,x^3*y*z,y^2*x^2*z,x*y^3*z,y^4*z,x^3*z^2,z^2*x^2*y,x*y^2*z^2,y^3*z^2,z^3*x^2,x*z^3*y,z^3*y^2,x*z^4,y*z^4,z^5,x^4,x^3*y,x^2*y^2,y^3*x,y^4,x^3*z,x^2*y*z,y^2*x*z,y^3*z,x^2*z^2,z^2*x*y,y^2*z^2,z^3*x,z^3*y,z^4,x^3,x^2*y,x*y^2,y^3,x^2*z,x*y*z,y^2*z,x*z^2,y*z^2,z^3,x^2,x*y,y^2,x*z,y*z,z^2,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);