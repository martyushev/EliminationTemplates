from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_IOD import inidata_num_IOD, coefs_IOD, red_481x561_IOD

def test_num_IOD():

    seed(23)
    stats = ini_stats('IOD')
    stats['solver'] = 'red_481x561_IOD'
    stats['nroots'] = 66
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_IOD()
        C,U,dU = coefs_IOD(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)