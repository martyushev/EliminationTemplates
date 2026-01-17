rng(23);
stats = ini_stats('gen5pra');
stats.solver = 'red_34x79_gen5pra';
stats.nroots = 44;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_gen5pra();
    [C,U,dU] = coefs_gen5pra(data);

    S = feval(stats.solver,C,data{5}^2-1);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);