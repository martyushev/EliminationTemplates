function C = coefs_refract5p(data)

    x = data{1};
    X = data{2};

    M = [2*x(3,:); 2*x(1,:); -x(2,:); -2*(X(1,:).*x(1,:)-X(2,:).*x(2,:));...
        X(1,:).*x(2,:)+X(2,:).*x(1,:); -2*x(3,:); -2*x(3,:); -2*x(3,:); 2*x(1,:);...
        -x(2,:); -x(1,:); x(2,:); x(1,:); -X(1,:).*x(2,:)-X(2,:).*x(1,:); x(1,:);...
        -2*x(2,:); 2*x(2,:); x(2,:); -x(1,:); -X(1,:).*x(2,:)+X(2,:).*x(1,:);...
        X(1,:).*x(2,:)-X(2,:).*x(1,:); 2*X(2,:).*x(3,:); -2*X(1,:).*x(3,:);...
        2*X(1,:).*x(3,:); 2*X(2,:).*x(3,:); -2*(X(1,:).*x(1,:)+X(2,:).*x(2,:))]';

    M = M(:,1:5)\M(:,6:end);

    C = zeros(3,29);

    C([60,62]) = 1;
    C(66) = -1;
    C([1,7,34,40]) = M(81);
    C([4,10]) = M(86);
    C(13) = -M(71)-2*M(82);
    C([16,61]) = -2*M(87)+M(83);
    C(19) = -M(71)+M(88);
    C([22,79]) = -M(81)+2*M(72);
    C(25) = -M(86)-M(73);
    C(28) = M(71);
    C([31,37]) = -M(86);
    C([43,46]) = M(101)+2*M(87)+M(83);
    C(49) = M(86)-2*M(102)-M(73);
    C([52,67]) = -M(81)-2*M(72)+M(103);
    C([55,82]) = -M(101);
    C(58) = M(71)-M(88);
    C(64) = M(71)+2*M(82);
    C(70) = -M(86)+2*M(102)+M(73);
    C(76) = M(86)+M(73);
    C(85) = -M(71);
    C([68,80]) = M(84);
    C(71) = M(89);
    C(74) = -M(74);
    C(77) = -M(89);
    C(83) = M(104);
    C(86) = M(74);
    C([69,81]) = M(85);
    C(72) = M(90);
    C(75) = -M(75);
    C(78) = -M(90);
    C(84) = M(105);
    C(87) = M(75);

    C = C./(sqrt(sum(C.^2,2))*ones(1,size(C,2)));

end