function C = coefs_wpnp(data)

    A = data{1};
    B = data{2};

    C = zeros(4,24);

    C([79,85,90,96]) = -A(3)*B(5);
    C([88,91]) = -A(3)*B(6);
    C([78,93]) = A(3)*B(6);
    C([22,48,55,57]) = 2*A(1)^2-2*A(2)^2;
    C([1,15,20,29,40,50,71,82]) = A(2)^2+A(1)^2;
    C(77) = -A(1)*B(1)-A(2)*B(4);
    C(94) = -A(1)*B(1)+A(2)*B(4);
    C(87) = A(1)*B(1)-A(2)*B(4);
    C(92) = A(1)*B(1)+A(2)*B(4);
    C([86,95]) = -A(1)*B(2)-A(2)*B(3);
    C([80,89]) = -A(1)*B(2)+A(2)*B(3);
    C([7,9,62,76]) = -A(1)^2+A(2)^2+2*A(3)^2;
    C([28,35,42,65]) = -A(2)^2+2*A(3)^2+A(1)^2;

    C = C./repmat(sqrt(sum(C.*conj(C),2)),1,size(C,2));

end