from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_tdoa_pose_5pt import inidata_num_tdoa_pose_5pt, coefs_tdoa_pose_5pt, red_195x237_tdoa_pose_5pt

def test_num_tdoa_pose_5pt():

    seed(23)
    stats = ini_stats('tdoa_pose_5pt')
    stats['solver'] = 'red_195x237_tdoa_pose_5pt'
    stats['nroots'] = 24
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_tdoa_pose_5pt()
        C,U,dU = coefs_tdoa_pose_5pt(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)