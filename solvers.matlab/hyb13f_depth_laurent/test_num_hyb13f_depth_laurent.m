rng(23);
stats = ini_stats('hyb13f_depth_laurent');
stats.solver = 'red_115x134_colpiv_hyb13f_depth_laurent';
stats.nroots = 12;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_hyb13f_depth_laurent();
    [C,U,dU] = coefs_hyb13f_depth_laurent(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);