rng(23);
stats = ini_stats('relpose_7p_fr_1s');
stats.solver = 'red_34x56_relpose_7p_fr_1s';
stats.nroots = 19;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_relpose_7p_fr_1s();
    [C,U,dU] = coefs_relpose_7p_fr_1s(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);