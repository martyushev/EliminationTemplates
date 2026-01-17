from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_hyb51f import inidata_num_hyb51f, coefs_hyb51f, red_598x684_hyb51f

def test_num_hyb51f():

    seed(23)
    stats = ini_stats('hyb51f')
    stats['solver'] = 'red_598x684_hyb51f'
    stats['nroots'] = 56
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_hyb51f()
        C,U,dU = coefs_hyb51f(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)