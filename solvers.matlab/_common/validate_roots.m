% validate roots and remove false ones
function [S,Ir,e] = validate_roots(S,C,U,dU,nroots,iterref)

    n = size(S,2);
    k = min(nroots,n); % number of roots
    e = nan(size(C,2),n);
    for i = 1:n; e(:,i) = U(S(:,i)); end
    e = e./vecnorm(e);
    e = vecnorm(C*e);
    [e,I] = sort(e);
    S = S(:,I(1:k));
    e1 = e(1:k);
    if iterref; [e1,S] = iter_ref(e1,S,C,U,dU); end
    if n == k; e = [e1,-1]; else; e = [e1,e(k+1)]; end
    Ir = ~any(imag(S)); % mask for real roots

end