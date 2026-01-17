import numpy as np

def inidata_num_tdoa_pose_5pt():
    data = [None]*2
    data[0] = np.random.randn(3,5)
    data[1] = np.random.randn(1,5)
    return data