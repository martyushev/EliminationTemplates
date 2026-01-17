rng(23);
stats = ini_stats('unsynch_relpose');
stats.solver = 'red_59x79_unsynch_relpose';
stats.nroots = 16;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_unsynch_relpose();
    [C,U,dU] = coefs_unsynch_relpose(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);