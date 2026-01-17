sk = skew(rand(3,1));
Rgt = (eye(3)-sk)/(eye(3)+sk);
Cgt = rand(3,1);
Rtgt = [Rgt -Rgt*Cgt];
[Q1,V1,Q2,V2] = proj_gen6p(Rtgt,Cgt);
    
[C,~,~] = coefs_gen6p({Q1,Q2,V1,V2});

S = red_78x155_gen6p(C);
%S = std_99x163_colpiv_gen6p(C);
S = S(:,~any(imag(S)));

Rt = nan(3,4,size(S,2));
for i = 1:size(S,2)
    Rt(:,:,i) = u2Rt_gen6p(Q1,V1,Q2,V2,S(:,i));
    disp(norm(Rt(:,:,i) - Rtgt));
end



function Rt = u2Rt_gen6p(Q1,V1,Q2,V2,u)

    n = 6;
    R = (eye(3)-skew(u))/(eye(3)+skew(u));
    A = zeros(n,4);
    for k = 1:n
        A(k,1:3) = -skew(R*Q1(:,k))*Q2(:,k);
        A(k,4) = Q2(:,k).'*R*V1(:,k) + V2(:,k).'*R*Q1(:,k);
    end
    [~,~,V] = svd(A);
    Rt = [R V(1:3,4)./V(4,4)];

end



function [Q1,V1,Q2,V2] = proj_gen6p(Rt,C)

    n = 6;
    P = rand(3,n);
    Q1 = zeros(3,n);
    Q2 = zeros(3,n);
    V1 = zeros(3,n);
    V2 = zeros(3,n);

    for k = 1:n
        C1 = rand(3,1); % camera centers at 1st position
        C1 = C1./norm(C1,'fro')*0.05*rand;
        Q1(:,k) = P(:,k) - C1;
        nQ1 = norm(Q1(:,k),'fro');
        Q1(:,k) = Q1(:,k)./nQ1;
        V1(:,k) = skew(P(:,k))*C1./nQ1;

        C2 = rand(3,1); % camera centers at 2nd position
        C2 = C + C2./norm(C2,'fro')*0.05*rand;
        Q2(:,k) = P(:,k) - C2;
        nQ2 = norm(Q2(:,k),'fro');
        Q2(:,k) = Q2(:,k)./nQ2;
        V2(:,k) = skew(P(:,k))*C2./nQ2;

        % translate into local coordinate frame
        Q2(:,k) = Rt(:,1:3)*Q2(:,k);
        V2(:,k) = Rt(:,1:3)*V2(:,k) - skew(Rt(:,4))*Q2(:,k);

        zr = Q2(:,k)'*Rt(:,1:3)*V1(:,k) + V2(:,k)'*Rt(:,1:3)*Q1(:,k) + Q2(:,k)'*skew(Rt(:,1:3)*Q1(:,k))*Rt(:,4);
        disp(['epipolar constraint #', num2str(k), ': ', num2str(zr)]);
    end

end