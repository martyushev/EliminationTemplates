from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_optpose2pt_v2 import inidata_num_optpose2pt_v2, coefs_optpose2pt_v2, red_87x120_optpose2pt_v2

def test_num_optpose2pt_v2():

    seed(23)
    stats = ini_stats('optpose2pt_v2')
    stats['solver'] = 'red_87x120_optpose2pt_v2'
    stats['nroots'] = 24
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_optpose2pt_v2()
        C,U,dU = coefs_optpose2pt_v2(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)