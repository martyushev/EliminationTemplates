rng(23);
stats = ini_stats('satellite_triang');
stats.solver = 'red_74x104_satellite_triang';
stats.nroots = 27;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_satellite_triang();
    [C,U,dU] = coefs_satellite_triang(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);