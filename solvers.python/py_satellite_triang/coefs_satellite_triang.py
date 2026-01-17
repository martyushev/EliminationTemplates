import numpy as np

def coefs_satellite_triang(data):

    c1 = data[0].T.flat
    c2 = data[1].T.flat
    c3 = data[2].T.flat

    C = np.zeros((3,20))
    C.flat[19] = c1[0]
    C.flat[18] = c1[1]
    C.flat[15] = c1[2]
    C.flat[9] = c1[3]
    C.flat[17] = c1[4]
    C.flat[14] = c1[5]
    C.flat[8] = c1[6]
    C.flat[12] = c1[7]
    C.flat[6] = c1[8]
    C.flat[3] = c1[9]
    C.flat[16] = c1[10]
    C.flat[13] = c1[11]
    C.flat[7] = c1[12]
    C.flat[11] = c1[13]
    C.flat[5] = c1[14]
    C.flat[2] = c1[15]
    C.flat[10] = c1[16]
    C.flat[4] = c1[17]
    C.flat[1] = c1[18]
    C.flat[0] = c1[19]
    C.flat[39] = c2[0]
    C.flat[38] = c2[1]
    C.flat[35] = c2[2]
    C.flat[29] = c2[3]
    C.flat[37] = c2[4]
    C.flat[34] = c2[5]
    C.flat[28] = c2[6]
    C.flat[32] = c2[7]
    C.flat[26] = c2[8]
    C.flat[23] = c2[9]
    C.flat[36] = c2[10]
    C.flat[33] = c2[11]
    C.flat[27] = c2[12]
    C.flat[31] = c2[13]
    C.flat[25] = c2[14]
    C.flat[22] = c2[15]
    C.flat[30] = c2[16]
    C.flat[24] = c2[17]
    C.flat[21] = c2[18]
    C.flat[20] = c2[19]
    C.flat[59] = c3[0]
    C.flat[58] = c3[1]
    C.flat[55] = c3[2]
    C.flat[49] = c3[3]
    C.flat[57] = c3[4]
    C.flat[54] = c3[5]
    C.flat[48] = c3[6]
    C.flat[52] = c3[7]
    C.flat[46] = c3[8]
    C.flat[43] = c3[9]
    C.flat[56] = c3[10]
    C.flat[53] = c3[11]
    C.flat[47] = c3[12]
    C.flat[51] = c3[13]
    C.flat[45] = c3[14]
    C.flat[42] = c3[15]
    C.flat[50] = c3[16]
    C.flat[44] = c3[17]
    C.flat[41] = c3[18]
    C.flat[40] = c3[19]

    C = C/np.linalg.norm(C,axis=1,keepdims=True)

    def U(s):
        return np.array([s[0]**3,s[1]*s[0]**2,s[0]*s[1]**2,s[1]**3,s[2]*s[0]**2,s[1]*s[0]*s[2],s[1]**2*s[2],s[0]*s[2]**2,s[1]*s[2]**2,s[2]**3,s[0]**2,s[1]*s[0],s[1]**2,s[0]*s[2],s[1]*s[2],s[2]**2,s[0],s[1],s[2],1])

    def dU(s):
        return np.column_stack([[3*s[0]**2,2*s[1]*s[0],s[1]**2,0,2*s[0]*s[2],s[1]*s[2],0,s[2]**2,0,0,2*s[0],s[1],0,s[2],0,0,1,0,0,0],[0,s[0]**2,2*s[1]*s[0],3*s[1]**2,0,s[0]*s[2],2*s[1]*s[2],0,s[2]**2,0,0,s[0],2*s[1],0,s[2],0,0,1,0,0],[0,0,0,0,s[0]**2,s[1]*s[0],s[1]**2,2*s[0]*s[2],2*s[1]*s[2],3*s[2]**2,0,0,0,s[0],s[1],2*s[2],0,0,1,0]])

    return C,U,dU