import numpy as np
from scipy.sparse import csr_matrix
from scipy.linalg import lu, solve, eig

# Input: coefficient matrix C of size 4x24
# Output: solution matrix S of size 4x22

def red_85x107_wpnp(C):
    M = csr_matrix((C.flat[[0,2,7,14,16,19,21,22,23,0,2,7,14,16,19,21,22,23,0,2,7,14,16,21,22,23,19,0,2,7,16,21,22,23,19,0,2,14,21,22,23,19,0,2,7,14,16,19,21,22,23,0,2,7,14,21,22,23,19,0,2,7,14,16,19,21,22,23,0,2,21,22,23,19,0,2,21,22,23,19,0,2,7,21,22,23,19,0,2,14,16,19,21,22,23,0,2,21,22,23,19,0,2,7,14,21,22,23,16,19,0,2,14,21,22,23,16,19,0,2,7,14,16,19,21,22,23,0,2,14,21,22,23,7,16,19,0,14,21,22,23,2,7,16,19,0,14,21,22,23,2,7,16,19,29,34,36,43,45,46,47,29,34,36,39,43,45,46,47,29,34,36,39,43,45,46,47,29,34,36,45,46,47,43,29,34,36,43,45,46,47,29,34,36,39,45,46,47,43,29,34,45,46,47,43,29,34,36,39,43,45,46,47,29,34,45,46,47,43,29,34,36,43,45,46,47,29,34,36,45,46,47,43,29,34,36,43,39,44,45,46,47,29,34,36,39,43,44,45,46,47,29,34,45,46,47,43,29,34,36,39,45,46,44,47,43,29,34,36,39,43,44,45,46,47,29,34,45,46,47,43,29,34,36,39,45,46,44,47,43,29,36,39,45,46,44,47,34,43,29,34,36,39,43,44,45,46,47,36,39,44,45,46,47,29,34,43,36,39,44,45,46,47,29,34,43,36,39,44,45,46,47,29,34,43,49,51,56,61,65,67,69,70,71,49,51,56,61,65,67,69,70,71,49,51,56,61,65,67,69,70,71,49,51,56,61,65,67,69,70,71,49,51,56,61,65,67,69,70,71,49,51,56,61,67,69,70,71,49,51,56,61,69,70,71,67,49,51,61,69,70,71,67,49,51,56,69,70,71,67,49,51,56,61,67,69,70,71,49,69,70,71,67,49,51,56,61,65,67,69,70,71,49,51,69,70,71,67,49,51,56,69,70,65,71,61,67,49,51,56,69,70,65,71,61,67,49,51,56,61,65,67,69,70,71,49,69,70,71,67,49,51,56,65,69,70,71,61,67,49,51,56,65,69,70,71,61,67,51,56,65,69,70,71,49,61,67,76,78,81,83,90,91,93,94,95,76,78,81,83,90,91,93,94,95,76,78,81,83,90,91,93,94,95,76,78,81,83,90,91,93,94,95,76,78,83,91,93,94,95,76,78,83,93,94,95,91,76,78,81,83,90,91,93,94,95,76,78,83,91,93,94,95,76,78,83,91,93,94,95,76,78,81,83,93,94,95,91,76,83,93,94,95,91,76,78,83,91,90,93,94,95,76,78,83,91,93,94,95,76,78,81,83,90,91,93,94,95,76,78,93,94,95,91,76,78,81,83,93,94,90,95,91,76,78,83,90,91,93,94,95,76,78,81,93,94,90,95,83,91,76,78,81,83,90,91,93,94,95,76,93,94,95,91,76,78,81,90,93,94,95,83,91,78,81,90,93,94,95,76,83,91,78,81,90,93,94,95,76,83,91]],([0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,9,9,9,9,9,9,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,25,25,25,25,25,25,26,26,26,26,26,26,26,26,27,27,27,27,27,27,28,28,28,28,28,28,28,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,52,52,52,52,52,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,55,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,57,58,58,58,58,58,59,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,63,64,64,64,64,64,64,64,64,64,65,65,65,65,65,65,65,65,65,66,66,66,66,66,66,66,67,67,67,67,67,67,67,68,68,68,68,68,68,68,68,68,69,69,69,69,69,69,69,70,70,70,70,70,70,70,71,71,71,71,71,71,71,71,72,72,72,72,72,72,73,73,73,73,73,73,73,73,74,74,74,74,74,74,74,75,75,75,75,75,75,75,75,75,76,76,76,76,76,76,77,77,77,77,77,77,77,77,77,78,78,78,78,78,78,78,78,79,79,79,79,79,79,79,79,79,80,80,80,80,80,80,80,80,80,81,81,81,81,81,82,82,82,82,82,82,82,82,82,83,83,83,83,83,83,83,83,83,84,84,84,84,84,84,84,84,84],[0,1,2,12,26,45,46,48,60,3,5,10,26,36,58,85,87,92,4,6,11,27,38,59,60,70,85,7,8,13,44,60,61,71,87,9,11,29,61,62,72,88,14,16,25,38,52,89,90,92,96,15,17,26,40,64,70,73,90,19,21,28,44,57,91,92,93,99,20,22,70,71,74,92,24,26,71,72,75,93,30,32,44,73,74,76,96,33,37,87,91,98,100,101,105,34,38,74,75,78,99,35,39,47,60,67,68,79,92,100,42,45,61,68,69,80,93,101,50,53,86,92,94,102,104,105,106,51,54,70,77,79,82,87,96,104,56,71,79,80,83,85,88,99,105,63,74,82,83,84,90,93,103,106,2,10,12,47,48,49,61,5,15,17,26,53,54,85,90,6,16,18,27,54,55,59,64,8,21,23,59,60,70,85,10,24,26,86,87,88,93,11,25,27,29,60,61,71,87,13,28,61,62,72,88,21,30,32,44,89,90,92,96,22,31,64,70,73,90,25,34,38,91,92,93,99,26,36,40,70,71,74,92,35,50,53,65,86,94,95,98,102,37,51,54,87,95,96,97,100,104,38,52,73,74,76,96,39,53,55,60,66,67,73,77,97,43,56,85,88,98,99,100,101,105,44,57,74,75,78,99,45,58,59,61,67,68,74,79,100,47,60,62,68,69,75,80,86,101,58,63,90,93,102,103,104,105,106,64,71,76,77,79,82,85,89,104,70,72,78,79,80,83,87,91,105,73,75,81,82,83,84,92,94,106,0,1,2,10,26,43,45,47,87,3,5,10,24,36,56,58,86,91,4,6,11,25,38,58,85,87,92,7,8,13,28,44,86,87,88,93,14,16,25,34,52,63,89,91,94,15,17,26,36,89,90,92,96,16,18,27,38,64,70,73,90,21,23,44,70,71,74,92,25,27,29,71,72,75,93,30,32,44,57,94,96,99,103,31,73,74,76,96,35,39,47,86,92,98,100,101,105,36,40,74,75,78,99,37,41,48,67,68,70,79,87,100,43,46,49,68,69,71,80,88,101,51,54,87,91,96,102,104,105,106,52,76,78,81,103,53,55,60,73,77,79,82,92,104,58,59,61,74,79,80,83,93,105,64,71,76,82,83,84,89,99,106,0,1,2,5,26,37,39,45,85,3,5,10,15,36,51,53,58,89,4,6,11,16,38,53,54,85,90,7,8,13,21,44,58,85,87,92,9,11,25,86,87,88,93,10,12,26,60,61,71,87,19,21,28,30,57,63,89,91,94,20,22,31,89,90,92,96,24,26,36,91,92,93,99,25,27,29,38,70,71,74,92,28,44,71,72,75,93,33,37,51,65,91,95,98,102,34,38,52,94,96,99,103,35,39,47,53,92,95,97,100,104,36,40,73,74,76,96,37,41,48,54,66,67,70,77,97,42,45,58,93,98,100,101,105,43,46,49,67,68,71,79,85,100,56,85,88,89,99,102,104,105,106,57,76,78,81,103,58,59,61,74,77,79,82,90,104,60,62,75,79,80,83,86,92,105,70,72,78,82,83,84,91,96,106])),shape=(85,107))
    M = M.toarray()

    P,L,_ = lu(M[:,:70])
    M = solve(np.concatenate((P@L,P[:,70:]),axis=1),M[:,70:])
    M = M[-15:,:]

    T0 = np.zeros((22,22))
    T0[[0,2,3,5,7,8,11,12,14,15,16,18,19,20,21],:] = -M[:,15:]
    T0.flat[[30,99,146,216,239,306,395]] = 1
    T1 = np.zeros((22,22))
    T1[np.ix_([0,2,3,5,7,8,11,12,14,15,16,18,19,20,21],[0,2,3,5,7,8,11,12,14,15,16,18,19,20,21])] = M[:,:15]
    T1.flat[[23,92,138,207,230,299,391]] = 1

    _,V = eig(T0,T1)
    S = V[17:21,:]/np.tile(V[21,:],(4,1))
    S = S[:,np.all(np.isfinite(S),axis=0)]

    return S