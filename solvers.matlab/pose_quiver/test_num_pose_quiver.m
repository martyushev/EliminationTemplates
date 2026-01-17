rng(23);
stats = ini_stats('pose_quiver');
stats.solver = 'red_38x74_pose_quiver';
stats.nroots = 20;
stats.ntrials = 10^4;
stats.iterref = 0;

for i = 1:stats.ntrials

    tic;
    data = inidata_num_pose_quiver();
    [C,U,dU] = coefs_pose_quiver(data);

    S = feval(stats.solver,C);
    [S,Ir,e] = validate_roots(S,C,U,dU,stats.nroots,stats.iterref);

    stats.tm = [stats.tm toc];
    stats = update_stats(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);