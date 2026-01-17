import numpy as np

def inidata_num_3v_triang_laurent():
    data = [None]*6
    data[0] = np.random.randn(2,4)
    data[1] = np.random.randn(2,4)
    data[2] = np.random.randn(2,4)
    data[3] = np.random.randn(2,1)
    data[4] = np.random.randn(2,1)
    data[5] = np.random.randn(2,1)
    return data