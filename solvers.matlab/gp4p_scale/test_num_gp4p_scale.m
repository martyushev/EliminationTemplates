rng(23);
stats = ini_stats('gp4p_scale');
stats.solver = 'red_40x52_gp4p_scale';
stats.nroots = 8;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_gp4p_scale();
    [C,U,dU] = coefs_gp4p_scale(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);