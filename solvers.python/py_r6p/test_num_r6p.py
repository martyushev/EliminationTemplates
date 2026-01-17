from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_r6p import inidata_num_r6p, coefs_r6p, red_66x92_r6p

def test_num_r6p():

    seed(23)
    stats = ini_stats('r6p')
    stats['solver'] = 'red_66x92_r6p'
    stats['nroots'] = 20
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_r6p()
        C,U,dU = coefs_r6p(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)