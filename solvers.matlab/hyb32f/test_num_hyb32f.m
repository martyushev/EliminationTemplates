rng(23);
stats = ini_stats('hyb32f');
stats.solver = 'red_162x221_hyb32f';
stats.nroots = 28;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_hyb32f();
    [C,U,dU] = coefs_hyb32f(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);