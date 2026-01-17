from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_p4p_fr_iccv17 import inidata_num_p4p_fr_iccv17, coefs_p4p_fr_iccv17, red_28x40_p4p_fr_iccv17

def test_num_p4p_fr_iccv17():

    seed(23)
    stats = ini_stats('p4p_fr_iccv17')
    stats['solver'] = 'red_28x40_p4p_fr_iccv17'
    stats['nroots'] = 12
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_p4p_fr_iccv17()
        C,U,dU = coefs_p4p_fr_iccv17(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)