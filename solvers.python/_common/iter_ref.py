import numpy as np
from scipy.linalg import lstsq, norm

# iterative refinement by Newton-Raphson method
def iter_ref(e,S,C,U,dU):

    maxit = 10 # maximum number of iterations
    theta = 0.1*np.mean(e) # threshold
    e1 = e.copy()
    for i in range(S.shape[1]):
        x = S[:,i].copy()
        it = 0
        while e1[i] > theta and it < maxit:
            m,dm = U(x),dU(x)
            A,J = C@m,C@dm
            dx = lstsq(J,A)[0]
            x -= dx
            e1[i] = norm(A)/norm(m)
            it += 1

        if e1[i] < e[i]:
            S[:,i] = x
        else:
            e1[i] = e[i]

    I = np.argsort(e1)

    return e1[I],S[:,I]