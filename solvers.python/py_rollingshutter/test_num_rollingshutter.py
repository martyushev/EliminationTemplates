from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_rollingshutter import inidata_num_rollingshutter, coefs_rollingshutter, red_40x52_rollingshutter, red_40x52_colpiv_rollingshutter

def test_num_rollingshutter():

    seed(23)
    stats = ini_stats('rollingshutter')
    stats['solver'] = 'red_40x52_rollingshutter'
    stats['nroots'] = 8
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_rollingshutter()
        C,U,dU = coefs_rollingshutter(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)