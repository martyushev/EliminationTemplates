% Input: coefficient matrix C of size 6x35
% Output: solution matrix S of size 3x43

function S = red_103x146_colpiv_opt_pnp_nakanoC(C)

    ix = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103];
    jx = [3,4,5,6,7,12,13,14,15,19,20,21,26,27,32,55,56,57,58,59,60,61,62,63,64,82,83,84,86,87,89,107,108,110,125,9,12,13,14,15,19,20,21,22,26,27,28,32,33,37,81,82,83,84,85,86,87,88,89,90,106,107,108,109,110,111,124,125,126,136,18,19,20,21,22,25,26,27,28,31,32,33,36,37,40,102,103,104,105,106,107,108,109,110,111,121,122,123,124,125,126,134,135,136,142,24,25,26,27,28,30,31,32,33,35,36,37,39,40,42,117,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,1,2,3,4,5,10,11,12,13,17,18,19,24,25,30,46,47,48,49,52,53,54,57,58,61,73,74,75,79,80,84,100,101,105,120,2,3,4,5,6,11,12,13,14,18,19,20,25,26,31,51,52,53,54,56,57,58,60,61,63,78,79,80,83,84,87,104,105,108,123,3,4,5,6,7,12,13,14,15,19,20,21,26,27,32,55,56,57,58,59,60,61,62,63,64,82,83,84,86,87,89,107,108,110,125,8,10,11,12,13,16,17,18,19,23,24,25,29,30,34,66,67,68,69,73,74,75,79,80,84,94,95,96,100,101,105,115,116,120,130,10,11,12,13,14,17,18,19,20,24,25,26,30,31,35,72,73,74,75,78,79,80,83,84,87,99,100,101,104,105,108,119,120,123,133,11,12,13,14,15,18,19,20,21,25,26,27,31,32,36,77,78,79,80,82,83,84,86,87,89,103,104,105,107,108,110,122,123,125,135,9,12,13,14,15,19,20,21,22,26,27,28,32,33,37,81,82,83,84,85,86,87,88,89,90,106,107,108,109,110,111,124,125,126,136,16,17,18,19,20,23,24,25,26,29,30,31,34,35,38,93,94,95,96,99,100,101,104,105,108,114,115,116,119,120,123,129,130,133,139,17,18,19,20,21,24,25,26,27,30,31,32,35,36,39,98,99,100,101,103,104,105,107,108,110,118,119,120,122,123,125,132,133,135,141,18,19,20,21,22,25,26,27,28,31,32,33,36,37,40,102,103,104,105,106,107,108,109,110,111,121,122,123,124,125,126,134,135,136,142,23,24,25,26,27,29,30,31,32,34,35,36,38,39,41,113,114,115,116,118,119,120,122,123,125,128,129,130,132,133,135,138,139,141,144,24,25,26,27,28,30,31,32,33,35,36,37,39,40,42,117,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,1,2,3,4,5,10,11,12,13,17,18,19,24,25,30,46,47,48,49,52,53,54,57,58,61,73,74,75,79,80,84,100,101,105,120,2,3,4,5,6,11,12,13,14,18,19,20,25,26,31,51,52,53,54,56,57,58,60,61,63,78,79,80,83,84,87,104,105,108,123,3,4,5,6,7,12,13,14,15,19,20,21,26,27,32,55,56,57,58,59,60,61,62,63,64,82,83,84,86,87,89,107,108,110,125,8,10,11,12,13,16,17,18,19,23,24,25,29,30,34,66,67,68,69,73,74,75,79,80,84,94,95,96,100,101,105,115,116,120,130,10,11,12,13,14,17,18,19,20,24,25,26,30,31,35,72,73,74,75,78,79,80,83,84,87,99,100,101,104,105,108,119,120,123,133,11,12,13,14,15,18,19,20,21,25,26,27,31,32,36,77,78,79,80,82,83,84,86,87,89,103,104,105,107,108,110,122,123,125,135,9,12,13,14,15,19,20,21,22,26,27,28,32,33,37,81,82,83,84,85,86,87,88,89,90,106,107,108,109,110,111,124,125,126,136,16,17,18,19,20,23,24,25,26,29,30,31,34,35,38,93,94,95,96,99,100,101,104,105,108,114,115,116,119,120,123,129,130,133,139,17,18,19,20,21,24,25,26,27,30,31,32,35,36,39,98,99,100,101,103,104,105,107,108,110,118,119,120,122,123,125,132,133,135,141,18,19,20,21,22,25,26,27,28,31,32,33,36,37,40,102,103,104,105,106,107,108,109,110,111,121,122,123,124,125,126,134,135,136,142,23,24,25,26,27,29,30,31,32,34,35,36,38,39,41,113,114,115,116,118,119,120,122,123,125,128,129,130,132,133,135,138,139,141,144,24,25,26,27,28,30,31,32,33,35,36,37,39,40,42,117,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,44,45,46,47,48,50,51,52,53,55,56,57,59,60,62,71,72,73,74,77,78,79,82,83,86,98,99,100,103,104,107,118,119,122,132,45,46,47,48,49,51,52,53,54,56,57,58,60,61,63,72,73,74,75,78,79,80,83,84,87,99,100,101,104,105,108,119,120,123,133,1,2,3,4,5,10,11,12,13,17,18,19,24,25,30,46,47,48,49,52,53,54,57,58,61,73,74,75,79,80,84,100,101,105,120,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,77,78,79,80,82,83,84,86,87,89,103,104,105,107,108,110,122,123,125,135,2,3,4,5,6,11,12,13,14,18,19,20,25,26,31,51,52,53,54,56,57,58,60,61,63,78,79,80,83,84,87,104,105,108,123,3,4,5,6,7,12,13,14,15,19,20,21,26,27,32,55,56,57,58,59,60,61,62,63,64,82,83,84,86,87,89,107,108,110,125,65,66,67,68,69,72,73,74,75,78,79,80,83,84,87,93,94,95,96,99,100,101,104,105,108,114,115,116,119,120,123,129,130,133,139,8,10,11,12,13,16,17,18,19,23,24,25,29,30,34,66,67,68,69,73,74,75,79,80,84,94,95,96,100,101,105,115,116,120,130,70,71,72,73,74,76,77,78,79,81,82,83,85,86,88,97,98,99,100,102,103,104,106,107,109,117,118,119,121,122,124,131,132,134,140,71,72,73,74,75,77,78,79,80,82,83,84,86,87,89,98,99,100,101,103,104,105,107,108,110,118,119,120,122,123,125,132,133,135,141,10,11,12,13,14,17,18,19,20,24,25,26,30,31,35,72,73,74,75,78,79,80,83,84,87,99,100,101,104,105,108,119,120,123,133,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,102,103,104,105,106,107,108,109,110,111,121,122,123,124,125,126,134,135,136,142,11,12,13,14,15,18,19,20,21,25,26,27,31,32,36,77,78,79,80,82,83,84,86,87,89,103,104,105,107,108,110,122,123,125,135,9,12,13,14,15,19,20,21,22,26,27,28,32,33,37,81,82,83,84,85,86,87,88,89,90,106,107,108,109,110,111,124,125,126,136,91,92,93,94,95,97,98,99,100,102,103,104,106,107,109,112,113,114,115,117,118,119,121,122,124,127,128,129,131,132,134,137,138,140,143,92,93,94,95,96,98,99,100,101,103,104,105,107,108,110,113,114,115,116,118,119,120,122,123,125,128,129,130,132,133,135,138,139,141,144,16,17,18,19,20,23,24,25,26,29,30,31,34,35,38,93,94,95,96,99,100,101,104,105,108,114,115,116,119,120,123,129,130,133,139,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,117,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,17,18,19,20,21,24,25,26,27,30,31,32,35,36,39,98,99,100,101,103,104,105,107,108,110,118,119,120,122,123,125,132,133,135,141,18,19,20,21,22,25,26,27,28,31,32,33,36,37,40,102,103,104,105,106,107,108,109,110,111,121,122,123,124,125,126,134,135,136,142,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,23,24,25,26,27,29,30,31,32,34,35,36,38,39,41,113,114,115,116,118,119,120,122,123,125,128,129,130,132,133,135,138,139,141,144,24,25,26,27,28,30,31,32,33,35,36,37,39,40,42,117,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,44,45,46,47,48,50,51,52,53,55,56,57,59,60,62,71,72,73,74,77,78,79,82,83,86,98,99,100,103,104,107,118,119,122,132,45,46,47,48,49,51,52,53,54,56,57,58,60,61,63,72,73,74,75,78,79,80,83,84,87,99,100,101,104,105,108,119,120,123,133,1,2,3,4,5,10,11,12,13,17,18,19,24,25,30,46,47,48,49,52,53,54,57,58,61,73,74,75,79,80,84,100,101,105,120,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,77,78,79,80,82,83,84,86,87,89,103,104,105,107,108,110,122,123,125,135,2,3,4,5,6,11,12,13,14,18,19,20,25,26,31,51,52,53,54,56,57,58,60,61,63,78,79,80,83,84,87,104,105,108,123,3,4,5,6,7,12,13,14,15,19,20,21,26,27,32,55,56,57,58,59,60,61,62,63,64,82,83,84,86,87,89,107,108,110,125,65,66,67,68,69,72,73,74,75,78,79,80,83,84,87,93,94,95,96,99,100,101,104,105,108,114,115,116,119,120,123,129,130,133,139,8,10,11,12,13,16,17,18,19,23,24,25,29,30,34,66,67,68,69,73,74,75,79,80,84,94,95,96,100,101,105,115,116,120,130,70,71,72,73,74,76,77,78,79,81,82,83,85,86,88,97,98,99,100,102,103,104,106,107,109,117,118,119,121,122,124,131,132,134,140,71,72,73,74,75,77,78,79,80,82,83,84,86,87,89,98,99,100,101,103,104,105,107,108,110,118,119,120,122,123,125,132,133,135,141,10,11,12,13,14,17,18,19,20,24,25,26,30,31,35,72,73,74,75,78,79,80,83,84,87,99,100,101,104,105,108,119,120,123,133,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,102,103,104,105,106,107,108,109,110,111,121,122,123,124,125,126,134,135,136,142,11,12,13,14,15,18,19,20,21,25,26,27,31,32,36,77,78,79,80,82,83,84,86,87,89,103,104,105,107,108,110,122,123,125,135,9,12,13,14,15,19,20,21,22,26,27,28,32,33,37,81,82,83,84,85,86,87,88,89,90,106,107,108,109,110,111,124,125,126,136,91,92,93,94,95,97,98,99,100,102,103,104,106,107,109,112,113,114,115,117,118,119,121,122,124,127,128,129,131,132,134,137,138,140,143,92,93,94,95,96,98,99,100,101,103,104,105,107,108,110,113,114,115,116,118,119,120,122,123,125,128,129,130,132,133,135,138,139,141,144,16,17,18,19,20,23,24,25,26,29,30,31,34,35,38,93,94,95,96,99,100,101,104,105,108,114,115,116,119,120,123,129,130,133,139,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,117,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,17,18,19,20,21,24,25,26,27,30,31,32,35,36,39,98,99,100,101,103,104,105,107,108,110,118,119,120,122,123,125,132,133,135,141,18,19,20,21,22,25,26,27,28,31,32,33,36,37,40,102,103,104,105,106,107,108,109,110,111,121,122,123,124,125,126,134,135,136,142,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,23,24,25,26,27,29,30,31,32,34,35,36,38,39,41,113,114,115,116,118,119,120,122,123,125,128,129,130,132,133,135,138,139,141,144,24,25,26,27,28,30,31,32,33,35,36,37,39,40,42,117,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,44,45,46,47,48,50,51,52,53,55,56,57,59,60,62,71,72,73,74,77,78,79,82,83,86,98,99,100,103,104,107,118,119,122,132,45,46,47,48,49,51,52,53,54,56,57,58,60,61,63,72,73,74,75,78,79,80,83,84,87,99,100,101,104,105,108,119,120,123,133,1,2,3,4,5,10,11,12,13,17,18,19,24,25,30,46,47,48,49,52,53,54,57,58,61,73,74,75,79,80,84,100,101,105,120,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,77,78,79,80,82,83,84,86,87,89,103,104,105,107,108,110,122,123,125,135,2,3,4,5,6,11,12,13,14,18,19,20,25,26,31,51,52,53,54,56,57,58,60,61,63,78,79,80,83,84,87,104,105,108,123,3,4,5,6,7,12,13,14,15,19,20,21,26,27,32,55,56,57,58,59,60,61,62,63,64,82,83,84,86,87,89,107,108,110,125,65,66,67,68,69,72,73,74,75,78,79,80,83,84,87,93,94,95,96,99,100,101,104,105,108,114,115,116,119,120,123,129,130,133,139,8,10,11,12,13,16,17,18,19,23,24,25,29,30,34,66,67,68,69,73,74,75,79,80,84,94,95,96,100,101,105,115,116,120,130,70,71,72,73,74,76,77,78,79,81,82,83,85,86,88,97,98,99,100,102,103,104,106,107,109,117,118,119,121,122,124,131,132,134,140,71,72,73,74,75,77,78,79,80,82,83,84,86,87,89,98,99,100,101,103,104,105,107,108,110,118,119,120,122,123,125,132,133,135,141,10,11,12,13,14,17,18,19,20,24,25,26,30,31,35,72,73,74,75,78,79,80,83,84,87,99,100,101,104,105,108,119,120,123,133,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,102,103,104,105,106,107,108,109,110,111,121,122,123,124,125,126,134,135,136,142,11,12,13,14,15,18,19,20,21,25,26,27,31,32,36,77,78,79,80,82,83,84,86,87,89,103,104,105,107,108,110,122,123,125,135,9,12,13,14,15,19,20,21,22,26,27,28,32,33,37,81,82,83,84,85,86,87,88,89,90,106,107,108,109,110,111,124,125,126,136,91,92,93,94,95,97,98,99,100,102,103,104,106,107,109,112,113,114,115,117,118,119,121,122,124,127,128,129,131,132,134,137,138,140,143,92,93,94,95,96,98,99,100,101,103,104,105,107,108,110,113,114,115,116,118,119,120,122,123,125,128,129,130,132,133,135,138,139,141,144,16,17,18,19,20,23,24,25,26,29,30,31,34,35,38,93,94,95,96,99,100,101,104,105,108,114,115,116,119,120,123,129,130,133,139,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,117,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,17,18,19,20,21,24,25,26,27,30,31,32,35,36,39,98,99,100,101,103,104,105,107,108,110,118,119,120,122,123,125,132,133,135,141,18,19,20,21,22,25,26,27,28,31,32,33,36,37,40,102,103,104,105,106,107,108,109,110,111,121,122,123,124,125,126,134,135,136,142,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,23,24,25,26,27,29,30,31,32,34,35,36,38,39,41,113,114,115,116,118,119,120,122,123,125,128,129,130,132,133,135,138,139,141,144,24,25,26,27,28,30,31,32,33,35,36,37,39,40,42,117,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146];
    kx = [25,49,67,79,85,109,127,139,145,163,175,181,193,199,205,1,7,13,19,31,37,43,55,61,73,91,97,103,115,121,133,151,157,169,187,85,25,49,67,79,109,127,139,145,163,175,181,193,199,205,1,7,13,19,31,37,43,55,61,73,91,97,103,115,121,133,151,157,169,187,25,49,67,79,85,109,127,139,145,163,175,181,193,199,205,1,7,13,19,31,37,43,55,61,73,91,97,103,115,121,133,151,157,169,187,25,49,67,79,85,109,127,139,145,163,175,181,193,199,205,1,7,13,19,31,37,43,55,61,73,91,97,103,115,121,133,151,157,169,187,25,49,67,79,85,109,127,139,145,163,175,181,193,199,205,1,7,13,19,31,37,43,55,61,73,91,97,103,115,121,133,151,157,169,187,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,2,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,2,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,2,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,2,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,2,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,2,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,86,26,50,68,80,110,128,140,146,164,176,182,194,200,206,2,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,2,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,2,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,2,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,2,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,2,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,2,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,3,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,3,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,3,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,3,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,3,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,3,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,87,27,51,69,81,111,129,141,147,165,177,183,195,201,207,3,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,3,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,3,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,3,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,3,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,3,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,3,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,4,10,16,22,28,34,40,46,52,58,64,70,76,82,88,94,100,106,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,64,70,76,82,88,94,100,106,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,4,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,4,10,16,22,28,34,40,46,52,58,64,70,76,82,88,94,100,106,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,4,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,4,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,4,10,16,22,28,34,40,46,52,58,64,70,76,82,88,94,100,106,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,4,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,4,10,16,22,28,34,40,46,52,58,64,70,76,82,88,94,100,106,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,64,70,76,82,88,94,100,106,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,4,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,4,10,16,22,28,34,40,46,52,58,64,70,76,82,88,94,100,106,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,4,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,88,28,52,70,82,112,130,142,148,166,178,184,196,202,208,4,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,4,10,16,22,28,34,40,46,52,58,64,70,76,82,88,94,100,106,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,64,70,76,82,88,94,100,106,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,4,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,4,10,16,22,28,34,40,46,52,58,64,70,76,82,88,94,100,106,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,4,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,4,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,4,10,16,22,28,34,40,46,52,58,64,70,76,82,88,94,100,106,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,4,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,4,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,4,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,5,11,17,23,29,35,41,47,53,59,65,71,77,83,89,95,101,107,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,65,71,77,83,89,95,101,107,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,5,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,5,11,17,23,29,35,41,47,53,59,65,71,77,83,89,95,101,107,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,5,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,5,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,5,11,17,23,29,35,41,47,53,59,65,71,77,83,89,95,101,107,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,5,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,5,11,17,23,29,35,41,47,53,59,65,71,77,83,89,95,101,107,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,65,71,77,83,89,95,101,107,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,5,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,5,11,17,23,29,35,41,47,53,59,65,71,77,83,89,95,101,107,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,5,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,89,29,53,71,83,113,131,143,149,167,179,185,197,203,209,5,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,5,11,17,23,29,35,41,47,53,59,65,71,77,83,89,95,101,107,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,65,71,77,83,89,95,101,107,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,5,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,5,11,17,23,29,35,41,47,53,59,65,71,77,83,89,95,101,107,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,5,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,5,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,5,11,17,23,29,35,41,47,53,59,65,71,77,83,89,95,101,107,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,5,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,5,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,5,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,6,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,6,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,6,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,6,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,6,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,6,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,90,30,54,72,84,114,132,144,150,168,180,186,198,204,210,6,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,6,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,6,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,6,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,6,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,6,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,6,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192];
    M = sparse(ix,jx,C(kx),103,146);

    [L,~,P] = lu(M(:,1:9));
    P = P';
    M = [P*L P(:,10:end)]\M(:,10:end);
    M = full(M(10:end,:));

    [L,U,P] = lu(M(:,1:34));
    P = P';
    M = [P*L P(:,35:end)]\M(:,35:end);
    M1 = M(1:34,:);
    M2 = M(35:end,:);

    [Q,R,P] = qr(M2(:,1:end-4));
    A = U\[M1(:,1:end-4)*P M1(:,end-3:end)];
    B = R(:,1:60)\[R(:,61:end) Q'*M2(:,end-3:end)];
    M = [-A(:,end-42:end)+A(:,1:end-43)*B; -B];

    P1 = [104:137 (1:99)*P 100:103];
    P2 = [28,29,30,31,32,104,34,35,36,37,105,39,40,41,106,43,44,107,46,108,109,50,51,52,53,110,54,55,56,57,58,111,59,60,61,62,112,63,64,65,113,66,67,114,68,115,116,69,70,71,72,73,117,74,75,76,77,118,78,79,80,119,81,82,120,83,121,122,84,85,86,87,123,88,89,90,124,91,92,125,93,126,127,94,95,96,128,97,98,129,99,130,131,100,101,132,102,133,134,103,135,136,137];
    T = getT(M,P1(1:end-43),P1(end-42:end),P2);

    [V,~] = eig(T);
    S = V(40:42,:)./repmat(V(43,:),3,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end