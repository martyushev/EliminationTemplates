% Input: coefficient matrix C of size 2x16
% Output: solution matrix S of size 2x24

function S = red_6x30_stitching(C)

    M = sparse([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6],[2,3,4,5,7,9,12,14,15,17,18,21,22,24,25,29,3,4,5,6,8,11,14,16,17,20,21,24,25,28,29,30,1,4,5,6,10,13,16,19,20,23,24,26,27,28,29,30,2,3,4,5,7,9,12,14,15,17,18,21,22,24,25,29,3,4,5,6,8,11,14,16,17,20,21,24,25,28,29,30,1,4,5,6,10,13,16,19,20,23,24,26,27,28,29,30],C([23,27,29,31,1,3,5,7,9,11,13,15,17,19,21,25,23,27,29,31,1,3,5,7,9,11,13,15,17,19,21,25,31,23,27,29,1,3,5,7,9,11,13,19,25,15,17,21,24,28,30,32,2,4,6,8,10,12,14,16,18,20,22,26,24,28,30,32,2,4,6,8,10,12,14,16,18,20,22,26,32,24,28,30,2,4,6,8,10,12,14,20,26,16,18,22]),6,30);

    [L,~,P] = lu(M(:,1:1));
    P = P';
    M = [P*L P(:,2:end)]\M(:,2:end);
    M = M(end-4:end,:);

    T0 = zeros(24);
    T0([16,19,23,24,21],:) = -M(:,6:end);
    T0([49,98,123,148,173,198,223,248,273,322,347,372,397,422,447,521,546,500,574]) = 1;
    T1 = zeros(24);
    T1([16,19,23,24,21],[16,19,23,24,21]) = M(:,1:5);
    T1([1,26,51,76,101,126,151,176,201,226,251,276,301,326,351,401,426,476,526]) = 1;

    [V,~] = eig(T0,T1);
    S = V(22:23,:)./repmat(V(24,:),2,1);

    I = ~any(isnan(S)) & ~any(isinf(S));
    %I = I & ~any(imag(S)); % uncomment this line for real roots only
    S = S(:,I);

end