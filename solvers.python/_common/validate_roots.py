import numpy as np
from _common.iter_ref import iter_ref

# validate roots and remove false ones
def validate_roots(S,C,U,dU,nroots,iterref):

    n = S.shape[1]
    k = min(nroots,n) # number of roots
    e = np.array([U(s) for s in S.T]).T
    e = e/np.linalg.norm(e,axis=0)
    e = np.linalg.norm(C@e,axis=0)
    I = np.argsort(e)
    e1,S = e[I[:k]],S[:,I[:k]]
    if iterref:
        e1,S = iter_ref(e1,S,C,U,dU)
    e1 = np.append(e1, -1 if n == k else e[I[k]])
    Ir = np.all(np.isreal(S),axis=0) # mask for real roots

    return S,Ir,e1