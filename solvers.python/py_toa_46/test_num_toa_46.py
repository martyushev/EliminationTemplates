from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_toa_46 import inidata_num_toa_46, coefs_toa_46, red_427x475_toa_46

def test_num_toa_46():

    seed(23)
    stats = ini_stats('toa_46')
    stats['solver'] = 'red_427x475_toa_46'
    stats['nroots'] = 38
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_toa_46()
        C,U,dU = coefs_toa_46(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)