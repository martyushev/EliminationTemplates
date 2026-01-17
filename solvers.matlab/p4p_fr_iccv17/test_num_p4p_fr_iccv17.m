rng(23);
stats = ini_stats('p4p_fr_iccv17');
stats.solver = 'red_28x40_p4p_fr_iccv17';
stats.nroots = 12;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_p4p_fr_iccv17();
    [C,U,dU] = coefs_p4p_fr_iccv17(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);