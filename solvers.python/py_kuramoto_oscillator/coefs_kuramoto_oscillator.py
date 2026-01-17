import numpy as np

def coefs_kuramoto_oscillator(data):

    W = data[0].T.flat
    A = data[1].T.flat

    C = np.zeros((6,16))
    C.flat[[63,79,95]] = -1
    C.flat[[48,53,65,72,82,91]] = 1
    C.flat[15] = W[0]
    C.flat[31] = W[1]
    C.flat[47] = W[2]
    C.flat[22] = -1/4*A[1]
    C.flat[19] = 1/4*A[1]
    C.flat[41] = -1/4*A[2]
    C.flat[36] = 1/4*A[2]
    C.flat[3] = -1/4*A[3]
    C.flat[6] = 1/4*A[3]
    C.flat[42] = -1/4*A[5]
    C.flat[39] = 1/4*A[5]
    C.flat[4] = -1/4*A[6]
    C.flat[9] = 1/4*A[6]
    C.flat[23] = -1/4*A[7]
    C.flat[26] = 1/4*A[7]
    C.flat[12] = -1/4*A[9]
    C.flat[29] = -1/4*A[10]
    C.flat[46] = -1/4*A[11]

    C = C/np.linalg.norm(C,axis=1,keepdims=True)

    def U(s):
        return np.array([s[0]**2,s[1]**2,s[2]**2,s[1]*s[3],s[2]*s[3],s[3]**2,s[0]*s[4],s[4]*s[2],s[4]**2,s[5]*s[0],s[1]*s[5],s[5]**2,s[3],s[4],s[5],1])

    def dU(s):
        return np.column_stack([[2*s[0],0,0,0,0,0,s[4],0,0,s[5],0,0,0,0,0,0],[0,2*s[1],0,s[3],0,0,0,0,0,0,s[5],0,0,0,0,0],[0,0,2*s[2],0,s[3],0,0,s[4],0,0,0,0,0,0,0,0],[0,0,0,s[1],s[2],2*s[3],0,0,0,0,0,0,1,0,0,0],[0,0,0,0,0,0,s[0],s[2],2*s[4],0,0,0,0,1,0,0],[0,0,0,0,0,0,0,0,0,s[0],s[1],2*s[5],0,0,1,0]])

    return C,U,dU