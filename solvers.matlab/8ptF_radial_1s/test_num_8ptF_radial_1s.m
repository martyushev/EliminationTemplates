rng(23);
stats = ini_stats('8ptF_radial_1s');
stats.solver = 'red_7x15_8ptF_radial_1s';
stats.nroots = 8;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_8ptF_radial_1s();
    [C,U,dU] = coefs_8ptF_radial_1s(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);