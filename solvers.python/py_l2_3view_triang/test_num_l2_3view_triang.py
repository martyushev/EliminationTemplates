from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_l2_3view_triang import inidata_num_l2_3view_triang, coefs_l2_3view_triang, red_190x227_l2_3view_triang

def test_num_l2_3view_triang():

    seed(23)
    stats = ini_stats('l2_3view_triang')
    stats['solver'] = 'red_190x227_l2_3view_triang'
    stats['nroots'] = 31
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_l2_3view_triang()
        C,U,dU = coefs_l2_3view_triang(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)