import numpy as np

def inidata_num_kuramoto_oscillator():
    data = [None]*2
    data[0] = np.random.randn(3,1)
    data[1] = np.random.randn(3,4)
    return data