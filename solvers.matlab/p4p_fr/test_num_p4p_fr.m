rng(23);
stats = ini_stats('p4p_fr');
stats.solver = 'red_42x60_p4p_fr';
stats.nroots = 16;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_p4p_fr();
    [C,U,dU] = coefs_p4p_fr(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);