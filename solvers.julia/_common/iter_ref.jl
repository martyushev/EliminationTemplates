# iterative refinement by Newton-Raphson method
function iter_ref(e,S,C,U,dU)

    maxit = 10 # maximum number of iterations
    theta = 0.1*mean(e) # threshold
    e1 = copy(e)
    for i in 1:size(S,2)
        x = S[:,i]
        it = 0
        while e1[i] > theta && it < maxit
            m,dm = U(x),dU(x)
            A,J = C*m,C*dm
            dx = J\A
            x -= dx
            e1[i] = norm(A)/norm(m)
            it += 1
        end
        if e1[i] < e[i] S[:,i] = x else e1[i] = e[i] end
    end
    I = sortperm(e1)

    return e1[I],S[:,I]

end