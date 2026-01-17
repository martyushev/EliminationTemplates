from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_focal6p_1s import inidata_num_focal6p_1s, coefs_focal6p_1s, red_11x20_focal6p_1s

def test_num_focal6p_1s():

    seed(23)
    stats = ini_stats('focal6p_1s')
    stats['solver'] = 'red_11x20_focal6p_1s'
    stats['nroots'] = 9
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_focal6p_1s()
        C,U,dU = coefs_focal6p_1s(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)