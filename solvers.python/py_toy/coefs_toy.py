import numpy as np

def coefs_toy(data):

    A = data[0].T.flat

    C = np.zeros((3,10))
    C.flat[[4,6,8,13,15,17,20,21,22]] = 1
    C.flat[9] = A[0]
    C.flat[19] = A[1]
    C.flat[29] = A[2]

    C = C/np.linalg.norm(C,axis=1,keepdims=True)

    def U(s):
        return np.array([s[0]**3,s[1]**3,s[0]*s[2]**2,s[0]**2,s[1]*s[0],s[1]**2,s[1]*s[2],s[2]**2,s[2],1])

    def dU(s):
        return np.column_stack([[3*s[0]**2,0,s[2]**2,2*s[0],s[1],0,0,0,0,0],[0,3*s[1]**2,0,0,s[0],2*s[1],s[2],0,0,0],[0,0,2*s[0]*s[2],0,0,0,s[1],2*s[2],1,0]])

    return C,U,dU