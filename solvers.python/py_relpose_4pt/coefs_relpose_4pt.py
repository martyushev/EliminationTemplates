import numpy as np

def coefs_relpose_4pt(data):

    x1 = data[0].T.flat
    x2 = data[1].T.flat
    th = data[2].T.flat

    C = np.zeros((5,28))
    C.flat[139] = -1
    C.flat[[124,128,133]] = 1
    C.flat[24] = x1[0]*np.sin(th[0])
    C.flat[25] = x1[1]*np.sin(th[0])
    C.flat[52] = x1[2]*np.sin(th[0])
    C.flat[53] = x1[3]*np.sin(th[0])
    C.flat[80] = x1[4]*np.sin(th[0])
    C.flat[81] = x1[5]*np.sin(th[0])
    C.flat[108] = x1[6]*np.sin(th[0])
    C.flat[109] = x1[7]*np.sin(th[0])
    C.flat[17] = x2[0]*np.sin(th[0])
    C.flat[18] = x2[1]*np.sin(th[0])
    C.flat[45] = x2[2]*np.sin(th[0])
    C.flat[46] = x2[3]*np.sin(th[0])
    C.flat[73] = x2[4]*np.sin(th[0])
    C.flat[74] = x2[5]*np.sin(th[0])
    C.flat[101] = x2[6]*np.sin(th[0])
    C.flat[102] = x2[7]*np.sin(th[0])
    C.flat[13] = x2[0]*x1[1]*np.sin(th[0])
    C.flat[11] = x2[1]*x1[0]*np.sin(th[0])
    C.flat[41] = x2[2]*x1[3]*np.sin(th[0])
    C.flat[39] = x2[3]*x1[2]*np.sin(th[0])
    C.flat[69] = x2[4]*x1[5]*np.sin(th[0])
    C.flat[67] = x2[5]*x1[4]*np.sin(th[0])
    C.flat[97] = x2[6]*x1[7]*np.sin(th[0])
    C.flat[95] = x2[7]*x1[6]*np.sin(th[0])
    C.flat[76] = -x1[4]+x1[4]*np.cos(th[0])
    C.flat[65] = x1[4]-x1[4]*np.cos(th[0])
    C.flat[64] = -x1[5]+x1[5]*np.cos(th[0])
    C.flat[75] = x1[5]-x1[5]*np.cos(th[0])
    C.flat[104] = -x1[6]+x1[6]*np.cos(th[0])
    C.flat[93] = x1[6]-x1[6]*np.cos(th[0])
    C.flat[92] = -x1[7]+x1[7]*np.cos(th[0])
    C.flat[103] = x1[7]-x1[7]*np.cos(th[0])
    C.flat[1] = x2[0]-x2[0]*np.cos(th[0])
    C.flat[2] = -x2[1]+x2[1]*np.cos(th[0])
    C.flat[29] = x2[2]-x2[2]*np.cos(th[0])
    C.flat[30] = -x2[3]+x2[3]*np.cos(th[0])
    C.flat[57] = x2[4]-x2[4]*np.cos(th[0])
    C.flat[58] = -x2[5]+x2[5]*np.cos(th[0])
    C.flat[59] = x2[5]-x2[5]*np.cos(th[0])
    C.flat[84] = -x2[6]+x2[6]*np.cos(th[0])
    C.flat[85] = x2[6]-x2[6]*np.cos(th[0])
    C.flat[86] = -x2[7]+x2[7]*np.cos(th[0])
    C.flat[87] = x2[7]-x2[7]*np.cos(th[0])
    C.flat[9] = -x1[0]*np.cos(th[0])+x1[0]
    C.flat[20] = x1[0]*np.cos(th[0])-x1[0]
    C.flat[19] = -x1[1]*np.cos(th[0])+x1[1]
    C.flat[8] = x1[1]*np.cos(th[0])-x1[1]
    C.flat[37] = -x1[2]*np.cos(th[0])+x1[2]
    C.flat[48] = x1[2]*np.cos(th[0])-x1[2]
    C.flat[47] = -x1[3]*np.cos(th[0])+x1[3]
    C.flat[36] = x1[3]*np.cos(th[0])-x1[3]
    C.flat[79] = x1[4]*np.cos(th[0])-x2[4]*np.cos(th[0])
    C.flat[78] = -x1[5]*np.cos(th[0])+x2[5]*np.cos(th[0])
    C.flat[4] = -x2[0]*x1[1]+x2[0]*x1[1]*np.cos(th[0])
    C.flat[23] = -x2[0]*np.cos(th[0])+x1[0]*np.cos(th[0])
    C.flat[0] = x2[0]*np.cos(th[0])-x2[0]
    C.flat[7] = x2[1]*x1[0]-x2[1]*x1[0]*np.cos(th[0])
    C.flat[3] = -x2[1]*np.cos(th[0])+x2[1]
    C.flat[22] = x2[1]*np.cos(th[0])-x1[1]*np.cos(th[0])
    C.flat[51] = -x2[2]*np.cos(th[0])+x1[2]*np.cos(th[0])
    C.flat[28] = x2[2]*np.cos(th[0])-x2[2]
    C.flat[31] = -x2[3]*np.cos(th[0])+x2[3]
    C.flat[50] = x2[3]*np.cos(th[0])-x1[3]*np.cos(th[0])
    C.flat[56] = x2[4]*np.cos(th[0])-x2[4]
    C.flat[96] = x2[6]*x1[7]-x2[6]*x1[7]*np.cos(th[0])
    C.flat[107] = -x2[6]*np.cos(th[0])+x1[6]*np.cos(th[0])
    C.flat[100] = -x2[7]*x1[6]+x2[7]*x1[6]*np.cos(th[0])
    C.flat[106] = x2[7]*np.cos(th[0])-x1[7]*np.cos(th[0])
    C.flat[26] = -x2[0]*x1[0]*np.sin(th[0])-x2[1]*x1[1]*np.sin(th[0])
    C.flat[12] = -x2[0]*x1[1]*np.cos(th[0])+x2[0]*x1[1]
    C.flat[27] = x2[0]*x1[1]*np.cos(th[0])-x2[1]*x1[0]*np.cos(th[0])
    C.flat[16] = x2[1]*x1[0]*np.cos(th[0])-x2[1]*x1[0]
    C.flat[10] = -x2[1]*x1[1]*np.sin(th[0])-np.sin(th[0])
    C.flat[54] = -x2[2]*x1[2]*np.sin(th[0])-x2[3]*x1[3]*np.sin(th[0])
    C.flat[40] = -x2[2]*x1[3]*np.cos(th[0])+x2[2]*x1[3]
    C.flat[32] = x2[2]*x1[3]*np.cos(th[0])-x2[2]*x1[3]
    C.flat[55] = x2[2]*x1[3]*np.cos(th[0])-x2[3]*x1[2]*np.cos(th[0])
    C.flat[35] = -x2[3]*x1[2]*np.cos(th[0])+x2[3]*x1[2]
    C.flat[44] = x2[3]*x1[2]*np.cos(th[0])-x2[3]*x1[2]
    C.flat[38] = -x2[3]*x1[3]*np.sin(th[0])-np.sin(th[0])
    C.flat[82] = -x2[4]*x1[4]*np.sin(th[0])-x2[5]*x1[5]*np.sin(th[0])
    C.flat[68] = -x2[4]*x1[5]*np.cos(th[0])+x2[4]*x1[5]
    C.flat[60] = x2[4]*x1[5]*np.cos(th[0])-x2[4]*x1[5]
    C.flat[83] = x2[4]*x1[5]*np.cos(th[0])-x2[5]*x1[4]*np.cos(th[0])
    C.flat[63] = -x2[5]*x1[4]*np.cos(th[0])+x2[5]*x1[4]
    C.flat[72] = x2[5]*x1[4]*np.cos(th[0])-x2[5]*x1[4]
    C.flat[66] = -x2[5]*x1[5]*np.sin(th[0])-np.sin(th[0])
    C.flat[110] = -x2[6]*x1[6]*np.sin(th[0])-x2[7]*x1[7]*np.sin(th[0])
    C.flat[88] = x2[6]*x1[7]*np.cos(th[0])-x2[6]*x1[7]
    C.flat[111] = x2[6]*x1[7]*np.cos(th[0])-x2[7]*x1[6]*np.cos(th[0])
    C.flat[91] = -x2[7]*x1[6]*np.cos(th[0])+x2[7]*x1[6]
    C.flat[94] = -x2[7]*x1[7]*np.sin(th[0])-np.sin(th[0])
    C.flat[14] = -np.sin(th[0])-x2[0]*x1[0]*np.sin(th[0])
    C.flat[42] = -np.sin(th[0])-x2[2]*x1[2]*np.sin(th[0])
    C.flat[70] = -np.sin(th[0])-x2[4]*x1[4]*np.sin(th[0])
    C.flat[98] = -np.sin(th[0])-x2[6]*x1[6]*np.sin(th[0])
    C.flat[5] = -1+np.cos(th[0])+x2[0]*x1[0]-x2[0]*x1[0]*np.cos(th[0])
    C.flat[33] = -1+np.cos(th[0])-x2[2]*x1[2]*np.cos(th[0])+x2[2]*x1[2]
    C.flat[61] = -1+np.cos(th[0])-x2[4]*x1[4]*np.cos(th[0])+x2[4]*x1[4]
    C.flat[89] = -1+np.cos(th[0])-x2[6]*x1[6]*np.cos(th[0])+x2[6]*x1[6]
    C.flat[6] = 1-np.cos(th[0])-x2[1]*x1[1]+x2[1]*x1[1]*np.cos(th[0])
    C.flat[34] = 1-np.cos(th[0])+x2[3]*x1[3]*np.cos(th[0])-x2[3]*x1[3]
    C.flat[62] = 1-np.cos(th[0])+x2[5]*x1[5]*np.cos(th[0])-x2[5]*x1[5]
    C.flat[90] = 1-np.cos(th[0])+x2[7]*x1[7]*np.cos(th[0])-x2[7]*x1[7]
    C.flat[15] = -x2[0]*x1[0]+x2[1]*x1[1]+x2[0]*x1[0]*np.cos(th[0])-x2[1]*x1[1]*np.cos(th[0])
    C.flat[43] = -x2[2]*x1[2]+x2[3]*x1[3]+x2[2]*x1[2]*np.cos(th[0])-x2[3]*x1[3]*np.cos(th[0])
    C.flat[71] = -x2[4]*x1[4]+x2[5]*x1[5]+x2[4]*x1[4]*np.cos(th[0])-x2[5]*x1[5]*np.cos(th[0])
    C.flat[99] = -x2[6]*x1[6]+x2[7]*x1[7]+x2[6]*x1[6]*np.cos(th[0])-x2[7]*x1[7]*np.cos(th[0])

    C = C/np.linalg.norm(C,axis=1,keepdims=True)

    def U(s):
        return np.array([s[1]*s[2]**2,s[0]*s[2]*s[3],s[3]*s[2]*s[1],s[0]*s[3]**2,s[4]*s[2]*s[0],s[1]*s[2]*s[4],s[0]*s[3]*s[4],s[1]*s[3]*s[4],s[0]*s[4]**2,s[1]*s[4]**2,s[0]*s[2],s[1]*s[2],s[2]**2,s[0]*s[3],s[1]*s[3],s[2]*s[3],s[3]**2,s[0]*s[4],s[4]*s[1],s[2]*s[4],s[3]*s[4],s[4]**2,s[0],s[1],s[2],s[3],s[4],1])

    def dU(s):
        return np.column_stack([[0,s[2]*s[3],0,s[3]**2,s[2]*s[4],0,s[3]*s[4],0,s[4]**2,0,s[2],0,0,s[3],0,0,0,s[4],0,0,0,0,1,0,0,0,0,0],[s[2]**2,0,s[2]*s[3],0,0,s[2]*s[4],0,s[3]*s[4],0,s[4]**2,0,s[2],0,0,s[3],0,0,0,s[4],0,0,0,0,1,0,0,0,0],[2*s[1]*s[2],s[0]*s[3],s[1]*s[3],0,s[0]*s[4],s[4]*s[1],0,0,0,0,s[0],s[1],2*s[2],0,0,s[3],0,0,0,s[4],0,0,0,0,1,0,0,0],[0,s[0]*s[2],s[1]*s[2],2*s[0]*s[3],0,0,s[0]*s[4],s[4]*s[1],0,0,0,0,0,s[0],s[1],s[2],2*s[3],0,0,0,s[4],0,0,0,0,1,0,0],[0,0,0,0,s[0]*s[2],s[1]*s[2],s[0]*s[3],s[1]*s[3],2*s[0]*s[4],2*s[4]*s[1],0,0,0,0,0,0,0,s[0],s[1],s[2],s[3],2*s[4],0,0,0,0,1,0]])

    return C,U,dU