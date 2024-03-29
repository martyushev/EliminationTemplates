% Input: coefficient matrix C of size 4x16
% Output: solution matrix S of size 4x16

function S = nstd_18x34_colpiv_wpnp_2x2sym(C)

    ix = [1,1,1,1,1,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,6,7,7,7,7,7,8,8,8,8,8,9,9,9,9,9,10,10,10,10,10,11,11,11,11,11,12,12,12,12,12,13,13,13,13,13,14,14,14,14,14,15,15,15,15,15,16,16,16,16,16,17,17,17,17,17,18,18,18,18,18];
    jx = [15,17,30,32,34,16,18,27,29,33,6,13,20,33,34,7,14,22,29,32,16,20,30,33,34,17,22,27,29,32,5,7,13,32,34,6,8,14,29,33,1,2,5,15,32,2,3,6,16,33,3,4,7,17,22,9,11,12,19,26,11,13,14,23,28,1,2,6,16,20,2,3,7,17,32,3,4,8,18,33,10,11,12,21,24,12,13,14,25,31];
    kx = [5,17,49,33,61,5,17,49,61,33,33,61,5,17,49,33,61,17,49,5,14,26,50,38,62,14,38,50,62,26,26,38,62,14,50,26,38,62,50,14,55,59,43,3,31,55,59,43,3,31,55,59,43,3,31,43,55,59,3,31,43,55,59,3,31,56,60,48,12,24,56,60,48,12,24,56,60,48,12,24,48,56,60,12,24,48,56,60,12,24];
    M = sparse(ix,jx,C(kx),18,34);

    [L,~,P] = lu(M(:,1:4));
    P = P';
    M = [P*L P(:,5:end)]\M(:,5:end);
    M = full(M(5:end,:));

    [L,U,P] = lu(M(:,1:10));
    P = P';
    M = [P*L P(:,11:end)]\M(:,11:end);
    M1 = M(1:10,:);
    M2 = M(11:end,:);

    [Q,R,P] = qr(M2(:,1:end-5));
    A = U\[M1(:,1:end-5)*P M1(:,end-4:end)];
    B = R(:,1:4)\[R(:,5:end) Q'*M2(:,end-4:end)];
    M = [-A(:,end-15:end)+A(:,1:end-16)*B; -B];

    P1 = [21:30 (1:15)*P 16:20];
    P2 = [6,18,19,8,10,21,12,24,17,25,14,26,15,28,30,20,27,22,23,29];
    T = getT(M,P1(1:end-16),P1(end-15:end),P2);

    [V,~] = eig(T);
    S = V(12:15,:)./repmat(V(16,:),4,1);
 
    w = S(1,:);
    x = S(2,:);
    z = sqrt(S(4,:)./x);
    y = S(3,:)./x./z;
    S = [w; x; y; z];
    
    I = ~isnan(S(3,:)) & ~isinf(S(3,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end