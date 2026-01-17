from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_5p import inidata_num_5p, coefs_5p, red_10x20_5p

def test_num_5p():

    seed(23)
    stats = ini_stats('5p')
    stats['solver'] = 'red_10x20_5p'
    stats['nroots'] = 10
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_5p()
        C,U,dU = coefs_5p(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)