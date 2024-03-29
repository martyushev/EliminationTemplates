rng(23);
N = 10000;
d = 6;

stats = struct('problem','relpose_7p_fuv_angle_w_sat','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_relpose_7p_fuv_angle_w_sat(); % generate initial data

    try
        B = coefs_relpose_7p_fuv_angle_w_sat(data); % compute coefficients of polynomial system
        tic;
        C = sat_relpose_7p_fuv_angle_w_sat(B); % saturation of 1-dimensional ideal
        S = red_14x26_colpiv_relpose_7p_fuv_angle_w_sat(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(a,b,p) [a^4,a^3*b,a^2*b^2,a*b^3,b^4,a^3,a^2*b,a*b^2,b^3,a^2*p,a*b*p,b^2*p,a^2,b*a,b^2,p*a,b*p,p^2,a,b,p,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);