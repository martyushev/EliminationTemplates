from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_kuramoto_oscillator import inidata_num_kuramoto_oscillator, coefs_kuramoto_oscillator, red_87x110_kuramoto_oscillator

def test_num_kuramoto_oscillator():

    seed(23)
    stats = ini_stats('kuramoto_oscillator')
    stats['solver'] = 'red_87x110_kuramoto_oscillator'
    stats['nroots'] = 20
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_kuramoto_oscillator()
        C,U,dU = coefs_kuramoto_oscillator(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)