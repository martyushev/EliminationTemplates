import numpy as np

def coefs_toa2d_33(data):

    dd = data[0].T.flat

    C = np.zeros((3,10))
    C.flat[[0,10,20]] = -2
    C.flat[6] = -2*dd[0]
    C.flat[16] = -2*dd[1]
    C.flat[26] = -2*dd[2]
    C.flat[3] = -2*dd[3]
    C.flat[13] = -2*dd[4]
    C.flat[23] = -2*dd[5]
    C.flat[1] = -2*dd[6]
    C.flat[11] = -2*dd[7]
    C.flat[21] = -2*dd[8]
    C.flat[4] = 2*dd[0]+2*dd[6]
    C.flat[15] = 2*dd[1]+2*dd[4]
    C.flat[5] = 2*dd[3]+2*dd[0]
    C.flat[2] = 2*dd[3]+2*dd[6]
    C.flat[25] = 2*dd[5]+2*dd[2]
    C.flat[14] = 2*dd[7]+2*dd[1]
    C.flat[12] = 2*dd[7]+2*dd[4]
    C.flat[24] = 2*dd[8]+2*dd[2]
    C.flat[22] = 2*dd[8]+2*dd[5]
    C.flat[7] = -2*dd[0]*dd[3]+2*dd[0]*dd[6]+2*dd[3]*dd[6]-2*dd[6]**2
    C.flat[8] = 2*dd[0]*dd[3]-2*dd[0]*dd[6]-2*dd[3]**2+2*dd[3]*dd[6]
    C.flat[9] = -2*dd[0]**2+2*dd[0]*dd[3]+2*dd[0]*dd[6]-2*dd[3]*dd[6]
    C.flat[17] = -2*dd[1]*dd[4]+2*dd[1]*dd[7]+2*dd[4]*dd[7]-2*dd[7]**2
    C.flat[18] = 2*dd[1]*dd[4]-2*dd[1]*dd[7]-2*dd[4]**2+2*dd[4]*dd[7]
    C.flat[19] = -2*dd[1]**2+2*dd[1]*dd[4]+2*dd[1]*dd[7]-2*dd[4]*dd[7]
    C.flat[27] = -2*dd[2]*dd[5]+2*dd[2]*dd[8]+2*dd[5]*dd[8]-2*dd[8]**2
    C.flat[28] = 2*dd[2]*dd[5]-2*dd[2]*dd[8]-2*dd[5]**2+2*dd[5]*dd[8]
    C.flat[29] = -2*dd[2]**2+2*dd[2]*dd[5]+2*dd[2]*dd[8]-2*dd[5]*dd[8]

    C = C/np.linalg.norm(C,axis=1,keepdims=True)

    def U(s):
        return np.array([s[0]*s[1]*s[2],s[0]**2,s[1]*s[0],s[1]**2,s[0]*s[2],s[2]*s[1],s[2]**2,s[0],s[1],s[2]])

    def dU(s):
        return np.column_stack([[s[2]*s[1],2*s[0],s[1],0,s[2],0,0,1,0,0],[s[0]*s[2],0,s[0],2*s[1],0,s[2],0,0,1,0],[s[1]*s[0],0,0,0,s[0],s[1],2*s[2],0,0,1]])

    return C,U,dU