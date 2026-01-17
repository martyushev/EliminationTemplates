rng(23);
stats = ini_stats('r6p');
stats.solver = 'red_66x92_r6p';
stats.nroots = 20;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_r6p();
    [C,U,dU] = coefs_r6p(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);