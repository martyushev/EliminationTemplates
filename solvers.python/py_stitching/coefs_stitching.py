import numpy as np

def coefs_stitching(data):

    c1 = data[0].T.flat
    c2 = data[1].T.flat

    C = np.zeros((2,16))
    C.flat[0] = c1[0]
    C.flat[1] = c1[1]
    C.flat[2] = c1[2]
    C.flat[3] = c1[3]
    C.flat[4] = c1[4]
    C.flat[5] = c1[5]
    C.flat[6] = c1[6]
    C.flat[7] = c1[7]
    C.flat[9] = c1[8]
    C.flat[8] = c1[9]
    C.flat[10] = c1[10]
    C.flat[12] = c1[11]
    C.flat[11] = c1[12]
    C.flat[13] = c1[13]
    C.flat[14] = c1[14]
    C.flat[15] = c1[15]
    C.flat[16] = c2[0]
    C.flat[17] = c2[1]
    C.flat[18] = c2[2]
    C.flat[19] = c2[3]
    C.flat[20] = c2[4]
    C.flat[21] = c2[5]
    C.flat[22] = c2[6]
    C.flat[23] = c2[7]
    C.flat[25] = c2[8]
    C.flat[24] = c2[9]
    C.flat[26] = c2[10]
    C.flat[28] = c2[11]
    C.flat[27] = c2[12]
    C.flat[29] = c2[13]
    C.flat[30] = c2[14]
    C.flat[31] = c2[15]

    C = C/np.linalg.norm(C,axis=1,keepdims=True)

    def U(s):
        return np.array([s[0]**6*s[1]**3,s[0]**5*s[1]**3,s[0]**4*s[1]**3,s[0]**4*s[1]**2,s[0]**3*s[1]**3,s[0]**3*s[1]**2,s[1]**3*s[0]**2,s[0]**2*s[1]**2,s[0]*s[1]**3,s[1]*s[0]**2,s[0]*s[1]**2,s[1]**3,s[1]*s[0],s[1]**2,s[1],1])

    def dU(s):
        return np.column_stack([[6*s[0]**5*s[1]**3,5*s[0]**4*s[1]**3,4*s[0]**3*s[1]**3,4*s[0]**3*s[1]**2,3*s[1]**3*s[0]**2,3*s[0]**2*s[1]**2,2*s[0]*s[1]**3,2*s[0]*s[1]**2,s[1]**3,2*s[1]*s[0],s[1]**2,0,s[1],0,0,0],[3*s[0]**6*s[1]**2,3*s[0]**5*s[1]**2,3*s[0]**4*s[1]**2,2*s[0]**4*s[1],3*s[0]**3*s[1]**2,2*s[0]**3*s[1],3*s[0]**2*s[1]**2,2*s[1]*s[0]**2,3*s[0]*s[1]**2,s[0]**2,2*s[1]*s[0],3*s[1]**2,s[0],2*s[1],1,0]])

    return C,U,dU