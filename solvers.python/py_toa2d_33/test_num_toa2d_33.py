from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_toa2d_33 import inidata_num_toa2d_33, coefs_toa2d_33, red_18x28_toa2d_33

def test_num_toa2d_33():

    seed(23)
    stats = ini_stats('toa2d_33')
    stats['solver'] = 'red_18x28_toa2d_33'
    stats['nroots'] = 8
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_toa2d_33()
        C,U,dU = coefs_toa2d_33(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)