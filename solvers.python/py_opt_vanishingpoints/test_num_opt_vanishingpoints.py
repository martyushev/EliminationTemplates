from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_opt_vanishingpoints import inidata_num_opt_vanishingpoints, coefs_opt_vanishingpoints, red_136x194_opt_vanishingpoints

def test_num_opt_vanishingpoints():

    seed(23)
    stats = ini_stats('opt_vanishingpoints')
    stats['solver'] = 'red_136x194_opt_vanishingpoints'
    stats['nroots'] = 40
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_opt_vanishingpoints()
        C,U,dU = coefs_opt_vanishingpoints(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)