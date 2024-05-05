import numpy as np
from scipy.sparse import csr_matrix
from scipy.linalg import lu, solve, eig

# Input: coefficient matrix C of size 4x22
# Output: solution matrix S of size 3x7

def red_26x33_relpose_7p_fuv_angle(C):
    M = csr_matrix((C.flat[[0,1,2,3,5,6,7,9,10,11,12,13,17,15,16,20,0,1,2,5,6,9,10,11,12,16,20,15,0,1,2,3,5,6,7,12,9,10,11,15,16,17,20,0,1,2,5,6,11,17,16,20,9,10,15,0,1,2,3,4,8,9,10,16,14,19,20,21,5,6,7,12,13,15,18,0,1,2,5,11,16,17,20,9,10,15,22,23,24,25,27,28,29,31,32,33,34,35,39,37,38,42,22,23,24,27,28,31,32,33,34,38,42,37,22,23,24,25,27,28,29,34,31,32,33,37,38,39,42,22,23,24,27,28,33,39,38,42,31,32,37,22,23,24,25,26,30,31,32,38,36,41,42,43,27,28,29,34,35,37,40,22,23,24,27,33,38,39,42,31,32,37,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,61,62,59,60,64,44,45,46,47,49,50,51,53,54,55,56,57,61,59,60,64,44,45,46,49,50,53,54,55,56,60,64,59,44,45,46,47,49,50,51,56,53,54,55,59,60,61,64,44,45,46,49,50,55,61,60,64,53,54,59,44,45,46,47,48,52,53,54,60,58,63,64,65,49,50,51,56,57,59,62,44,45,46,49,55,60,61,64,53,54,59,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,83,84,81,82,86,66,67,68,69,71,72,73,75,76,77,78,79,83,81,82,86,66,67,68,71,72,75,76,77,78,82,86,81,66,67,68,69,71,72,73,78,75,76,77,81,82,83,86,66,67,68,71,72,77,83,82,86,75,76,81,66,67,68,69,70,74,75,76,82,80,85,86,87,71,72,73,78,79,81,84,66,67,68,71,77,82,83,86,75,76,81]],([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25],[1,2,3,4,6,7,8,10,11,12,15,16,19,27,28,30,2,3,4,7,8,11,12,13,16,17,22,28,5,6,7,8,14,15,16,20,26,27,28,29,30,31,32,6,7,8,15,16,17,21,22,23,27,28,30,9,10,11,12,13,17,18,19,21,22,23,24,25,26,27,28,29,30,31,32,14,15,16,20,22,23,24,25,29,30,32,1,2,3,4,6,7,8,10,11,12,15,16,19,27,28,30,2,3,4,7,8,11,12,13,16,17,22,28,5,6,7,8,14,15,16,20,26,27,28,29,30,31,32,6,7,8,15,16,17,21,22,23,27,28,30,9,10,11,12,13,17,18,19,21,22,23,24,25,26,27,28,29,30,31,32,14,15,16,20,22,23,24,25,29,30,32,0,1,2,3,4,5,6,7,8,9,10,11,14,15,16,18,20,26,27,29,1,2,3,4,6,7,8,10,11,12,15,16,19,27,28,30,2,3,4,7,8,11,12,13,16,17,22,28,5,6,7,8,14,15,16,20,26,27,28,29,30,31,32,6,7,8,15,16,17,21,22,23,27,28,30,9,10,11,12,13,17,18,19,21,22,23,24,25,26,27,28,29,30,31,32,14,15,16,20,22,23,24,25,29,30,32,0,1,2,3,4,5,6,7,8,9,10,11,14,15,16,18,20,26,27,29,1,2,3,4,6,7,8,10,11,12,15,16,19,27,28,30,2,3,4,7,8,11,12,13,16,17,22,28,5,6,7,8,14,15,16,20,26,27,28,29,30,31,32,6,7,8,15,16,17,21,22,23,27,28,30,9,10,11,12,13,17,18,19,21,22,23,24,25,26,27,28,29,30,31,32,14,15,16,20,22,23,24,25,29,30,32])),shape=(26,33))
    M = M.toarray()

    P,L,_ = lu(M[:,:22])
    M = solve(np.concatenate((P@L,P[:,22:]),axis=1),M[:,22:])
    M = M[-4:,:]

    T0 = np.zeros((7,7))
    T0[[2,4,5,6],:] = -M[:,4:]
    T0.flat[[3,11,27]] = 1
    T1 = np.zeros((7,7))
    T1[np.ix_([2,4,5,6],[2,4,5,6])] = M[:,:4]
    T1.flat[[0,8,24]] = 1

    _,V = eig(T0,T1)
    S = V[3:6,:]/np.tile(V[6,:],(3,1))
    S = S[:,np.all(np.isfinite(S),axis=0)]

    return S