# validate roots and remove false ones
function validate_roots(S,C,U,dU,nroots,iterref)

    n = size(S,2)
    k = min(nroots,n) # number of roots
    e = transpose(mapslices(U,S,dims=1))
    e = e./norm.(eachrow(e))
    e = norm.(eachcol(C*transpose(e)))
    I = sortperm(e)
    e1,S = e[I[1:k]],S[:,I[1:k]]
    if Bool(iterref) e1,S = iter_ref(e1,S,C,U,dU) end
    if n == k e1 = [e1;-1] else e1 = [e1;e[I[k+1]]] end
    Ir = vec(all(c->isreal(c),S;dims=1)) # mask for real roots

    return S,Ir,e1

end