rng(23);
stats = ini_stats('wpnp_2x2sym');
stats.solver = 'red_10x20_wpnp_2x2sym';
stats.nroots = 16;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_wpnp_2x2sym();
    [C,U,dU] = coefs_wpnp_2x2sym(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);