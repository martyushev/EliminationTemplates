rng(23);
stats = ini_stats('focal6p_1s');
stats.solver = 'red_11x20_focal6p_1s';
stats.nroots = 9;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_focal6p_1s();
    [C,U,dU] = coefs_focal6p_1s(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);