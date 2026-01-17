import numpy as np

def coefs_tdoa_pose_5pt(data):

    U = data[0].T.flat
    cosangles = data[1].T.flat

    C = np.zeros((5,33))
    C.flat[[2,15,16,35,48,49,68,81,82,101,114,115,134,147,148]] = 2
    C.flat[[11,24]] = -2*U[0]
    C.flat[[8,25]] = -2*U[1]
    C.flat[[20,22]] = -2*U[2]
    C.flat[[44,57]] = -2*U[3]
    C.flat[[41,58]] = -2*U[4]
    C.flat[[53,55]] = -2*U[5]
    C.flat[[77,90]] = -2*U[6]
    C.flat[[74,91]] = -2*U[7]
    C.flat[[86,88]] = -2*U[8]
    C.flat[[110,123]] = -2*U[9]
    C.flat[[107,124]] = -2*U[10]
    C.flat[[119,121]] = -2*U[11]
    C.flat[[143,156]] = -2*U[12]
    C.flat[[140,157]] = -2*U[13]
    C.flat[[152,154]] = -2*U[14]
    C.flat[[1,3,5,6,21,23]] = -cosangles[0]**2
    C.flat[[34,36,38,39,54,56]] = -cosangles[1]**2
    C.flat[[67,69,71,72,87,89]] = -cosangles[2]**2
    C.flat[[100,102,104,105,120,122]] = -cosangles[3]**2
    C.flat[[133,135,137,138,153,155]] = -cosangles[4]**2
    C.flat[18] = 2*U[0]*U[1]
    C.flat[27] = 2*U[0]*U[2]
    C.flat[28] = 2*U[1]*U[2]
    C.flat[51] = 2*U[3]*U[4]
    C.flat[60] = 2*U[3]*U[5]
    C.flat[61] = 2*U[4]*U[5]
    C.flat[84] = 2*U[6]*U[7]
    C.flat[93] = 2*U[6]*U[8]
    C.flat[94] = 2*U[7]*U[8]
    C.flat[117] = 2*U[9]*U[10]
    C.flat[126] = 2*U[9]*U[11]
    C.flat[127] = 2*U[10]*U[11]
    C.flat[150] = 2*U[12]*U[13]
    C.flat[159] = 2*U[12]*U[14]
    C.flat[160] = 2*U[13]*U[14]
    C.flat[[9,29]] = 2*cosangles[0]**2*U[0]
    C.flat[[10,30]] = 2*cosangles[0]**2*U[1]
    C.flat[[13,14]] = 2*cosangles[0]**2*U[2]
    C.flat[[42,62]] = 2*cosangles[1]**2*U[3]
    C.flat[[43,63]] = 2*cosangles[1]**2*U[4]
    C.flat[[46,47]] = 2*cosangles[1]**2*U[5]
    C.flat[[75,95]] = 2*cosangles[2]**2*U[6]
    C.flat[[76,96]] = 2*cosangles[2]**2*U[7]
    C.flat[[79,80]] = 2*cosangles[2]**2*U[8]
    C.flat[[108,128]] = 2*cosangles[3]**2*U[9]
    C.flat[[109,129]] = 2*cosangles[3]**2*U[10]
    C.flat[[112,113]] = 2*cosangles[3]**2*U[11]
    C.flat[[141,161]] = 2*cosangles[4]**2*U[12]
    C.flat[[142,162]] = 2*cosangles[4]**2*U[13]
    C.flat[[145,146]] = 2*cosangles[4]**2*U[14]
    C.flat[[0,4,26]] = -cosangles[0]**2+1
    C.flat[[33,37,59]] = -cosangles[1]**2+1
    C.flat[[66,70,92]] = -cosangles[2]**2+1
    C.flat[[99,103,125]] = -cosangles[3]**2+1
    C.flat[[132,136,158]] = -cosangles[4]**2+1
    C.flat[7] = 2*U[0]*cosangles[0]**2-2*U[0]
    C.flat[12] = 2*U[1]*cosangles[0]**2-2*U[1]
    C.flat[31] = 2*U[2]*cosangles[0]**2-2*U[2]
    C.flat[40] = 2*U[3]*cosangles[1]**2-2*U[3]
    C.flat[45] = 2*U[4]*cosangles[1]**2-2*U[4]
    C.flat[64] = 2*U[5]*cosangles[1]**2-2*U[5]
    C.flat[73] = 2*U[6]*cosangles[2]**2-2*U[6]
    C.flat[78] = 2*U[7]*cosangles[2]**2-2*U[7]
    C.flat[97] = 2*U[8]*cosangles[2]**2-2*U[8]
    C.flat[106] = 2*U[9]*cosangles[3]**2-2*U[9]
    C.flat[111] = 2*U[10]*cosangles[3]**2-2*U[10]
    C.flat[130] = 2*U[11]*cosangles[3]**2-2*U[11]
    C.flat[139] = 2*U[12]*cosangles[4]**2-2*U[12]
    C.flat[144] = 2*U[13]*cosangles[4]**2-2*U[13]
    C.flat[163] = 2*U[14]*cosangles[4]**2-2*U[14]
    C.flat[32] = -U[0]**2*cosangles[0]**2-U[1]**2*cosangles[0]**2-U[2]**2*cosangles[0]**2+U[2]**2
    C.flat[19] = -U[0]**2*cosangles[0]**2-U[1]**2*cosangles[0]**2-U[2]**2*cosangles[0]**2+U[1]**2
    C.flat[17] = -U[0]**2*cosangles[0]**2-U[1]**2*cosangles[0]**2-U[2]**2*cosangles[0]**2+U[0]**2
    C.flat[65] = -U[3]**2*cosangles[1]**2-U[4]**2*cosangles[1]**2-U[5]**2*cosangles[1]**2+U[5]**2
    C.flat[52] = -U[3]**2*cosangles[1]**2-U[4]**2*cosangles[1]**2-U[5]**2*cosangles[1]**2+U[4]**2
    C.flat[50] = -U[3]**2*cosangles[1]**2-U[4]**2*cosangles[1]**2-U[5]**2*cosangles[1]**2+U[3]**2
    C.flat[98] = -U[6]**2*cosangles[2]**2-U[7]**2*cosangles[2]**2-U[8]**2*cosangles[2]**2+U[8]**2
    C.flat[85] = -U[6]**2*cosangles[2]**2-U[7]**2*cosangles[2]**2-U[8]**2*cosangles[2]**2+U[7]**2
    C.flat[83] = -U[6]**2*cosangles[2]**2-U[7]**2*cosangles[2]**2-U[8]**2*cosangles[2]**2+U[6]**2
    C.flat[131] = -U[9]**2*cosangles[3]**2-U[10]**2*cosangles[3]**2-U[11]**2*cosangles[3]**2+U[11]**2
    C.flat[118] = -U[9]**2*cosangles[3]**2-U[10]**2*cosangles[3]**2-U[11]**2*cosangles[3]**2+U[10]**2
    C.flat[116] = -U[9]**2*cosangles[3]**2-U[10]**2*cosangles[3]**2-U[11]**2*cosangles[3]**2+U[9]**2
    C.flat[164] = -U[12]**2*cosangles[4]**2-U[13]**2*cosangles[4]**2-U[14]**2*cosangles[4]**2+U[14]**2
    C.flat[151] = -U[12]**2*cosangles[4]**2-U[13]**2*cosangles[4]**2-U[14]**2*cosangles[4]**2+U[13]**2
    C.flat[149] = -U[12]**2*cosangles[4]**2-U[13]**2*cosangles[4]**2-U[14]**2*cosangles[4]**2+U[12]**2

    C = C/np.linalg.norm(C,axis=1,keepdims=True)

    def U(s):
        return np.array([s[0]**2*s[2]**2,s[2]**2*s[1]**2,s[0]*s[2]*s[1]*s[3],s[3]**2*s[0]**2,s[1]**2*s[3]**2,s[4]**2*s[0]**2,s[4]**2*s[1]**2,s[2]*s[0]**2,s[1]*s[0]*s[2],s[1]**2*s[2],s[3]*s[0]**2,s[3]*s[1]*s[0],s[1]**2*s[3],s[4]*s[0]**2,s[1]**2*s[4],s[4]*s[2]*s[0],s[1]*s[3]*s[4],s[0]**2,s[1]*s[0],s[1]**2,s[0]*s[2],s[2]**2,s[1]*s[3],s[3]**2,s[0]*s[4],s[1]*s[4],s[4]**2,s[0],s[1],s[2],s[3],s[4],1])

    def dU(s):
        return np.column_stack([[2*s[0]*s[2]**2,0,s[3]*s[2]*s[1],2*s[3]**2*s[0],0,2*s[4]**2*s[0],0,2*s[0]*s[2],s[1]*s[2],0,2*s[3]*s[0],s[1]*s[3],0,2*s[0]*s[4],0,s[2]*s[4],0,2*s[0],s[1],0,s[2],0,0,0,s[4],0,0,1,0,0,0,0,0],[0,2*s[1]*s[2]**2,s[0]*s[2]*s[3],0,2*s[1]*s[3]**2,0,2*s[4]**2*s[1],0,s[0]*s[2],2*s[1]*s[2],0,s[3]*s[0],2*s[1]*s[3],0,2*s[1]*s[4],0,s[3]*s[4],0,s[0],2*s[1],0,0,s[3],0,0,s[4],0,0,1,0,0,0,0],[2*s[2]*s[0]**2,2*s[1]**2*s[2],s[3]*s[1]*s[0],0,0,0,0,s[0]**2,s[1]*s[0],s[1]**2,0,0,0,0,0,s[0]*s[4],0,0,0,0,s[0],2*s[2],0,0,0,0,0,0,0,1,0,0,0],[0,0,s[1]*s[0]*s[2],2*s[3]*s[0]**2,2*s[1]**2*s[3],0,0,0,0,0,s[0]**2,s[1]*s[0],s[1]**2,0,0,0,s[1]*s[4],0,0,0,0,0,s[1],2*s[3],0,0,0,0,0,0,1,0,0],[0,0,0,0,0,2*s[4]*s[0]**2,2*s[1]**2*s[4],0,0,0,0,0,0,s[0]**2,s[1]**2,s[0]*s[2],s[1]*s[3],0,0,0,0,0,0,0,s[0],s[1],2*s[4],0,0,0,0,1,0]])

    return C,U,dU