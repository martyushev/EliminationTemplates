rng(23);
stats = ini_stats('hyb51f');
stats.solver = 'red_598x684_hyb51f';
stats.nroots = 56;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_hyb51f();
    [C,U,dU] = coefs_hyb51f(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);