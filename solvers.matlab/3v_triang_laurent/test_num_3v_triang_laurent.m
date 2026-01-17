rng(23);
stats = ini_stats('3v_triang_laurent');
stats.solver = 'red_69x127_3v_triang_laurent';
stats.nroots = 47;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_3v_triang_laurent();
    [C,U,dU] = coefs_3v_triang_laurent(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);