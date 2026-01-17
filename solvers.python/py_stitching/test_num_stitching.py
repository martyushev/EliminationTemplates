from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_stitching import inidata_num_stitching, coefs_stitching, red_6x30_stitching

def test_num_stitching():

    seed(23)
    stats = ini_stats('stitching')
    stats['solver'] = 'red_6x30_stitching'
    stats['nroots'] = 18
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_stitching()
        C,U,dU = coefs_stitching(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)