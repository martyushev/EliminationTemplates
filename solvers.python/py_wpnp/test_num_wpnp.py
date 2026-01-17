from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_wpnp import inidata_num_wpnp, coefs_wpnp, red_85x107_wpnp

def test_num_wpnp():

    seed(23)
    stats = ini_stats('wpnp')
    stats['solver'] = 'red_85x107_wpnp'
    stats['nroots'] = 16
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_wpnp()
        C,U,dU = coefs_wpnp(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)