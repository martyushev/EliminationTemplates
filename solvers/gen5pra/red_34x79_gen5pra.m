% Input: coefficient matrix C of size 6x84
% Output: solution matrix S of size 3x45

function S = red_34x79_gen5pra(C,ss)

    M = sparse([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34],[2,3,4,5,6,8,9,10,11,13,14,15,17,18,20,24,25,26,27,30,31,32,35,36,39,45,46,47,50,51,54,60,61,64,70,78,79,80,81,82,83,84,85,86,87,88,89,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,108,112,114,115,117,121,122,123,124,125,126,128,132,133,134,135,137,141,142,144,149,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,29,30,31,32,34,35,36,38,39,41,49,50,51,53,54,56,63,64,66,72,80,81,82,83,84,85,86,87,88,89,90,93,94,95,96,97,98,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,91,93,95,97,99,101,103,105,107,109,114,116,118,121,123,125,127,129,132,134,136,138,141,143,145,148,150,153,23,24,25,26,27,29,30,31,32,34,35,36,38,39,41,44,45,46,47,49,50,51,53,54,56,59,60,61,63,64,66,69,70,72,75,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,110,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,48,49,50,51,52,53,54,55,56,57,62,63,64,65,66,67,71,72,73,76,93,94,95,96,97,98,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,99,100,101,102,103,104,105,106,107,108,109,110,111,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,27,29,30,31,32,34,35,36,38,39,41,44,45,46,47,49,50,51,53,54,56,59,60,61,63,64,66,69,70,72,75,78,80,82,84,86,88,90,91,93,95,97,99,101,103,105,107,114,116,121,123,125,127,132,134,136,141,143,148,2,3,4,5,6,8,9,10,11,13,14,15,17,18,20,24,25,26,27,30,31,32,35,36,39,45,46,47,50,51,54,60,61,64,70,78,79,80,81,82,83,84,85,86,87,88,89,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,108,112,114,115,117,121,122,123,124,125,126,128,132,133,134,135,137,141,142,144,149,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,29,30,31,32,34,35,36,38,39,41,49,50,51,53,54,56,63,64,66,72,80,81,82,83,84,85,86,87,88,89,90,93,94,95,96,97,98,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,91,93,95,97,99,101,103,105,107,109,114,116,118,121,123,125,127,129,132,134,136,138,141,143,145,148,150,153,23,24,25,26,27,29,30,31,32,34,35,36,38,39,41,44,45,46,47,49,50,51,53,54,56,59,60,61,63,64,66,69,70,72,75,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,110,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,48,49,50,51,52,53,54,55,56,57,62,63,64,65,66,67,71,72,73,76,93,94,95,96,97,98,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,99,100,101,102,103,104,105,106,107,108,109,110,111,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,27,29,30,31,32,34,35,36,38,39,41,44,45,46,47,49,50,51,53,54,56,59,60,61,63,64,66,69,70,72,75,78,80,82,84,86,88,90,91,93,95,97,99,101,103,105,107,114,116,121,123,125,127,132,134,136,141,143,148,2,3,4,5,6,8,9,10,11,13,14,15,17,18,20,24,25,26,27,30,31,32,35,36,39,45,46,47,50,51,54,60,61,64,70,78,79,80,81,82,83,84,85,86,87,88,89,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,108,112,114,115,117,121,122,123,124,125,126,128,132,133,134,135,137,141,142,144,149,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,29,30,31,32,34,35,36,38,39,41,49,50,51,53,54,56,63,64,66,72,80,81,82,83,84,85,86,87,88,89,90,93,94,95,96,97,98,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,91,93,95,97,99,101,103,105,107,109,114,116,118,121,123,125,127,129,132,134,136,138,141,143,145,148,150,153,23,24,25,26,27,29,30,31,32,34,35,36,38,39,41,44,45,46,47,49,50,51,53,54,56,59,60,61,63,64,66,69,70,72,75,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,110,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,48,49,50,51,52,53,54,55,56,57,62,63,64,65,66,67,71,72,73,76,93,94,95,96,97,98,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,99,100,101,102,103,104,105,106,107,108,109,110,111,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,27,29,30,31,32,34,35,36,38,39,41,44,45,46,47,49,50,51,53,54,56,59,60,61,63,64,66,69,70,72,75,78,80,82,84,86,88,90,91,93,95,97,99,101,103,105,107,114,116,121,123,125,127,132,134,136,141,143,148,2,3,4,5,6,8,9,10,11,13,14,15,17,18,20,24,25,26,27,30,31,32,35,36,39,45,46,47,50,51,54,60,61,64,70,78,79,80,81,82,83,84,85,86,87,88,89,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,108,112,114,115,117,121,122,123,124,125,126,128,132,133,134,135,137,141,142,144,149,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,29,30,31,32,34,35,36,38,39,41,49,50,51,53,54,56,63,64,66,72,80,81,82,83,84,85,86,87,88,89,90,93,94,95,96,97,98,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,91,93,95,97,99,101,103,105,107,109,114,116,118,121,123,125,127,129,132,134,136,138,141,143,145,148,150,153,23,24,25,26,27,29,30,31,32,34,35,36,38,39,41,44,45,46,47,49,50,51,53,54,56,59,60,61,63,64,66,69,70,72,75,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,110,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,48,49,50,51,52,53,54,55,56,57,62,63,64,65,66,67,71,72,73,76,93,94,95,96,97,98,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,99,100,101,102,103,104,105,106,107,108,109,110,111,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,27,29,30,31,32,34,35,36,38,39,41,44,45,46,47,49,50,51,53,54,56,59,60,61,63,64,66,69,70,72,75,78,80,82,84,86,88,90,91,93,95,97,99,101,103,105,107,114,116,121,123,125,127,132,134,136,141,143,148,2,3,4,5,6,8,9,10,11,13,14,15,17,18,20,24,25,26,27,30,31,32,35,36,39,45,46,47,50,51,54,60,61,64,70,78,79,80,81,82,83,84,85,86,87,88,89,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,108,112,114,115,117,121,122,123,124,125,126,128,132,133,134,135,137,141,142,144,149,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,29,30,31,32,34,35,36,38,39,41,49,50,51,53,54,56,63,64,66,72,80,81,82,83,84,85,86,87,88,89,90,93,94,95,96,97,98,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,91,93,95,97,99,101,103,105,107,109,114,116,118,121,123,125,127,129,132,134,136,138,141,143,145,148,150,153,23,24,25,26,27,29,30,31,32,34,35,36,38,39,41,44,45,46,47,49,50,51,53,54,56,59,60,61,63,64,66,69,70,72,75,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,110,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,48,49,50,51,52,53,54,55,56,57,62,63,64,65,66,67,71,72,73,76,93,94,95,96,97,98,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,99,100,101,102,103,104,105,106,107,108,109,110,111,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156],C([1,7,13,19,25,43,49,55,61,79,85,91,109,115,133,169,175,181,187,205,211,217,235,241,259,295,301,307,325,331,349,385,391,409,445,31,37,67,73,97,103,121,127,139,145,151,157,193,199,223,229,247,253,265,271,313,319,397,403,451,457,481,487,499,163,277,283,289,337,343,355,361,367,373,379,415,421,427,433,439,463,469,475,493,1,7,13,19,25,43,49,55,61,79,85,91,109,115,133,169,175,181,187,205,211,217,235,241,259,295,301,307,325,331,349,385,391,409,445,31,37,67,73,97,103,121,127,139,145,151,193,199,223,229,247,253,157,163,265,271,277,283,289,313,319,337,343,355,361,367,373,379,397,403,415,421,427,433,439,451,457,463,469,475,481,487,493,499,1,7,13,19,25,31,43,49,55,61,67,79,85,91,97,109,115,121,133,139,151,169,175,181,187,193,205,211,217,223,235,241,247,259,265,277,295,301,307,313,325,331,337,349,355,367,385,391,397,409,415,427,445,451,463,481,37,73,103,127,199,319,403,457,487,499,145,157,163,229,253,271,283,289,343,361,373,379,421,433,439,469,475,493,1,7,13,19,25,43,49,55,61,79,85,91,109,115,133,169,175,181,187,205,211,217,235,241,259,295,301,307,325,331,349,385,391,409,445,31,37,67,73,97,103,121,127,193,199,313,319,397,403,451,457,481,487,499,139,145,151,157,163,223,229,247,253,265,271,277,283,289,337,343,355,361,367,373,379,415,421,427,433,439,463,469,475,493,1,7,13,19,25,43,49,55,61,79,85,91,109,115,133,169,175,181,187,205,211,217,235,241,259,295,301,307,325,331,349,385,391,409,445,31,37,67,73,97,103,121,127,139,145,151,157,163,193,199,223,229,247,253,265,271,277,283,289,313,319,337,343,355,361,367,373,379,397,403,415,421,427,433,439,451,457,463,469,475,481,487,493,499,1,7,13,19,25,43,49,55,61,79,85,91,109,115,133,169,175,181,187,205,211,217,235,241,259,295,301,307,325,331,349,385,391,409,445,31,37,193,199,313,319,397,403,451,457,481,487,499,67,73,97,103,121,127,139,145,151,157,163,223,229,247,253,265,271,277,283,289,337,343,355,361,367,373,379,415,421,427,433,439,463,469,475,493,2,8,14,20,26,32,44,50,56,62,68,80,86,92,98,110,116,122,134,140,152,170,176,182,188,194,206,212,218,224,236,242,248,260,266,278,296,302,308,314,326,332,338,350,356,368,386,392,398,410,416,428,446,452,464,482,38,74,104,128,146,158,164,200,230,254,272,320,404,458,488,500,284,290,344,362,374,380,422,434,440,470,476,494,2,8,14,20,26,44,50,56,62,80,86,92,110,116,134,170,176,182,188,206,212,218,236,242,260,296,302,308,326,332,350,386,392,410,446,32,38,68,74,98,104,122,128,140,146,152,158,194,200,224,230,248,254,266,272,314,320,398,404,452,458,482,488,500,164,278,284,290,338,344,356,362,368,374,380,416,422,428,434,440,464,470,476,494,2,8,14,20,26,44,50,56,62,80,86,92,110,116,134,170,176,182,188,206,212,218,236,242,260,296,302,308,326,332,350,386,392,410,446,32,38,68,74,98,104,122,128,140,146,152,194,200,224,230,248,254,158,164,266,272,278,284,290,314,320,338,344,356,362,368,374,380,398,404,416,422,428,434,440,452,458,464,470,476,482,488,494,500,2,8,14,20,26,32,44,50,56,62,68,80,86,92,98,110,116,122,134,140,152,170,176,182,188,194,206,212,218,224,236,242,248,260,266,278,296,302,308,314,326,332,338,350,356,368,386,392,398,410,416,428,446,452,464,482,38,74,104,128,200,320,404,458,488,500,146,158,164,230,254,272,284,290,344,362,374,380,422,434,440,470,476,494,2,8,14,20,26,44,50,56,62,80,86,92,110,116,134,170,176,182,188,206,212,218,236,242,260,296,302,308,326,332,350,386,392,410,446,32,38,68,74,98,104,122,128,194,200,314,320,398,404,452,458,482,488,500,140,146,152,158,164,224,230,248,254,266,272,278,284,290,338,344,356,362,368,374,380,416,422,428,434,440,464,470,476,494,2,8,14,20,26,44,50,56,62,80,86,92,110,116,134,170,176,182,188,206,212,218,236,242,260,296,302,308,326,332,350,386,392,410,446,32,38,68,74,98,104,122,128,140,146,152,158,164,194,200,224,230,248,254,266,272,278,284,290,314,320,338,344,356,362,368,374,380,398,404,416,422,428,434,440,452,458,464,470,476,482,488,494,500,2,8,14,20,26,44,50,56,62,80,86,92,110,116,134,170,176,182,188,206,212,218,236,242,260,296,302,308,326,332,350,386,392,410,446,32,38,194,200,314,320,398,404,452,458,482,488,500,68,74,98,104,122,128,140,146,152,158,164,224,230,248,254,266,272,278,284,290,338,344,356,362,368,374,380,416,422,428,434,440,464,470,476,494,3,9,15,21,27,33,45,51,57,63,69,81,87,93,99,111,117,123,135,141,153,171,177,183,189,195,207,213,219,225,237,243,249,261,267,279,297,303,309,315,327,333,339,351,357,369,387,393,399,411,417,429,447,453,465,483,39,75,105,129,147,159,165,201,231,255,273,321,405,459,489,501,285,291,345,363,375,381,423,435,441,471,477,495,3,9,15,21,27,45,51,57,63,81,87,93,111,117,135,171,177,183,189,207,213,219,237,243,261,297,303,309,327,333,351,387,393,411,447,33,39,69,75,99,105,123,129,141,147,153,159,195,201,225,231,249,255,267,273,315,321,399,405,453,459,483,489,501,165,279,285,291,339,345,357,363,369,375,381,417,423,429,435,441,465,471,477,495,3,9,15,21,27,45,51,57,63,81,87,93,111,117,135,171,177,183,189,207,213,219,237,243,261,297,303,309,327,333,351,387,393,411,447,33,39,69,75,99,105,123,129,141,147,153,195,201,225,231,249,255,159,165,267,273,279,285,291,315,321,339,345,357,363,369,375,381,399,405,417,423,429,435,441,453,459,465,471,477,483,489,495,501,3,9,15,21,27,33,45,51,57,63,69,81,87,93,99,111,117,123,135,141,153,171,177,183,189,195,207,213,219,225,237,243,249,261,267,279,297,303,309,315,327,333,339,351,357,369,387,393,399,411,417,429,447,453,465,483,39,75,105,129,201,321,405,459,489,501,147,159,165,231,255,273,285,291,345,363,375,381,423,435,441,471,477,495,3,9,15,21,27,45,51,57,63,81,87,93,111,117,135,171,177,183,189,207,213,219,237,243,261,297,303,309,327,333,351,387,393,411,447,33,39,69,75,99,105,123,129,195,201,315,321,399,405,453,459,483,489,501,141,147,153,159,165,225,231,249,255,267,273,279,285,291,339,345,357,363,369,375,381,417,423,429,435,441,465,471,477,495,3,9,15,21,27,45,51,57,63,81,87,93,111,117,135,171,177,183,189,207,213,219,237,243,261,297,303,309,327,333,351,387,393,411,447,33,39,69,75,99,105,123,129,141,147,153,159,165,195,201,225,231,249,255,267,273,279,285,291,315,321,339,345,357,363,369,375,381,399,405,417,423,429,435,441,453,459,465,471,477,483,489,495,501,3,9,15,21,27,45,51,57,63,81,87,93,111,117,135,171,177,183,189,207,213,219,237,243,261,297,303,309,327,333,351,387,393,411,447,33,39,195,201,315,321,399,405,453,459,483,489,501,69,75,99,105,123,129,141,147,153,159,165,225,231,249,255,267,273,279,285,291,339,345,357,363,369,375,381,417,423,429,435,441,465,471,477,495,4,10,16,22,28,34,46,52,58,64,70,82,88,94,100,112,118,124,136,142,154,172,178,184,190,196,208,214,220,226,238,244,250,262,268,280,298,304,310,316,328,334,340,352,358,370,388,394,400,412,418,430,448,454,466,484,40,76,106,130,148,160,166,202,232,256,274,322,406,460,490,502,286,292,346,364,376,382,424,436,442,472,478,496,4,10,16,22,28,46,52,58,64,82,88,94,112,118,136,172,178,184,190,208,214,220,238,244,262,298,304,310,328,334,352,388,394,412,448,34,40,70,76,100,106,124,130,142,148,154,160,196,202,226,232,250,256,268,274,316,322,400,406,454,460,484,490,502,166,280,286,292,340,346,358,364,370,376,382,418,424,430,436,442,466,472,478,496,4,10,16,22,28,46,52,58,64,82,88,94,112,118,136,172,178,184,190,208,214,220,238,244,262,298,304,310,328,334,352,388,394,412,448,34,40,70,76,100,106,124,130,142,148,154,196,202,226,232,250,256,160,166,268,274,280,286,292,316,322,340,346,358,364,370,376,382,400,406,418,424,430,436,442,454,460,466,472,478,484,490,496,502,4,10,16,22,28,34,46,52,58,64,70,82,88,94,100,112,118,124,136,142,154,172,178,184,190,196,208,214,220,226,238,244,250,262,268,280,298,304,310,316,328,334,340,352,358,370,388,394,400,412,418,430,448,454,466,484,40,76,106,130,202,322,406,460,490,502,148,160,166,232,256,274,286,292,346,364,376,382,424,436,442,472,478,496,4,10,16,22,28,46,52,58,64,82,88,94,112,118,136,172,178,184,190,208,214,220,238,244,262,298,304,310,328,334,352,388,394,412,448,34,40,70,76,100,106,124,130,196,202,316,322,400,406,454,460,484,490,502,142,148,154,160,166,226,232,250,256,268,274,280,286,292,340,346,358,364,370,376,382,418,424,430,436,442,466,472,478,496,4,10,16,22,28,46,52,58,64,82,88,94,112,118,136,172,178,184,190,208,214,220,238,244,262,298,304,310,328,334,352,388,394,412,448,34,40,70,76,100,106,124,130,142,148,154,160,166,196,202,226,232,250,256,268,274,280,286,292,316,322,340,346,358,364,370,376,382,400,406,418,424,430,436,442,454,460,466,472,478,484,490,496,502,4,10,16,22,28,46,52,58,64,82,88,94,112,118,136,172,178,184,190,208,214,220,238,244,262,298,304,310,328,334,352,388,394,412,448,34,40,196,202,316,322,400,406,454,460,484,490,502,70,76,100,106,124,130,142,148,154,160,166,226,232,250,256,268,274,280,286,292,340,346,358,364,370,376,382,418,424,430,436,442,466,472,478,496,5,11,17,23,29,35,47,53,59,65,71,83,89,95,101,113,119,125,137,143,155,173,179,185,191,197,209,215,221,227,239,245,251,263,269,281,299,305,311,317,329,335,341,353,359,371,389,395,401,413,419,431,449,455,467,485,41,77,107,131,149,161,167,203,233,257,275,323,407,461,491,503,287,293,347,365,377,383,425,437,443,473,479,497,5,11,17,23,29,47,53,59,65,83,89,95,113,119,137,173,179,185,191,209,215,221,239,245,263,299,305,311,329,335,353,389,395,413,449,35,41,71,77,101,107,125,131,143,149,155,161,197,203,227,233,251,257,269,275,317,323,401,407,455,461,485,491,503,167,281,287,293,341,347,359,365,371,377,383,419,425,431,437,443,467,473,479,497,5,11,17,23,29,47,53,59,65,83,89,95,113,119,137,173,179,185,191,209,215,221,239,245,263,299,305,311,329,335,353,389,395,413,449,35,41,71,77,101,107,125,131,143,149,155,197,203,227,233,251,257,161,167,269,275,281,287,293,317,323,341,347,359,365,371,377,383,401,407,419,425,431,437,443,455,461,467,473,479,485,491,497,503,5,11,17,23,29,35,47,53,59,65,71,83,89,95,101,113,119,125,137,143,155,173,179,185,191,197,209,215,221,227,239,245,251,263,269,281,299,305,311,317,329,335,341,353,359,371,389,395,401,413,419,431,449,455,467,485,41,77,107,131,203,323,407,461,491,503,149,161,167,233,257,275,287,293,347,365,377,383,425,437,443,473,479,497,5,11,17,23,29,47,53,59,65,83,89,95,113,119,137,173,179,185,191,209,215,221,239,245,263,299,305,311,329,335,353,389,395,413,449,35,41,71,77,101,107,125,131,197,203,317,323,401,407,455,461,485,491,503,143,149,155,161,167,227,233,251,257,269,275,281,287,293,341,347,359,365,371,377,383,419,425,431,437,443,467,473,479,497,5,11,17,23,29,47,53,59,65,83,89,95,113,119,137,173,179,185,191,209,215,221,239,245,263,299,305,311,329,335,353,389,395,413,449,35,41,71,77,101,107,125,131,143,149,155,161,167,197,203,227,233,251,257,269,275,281,287,293,317,323,341,347,359,365,371,377,383,401,407,419,425,431,437,443,455,461,467,473,479,485,491,497,503,5,11,17,23,29,47,53,59,65,83,89,95,113,119,137,173,179,185,191,209,215,221,239,245,263,299,305,311,329,335,353,389,395,413,449,35,41,197,203,317,323,401,407,455,461,485,491,503,71,77,101,107,125,131,143,149,155,161,167,227,233,251,257,269,275,281,287,293,341,347,359,365,371,377,383,419,425,431,437,443,467,473,479,497]),34,156);

    M0 = sparse([1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,4,4,4,4,4,4,5,5,5,6,6,6,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,9,9,9,9,9,9,10,10,10,11,11,11,12,12,12,12,12,12,13,13,13,13,13,13,14,14,14,15,15,15,16,16,16,16,16,16,17,17,17,18,18,18,19,19,19,20,20,20,21,21,21,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,25,25,25,25,25,25,26,26,26,27,27,27,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,30,30,30,30,30,30,31,31,31,32,32,32,33,33,33,33,33,33,34,34,34,34,34,34,35,35,35,36,36,36,37,37,37,37,37,37,38,38,38,39,39,39,40,40,40,41,41,41,42,42,42,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,45,45,45,45,45,45,46,46,46,47,47,47,48,48,48,48,48,48,49,49,49,49,49,49,50,50,50,51,51,51,52,52,52,52,52,52,53,53,53,54,54,54,55,55,55,56,56,56,57,57,57,58,58,58,58,58,58,59,59,59,59,59,59,60,60,60,61,61,61,62,62,62,62,62,62,63,63,63,64,64,64,65,65,65,66,66,66,67,67,67,68,68,68,68,68,68,69,69,69,70,70,70,71,71,71,72,72,72,73,73,73,74,74,74,75,75,75,76,76,76,77,77,77],[1,5,9,13,22,26,30,46,50,66,2,6,10,23,27,31,35,47,51,67,1,5,9,22,26,46,2,6,10,23,27,47,1,5,22,2,6,23,4,8,12,36,45,49,53,65,69,77,3,7,11,44,48,64,4,8,12,45,49,65,3,7,44,4,8,45,5,9,13,46,50,66,6,10,35,47,51,67,5,9,46,6,10,47,8,12,36,49,53,69,7,11,48,8,12,49,9,13,50,10,35,51,12,36,53,14,18,24,28,32,37,41,57,61,73,15,19,25,29,33,38,42,58,62,74,14,18,24,28,37,57,15,19,25,29,38,58,14,18,24,15,19,25,17,21,40,43,56,60,63,72,75,79,16,20,39,55,59,71,17,21,40,56,60,72,16,20,55,17,21,56,18,37,41,57,61,73,19,38,42,58,62,74,18,37,57,19,38,58,21,40,43,60,63,75,20,39,59,21,40,60,37,41,61,38,42,62,40,43,63,23,27,31,34,47,51,54,67,70,78,22,26,30,46,50,66,23,27,31,47,51,67,22,26,46,23,27,47,44,48,52,64,68,76,45,49,53,65,69,77,44,48,64,45,49,65,47,51,54,67,70,78,46,50,66,47,51,67,48,52,68,49,53,69,51,54,70,24,28,32,57,61,73,25,29,33,58,62,74,24,28,57,25,29,58,56,60,63,72,75,79,55,59,71,56,60,72,57,61,73,58,62,74,60,63,75,27,31,34,67,70,78,26,30,66,27,31,67,64,68,76,65,69,77,67,70,78,28,32,73,29,33,74,72,75,79,31,34,78],[1,3,3,1,3*ss,3*ss^2,ss^3,6*ss,3*ss,3*ss^2,1,3,3,3*ss,3*ss^2,ss^3,1,6*ss,3*ss,3*ss^2,-1,-2,-1,-2*ss,-ss^2,-2*ss,-1,-2,-1,-2*ss,-ss^2,-2*ss,1,1,ss,1,1,ss,1,3,3,1,3*ss,6*ss,3*ss,3*ss^2,3*ss^2,ss^3,-1,-2,-1,-2*ss,-2*ss,-ss^2,-1,-2,-1,-2*ss,-2*ss,-ss^2,1,1,ss,1,1,ss,-1,-2,-1,-2*ss,-2*ss,-ss^2,-1,-2,-1,-2*ss,-2*ss,-ss^2,1,1,ss,1,1,ss,-1,-2,-1,-2*ss,-2*ss,-ss^2,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,3,3*ss,3*ss^2,ss^3,3,1,6*ss,3*ss,3*ss^2,1,3,3*ss,3*ss^2,ss^3,3,1,6*ss,3*ss,3*ss^2,-1,-2,-2*ss,-ss^2,-1,-2*ss,-1,-2,-2*ss,-ss^2,-1,-2*ss,1,1,ss,1,1,ss,1,3,3,1,3*ss,6*ss,3*ss,3*ss^2,3*ss^2,ss^3,-1,-2,-1,-2*ss,-2*ss,-ss^2,-1,-2,-1,-2*ss,-2*ss,-ss^2,1,1,ss,1,1,ss,-1,-2,-1,-2*ss,-2*ss,-ss^2,-1,-2,-1,-2*ss,-2*ss,-ss^2,1,1,ss,1,1,ss,-1,-2,-1,-2*ss,-2*ss,-ss^2,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,3*ss,3*ss^2,ss^3,3,3,1,6*ss,3*ss,3*ss^2,-1,-2*ss,-ss^2,-2,-1,-2*ss,-1,-2*ss,-ss^2,-2,-1,-2*ss,1,ss,1,1,ss,1,-1,-2,-1,-2*ss,-2*ss,-ss^2,-1,-2,-1,-2*ss,-2*ss,-ss^2,1,1,ss,1,1,ss,-1,-2,-1,-2*ss,-2*ss,-ss^2,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,1,ss,-1,-2*ss,-ss^2,-2,-1,-2*ss,-1,-2*ss,-ss^2,-2,-1,-2*ss,1,ss,1,1,ss,1,-1,-2,-1,-2*ss,-2*ss,-ss^2,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,1,ss,-1,-2*ss,-ss^2,-2,-1,-2*ss,1,ss,1,1,ss,1,1,1,ss,1,1,ss,1,1,ss,1,ss,1,1,ss,1,1,1,ss,1,ss,1],77,79);
    M = M(:,78:end)-M(:,1:77)*M0; % Schur complement reduction

    [L,~,P] = lu(M(:,1:23));
    P = P';
    M = [P*L P(:,24:end)]\M(:,24:end);
    M = M(end-10:end,:);

    T0 = zeros(45);
    T0([10,11,21,22,30,31,37,38,42,43,45],:) = -M(:,12:end);
    T0([226,317,588,634,680,726,772,818,864,912,958,1004,1050,1096,1142,1188,1234,1280,1328,1374,1420,1466,1512,1558,1604,1652,1698,1744,1790,1836,1884,1930,1976,2024]) = 1;
    T1 = zeros(45);
    T1([10,11,21,22,30,31,37,38,42,43,45],[10,11,21,22,30,31,37,38,42,43,45]) = M(:,1:11);
    T1([1,47,93,139,185,231,277,323,369,507,553,599,645,691,737,783,829,875,1013,1059,1105,1151,1197,1243,1289,1427,1473,1519,1565,1611,1749,1795,1841,1979]) = 1;

    [V,~] = eig(T0,T1);
    S = V(42:44,:)./repmat(V(45,:),3,1);

    I = ~any(isnan(S)) & ~any(isinf(S));
    %I = I & ~any(imag(S)); % uncomment this line for real roots only
    S = S(:,I);

end