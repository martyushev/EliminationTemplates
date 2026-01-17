from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_wpnp_2x2sym import inidata_num_wpnp_2x2sym, coefs_wpnp_2x2sym, red_10x20_wpnp_2x2sym

def test_num_wpnp_2x2sym():

    seed(23)
    stats = ini_stats('wpnp_2x2sym')
    stats['solver'] = 'red_10x20_wpnp_2x2sym'
    stats['nroots'] = 16
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_wpnp_2x2sym()
        C,U,dU = coefs_wpnp_2x2sym(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)