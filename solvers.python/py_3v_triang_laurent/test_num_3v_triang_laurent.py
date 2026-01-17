from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_3v_triang_laurent import inidata_num_3v_triang_laurent, coefs_3v_triang_laurent, red_69x127_3v_triang_laurent, red_69x127_colpiv_3v_triang_laurent

def test_num_3v_triang_laurent():

    seed(23)
    stats = ini_stats('3v_triang_laurent')
    stats['solver'] = 'red_69x127_3v_triang_laurent'
    stats['nroots'] = 47
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_3v_triang_laurent()
        C,U,dU = coefs_3v_triang_laurent(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)