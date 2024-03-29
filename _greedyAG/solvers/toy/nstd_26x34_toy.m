% Input: coefficient matrix C of size 3x10
% Output: solution matrix S of size 2x8

function S = nstd_26x34_toy(C)

    M = sparse([1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,10,10,10,10,11,11,11,12,12,12,13,13,13,14,14,14,15,15,15,16,16,16,17,17,17,17,18,18,18,18,19,19,19,19,20,20,20,20,21,21,21,22,22,22,23,23,23,24,24,24,25,25,25,26,26,26],[2,6,13,17,10,13,18,20,16,18,21,22,3,23,27,28,6,7,14,31,11,27,31,32,13,14,25,33,17,26,31,33,18,25,29,34,20,30,33,34,8,10,19,1,3,17,5,6,18,9,11,20,12,13,21,15,17,22,2,4,7,28,10,14,24,32,16,25,26,28,19,29,30,32,8,11,22,1,4,32,5,23,33,9,24,26,12,27,34,15,28,30],C([13,19,25,28,13,19,25,28,13,19,25,28,13,19,25,28,13,19,25,28,13,19,25,28,13,19,25,28,13,28,19,25,13,19,25,28,13,28,19,25,11,17,29,11,17,29,11,17,29,11,17,29,11,17,29,11,17,29,11,17,23,29,11,23,17,29,11,23,29,17,11,23,29,17,3,6,30,3,6,30,3,6,30,3,6,30,3,6,30,3,6,30]),26,34);

    [L,~,Pi] = lu(M(:,1:22));
    Pi = Pi';
    M = [Pi*L Pi(:,23:end)]\M(:,23:end);
    M = M(end-3:end,:);

    T = zeros(8);
    T(1:4,:) = -M(:,1:4)\M(:,5:end);
    T([5,14,39,56]) = 1;

    [V,~] = eig(T);
    S = V(1:2,:)./repmat(V(8,:),2,1);


    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end