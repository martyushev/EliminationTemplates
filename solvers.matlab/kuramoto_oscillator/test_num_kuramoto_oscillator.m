rng(23);
stats = ini_stats('kuramoto_oscillator');
stats.solver = 'red_87x110_kuramoto_oscillator';
stats.nroots = 20;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_kuramoto_oscillator();
    [C,U,dU] = coefs_kuramoto_oscillator(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);