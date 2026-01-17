rng(23);
stats = ini_stats('opt_pnp_nakanoC');
stats.solver = 'red_78x131_opt_pnp_nakanoC';
stats.nroots = 40;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_opt_pnp_nakanoC();
    [C,U,dU] = coefs_opt_pnp_nakanoC(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);