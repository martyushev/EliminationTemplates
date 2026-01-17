rng(23);
stats = ini_stats('opt_pnp_hesch');
stats.solver = 'red_62x97_opt_pnp_hesch';
stats.nroots = 27;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_opt_pnp_hesch();
    [C,U,dU] = coefs_opt_pnp_hesch(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);