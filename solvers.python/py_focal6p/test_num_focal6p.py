from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_focal6p import inidata_num_focal6p, coefs_focal6p, red_11x26_focal6p

def test_num_focal6p():

    seed(23)
    stats = ini_stats('focal6p')
    stats['solver'] = 'red_11x26_focal6p'
    stats['nroots'] = 15
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_focal6p()
        C,U,dU = coefs_focal6p(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)