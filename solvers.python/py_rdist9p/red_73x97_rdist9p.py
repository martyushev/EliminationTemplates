import numpy as np
from scipy.sparse import csr_matrix
from scipy.linalg import lu, solve, eig

# Input: coefficient matrix C of size 4x52
# Output: solution matrix S of size 4x24

def red_73x97_rdist9p(C):
    M = csr_matrix((C.flat[[28,31,37,38,40,43,45,47,48,50,49,51,28,31,37,38,40,43,45,50,47,48,49,51,28,31,37,43,45,47,48,49,50,51,28,31,43,45,47,48,49,50,51,28,31,37,43,47,48,49,51,45,50,28,31,43,47,48,49,51,45,50,28,31,47,48,49,51,43,45,50,28,31,37,38,40,43,45,47,48,50,49,51,28,31,37,38,43,45,50,40,47,48,49,51,28,31,37,38,43,45,50,40,47,48,49,51,28,31,43,37,38,40,45,47,48,49,50,51,28,31,37,38,40,43,47,48,49,51,45,50,28,31,37,38,40,43,47,48,49,51,45,50,28,31,37,38,40,43,47,48,49,51,45,50,28,37,38,40,47,48,49,51,31,43,45,50,28,37,38,40,47,48,49,51,31,43,45,50,37,38,40,47,48,49,51,28,31,43,45,50,28,31,37,38,43,45,50,40,47,48,49,51,28,31,37,38,43,45,40,47,48,49,50,51,28,31,43,37,38,40,45,47,48,49,50,51,28,37,38,40,47,48,49,51,31,43,45,50,28,37,38,40,47,48,49,51,31,43,45,50,37,38,40,47,48,49,51,28,31,43,45,50,28,31,43,37,38,40,45,47,48,49,50,51,37,38,40,47,48,49,51,28,31,43,45,50,80,83,89,90,92,95,97,99,100,101,102,103,80,83,89,90,92,95,97,99,100,102,101,103,80,83,89,90,92,95,97,99,100,102,101,103,80,83,89,90,92,95,97,102,99,100,101,103,80,83,89,95,97,99,100,101,102,103,80,83,95,97,99,100,101,102,103,80,83,89,95,99,100,101,103,97,102,80,83,95,99,100,101,103,97,102,80,83,99,100,101,103,95,97,102,80,83,89,90,92,95,97,99,100,102,101,103,80,83,89,90,92,95,97,99,100,102,101,103,80,83,89,90,95,97,102,92,99,100,101,103,80,83,89,90,95,97,102,92,99,100,101,103,80,83,95,89,90,92,97,99,100,101,102,103,80,83,89,90,92,95,99,100,101,103,97,102,80,83,89,90,92,95,99,100,101,103,97,102,80,83,89,90,92,95,99,100,101,103,97,102,80,89,90,92,99,100,101,103,83,95,97,102,80,89,90,92,99,100,101,103,83,95,97,102,89,90,92,99,100,101,103,80,83,95,97,102,80,83,89,90,95,97,102,92,99,100,101,103,80,83,89,90,95,97,92,99,100,101,102,103,80,83,95,89,90,92,97,99,100,101,102,103,80,89,90,92,99,100,101,103,83,95,97,102,80,89,90,92,99,100,101,103,83,95,97,102,89,90,92,99,100,101,103,80,83,95,97,102,80,83,95,89,90,92,97,99,100,101,102,103,89,90,92,99,100,101,103,80,83,95,97,102,147,148,149,151,152,153,154,155,147,148,151,152,153,155,149,154,147,148,151,152,153,155,149,154,151,152,153,155,147,148,149,154,147,148,149,151,152,153,154,155,147,148,151,152,153,155,149,154,147,148,151,152,153,155,149,154,151,152,153,155,147,148,149,154,151,152,153,155,147,148,149,154,151,152,153,155,147,148,149,154,147,148,149,154,151,152,153,155,147,148,149,151,152,153,154,155,151,152,153,155,147,148,149,154,151,152,153,155,147,148,149,154,151,152,153,155,147,148,149,154,147,148,149,151,152,153,154,155,151,152,153,155,147,148,149,154,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,178,184,185,186,187,188,190,191,192,193,194,195,196,197,199,200,202,203,204,198,205,207,189,201,206,156,157,158,159,160,161,162,163,164,165,166,170,171,172,173,174,175,176,177,178,179,180,184,185,186,190,191,192,193,194,195,202,181,182,183,196,197,198,203,204,205,207,167,168,169,187,188,189,199,200,201,206,156,157,158,159,160,162,163,170,171,172,173,175,176,177,190,178,179,180,181,182,183,193,194,195,196,197,198,203,204,205,207,161,164,165,166,167,168,169,174,184,185,186,187,188,189,191,192,199,200,201,202,206]],([0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,42,42,43,43,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,64,64,64,64,64,64,64,64,65,65,65,65,65,65,65,65,66,66,66,66,66,66,66,66,67,67,67,67,67,67,67,67,68,68,68,68,68,68,68,68,69,69,69,69,69,69,69,69,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72],[2,4,9,10,12,17,19,27,28,32,74,78,3,5,11,12,13,18,20,33,73,74,75,80,6,9,21,24,27,36,37,40,43,50,7,10,25,28,37,38,41,44,51,8,11,22,26,39,40,54,57,73,77,9,12,27,40,41,55,58,74,78,11,13,54,55,56,60,73,75,80,15,17,24,25,27,30,32,43,44,46,78,85,16,18,26,27,31,33,47,73,77,78,80,87,17,19,27,28,32,34,48,74,78,79,81,88,18,20,33,73,74,75,76,80,81,82,83,89,23,26,35,36,39,42,49,50,57,63,77,84,24,27,36,37,40,43,50,51,58,64,78,85,25,28,37,38,41,44,51,52,59,65,79,86,26,39,40,54,57,58,60,66,73,77,80,87,27,40,41,55,58,59,61,67,74,78,81,88,54,55,56,60,61,62,68,73,75,80,82,89,29,31,42,43,45,47,53,77,84,85,87,92,30,32,43,44,46,48,78,85,86,88,90,93,31,33,47,77,78,80,83,87,88,89,91,94,42,49,50,57,63,64,66,69,77,84,87,92,43,50,51,58,64,65,67,70,78,85,88,93,57,58,60,66,67,68,71,77,80,87,89,94,45,47,53,84,85,87,91,92,93,94,95,96,63,64,66,69,70,71,72,84,87,92,94,96,0,2,6,7,9,15,17,24,25,27,30,43,1,3,8,9,11,16,18,26,27,31,73,77,2,4,9,10,12,17,19,27,28,32,74,78,3,5,11,12,13,18,20,33,73,74,75,80,6,9,21,24,27,36,37,40,43,50,7,10,25,28,37,38,41,44,51,8,11,22,26,39,40,54,57,73,77,9,12,27,40,41,55,58,74,78,11,13,54,55,56,60,73,75,80,14,16,23,24,26,29,31,42,43,45,77,84,15,17,24,25,27,30,32,43,44,46,78,85,16,18,26,27,31,33,47,73,77,78,80,87,17,19,27,28,32,34,48,74,78,79,81,88,18,20,33,73,74,75,76,80,81,82,83,89,23,26,35,36,39,42,49,50,57,63,77,84,24,27,36,37,40,43,50,51,58,64,78,85,25,28,37,38,41,44,51,52,59,65,79,86,26,39,40,54,57,58,60,66,73,77,80,87,27,40,41,55,58,59,61,67,74,78,81,88,54,55,56,60,61,62,68,73,75,80,82,89,29,31,42,43,45,47,53,77,84,85,87,92,30,32,43,44,46,48,78,85,86,88,90,93,31,33,47,77,78,80,83,87,88,89,91,94,42,49,50,57,63,64,66,69,77,84,87,92,43,50,51,58,64,65,67,70,78,85,88,93,57,58,60,66,67,68,71,77,80,87,89,94,45,47,53,84,85,87,91,92,93,94,95,96,63,64,66,69,70,71,72,84,87,92,94,96,24,25,27,36,37,40,43,50,26,27,39,40,54,57,73,77,27,28,40,41,55,58,74,78,54,55,56,60,73,74,75,80,33,34,76,80,81,82,83,89,42,43,49,50,57,63,77,84,43,44,50,51,58,64,78,85,57,58,60,66,77,78,80,87,58,59,61,67,78,79,81,88,60,61,62,68,80,81,82,89,45,46,47,53,84,85,87,92,47,48,83,87,88,89,91,94,63,64,66,69,84,85,87,92,64,65,67,70,85,86,88,93,66,67,68,71,87,88,89,94,53,90,91,92,93,94,95,96,69,70,71,72,92,93,94,96,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,21,22,23,24,25,26,27,29,30,31,35,36,37,39,40,42,43,45,49,50,54,57,63,73,77,84,15,16,17,18,19,20,24,25,26,27,28,29,30,31,32,33,36,37,38,39,40,41,42,43,44,45,46,47,49,50,51,53,54,55,56,57,58,60,63,64,66,69,73,74,75,77,78,80,84,85,87,92,30,31,32,33,34,43,44,45,46,47,48,50,51,52,53,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96])),shape=(73,97))
    M = M.toarray()

    P,L,_ = lu(M[:,:54])
    M = solve(np.concatenate((P@L,P[:,54:]),axis=1),M[:,54:])
    M = M[-19:,:]

    T0 = np.zeros((24,24))
    T0[[0,1,2,4,5,6,7,8,9,11,12,13,14,15,16,19,20,21,23],:] = -M[:,19:]
    T0.flat[[81,256,428,453,551]] = 1
    T1 = np.zeros((24,24))
    T1[np.ix_([0,1,2,4,5,6,7,8,9,11,12,13,14,15,16,19,20,21,23],[0,1,2,4,5,6,7,8,9,11,12,13,14,15,16,19,20,21,23])] = M[:,:19]
    T1.flat[[75,250,425,450,550]] = 1

    _,V = eig(T0,T1)
    S = V[19:23,:]/np.tile(V[23,:],(4,1))
    S = S[:,np.all(np.isfinite(S),axis=0)]

    return S