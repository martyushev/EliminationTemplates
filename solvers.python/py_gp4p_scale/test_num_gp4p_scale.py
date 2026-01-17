from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_gp4p_scale import inidata_num_gp4p_scale, coefs_gp4p_scale, red_40x52_gp4p_scale

def test_num_gp4p_scale():

    seed(23)
    stats = ini_stats('gp4p_scale')
    stats['solver'] = 'red_40x52_gp4p_scale'
    stats['nroots'] = 8
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_gp4p_scale()
        C,U,dU = coefs_gp4p_scale(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)