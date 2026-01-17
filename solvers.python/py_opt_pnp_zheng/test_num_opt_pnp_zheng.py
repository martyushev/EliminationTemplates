from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_opt_pnp_zheng import inidata_num_opt_pnp_zheng, coefs_opt_pnp_zheng, red_109x161_opt_pnp_zheng

def test_num_opt_pnp_zheng():

    seed(23)
    stats = ini_stats('opt_pnp_zheng')
    stats['solver'] = 'red_109x161_opt_pnp_zheng'
    stats['nroots'] = 40
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_opt_pnp_zheng()
        C,U,dU = coefs_opt_pnp_zheng(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)