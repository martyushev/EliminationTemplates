from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_8ptF_radial import inidata_num_8ptF_radial, coefs_8ptF_radial, red_19x39_8ptF_radial, red_19x39_colpiv_8ptF_radial

def test_num_8ptF_radial():

    seed(23)
    stats = ini_stats('8ptF_radial')
    stats['solver'] = 'red_19x39_8ptF_radial'
    stats['nroots'] = 16
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_8ptF_radial()
        C,U,dU = coefs_8ptF_radial(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)