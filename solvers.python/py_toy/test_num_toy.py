from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_toy import inidata_num_toy, coefs_toy, red_14x22_toy, red_14x22_colpiv_toy

def test_num_toy():

    seed(23)
    stats = ini_stats('toy')
    stats['solver'] = 'red_14x22_toy'
    stats['nroots'] = 8
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_toy()
        C,U,dU = coefs_toy(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)