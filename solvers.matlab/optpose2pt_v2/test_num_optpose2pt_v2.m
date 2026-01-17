rng(23);
stats = ini_stats('optpose2pt_v2');
stats.solver = 'red_87x120_optpose2pt_v2';
stats.nroots = 24;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_optpose2pt_v2();
    [C,U,dU] = coefs_optpose2pt_v2(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);