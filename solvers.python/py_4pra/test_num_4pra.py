from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_4pra import inidata_num_4pra, coefs_4pra, red_12x36_4pra

def test_num_4pra():

    seed(23)
    stats = ini_stats('4pra')
    stats['solver'] = 'red_12x36_4pra'
    stats['nroots'] = 20
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_4pra()
        C,U,dU = coefs_4pra(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C,data[2][0,0]**2-1)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)