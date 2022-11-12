% Input: coefficient matrix C of size 3x10
% Output: solution matrix S of size 3x8

function S = red_17x25_colpiv_toy(C)

    ix = [1,1,1,2,2,2,2,3,4,4,5,5,5,5,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,10,10,10,11,11,11,12,12,12,12,13,13,13,14,14,14,14,15,15,16,16,16,17,17,17];
    jx = [1,6,9,3,4,17,23,7,5,8,19,20,23,25,2,10,15,11,14,22,24,13,15,18,22,12,14,21,25,1,7,22,5,13,19,16,18,20,24,2,9,21,10,11,12,17,3,14,4,6,13,5,12,16];
    kx = [25,13,28,19,13,28,25,25,13,28,13,28,19,25,28,13,19,25,28,13,19,28,25,13,19,28,25,13,19,11,23,17,11,29,17,17,11,29,23,29,11,17,11,23,29,17,6,30,6,3,30,3,30,6];
    M = sparse(ix,jx,C(kx),17,25);

    [L,~,P] = lu(M(:,1:9));
    P = P';
    M = [P*L P(:,10:end)]\M(:,10:end);
    M = full(M(10:end,:));

    [L,U,P] = lu(M(:,1:6));
    P = P';
    M = [P*L P(:,7:end)]\M(:,7:end);
    M1 = M(1:6,:);
    M2 = M(7:end,:);

    [Q,R,P] = qr(M2(:,1:end-4));
    A = U\[M1(:,1:end-4)*P M1(:,end-3:end)];
    B = R(:,1:2)\[R(:,3:end) Q'*M2(:,end-3:end)];
    M = [-A(:,end-7:end)+A(:,1:end-8)*B; -B];

    P1 = [11:16 (1:6)*P 7:10];
    P2 = [2,5,11,6,13,14,16,10,12,15];
    T = getT(M,P1(1:end-8),P1(end-7:end),P2);

    [V,~] = eig(T);
    S = V(5:7,:)./repmat(V(8,:),3,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end