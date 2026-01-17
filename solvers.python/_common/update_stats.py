import numpy as np

def update_stats(stats,Ir,e):

    kr = np.sum(Ir) # number of real roots
    e1 = e[:-1]
    k = len(e1)
    err = np.log10(np.linalg.norm(e1)) # numerical error
    flr = np.any(e1>1e-3) # failure identifier
    shrp = -np.inf if e[k] == -1 else np.log10(e[k-1]/e[k]) # boundary sharpness

    stats['err'].append(err)
    stats['flr'].append(flr)
    stats['shrp'].append(shrp)
    stats['k'].append(k)
    stats['kr'].append(kr)

    return stats