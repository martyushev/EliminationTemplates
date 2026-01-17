rng(23);
stats = ini_stats('4pra');
stats.solver = 'red_12x36_4pra';
stats.nroots = 20;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_4pra();
    [C,U,dU] = coefs_4pra(data);

    S = feval(stats.solver,C,data{3}^2-1);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);