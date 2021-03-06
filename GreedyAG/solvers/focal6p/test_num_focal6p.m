rng(23);

N = 10000;

Err_focal6p = [];
Tm_focal6p = [];

for i = 1:N

    data = inidata_focal6p(); % generate initial data of the problem

    try
        tic;
        C = coefs_focal6p(data); % compute coefficients of polynomial system
        [gg,uu,vv] = nstd_11x26_focal6p(C); % solve polynomial system
        tm = toc;
        if isempty(gg); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(gg)
        g = gg(j);
        u = uu(j);
        v = vv(j);
        m = [g^2*u^2,g*u^3,g^2*u*v,g*u^2*v,g^2*v^2,v^2*u*g,v^3*g,u*g^2,u^2*g,u^3,v*g^2,g*u*v,v*u^2,g*v^2,v^2*u,v^3,g^2,g*u,u^2,g*v,v*u,v^2,g,u,v,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(15,length(M))),'fro');

    Err_focal6p = [Err_focal6p err];
    Tm_focal6p = [Tm_focal6p tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_focal6p.mat'),'Err_focal6p');

fprintf('Problem: focal6p. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_focal6p),median(Err_focal6p));
