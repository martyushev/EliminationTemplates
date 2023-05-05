% Input: coefficient matrix C of size 3x10
% Output: solution matrix S of size 3x8

function S = red_20x28_colpiv_toy(C)

    M = sparse([1,1,1,1,2,2,2,2,3,3,3,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,10,10,10,11,11,11,11,12,12,12,12,13,13,13,14,14,14,14,15,15,15,16,16,16,16,17,17,17,18,18,18,19,19,19,19,20,20],[15,17,22,24,14,16,19,22,6,11,12,5,10,12,20,23,27,28,3,7,8,11,2,5,14,15,17,18,25,27,1,6,13,14,2,16,17,10,11,17,23,7,12,16,20,6,9,22,19,21,24,28,2,8,27,13,15,18,26,1,4,25,2,9,23,7,12,18,21,4,26],C([25,28,13,19,25,28,13,19,28,13,19,28,19,13,13,19,25,28,28,13,25,19,28,25,13,19,25,28,13,19,28,25,13,19,25,13,19,23,11,29,17,11,23,29,17,29,11,17,11,17,23,29,29,11,17,11,23,29,17,29,11,17,30,3,6,3,9,30,6,3,6]),20,28);

    [L,~,P] = lu(M(:,1:12));
    P = P';
    M = [P*L P(:,13:end)]\M(:,13:end);
    M = full(M(13:end,:));

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
    P2 = [11,7,8,12,9,13,14,10,15,16];
    T = getT(M,P1(1:end-8),P1(end-7:end),P2);

    [V,~] = eig(T);
    S = V(5:7,:)./repmat(V(8,:),3,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end