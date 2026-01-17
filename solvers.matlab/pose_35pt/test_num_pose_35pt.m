rng(23);
stats = ini_stats('pose_35pt');
stats.solver = 'red_12x26_pose_35pt';
stats.nroots = 10;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_pose_35pt();
    [C,U,dU] = coefs_pose_35pt(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);