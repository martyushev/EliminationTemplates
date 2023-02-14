% Input: coefficient matrix C of size 3x24
% Output: solution matrix S of size 3x58

function S = red_69x127_colpiv_3v_triang_laurent(C)

    ix = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,42,42,43,43,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,63,63,63,63,64,64,64,64,64,64,64,64,64,64,64,64,65,65,65,65,65,65,65,65,65,65,65,65,66,66,66,66,66,66,66,66,66,66,66,66,67,67,67,67,67,67,67,67,67,67,67,67,68,68,68,68,68,68,68,68,68,68,68,69,69,69,69,69,69,69,69,69];
    jx = [31,32,49,55,56,63,73,80,81,83,90,95,96,101,102,104,123,15,17,23,35,36,55,80,95,101,102,104,109,114,115,120,121,123,40,46,47,57,66,70,71,73,84,87,88,90,95,96,114,124,125,26,27,31,42,48,49,58,67,72,73,75,89,90,94,95,97,116,45,51,52,59,69,76,77,79,86,93,94,98,99,100,101,119,124,46,52,53,60,70,77,78,80,87,95,99,101,102,120,124,125,126,47,53,54,61,71,78,79,81,88,94,96,100,102,103,121,125,126,48,54,55,62,72,79,80,82,89,94,95,97,100,101,103,104,122,4,10,11,28,45,69,86,93,94,105,106,108,111,112,113,114,124,5,7,22,33,47,71,88,94,96,107,108,110,113,115,116,125,127,5,15,16,29,34,35,48,72,89,94,95,97,108,109,113,114,116,4,9,18,52,77,99,101,106,112,114,117,118,120,121,124,126,127,7,9,14,53,78,100,102,107,113,115,118,119,121,122,125,126,127,5,14,17,54,79,94,100,101,103,108,113,114,116,119,120,122,123,1,3,9,25,38,44,45,47,50,51,53,54,118,119,121,126,127,2,3,14,21,39,45,46,48,51,52,54,55,100,113,119,120,122,1,5,6,7,8,10,11,12,13,20,22,38,44,45,47,127,3,4,5,10,11,14,17,18,19,45,51,52,54,119,37,43,44,57,66,68,70,71,84,85,87,88,92,93,94,112,125,44,50,51,61,71,76,78,79,88,93,94,98,99,100,101,118,125,10,12,20,33,44,71,88,93,94,105,107,108,111,112,113,114,125,10,18,19,51,79,94,99,100,101,108,112,113,114,117,118,120,121,26,39,45,46,58,67,70,72,73,87,89,90,95,96,113,124,125,45,51,52,62,72,77,79,80,89,94,95,99,101,102,119,124,126,46,52,53,63,73,78,80,81,90,95,96,100,102,103,120,125,126,47,53,54,64,74,79,81,82,91,94,96,97,100,101,103,104,121,27,31,32,48,54,55,65,75,80,82,83,95,97,101,102,104,122,4,10,11,29,45,72,89,94,95,106,108,109,112,114,115,124,127,5,7,22,30,34,35,47,74,91,94,96,97,108,110,113,114,116,4,9,18,52,80,95,101,102,109,114,115,118,119,121,122,126,127,7,9,14,53,81,96,100,102,103,110,113,115,116,119,120,122,123,5,14,17,34,35,36,54,82,97,101,103,104,114,116,120,121,123,1,3,9,25,41,45,47,48,51,52,54,55,102,115,119,121,122,2,3,14,21,42,46,48,49,52,53,55,56,103,116,120,122,123,1,4,5,6,8,10,11,15,16,22,24,41,45,47,48,115,3,4,5,9,15,16,17,18,23,48,52,54,55,122,37,43,44,68,70,85,87,92,93,112,124,125,44,50,51,76,78,93,98,99,100,118,125,126,31,32,49,55,56,81,83,96,102,103,104,123,57,58,66,67,70,71,72,73,94,108,113,114,59,61,69,71,76,77,78,79,118,119,126,127,60,62,70,72,77,78,79,80,100,113,119,120,61,63,71,73,78,79,80,81,101,114,120,121,62,64,72,74,79,80,81,82,102,115,121,122,63,65,73,75,80,81,82,83,103,116,122,123,11,13,20,28,33,38,86,88,105,106,107,108,16,22,24,29,30,34,41,89,91,108,109,110,10,12,20,44,93,105,107,111,112,113,125,127,10,18,19,51,99,100,112,113,117,118,119,120,15,17,23,35,36,55,102,104,115,121,122,123,38,44,45,69,71,86,88,93,94,124,125,127,39,45,46,70,72,87,89,94,95,113,124,125,40,46,47,71,73,88,90,94,95,96,114,125,41,47,48,72,74,89,91,94,95,96,97,115,27,31,42,48,49,73,75,90,95,96,97,116,45,51,52,77,79,94,99,100,101,119,124,126,46,52,53,78,80,95,100,101,102,120,125,126,47,53,54,79,81,94,96,100,101,102,103,121,48,54,55,80,82,95,97,101,102,103,104,122,4,10,11,45,94,106,108,112,113,114,124,127,5,7,22,47,94,96,108,110,113,114,115,116,5,15,16,34,35,48,95,97,109,114,115,116,4,9,18,52,101,114,118,119,120,121,126,127,7,9,14,53,100,102,113,115,119,120,121,122,5,14,17,54,101,103,114,116,120,121,122,123,1,3,9,25,45,47,51,52,53,54,119,121,2,3,14,21,46,48,52,53,54,55,120,122,1,4,5,6,7,8,10,11,22,45,47,3,4,5,9,14,17,18,52,54];
    kx = [34,16,7,4,1,70,64,58,55,52,46,40,37,28,25,19,10,7,4,1,34,16,10,70,64,58,55,52,46,40,37,28,25,19,7,4,1,70,64,58,55,52,46,40,37,34,19,16,10,28,25,46,34,16,7,4,1,70,64,58,55,52,40,37,28,25,19,10,7,4,1,70,64,58,55,52,46,40,34,28,25,19,16,10,37,7,4,1,70,64,58,55,52,46,34,28,19,16,10,40,37,25,7,4,1,70,64,58,55,52,46,37,34,25,19,16,10,40,28,7,4,1,70,64,58,55,52,46,40,37,34,28,25,19,16,10,1,4,7,46,10,70,64,58,52,40,37,34,28,25,19,16,55,1,4,7,46,10,70,64,55,52,40,37,34,25,19,16,58,28,4,1,7,46,34,16,10,70,64,58,55,52,40,37,28,25,19,7,1,4,10,70,58,52,46,40,34,28,25,19,16,64,55,37,7,4,1,10,70,55,52,46,37,34,28,25,19,16,64,58,40,7,4,1,10,70,64,58,55,52,46,40,37,34,28,25,19,16,7,1,10,4,46,40,37,34,28,25,19,16,58,55,52,70,64,7,4,10,1,46,40,37,34,28,25,19,16,70,64,58,55,52,10,16,4,19,7,25,37,28,46,40,34,64,58,55,52,70,10,37,34,40,46,19,16,25,28,64,58,55,52,70,8,5,2,68,62,56,53,50,44,38,35,32,26,23,14,11,17,8,5,2,68,62,56,53,50,44,38,32,26,23,17,14,11,35,2,5,8,44,11,68,62,56,50,38,35,32,26,23,17,14,53,8,2,5,11,68,62,56,53,50,44,38,35,32,26,23,17,14,44,8,5,2,68,62,56,53,50,38,35,32,17,14,11,26,23,8,5,2,68,62,56,53,50,44,35,32,26,17,14,11,38,23,8,5,2,68,62,56,53,50,44,35,32,23,17,14,11,38,26,8,5,2,68,62,56,53,50,44,38,35,32,26,23,17,14,11,44,32,14,8,5,2,68,62,56,53,50,38,35,26,23,17,11,2,5,8,44,11,68,62,53,50,38,35,32,26,17,14,56,23,2,5,8,44,32,14,11,68,62,56,53,50,38,35,26,23,17,8,2,5,11,68,62,53,50,44,35,32,26,23,17,14,56,38,8,5,2,11,68,62,56,53,50,44,38,35,32,26,23,17,14,8,5,2,44,32,14,11,68,62,56,53,50,38,35,26,23,17,8,2,11,5,44,38,35,32,26,23,17,14,68,62,56,53,50,8,5,11,2,44,38,35,32,26,23,17,14,68,62,56,53,50,11,23,17,5,8,26,38,14,32,35,44,62,56,53,50,68,11,38,35,23,32,44,17,26,14,62,56,53,50,68,9,6,3,57,54,39,36,27,24,12,21,18,9,6,3,57,54,39,27,24,18,12,36,21,36,18,9,6,3,57,54,39,27,24,21,12,57,54,39,36,27,24,21,18,12,9,6,3,57,54,39,36,27,24,21,18,6,3,12,9,57,54,39,36,27,24,21,18,12,9,6,3,57,54,39,36,27,24,21,18,12,9,6,3,57,54,39,36,27,24,21,18,12,9,6,3,57,54,39,36,27,24,21,18,12,9,6,3,3,9,6,39,36,12,57,54,27,24,21,18,3,6,9,39,36,18,12,57,54,27,24,21,3,6,9,12,57,39,36,27,24,18,54,21,9,3,6,12,57,54,39,36,27,24,21,18,9,6,3,36,18,12,57,54,39,27,24,21,9,6,3,57,54,39,36,27,18,24,21,12,9,6,3,57,54,39,36,21,18,12,27,24,9,6,3,57,54,39,36,24,21,18,12,27,9,6,3,57,54,39,36,27,24,21,18,12,36,18,9,6,3,57,54,39,27,24,21,12,9,6,3,57,54,36,27,21,18,12,39,24,9,6,3,57,54,36,24,21,18,12,39,27,9,6,3,57,54,39,36,27,24,21,18,12,9,6,3,57,54,39,36,27,24,21,18,12,3,6,9,12,54,39,36,27,21,18,57,24,3,6,9,12,57,54,39,36,27,24,21,18,6,3,9,36,18,12,57,54,39,27,24,21,9,3,6,12,54,36,27,24,21,18,57,39,9,6,3,12,57,54,39,36,27,24,21,18,9,6,3,12,57,54,39,36,27,24,21,18,9,3,12,6,39,36,27,24,21,18,57,54,9,6,12,3,39,36,27,24,21,18,57,54,12,24,18,6,21,9,27,39,36,57,54,12,39,36,24,21,18,27,57,54];
    M = sparse(ix,jx,C(kx),69,127);

    [L,~,P] = lu(M(:,1:30));
    P = P';
    M = [P*L P(:,31:end)]\M(:,31:end);
    M = full(M(31:end,:));

    [L,U,P] = lu(M(:,1:26));
    P = P';
    M = [P*L P(:,27:end)]\M(:,27:end);
    M1 = M(1:26,:);
    M2 = M(27:end,:);

    [Q,R,P] = qr(M2(:,1:end-4));
    A = U\[M1(:,1:end-4)*P M1(:,end-3:end)];
    B = R(:,1:13)\[R(:,14:end) Q'*M2(:,end-3:end)];
    M = [-A(:,end-57:end)+A(:,1:end-58)*B; -B];

    P1 = [72:97 (1:67)*P 68:71];
    P2 = [15,17,21,22,23,24,25,26,27,32,34,37,68,69,38,39,40,41,72,43,70,44,45,46,47,48,73,74,49,50,51,52,53,54,75,55,56,58,59,60,76,61,62,64,65,66,67,77,78,79,80,81,82,83,84,85,87,88,89,90,91,92,93,94,95,96,97,71,57,63,86];
    T = getT(M,P1(1:end-58),P1(end-57:end),P2);

    [V,~] = eig(T);
    S = repmat(V(58,:),3,1)./V(55:57,:);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end