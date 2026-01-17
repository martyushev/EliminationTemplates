import numpy as np

def inidata_num_relpose_7p_r1r2():
    data = [None]*2
    data[0] = np.random.randn(2,7)
    data[1] = np.random.randn(2,7)
    return data