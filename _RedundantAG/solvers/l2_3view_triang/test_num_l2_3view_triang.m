rng(23);
N = 10000;

stats = struct('problem','l2_3view_triang','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_l2_3view_triang(); % generate initial data

    try
        C = coefs_l2_3view_triang(data); % compute coefficients of polynomial system
        tic;
        S = red_190x227_colpiv_l2_3view_triang(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x1,x2,x3,x4,x5,x6,x7,x8) [x3*x1,x3*x2,x4*x1,x4*x2,x5*x3,x5*x4,x6*x3,x6*x4,x7*x1,x7*x2,x7*x3,x7*x4,x8*x3,x8*x4,x8*x5,x8*x6,x1,x2,x3,x4,x5,x6,x7,x8,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,31); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);