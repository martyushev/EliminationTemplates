% iterative refinement by Newton-Raphson method
function [e1,S] = iter_ref(e,S,C,U,dU)

    warning off; % suppress all warnings
    maxit = 10; % maximum number of iterations
    theta = 0.1*mean(e); % threshold
    e1 = e;
    for i = 1:size(S,2)
        x = S(:,i);
        it = 0;
        while e1(i) > theta && it < maxit
            m = U(x);
            dm = dU(x);
            A = C*m;
            J = C*dm;
            dx = J\A;
            x = x - dx;
            e1(i) = norm(A)/norm(m);
            it = it + 1;
        end
        if e1(i) < e(i); S(:,i) = x; else; e1(i) = e(i); end
    end
    [e1,I] = sort(e1);
    S = S(:,I);
    warning on;

end