function [C,U,dU] = coefs_wpnp(data)

    A = data{1};
    B = data{2};

    C = zeros(4,24);
    C([79,85,90,96]) = -4*A(3)*B(5);
    C([88,91]) = -4*A(3)*B(6);
    C([78,93]) = 4*A(3)*B(6);
    C([1,15,20,29,40,50,71,82]) = 4*A(1)^2+4*A(2)^2;
    C([22,48,55,57]) = 8*A(1)^2-8*A(2)^2;
    C(77) = -4*A(1)*B(1)-4*A(2)*B(4);
    C(94) = -4*A(1)*B(1)+4*A(2)*B(4);
    C(87) = 4*A(1)*B(1)-4*A(2)*B(4);
    C(92) = 4*A(1)*B(1)+4*A(2)*B(4);
    C([86,95]) = -4*A(1)*B(2)-4*A(2)*B(3);
    C([80,89]) = -4*A(1)*B(2)+4*A(2)*B(3);
    C([7,9,62,76]) = -4*A(1)^2+4*A(2)^2+8*A(3)^2;
    C([28,35,42,65]) = 4*A(1)^2-4*A(2)^2+8*A(3)^2;

    C = C./repmat(sqrt(sum(C.*conj(C),2)),1,size(C,2));

    U = @(w1,x1,y1,z1)[x1*w1^3,x1*y1*w1^2,x1*w1*y1^2,x1*y1^3,x1*z1*w1^2,x1*y1*w1*z1,x1*z1*y1^2,x1*w1*z1^2,x1*y1*z1^2,x1*z1^3,x1*w1^2,y1*x1*w1,y1^2*x1,z1*x1*w1,z1*y1*x1,z1^2*x1,x1*w1,x1*y1,x1*z1,w1,x1,y1,z1,1];
    dU = @(w1,x1,y1,z1)[[3*x1*w1^2,2*y1*x1*w1,y1^2*x1,0,2*z1*x1*w1,z1*y1*x1,0,z1^2*x1,0,0,2*x1*w1,x1*y1,0,x1*z1,0,0,x1,0,0,1,0,0,0,0];[w1^3,w1^2*y1,y1^2*w1,y1^3,w1^2*z1,z1*y1*w1,z1*y1^2,z1^2*w1,y1*z1^2,z1^3,w1^2,w1*y1,y1^2,w1*z1,y1*z1,z1^2,w1,y1,z1,0,1,0,0,0];[0,x1*w1^2,2*y1*x1*w1,3*y1^2*x1,0,z1*x1*w1,2*z1*y1*x1,0,z1^2*x1,0,0,x1*w1,2*x1*y1,0,x1*z1,0,0,x1,0,0,0,1,0,0];[0,0,0,0,x1*w1^2,y1*x1*w1,y1^2*x1,2*z1*x1*w1,2*z1*y1*x1,3*z1^2*x1,0,0,0,x1*w1,x1*y1,2*x1*z1,0,0,x1,0,0,0,1,0]];

end