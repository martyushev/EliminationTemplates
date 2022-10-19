% Input: coefficient matrix C of size 2x16
% Output: solution matrix S of size 2x20

function S = red_14x34_stitching(C)

    ix = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14];
    jx = [1,3,5,6,7,15,16,18,19,20,21,22,24,25,33,34,2,4,6,8,15,17,18,20,21,23,24,25,29,32,33,34,3,5,7,15,16,18,19,21,22,24,25,26,27,28,30,33,4,6,15,17,18,20,21,24,25,27,28,30,31,32,33,34,5,7,10,11,12,13,16,18,19,21,22,25,26,27,28,33,6,11,12,13,14,15,18,20,21,24,25,27,28,30,33,34,8,9,12,13,14,17,20,23,24,28,29,30,31,32,33,34,1,3,5,6,7,15,16,18,19,20,21,22,24,25,33,34,2,4,6,8,15,17,18,20,21,23,24,25,29,32,33,34,3,5,7,15,16,18,19,21,22,24,25,26,27,28,30,33,4,6,15,17,18,20,21,24,25,27,28,30,31,32,33,34,5,7,10,11,12,13,16,18,19,21,22,25,26,27,28,33,6,11,12,13,14,15,18,20,21,24,25,27,28,30,33,34,8,9,12,13,14,17,20,23,24,28,29,30,31,32,33,34];
    kx = [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,1,3,5,7,9,11,13,15,17,19,21,23,31,25,27,29,1,3,5,7,9,11,13,15,17,19,21,23,27,29,31,25,1,3,5,7,9,11,13,15,17,23,27,29,31,19,21,25,1,3,23,27,29,31,5,7,9,11,13,15,17,21,25,19,1,23,27,29,31,3,5,7,9,11,13,17,21,25,15,19,1,31,23,27,29,3,5,7,9,17,19,21,25,11,13,15,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,2,4,6,8,10,12,14,16,18,20,22,24,32,26,28,30,2,4,6,8,10,12,14,16,18,20,22,24,28,30,32,26,2,4,6,8,10,12,14,16,18,24,28,30,32,20,22,26,2,4,24,28,30,32,6,8,10,12,14,16,18,22,26,20,2,24,28,30,32,4,6,8,10,12,14,18,22,26,16,20,2,32,24,28,30,4,6,8,10,18,20,22,26,12,14,16];
    M = sparse(ix,jx,C(kx),14,34);

    [L,~,P] = lu(M(:,1:9));
    P = P';
    M = [P*L P(:,10:end)]\M(:,10:end);
    M = M(end-4:end,:);

    T = zeros(20);
    T([12,13,14,16,17],:) = -M(:,1:5)\M(:,6:end);
    T([61,82,103,124,145,186,207,228,349,370,251,335,398,279,320]) = 1;

    [V,~] = eig(T);
    S = V(18:19,:)./repmat(V(20,:),2,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end