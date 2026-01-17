rng(23);
stats = ini_stats('tdoa_pose_5pt');
stats.solver = 'red_195x237_tdoa_pose_5pt';
stats.nroots = 24;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_tdoa_pose_5pt();
    [C,U,dU] = coefs_tdoa_pose_5pt(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);