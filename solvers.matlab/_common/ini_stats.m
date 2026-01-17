% initialize solver statistics
function stats = ini_stats(prob)

    stats = struct(...
        'name',prob,...    % problem name
        'solver','',...    % solver
        'nroots',0,...     % number of roots
        'ntrials',0,...    % number of trials
        'iterref',0,...    % iterative refinement
        'tm',[],...        % timing
        'err',[],...       % numerical error
        'flr',[],...       % failure
        'shrp',[],...      % boundary sharpness
        'k',[],...         % number of roots
        'kr',[]);          % number of real roots

end