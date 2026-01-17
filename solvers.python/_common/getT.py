import numpy as np

# get action matrix for column-pivoting solvers
def getT(M,RP,B,xP):

    d = len(B)
    T = np.zeros((d,d))
    for i in range(d):
        r = np.where(RP == xP[B[i]])[0]
        if len(r) == 0:
            idx = np.where(B == xP[B[i]])[0]
            if len(idx) > 0:
                T[i,idx[0]] = 1
        else:
            T[i,:] = M[r[0],:]

    return T