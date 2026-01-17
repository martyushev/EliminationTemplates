from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_opt_pnp_hesch import inidata_num_opt_pnp_hesch, coefs_opt_pnp_hesch, red_62x97_opt_pnp_hesch

def test_num_opt_pnp_hesch():

    seed(23)
    stats = ini_stats('opt_pnp_hesch')
    stats['solver'] = 'red_62x97_opt_pnp_hesch'
    stats['nroots'] = 27
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_opt_pnp_hesch()
        C,U,dU = coefs_opt_pnp_hesch(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)