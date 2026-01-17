import numpy as np

def coefs_pose_quiver(data):

    M = data[0].T.flat

    C = np.zeros((4,18))
    C.flat[[7,8]] = M[32]
    C.flat[[25,26]] = M[33]
    C.flat[[43,44]] = M[34]
    C.flat[[61,62]] = M[35]
    C.flat[6] = -2*M[8]
    C.flat[1] = 2*M[8]
    C.flat[24] = -2*M[9]
    C.flat[19] = 2*M[9]
    C.flat[42] = -2*M[10]
    C.flat[37] = 2*M[10]
    C.flat[60] = -2*M[11]
    C.flat[55] = 2*M[11]
    C.flat[[2,5]] = 2*M[20]
    C.flat[[20,23]] = 2*M[21]
    C.flat[[38,41]] = 2*M[22]
    C.flat[[56,59]] = 2*M[23]
    C.flat[[11,14]] = 2*M[24]
    C.flat[[29,32]] = 2*M[25]
    C.flat[[47,50]] = 2*M[26]
    C.flat[[65,68]] = 2*M[27]
    C.flat[12] = -2*M[28]
    C.flat[13] = 2*M[28]
    C.flat[30] = -2*M[29]
    C.flat[31] = 2*M[29]
    C.flat[48] = -2*M[30]
    C.flat[49] = 2*M[30]
    C.flat[66] = -2*M[31]
    C.flat[67] = 2*M[31]
    C.flat[[0,4]] = -M[32]
    C.flat[[18,22]] = -M[33]
    C.flat[[36,40]] = -M[34]
    C.flat[[54,58]] = -M[35]
    C.flat[15] = -M[0]-M[16]
    C.flat[9] = -M[0]+M[16]
    C.flat[3] = M[0]-M[16]
    C.flat[17] = M[0]+M[16]
    C.flat[33] = -M[1]-M[17]
    C.flat[27] = -M[1]+M[17]
    C.flat[21] = M[1]-M[17]
    C.flat[35] = M[1]+M[17]
    C.flat[51] = -M[2]-M[18]
    C.flat[45] = -M[2]+M[18]
    C.flat[39] = M[2]-M[18]
    C.flat[53] = M[2]+M[18]
    C.flat[69] = -M[3]-M[19]
    C.flat[63] = -M[3]+M[19]
    C.flat[57] = M[3]-M[19]
    C.flat[71] = M[3]+M[19]
    C.flat[16] = 2*M[4]-2*M[12]
    C.flat[10] = 2*M[4]+2*M[12]
    C.flat[34] = 2*M[5]-2*M[13]
    C.flat[28] = 2*M[5]+2*M[13]
    C.flat[52] = 2*M[6]-2*M[14]
    C.flat[46] = 2*M[6]+2*M[14]
    C.flat[70] = 2*M[7]-2*M[15]
    C.flat[64] = 2*M[7]+2*M[15]

    A = (np.linalg.solve(C[:,:4],C[:,4:])).flat

    C = np.zeros((4,18))
    C.flat[[4,13,25,63]] = -1
    C.flat[[0,1,20,39,41,60]] = 1
    C.flat[8] = A[6]
    C.flat[10] = A[7]
    C.flat[14] = A[8]
    C.flat[11] = A[9]
    C.flat[15] = A[10]
    C.flat[12] = A[11]
    C.flat[16] = A[12]
    C.flat[17] = A[13]
    C.flat[26] = A[20]
    C.flat[28] = A[21]
    C.flat[32] = A[22]
    C.flat[29] = A[23]
    C.flat[33] = A[24]
    C.flat[30] = A[25]
    C.flat[34] = A[26]
    C.flat[35] = A[27]
    C.flat[44] = A[34]
    C.flat[46] = A[35]
    C.flat[50] = A[36]
    C.flat[47] = A[37]
    C.flat[51] = A[38]
    C.flat[48] = A[39]
    C.flat[52] = A[40]
    C.flat[53] = A[41]
    C.flat[62] = A[48]
    C.flat[64] = A[49]
    C.flat[68] = A[50]
    C.flat[65] = A[51]
    C.flat[69] = A[52]
    C.flat[66] = A[53]
    C.flat[70] = A[54]
    C.flat[71] = A[55]

    C = C/np.linalg.norm(C,axis=1,keepdims=True)

    def U(s):
        return np.array([s[0]*s[1]**2,s[0]*s[2]**2,s[0]*s[1]*s[3],s[0]*s[2]*s[3],s[0]*s[3]**2,s[1]*s[0],s[1]**2,s[0]*s[2],s[1]*s[2],s[2]**2,s[1]*s[3],s[2]*s[3],s[3]**2,s[0],s[1],s[2],s[3],1])

    def dU(s):
        return np.column_stack([[s[1]**2,s[2]**2,s[1]*s[3],s[2]*s[3],s[3]**2,s[1],0,s[2],0,0,0,0,0,1,0,0,0,0],[2*s[1]*s[0],0,s[0]*s[3],0,0,s[0],2*s[1],0,s[2],0,s[3],0,0,0,1,0,0,0],[0,2*s[0]*s[2],0,s[0]*s[3],0,0,0,s[0],s[1],2*s[2],0,s[3],0,0,0,1,0,0],[0,0,s[1]*s[0],s[0]*s[2],2*s[0]*s[3],0,0,0,0,0,s[1],s[2],2*s[3],0,0,0,1,0]])

    return C,U,dU