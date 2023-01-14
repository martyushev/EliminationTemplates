% Input: coefficient matrix C of size 3x10

function [x,y] = std_13x21_colpiv_toy(C)

    i_dx = [1,1,1,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,7,7,7,7,8,8,8,9,9,9,9,10,10,10,11,11,11,12,12,12,13,13,13];
    j_dx = [6,16,21,5,14,18,3,5,7,16,3,6,10,14,15,17,18,21,4,12,19,11,13,14,20,1,7,15,7,9,10,17,2,8,16,4,13,21,1,8,19,2,9,20];
    C_dx = [19,13,28,13,19,25,19,25,13,28,13,28,19,25,11,17,23,29,11,17,29,11,17,23,29,11,17,29,11,17,23,29,11,17,29,3,6,30,3,6,30,3,6,30];
    M = sparse(i_dx,j_dx,C(C_dx),13,21);

    [L,~,Pi] = lu(M(:,1:6));
    Pi = Pi';
    M = [Pi*L Pi(:,7:end)]\M(:,7:end);
    M = full(M(7:end,:));

    [L,UR,Pi] = lu(M(:,1:4));
    Pi = Pi';
    M = [Pi*L Pi(:,5:end)]\M(:,5:end);
    MP = M(1:4,:);
    NP = M(5:end,:);

    [Q,U,Pi] = qr(NP(:,1:end-3));
    A = UR\[MP(:,1:end-3)*Pi MP(:,end-2:end)];
    B = U(:,1:3)\[U(:,4:end) Q'*NP(:,end-2:end)];
    M = [-A(:,end-7:end)+A(:,1:end-8)*B; -B];

    xP = [12,13,14,15,1,2,3,4,6,7,10];
    P1 = [(1:8)*Pi 9:11];
    T = getT(M,[12:15 P1(1:end-8)],P1(end-7:end),xP);

    [V,D] = eig(T);
    sol = [V(6,:)./V(8,:); diag(D).'];

    I = find(not(isnan(sol(1,:))) & not(isinf(sol(1,:))));
    %I = I(not(imag(sol(1,:)))); % uncomment this line for real roots only
    x = sol(1,I);
    y = sol(2,I);

end