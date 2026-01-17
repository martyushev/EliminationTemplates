from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_relpose_4pt import inidata_num_relpose_4pt, coefs_relpose_4pt, red_72x108_relpose_4pt

def test_num_relpose_4pt():

    seed(23)
    stats = ini_stats('relpose_4pt')
    stats['solver'] = 'red_72x108_relpose_4pt'
    stats['nroots'] = 20
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_relpose_4pt()
        C,U,dU = coefs_relpose_4pt(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)