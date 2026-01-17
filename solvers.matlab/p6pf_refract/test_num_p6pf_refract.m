rng(23);
stats = ini_stats('p6pf_refract');
stats.solver = 'red_40x61_p6pf_refract';
stats.nroots = 36;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_p6pf_refract();
    [C,U,dU] = coefs_p6pf_refract(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);