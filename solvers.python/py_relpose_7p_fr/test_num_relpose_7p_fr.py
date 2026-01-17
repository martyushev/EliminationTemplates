from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_relpose_7p_fr import inidata_num_relpose_7p_fr, coefs_relpose_7p_fr, red_138x210_relpose_7p_fr

def test_num_relpose_7p_fr():

    seed(23)
    stats = ini_stats('relpose_7p_fr')
    stats['solver'] = 'red_138x210_relpose_7p_fr'
    stats['nroots'] = 68
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_relpose_7p_fr()
        C,U,dU = coefs_relpose_7p_fr(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)