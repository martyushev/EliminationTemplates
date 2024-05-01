% Input: coefficient matrix C of size 2x16

function S = nstd_7x15_8ptF_radial_1s(C)

    i_dx = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,4,4,4,4,4,4,5,5,5,5,5,5,6,6,6,6,6,7,7,7,7,7,7];
    j_dx = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,1,2,4,5,8,9,4,5,8,9,12,13,2,3,5,6,9,10,5,6,9,10,13,14,3,6,7,10,11,6,7,10,11,14,15];
    C_dx = [1,5,11,3,9,17,25,7,15,23,29,13,21,27,31,18,26,24,30,28,32,18,26,24,30,28,32,18,26,24,30,28,32,18,26,24,30,28,32,18,24,30,28,32,18,26,24,30,28,32];
    M = sparse(i_dx,j_dx,C(C_dx),7,15);

    [L,~,Pi] = lu(M(:,1:3));
    Pi = Pi';
    M = [Pi*L Pi(:,4:end)]\M(:,4:end);
    M = M(end-3:end,:);

    T = zeros(8);
    T(1:4,:) = -M(:,1:4)\M(:,5:end);
    T([5,14,23,32]) = 1;

    [V,~] = eig(T);
    S = V([7,4],:)./repmat(V(8,:),2,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end