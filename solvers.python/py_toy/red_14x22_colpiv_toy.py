import numpy as np
from scipy.sparse import csr_matrix
from scipy.linalg import lu, qr, solve, eig
from _common.getT import getT

# Input: coefficient matrix C of size 3x10
# Output: solution matrix S of size 3x8

def red_14x22_colpiv_toy(C):

    M = csr_matrix((C.flat[[8,4,6,8,9,4,6,9,8,4,6,8,9,4,6,4,6,8,9,8,9,4,6,13,17,19,15,19,13,15,19,13,15,13,15,17,19,13,19,15,20,21,29,20,21,20,29,21]],([0,0,0,1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,8,8,8,9,9,9,9,10,10,10,11,11,12,12,12,13,13,13],[1,9,10,10,11,18,20,0,3,6,7,8,10,15,17,13,16,20,21,7,9,12,15,6,8,11,19,0,2,18,3,5,15,12,14,17,21,4,9,13,2,19,1,5,16,4,11,14])),shape=(14,22))
    M = M.toarray()

    p,L,_ = lu(M[:,:6],p_indices=True)
    p = np.argsort(p)
    M = M[p[6:],6:]-L[6:,:]@solve(L[:6,:],M[p[:6],6:])

    p,L,U = lu(M[:,:6],p_indices=True)
    p = np.argsort(p)
    M1 = solve(L[:6,:],M[p[:6],6:])
    M2 = M[p[6:],6:]-L[6:,:]@M1

    Q,R,p = qr(M2[:,:-4],mode='economic',pivoting=True)
    A = solve(U,np.hstack([M1[:,p],M1[:,-4:]]))
    B = solve(R[:,:2],np.hstack([R[:,2:],Q.T@M2[:,-4:]]))
    M = np.vstack([-A[:,-8:]+A[:,:-8]@B,-B])

    P1 = np.hstack([np.arange(10,16),p,np.arange(6,10)])
    P2 = np.array([10,6,7,11,8,12,13,9,14,15])
    T = getT(M,P1[:-8],P1[-8:],P2)

    _,V = eig(T)
    S = V[4:7,:]/V[7,:]
    S = S[:,np.all(np.isfinite(S),axis=0)]

    return S