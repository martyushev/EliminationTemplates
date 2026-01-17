from numpy.random import seed
from time import time
from _common import ini_stats, validate_roots, update_stats, disp_stats
from py_parallel_robot_66 import inidata_num_parallel_robot_66, coefs_parallel_robot_66, red_293x362_parallel_robot_66

def test_num_parallel_robot_66():

    seed(23)
    stats = ini_stats('parallel_robot_66')
    stats['solver'] = 'red_293x362_parallel_robot_66'
    stats['nroots'] = 40
    stats['ntrials'] = 10**3
    stats['iterref'] = 0

    for i in range(stats['ntrials']):

        tic = time()
        data = inidata_num_parallel_robot_66()
        C,U,dU = coefs_parallel_robot_66(data)
        solver_func = globals().get(stats['solver'])
        S = solver_func(C,data[2][0,0])
        S,Ir,e = validate_roots(S,C,U,dU,stats['nroots'],stats['iterref'])

        stats['tm'].append(time()-tic)
        stats = update_stats(stats,Ir,e)

    disp_stats(stats)