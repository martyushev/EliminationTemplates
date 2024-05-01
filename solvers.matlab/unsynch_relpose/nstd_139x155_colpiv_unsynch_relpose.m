% Input: coefficient matrix C of size 4x80

function S = nstd_139x155_colpiv_unsynch_relpose(C)

    i_dx = [1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,42,42,43,43,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,63,63,63,64,64,64,64,64,64,64,64,64,64,64,64,65,65,65,65,65,65,65,65,65,65,65,65,66,66,66,66,66,66,66,66,66,66,66,66,67,67,67,67,67,67,67,67,67,67,67,67,68,68,68,68,68,68,68,68,68,68,68,68,69,69,69,69,69,69,69,69,69,69,69,69,70,70,70,70,70,70,70,70,70,70,70,70,71,71,71,71,71,71,71,71,71,71,71,71,72,72,72,72,72,72,72,72,72,72,72,72,73,73,73,73,73,73,73,73,73,73,73,73,74,74,74,74,74,74,74,74,74,74,74,74,75,75,75,75,75,75,75,75,75,75,75,75,76,76,76,76,76,76,76,76,76,76,76,76,77,77,77,77,77,77,77,77,77,77,77,77,78,78,78,78,78,78,78,78,78,78,78,78,79,79,79,79,79,79,79,79,79,79,79,79,80,80,80,80,80,80,80,80,80,80,80,80,81,81,81,81,81,81,81,81,81,81,81,81,82,82,82,82,82,82,82,82,82,82,82,82,83,83,83,83,83,83,83,83,83,83,83,83,84,84,84,84,84,84,84,84,84,84,84,84,85,85,85,85,85,85,85,85,85,85,85,85,86,86,86,86,86,86,86,86,86,86,86,86,87,87,87,87,87,87,87,87,87,87,87,87,88,88,88,88,88,88,88,88,88,88,88,88,89,89,89,89,89,89,89,89,89,89,89,89,90,90,90,90,90,90,90,90,90,90,90,90,91,91,91,91,91,91,91,91,91,91,91,91,92,92,92,92,92,92,92,92,92,92,92,92,93,93,93,93,93,93,93,93,93,93,93,93,94,94,94,94,94,94,94,94,94,94,94,94,95,95,95,95,95,95,95,95,95,95,95,95,96,96,96,96,96,96,96,96,96,97,97,97,97,97,97,97,97,97,97,97,97,98,98,98,98,98,98,98,98,98,98,98,98,99,99,99,99,99,99,99,99,99,99,99,99,100,100,100,100,100,100,100,100,100,100,100,100,101,101,101,101,101,101,101,101,101,101,101,101,102,102,102,102,102,102,102,102,102,102,102,102,103,103,103,103,103,103,103,103,103,103,103,103,104,104,104,104,104,104,104,104,104,104,104,104,105,105,105,105,105,105,105,105,105,105,105,105,106,106,106,106,106,106,106,106,106,106,106,106,107,107,107,107,107,107,107,107,107,107,107,108,108,108,108,108,108,108,108,108,108,108,108,109,109,109,109,109,109,109,109,109,109,109,109,110,110,110,110,110,110,110,110,110,110,110,110,111,111,111,111,111,111,111,111,111,111,111,111,112,112,112,112,112,112,112,112,112,112,112,112,113,113,113,113,113,113,113,113,113,113,113,113,114,114,114,114,114,114,114,114,114,114,114,114,115,115,115,115,115,115,115,115,115,115,115,115,116,116,116,116,116,116,116,116,116,116,116,116,117,117,117,117,117,117,117,117,117,117,117,117,118,118,118,118,118,118,118,118,118,118,118,118,119,119,119,119,119,119,119,119,119,119,119,119,120,120,120,120,120,120,120,120,120,120,120,120,121,121,121,121,121,121,121,121,121,121,121,121,122,122,122,122,122,122,122,122,122,122,122,122,123,123,123,123,123,123,123,123,123,123,123,123,124,124,124,124,124,124,124,124,124,124,124,124,125,125,125,125,125,125,125,125,125,125,125,125,126,126,126,126,126,126,126,126,126,126,126,126,127,127,127,127,127,127,127,127,127,127,127,127,128,128,128,128,128,128,128,128,128,128,128,128,129,129,129,129,129,129,129,129,129,129,129,129,130,130,130,130,130,130,130,130,130,130,130,130,131,131,131,131,131,131,131,131,131,131,131,131,132,132,132,132,132,132,132,132,132,132,132,132,133,133,133,133,133,133,133,133,133,133,133,133,134,134,134,134,134,134,134,134,134,134,134,134,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139];
    j_dx = [112,113,114,115,148,149,150,151,152,153,154,155,107,108,110,113,137,138,140,143,144,146,149,152,93,94,95,112,113,114,115,148,149,150,154,109,110,111,114,139,140,141,145,146,147,150,153,106,107,109,112,136,137,139,142,143,145,148,151,84,85,87,93,106,107,109,112,136,137,139,148,85,86,88,94,107,108,110,113,137,138,140,149,87,88,89,95,109,110,111,114,139,140,141,150,75,76,78,84,85,87,90,93,106,107,109,112,76,77,79,85,86,88,91,94,107,108,110,113,78,79,80,87,88,89,92,95,109,110,111,114,97,98,101,107,117,118,121,127,128,131,137,143,100,101,103,109,120,121,123,130,131,133,139,145,101,102,104,110,121,122,124,131,132,134,140,146,27,28,31,46,47,50,56,65,66,69,75,84,56,57,59,75,76,78,81,84,85,87,90,93,29,30,33,48,49,52,58,67,68,71,77,86,57,58,60,76,77,79,82,85,86,88,91,94,34,35,36,53,54,55,61,72,73,74,80,89,59,60,61,78,79,80,83,87,88,89,92,95,46,47,50,65,66,69,75,84,96,97,100,106,65,66,69,84,96,97,100,106,116,117,120,136,48,49,52,67,68,71,77,86,98,99,102,108,67,68,71,86,98,99,102,108,118,119,122,138,53,54,55,72,73,74,80,89,103,104,105,111,72,73,74,89,103,104,105,111,123,124,125,141,90,91,92,93,94,95,112,113,114,115,96,97,100,106,116,117,120,126,127,130,136,142,98,99,102,108,118,119,122,128,129,132,138,144,103,104,105,111,123,124,125,133,134,135,141,147,81,82,83,90,91,92,93,94,95,28,29,32,47,48,51,57,66,67,70,76,85,31,32,34,50,51,53,59,69,70,72,78,87,32,33,35,51,52,54,60,70,71,73,79,88,47,48,51,66,67,70,76,85,97,98,101,107,66,67,70,85,97,98,101,107,117,118,121,137,50,51,53,69,70,72,78,87,100,101,103,109,69,70,72,87,100,101,103,109,120,121,123,139,51,52,54,70,71,73,79,88,101,102,104,110,70,71,73,88,101,102,104,110,121,122,124,140,12,13,16,28,29,32,38,47,48,51,57,76,15,16,18,31,32,34,40,50,51,53,59,78,16,17,19,32,33,35,41,51,52,54,60,79,62,63,64,81,82,83,90,91,92,11,12,15,27,28,31,37,46,47,50,56,75,13,14,17,29,30,33,39,48,49,52,58,77,18,19,20,34,35,36,42,53,54,55,61,80,37,38,40,56,57,59,62,75,76,78,81,90,38,39,41,57,58,60,63,76,77,79,82,91,40,41,42,59,60,61,64,78,79,80,83,92,22,23,25,38,39,41,44,57,58,60,63,82,3,4,7,13,14,17,23,29,30,33,39,58,2,3,6,12,13,16,22,28,29,32,38,57,21,22,24,37,38,40,43,56,57,59,62,81,24,25,26,40,41,42,45,59,60,61,64,83,1,2,5,11,12,15,21,27,28,31,37,56,8,9,10,18,19,20,26,34,35,36,42,61,43,44,45,62,63,64,81,82,83,6,7,9,16,17,19,25,32,33,35,41,60,5,6,8,15,16,18,24,31,32,34,40,59,112,113,114,115,148,149,150,151,152,153,154,155,107,108,110,113,137,138,140,143,144,146,149,152,93,94,95,112,113,114,115,148,149,150,154,109,110,111,114,139,140,141,145,146,147,150,153,106,107,109,112,136,137,139,142,143,145,148,151,84,85,87,93,106,107,109,112,136,137,139,148,85,86,88,94,107,108,110,113,137,138,140,149,87,88,89,95,109,110,111,114,139,140,141,150,75,76,78,84,85,87,90,93,106,107,109,112,76,77,79,85,86,88,91,94,107,108,110,113,78,79,80,87,88,89,92,95,109,110,111,114,97,98,101,107,117,118,121,127,128,131,137,143,100,101,103,109,120,121,123,130,131,133,139,145,101,102,104,110,121,122,124,131,132,134,140,146,27,28,31,46,47,50,56,65,66,69,75,84,56,57,59,75,76,78,81,84,85,87,90,93,29,30,33,48,49,52,58,67,68,71,77,86,57,58,60,76,77,79,82,85,86,88,91,94,34,35,36,53,54,55,61,72,73,74,80,89,59,60,61,78,79,80,83,87,88,89,92,95,46,47,50,65,66,69,75,84,96,97,100,106,65,66,69,84,96,97,100,106,116,117,120,136,48,49,52,67,68,71,77,86,98,99,102,108,67,68,71,86,98,99,102,108,118,119,122,138,53,54,55,72,73,74,80,89,103,104,105,111,72,73,74,89,103,104,105,111,123,124,125,141,96,97,100,106,116,117,120,126,127,130,136,142,98,99,102,108,118,119,122,128,129,132,138,144,103,104,105,111,123,124,125,133,134,135,141,147,28,29,32,47,48,51,57,66,67,70,76,85,31,32,34,50,51,53,59,69,70,72,78,87,32,33,35,51,52,54,60,70,71,73,79,88,12,13,16,28,29,32,38,47,48,51,57,76,15,16,18,31,32,34,40,50,51,53,59,78,16,17,19,32,33,35,41,51,52,54,60,79,62,63,64,81,82,83,90,91,92,11,12,15,27,28,31,37,46,47,50,56,75,13,14,17,29,30,33,39,48,49,52,58,77,22,23,25,38,39,41,44,57,58,60,63,82,3,4,7,13,14,17,23,29,30,33,39,58,2,3,6,12,13,16,22,28,29,32,38,57,21,22,24,37,38,40,43,56,57,59,62,81,24,25,26,40,41,42,45,59,60,61,64,83,1,2,5,11,12,15,21,27,28,31,37,56,112,113,114,115,148,149,150,151,152,153,154,155,107,108,110,113,137,138,140,143,144,146,149,152,93,94,95,112,113,114,115,148,149,150,154,109,110,111,114,139,140,141,145,146,147,150,153,106,107,109,112,136,137,139,142,143,145,148,151,84,85,87,93,106,107,109,112,136,137,139,148,85,86,88,94,107,108,110,113,137,138,140,149,87,88,89,95,109,110,111,114,139,140,141,150,75,76,78,84,85,87,90,93,106,107,109,112,76,77,79,85,86,88,91,94,107,108,110,113,97,98,101,107,117,118,121,127,128,131,137,143,100,101,103,109,120,121,123,130,131,133,139,145,101,102,104,110,121,122,124,131,132,134,140,146,27,28,31,46,47,50,56,65,66,69,75,84,56,57,59,75,76,78,81,84,85,87,90,93,29,30,33,48,49,52,58,67,68,71,77,86,57,58,60,76,77,79,82,85,86,88,91,94,34,35,36,53,54,55,61,72,73,74,80,89,46,47,50,65,66,69,75,84,96,97,100,106,65,66,69,84,96,97,100,106,116,117,120,136,48,49,52,67,68,71,77,86,98,99,102,108,67,68,71,86,98,99,102,108,118,119,122,138,53,54,55,72,73,74,80,89,103,104,105,111,72,73,74,89,103,104,105,111,123,124,125,141,12,13,16,28,29,32,38,47,48,51,57,76,15,16,18,31,32,34,40,50,51,53,59,78,16,17,19,32,33,35,41,51,52,54,60,79,22,23,25,38,39,41,44,57,58,60,63,82,3,4,7,13,14,17,23,29,30,33,39,58,21,22,24,37,38,40,43,56,57,59,62,81,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,75,76,77,78,79,80,81,82,83,90,91,92,11,12,13,14,15,16,17,18,19,20,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,27,28,29,30,31,32,33,34,35,36,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,46,47,48,49,50,51,52,53,54,55,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,136,137,138,139,140,141,148,149,150,154,65,66,67,68,69,70,71,72,73,74,84,85,86,87,88,89,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155];
    C_dx = [245,249,253,297,285,289,293,301,305,309,313,317,245,249,253,297,285,289,293,301,305,309,313,317,245,249,253,285,289,293,313,301,305,309,317,245,249,253,297,285,289,293,301,305,309,313,317,245,249,253,297,285,289,293,301,305,309,313,317,245,249,253,297,285,289,293,313,301,305,309,317,245,249,253,297,285,289,293,313,301,305,309,317,245,249,253,297,285,289,293,313,301,305,309,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,297,285,289,293,301,305,309,313,317,245,249,253,297,285,289,293,301,305,309,313,317,245,249,253,297,285,289,293,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,297,285,289,293,313,301,305,309,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,297,285,289,293,313,301,305,309,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,297,285,289,293,313,301,305,309,317,245,249,253,285,289,293,301,305,309,317,245,249,253,297,285,289,293,301,305,309,313,317,245,249,253,297,285,289,293,301,305,309,313,317,245,249,253,297,285,289,293,301,305,309,313,317,245,249,253,285,289,293,301,305,309,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,297,285,289,293,313,301,305,309,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,297,285,289,293,313,301,305,309,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,297,285,289,293,313,301,305,309,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,301,305,309,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,301,305,309,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,309,313,317,246,250,254,298,286,290,294,302,306,310,314,318,246,250,254,298,286,290,294,302,306,310,314,318,246,250,254,286,290,294,314,302,306,310,318,246,250,254,298,286,290,294,302,306,310,314,318,246,250,254,298,286,290,294,302,306,310,314,318,246,250,254,298,286,290,294,314,302,306,310,318,246,250,254,298,286,290,294,314,302,306,310,318,246,250,254,298,286,290,294,314,302,306,310,318,246,250,254,286,290,294,298,314,302,306,310,318,246,250,254,286,290,294,298,314,302,306,310,318,246,250,254,286,290,294,298,314,302,306,310,318,246,250,254,298,286,290,294,302,306,310,314,318,246,250,254,298,286,290,294,302,306,310,314,318,246,250,254,298,286,290,294,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,314,302,306,310,318,246,250,254,298,286,290,294,314,302,306,310,318,246,250,254,286,290,294,298,314,302,306,310,318,246,250,254,298,286,290,294,314,302,306,310,318,246,250,254,286,290,294,298,314,302,306,310,318,246,250,254,298,286,290,294,314,302,306,310,318,246,250,254,298,286,290,294,302,306,310,314,318,246,250,254,298,286,290,294,302,306,310,314,318,246,250,254,298,286,290,294,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,302,306,310,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,310,314,318,247,251,255,299,287,291,295,303,307,311,315,319,247,251,255,299,287,291,295,303,307,311,315,319,247,251,255,287,291,295,315,303,307,311,319,247,251,255,299,287,291,295,303,307,311,315,319,247,251,255,299,287,291,295,303,307,311,315,319,247,251,255,299,287,291,295,315,303,307,311,319,247,251,255,299,287,291,295,315,303,307,311,319,247,251,255,299,287,291,295,315,303,307,311,319,247,251,255,287,291,295,299,315,303,307,311,319,247,251,255,287,291,295,299,315,303,307,311,319,247,251,255,299,287,291,295,303,307,311,315,319,247,251,255,299,287,291,295,303,307,311,315,319,247,251,255,299,287,291,295,303,307,311,315,319,247,251,255,287,291,295,299,303,307,311,315,319,247,251,255,287,291,295,299,303,307,311,315,319,247,251,255,287,291,295,299,303,307,311,315,319,247,251,255,287,291,295,299,303,307,311,315,319,247,251,255,287,291,295,299,303,307,311,315,319,247,251,255,287,291,295,299,315,303,307,311,319,247,251,255,299,287,291,295,315,303,307,311,319,247,251,255,287,291,295,299,315,303,307,311,319,247,251,255,299,287,291,295,315,303,307,311,319,247,251,255,287,291,295,299,315,303,307,311,319,247,251,255,299,287,291,295,315,303,307,311,319,247,251,255,287,291,295,299,303,307,311,315,319,247,251,255,287,291,295,299,303,307,311,315,319,247,251,255,287,291,295,299,303,307,311,315,319,247,251,255,287,291,295,299,303,307,311,315,319,247,251,255,287,291,295,299,303,307,311,315,319,247,251,255,287,291,295,299,303,307,311,315,319,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100,104,108,112,116,120,124,128,132,136,140,144,148,152,156,160,164,168,172,176,180,184,188,192,196,200,204,208,212,216,220,224,228,232,236,240,244,248,252,256,264,268,272,276,280,284,288,292,296,304,308,312,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100,104,108,112,116,120,124,128,132,136,140,144,148,152,156,160,164,168,172,176,180,184,188,192,196,200,204,208,212,216,220,224,228,232,236,240,244,248,252,256,264,268,272,276,280,284,288,292,296,304,308,312,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100,104,108,112,116,120,124,128,132,136,140,144,148,152,156,160,164,168,172,176,180,224,228,232,236,240,244,248,252,256,288,292,296,184,188,192,196,200,204,208,212,216,220,264,268,272,276,280,284,304,308,312,320,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100,104,148,152,156,160,164,168,172,176,180,248,252,256,108,112,116,120,124,128,132,136,140,144,224,228,232,236,240,244,288,292,296,316,184,188,192,196,200,204,208,212,216,220,264,268,272,276,280,284,304,308,312,320,4,8,12,16,20,24,28,32,36,40,84,88,92,96,100,104,172,176,180,44,48,52,56,60,64,68,72,76,80,148,152,156,160,164,168,248,252,256,300,108,112,116,120,124,128,132,136,140,144,184,188,192,196,200,204,208,212,216,220,224,228,232,236,240,244,264,268,272,276,280,284,288,292,296,304,308,312,316,320];
    M = sparse(i_dx,j_dx,C(C_dx),139,155);

    [L,~,Pi] = lu(M(:,1:95));
    Pi = Pi';
    M = [Pi*L Pi(:,96:end)]\M(:,96:end);
    M = full(M(96:end,:));

    [L,UR,Pi] = lu(M(:,1:20));
    Pi = Pi';
    M = [Pi*L Pi(:,21:end)]\M(:,21:end);
    MP = M(1:20,:);
    NP = M(21:end,:);

    [Q,U,Pi] = qr(NP(:,1:end-5));
    A = UR\[MP(:,1:end-5)*Pi MP(:,end-4:end)];
    B = U(:,1:24)\[U(:,25:end) Q'*NP(:,end-4:end)];
    M = [-A(:,end-15:end)+A(:,1:end-16)*B; -B];

    xP = [41,42,43,44,45,46,47,48,49,50,1,2,3,4,5,6,7,8,9,10,51,52,53,54,55,56,21,22,23,24,25,26,57,58,59,33,34,35,60,39];
    P1 = [(1:35)*Pi 36:40];
    T = getT(M,[41:60 P1(1:end-16)],P1(end-15:end),xP);

    [V,~] = eig(T);
    S = V(12:15,:)./repmat(V(16,:),4,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end