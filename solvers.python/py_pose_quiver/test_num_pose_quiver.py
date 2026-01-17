from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_pose_quiver import inidata_num_pose_quiver, coefs_pose_quiver, red_38x74_pose_quiver

def test_num_pose_quiver():

    seed(23)
    stats = ini_stats('pose_quiver')
    stats['solver'] = 'red_38x74_pose_quiver'
    stats['nroots'] = 20
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_pose_quiver()
        C,U,dU = coefs_pose_quiver(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C)
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)