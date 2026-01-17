# Elimination template generators for solving parameterized (Laurent) polynomial systems

## Problem statement

In applications, the following problem often arises:

> **Given a family of (Laurent) polynomial systems with the same monomial structure but varying coefficients, find a solver that computes solutions for any family member as fast as possible.**

Under appropriate genericity assumptions, the dimension and degree of the respective polynomial ideal remain unchanged for each particular system in the same family.


## The elimination template approach

The state-of-the-art approach to solving such problems is based on **elimination templates**, which are the coefficient (Macaulay) matrices that encode the transformation from the initial polynomials to the polynomials needed to construct the action matrix. Knowing an action matrix, the solutions of the system are computed from its eigenvectors.

The key advantage of elimination templates is their **universal applicability**: a single template works for all polynomial systems within the given family.


## Repository contents

This repository provides

### Elimination template generators
- **GreedyAG**: automatic generator by greedy parameter search
- **RedundantAG**: automatic generator by redundant solving sets

### Problem formulations
Formulations of more than 50 minimal problems, primarily from **geometric computer vision**, including:
- Absolute pose problems
- Relative pose problems
- Triangulation
- Self-calibration
- And many more...

### Automatically generated solvers
- **MATLAB** solvers
- **Julia** solvers
- **Python** solvers


## Related publications

The algorithms implemented in this repository are described in the following papers:

1)
@inproceedings{martyushev2022optimizing,<br/>
&nbsp;&nbsp;&nbsp; title={Optimizing Elimination Templates by Greedy Parameter Search},<br/>
&nbsp;&nbsp;&nbsp; author={Martyushev, Evgeniy and Vrablikova, Jana and Pajdla, Tomas},<br/>
&nbsp;&nbsp;&nbsp; booktitle={Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition},<br/>
&nbsp;&nbsp;&nbsp; pages={15754--15764},<br/>
&nbsp;&nbsp;&nbsp; year={2022},<br/>
&nbsp;&nbsp;&nbsp; url={https://doi.org/10.1109/CVPR52688.2022.01530 },<br/>
&nbsp;&nbsp;&nbsp; doi={10.1109/CVPR52688.2022.01530 }<br/>
}<br/>
[https://openaccess.thecvf.com/content/CVPR2022/html/Martyushev_Optimizing_Elimination_Templates_by_Greedy_Parameter_Search_CVPR_2022_paper.html]

2)
@article{martyushev2026automatic,<br/>
&nbsp;&nbsp;&nbsp; title={Automatic Solver Generator for Systems of {L}aurent Polynomial Equations},<br/>
&nbsp;&nbsp;&nbsp; author={Martyushev, Evgeniy and Bhayani, Snehal and Pajdla, Tomas},<br/>
&nbsp;&nbsp;&nbsp; journal={International Journal of Computer Vision},<br/>
&nbsp;&nbsp;&nbsp; volume={134},<br/>
&nbsp;&nbsp;&nbsp; pages={59},<br/>
&nbsp;&nbsp;&nbsp; year={2026},<br/>
&nbsp;&nbsp;&nbsp; url={https://doi.org/10.1007/s11263-025-02635-9 },<br/>
&nbsp;&nbsp;&nbsp; doi={10.1007/s11263-025-02635-9 }<br/>
}