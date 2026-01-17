from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_rdist9p import inidata_num_rdist9p, coefs_rdist9p, red_73x97_rdist9p, red_73x97_colpiv_rdist9p

def test_num_rdist9p():

    seed(23)
    stats = ini_stats('rdist9p')
    stats['solver'] = 'red_73x97_rdist9p'
    stats['nroots'] = 24
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_rdist9p()
        C,U,dU = coefs_rdist9p(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)