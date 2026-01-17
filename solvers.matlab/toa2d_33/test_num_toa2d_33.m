rng(23);
stats = ini_stats('toa2d_33');
stats.solver = 'red_18x28_toa2d_33';
stats.nroots = 8;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_toa2d_33();
    [C,U,dU] = coefs_toa2d_33(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);