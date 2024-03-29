function [C,M] = coefs_focal6p_1s(data)

    x1 = data{1};
    x2 = data{2};

    M = [x1(1,:).*x2(1,:); x1(2,:).*x2(1,:); x1(3,:).*x2(1,:);...
        x1(1,:).*x2(2,:); x1(2,:).*x2(2,:); x1(3,:).*x2(2,:);...
        x1(1,:).*x2(3,:); x1(2,:).*x2(3,:); x1(3,:).*x2(3,:)]';

    M = M(:,1:6)\M(:,7:end);
    f1 = -M(:,3);
    f2 = -M(:,2);
    f3 = -M(:,1);

    % G = F*w*F';
    G(4) = f1(3)^2;
    G(48) = f1(6)^2;
    G(10) = f2(3)^2;
    G(54) = f2(6)^2;
    G(11) = f3(3)^2;
    G(55) = f3(6)^2;
    G([16, 36]) = f1(3)*f1(6);
    G([22, 42]) = f2(3)*f2(6);
    G([23, 43]) = f3(3)*f3(6);
    G(8) = 2*f2(3)*f1(3);
    G(12) = 2*f2(3)*f3(3);
    G(52) = 2*f2(6)*f1(6);
    G(56) = 2*f2(6)*f3(6);
    G(9) = 2*f3(3)*f1(3);
    G(53) = 2*f3(6)*f1(6);
    G(1) = f1(1)^2+f1(2)^2;
    G(45) = f1(4)^2+f1(5)^2;
    G(6) = f2(1)^2+f2(2)^2;
    G(50) = f2(4)^2+f2(5)^2;
    G(5) = f3(1)^2+f3(2)^2;
    G(49) = f3(4)^2+f3(5)^2;
    G([13, 33]) = f1(1)*f1(4)+f1(2)*f1(5);
    G(2) = 2*f2(1)*f1(1)+2*f2(2)*f1(2);
    G([18, 38]) = f2(1)*f2(4)+f2(2)*f2(5);
    G(7) = 2*f2(1)*f3(1)+2*f2(2)*f3(2);
    G([20, 40]) = f2(3)*f1(6)+f1(3)*f2(6);
    G([24, 44]) = f2(3)*f3(6)+f3(3)*f2(6);
    G(46) = 2*f2(4)*f1(4)+2*f2(5)*f1(5);
    G(51) = 2*f2(4)*f3(4)+2*f2(5)*f3(5);
    G(3) = 2*f3(1)*f1(1)+2*f3(2)*f1(2);
    G([17, 37]) = f3(1)*f3(4)+f3(2)*f3(5);
    G([21, 41]) = f3(3)*f1(6)+f1(3)*f3(6);
    G(47) = 2*f3(4)*f1(4)+2*f3(5)*f1(5);
    G([30, 70]) = f2(1)+f3(2);
    G([62, 78]) = f2(4)+f3(5);
    G([14, 34]) = f2(1)*f1(4)+f1(1)*f2(4)+f2(2)*f1(5)+f1(2)*f2(5);
    G([19, 39]) = f2(1)*f3(4)+f3(1)*f2(4)+f2(2)*f3(5)+f3(2)*f2(5);
    G([15, 35]) = f3(1)*f1(4)+f1(1)*f3(4)+f3(2)*f1(5)+f1(2)*f3(5);
    G([26, 66]) = f1(1);
    G([25, 65]) = f1(2);
    G([27, 67]) = f1(3);
    G([58, 74]) = f1(4);
    G([57, 73]) = f1(5);
    G([59, 75]) = f1(6);
    G([29, 69]) = f2(2);
    G([31, 71]) = f2(3);
    G([61, 77]) = f2(5);
    G([63, 79]) = f2(6);
    G([28, 68]) = f3(1);
    G([32, 72]) = f3(3);
    G([60, 76]) = f3(4);
    G([64, 80]) = f3(6);

    C = zeros(10,20);

    C(177) = 2*G(25)*f1(1)+2*G(57)*f1(4);
    C(188) = 2*G(26)*f1(2)+2*G(58)*f1(5);
    C(167) = 2*G(27)*f1(1)+2*G(59)*f1(4);
    C(168) = 2*G(27)*f1(2)+2*G(59)*f1(5);
    C(108) = 2*G(28)*f3(2)+2*G(60)*f3(5);
    C(57) = 2*G(29)*f2(1)+2*G(61)*f2(4);
    C(47) = 2*G(31)*f2(1)+2*G(63)*f2(4);
    C(109) = 2*G(60)*f3(6)+2*G(28)*f3(3);
    C(59) = 2*G(61)*f2(6)+2*G(29)*f2(3);
    C(88) = 2*G(64)*f3(5)+2*G(32)*f3(2);
    C(200) = f1(1)*f1(5)-f1(4)*f1(2);
    C(60) = -f2(6)*f2(1)+f2(4)*f2(3);
    C(110) = -f3(5)*f3(3)+f3(6)*f3(2);
    C([18, 27]) = -G(12)-G(56);
    C(199) = -G(45)-G(1);
    C([8, 17]) = -G(54)-G(10);
    C([28, 37]) = -G(55)-G(11);
    C(191) = G(1)*f1(1)-G(45)*f1(1)+2*G(33)*f1(4);
    C(3) = G(10)*f2(3)+2*G(42)*f2(6)-G(54)*f2(3);
    C(33) = G(11)*f3(3)+2*G(43)*f3(6)-G(55)*f3(3);
    C(195) = 2*G(13)*f1(2)+G(45)*f1(5)-G(1)*f1(5);
    C(196) = 2*G(13)*f1(3)+G(45)*f1(6)-G(1)*f1(6);
    C(4) = 2*G(22)*f2(1)+G(54)*f2(4)-G(10)*f2(4);
    C(6) = 2*G(22)*f2(3)+G(54)*f2(6)-G(10)*f2(6);
    C(34) = 2*G(23)*f3(1)+G(55)*f3(4)-G(11)*f3(4);
    C(36) = 2*G(23)*f3(3)+G(55)*f3(6)-G(11)*f3(6);
    C(1) = 2*G(42)*f2(4)-G(54)*f2(1)+G(10)*f2(1);
    C(2) = 2*G(42)*f2(5)-G(54)*f2(2)+G(10)*f2(2);
    C(31) = 2*G(43)*f3(4)-G(55)*f3(1)+G(11)*f3(1);
    C(32) = 2*G(43)*f3(5)-G(55)*f3(2)+G(11)*f3(2);
    C(192) = -G(45)*f1(2)+2*G(33)*f1(5)+G(1)*f1(2);
    C(193) = -G(45)*f1(3)+2*G(33)*f1(6)+G(1)*f1(3);
    C(194) = G(45)*f1(4)+2*G(13)*f1(1)-G(1)*f1(4);
    C(5) = G(54)*f2(5)-G(10)*f2(5)+2*G(22)*f2(2);
    C(35) = G(55)*f3(5)-G(11)*f3(5)+2*G(23)*f3(2);
    C(103) = G(5)*f3(3)+2*G(37)*f3(6)-G(49)*f3(3)-f3(3);
    C(53) = G(6)*f2(3)+2*G(38)*f2(6)-G(50)*f2(3)-f2(3);
    C(106) = 2*G(17)*f3(3)+G(49)*f3(6)-G(5)*f3(6)-f3(6);
    C(56) = 2*G(18)*f2(3)+G(50)*f2(6)-G(6)*f2(6)-f2(6);
    C(158) = 2*G(26)*f3(2)+2*G(28)*f1(2)+2*G(58)*f3(5)+2*G(60)*f1(5);
    C(117) = 2*G(27)*f2(1)+2*G(31)*f1(1)+2*G(59)*f2(4)+2*G(63)*f1(4);
    C(99) = 2*G(28)*f2(3)+2*G(30)*f3(3)+2*G(60)*f2(6)+2*G(62)*f3(6);
    C(127) = 2*G(29)*f1(1)+2*G(57)*f2(4)+2*G(61)*f1(4)+2*G(25)*f2(1);
    C(79) = 2*G(29)*f3(3)+2*G(30)*f2(3)+2*G(61)*f3(6)+2*G(62)*f2(6);
    C(49) = 2*G(31)*f2(3)+2*G(63)*f2(6)-G(54)-G(10);
    C(87) = 2*G(32)*f3(1)+2*G(64)*f3(4)-G(9)-G(53);
    C(89) = 2*G(32)*f3(3)-G(55)-G(11)+2*G(64)*f3(6);
    C(138) = 2*G(59)*f3(5)+2*G(64)*f1(5)+2*G(27)*f3(2)+2*G(32)*f1(2);
    C(48) = 2*G(63)*f2(5)-G(8)-G(52)+2*G(31)*f2(2);
    C(178) = -G(1)-G(45)+2*G(25)*f1(2)+2*G(57)*f1(5);
    C(179) = -G(2)-G(46)+2*G(25)*f1(3)+2*G(57)*f1(6);
    C(189) = -G(3)-G(47)+2*G(58)*f1(6)+2*G(26)*f1(3);
    C(187) = -G(45)-G(1)+2*G(26)*f1(1)+2*G(58)*f1(4);
    C(161) = -f1(1)-G(48)*f1(1)+G(4)*f1(1)+2*G(36)*f1(4);
    C(162) = -f1(2)+G(4)*f1(2)+2*G(36)*f1(5)-G(48)*f1(2);
    C(164) = -f1(4)+G(48)*f1(4)-G(4)*f1(4)+2*G(16)*f1(1);
    C(165) = -f1(5)-G(4)*f1(5)+2*G(16)*f1(2)+G(48)*f1(5);
    C(51) = -f2(1)-G(50)*f2(1)+G(6)*f2(1)+2*G(38)*f2(4);
    C(54) = -f2(4)+2*G(18)*f2(1)+G(50)*f2(4)-G(6)*f2(4);
    C(102) = -f3(2)+G(5)*f3(2)+2*G(37)*f3(5)-G(49)*f3(2);
    C(105) = -f3(5)-G(5)*f3(5)+2*G(17)*f3(2)+G(49)*f3(5);
    C(169) = -G(4)-G(48)+2*G(59)*f1(6)+2*G(27)*f1(3)+1;
    C(58) = -G(6)-G(50)+2*G(29)*f2(2)+2*G(61)*f2(5)+1;
    C(107) = -G(49)-G(5)+2*G(28)*f3(1)+2*G(60)*f3(4)+1;
    C(163) = 2*G(67)+G(4)*f1(3)+2*G(36)*f1(6)-G(48)*f1(3)-f1(3);
    C(52) = 2*G(69)-f2(2)+G(6)*f2(2)+2*G(38)*f2(5)-G(50)*f2(2);
    C(166) = 2*G(75)+2*G(16)*f1(3)+G(48)*f1(6)-G(4)*f1(6)-f1(6);
    C(55) = 2*G(77)-f2(5)-G(6)*f2(5)+2*G(18)*f2(2)+G(50)*f2(5);
    C(101) = -f3(1)+2*G(68)-G(49)*f3(1)+G(5)*f3(1)+2*G(37)*f3(4);
    C(104) = -f3(4)+2*G(76)+G(49)*f3(4)-G(5)*f3(4)+2*G(17)*f3(1);
    C(175) = -G(1)*f2(5)-G(2)*f1(5)+2*G(13)*f2(2)+2*G(14)*f1(2)+G(45)*f2(5)+G(46)*f1(5);
    C(185) = -G(1)*f3(5)-G(3)*f1(5)+2*G(13)*f3(2)+2*G(15)*f1(2)+G(45)*f3(5)+G(47)*f1(5);
    C(44) = -G(8)*f2(4)-G(10)*f1(4)+2*G(20)*f2(1)+2*G(22)*f1(1)+G(52)*f2(4)+G(54)*f1(4);
    C(82) = G(9)*f3(2)+G(11)*f1(2)+2*G(41)*f3(5)+2*G(43)*f1(5)-G(55)*f1(2)-G(53)*f3(2);
    C(41) = G(10)*f1(1)+2*G(40)*f2(4)+2*G(42)*f1(4)-G(54)*f1(1)-G(52)*f2(1)+G(8)*f2(1);
    C(11) = G(10)*f3(1)+G(12)*f2(1)+2*G(42)*f3(4)+2*G(44)*f2(4)-G(56)*f2(1)-G(54)*f3(1);
    C(12) = G(10)*f3(2)+G(12)*f2(2)+2*G(42)*f3(5)+2*G(44)*f2(5)-G(56)*f2(2)-G(54)*f3(2);
    C(13) = G(10)*f3(3)+G(12)*f2(3)+2*G(42)*f3(6)+2*G(44)*f2(6)-G(56)*f2(3)-G(54)*f3(3);
    C(15) = -G(10)*f3(5)+2*G(22)*f3(2)+2*G(24)*f2(2)+G(54)*f3(5)+G(56)*f2(5)-G(12)*f2(5);
    C(21) = G(11)*f2(1)+G(12)*f3(1)+2*G(43)*f2(4)+2*G(44)*f3(4)-G(56)*f3(1)-G(55)*f2(1);
    C(22) = G(11)*f2(2)+G(12)*f3(2)+2*G(43)*f2(5)+2*G(44)*f3(5)-G(56)*f3(2)-G(55)*f2(2);
    C(23) = G(11)*f2(3)+G(12)*f3(3)+2*G(43)*f2(6)+2*G(44)*f3(6)-G(56)*f3(3)-G(55)*f2(3);
    C(25) = -G(11)*f2(5)+2*G(23)*f2(2)+2*G(24)*f3(2)+G(55)*f2(5)+G(56)*f3(5)-G(12)*f3(5);
    C(46) = 2*G(20)*f2(3)+2*G(22)*f1(3)+G(52)*f2(6)+G(54)*f1(6)-G(8)*f2(6)-G(10)*f1(6);
    C(85) = 2*G(21)*f3(2)+2*G(23)*f1(2)+G(53)*f3(5)+G(55)*f1(5)-G(11)*f1(5)-G(9)*f3(5);
    C(86) = 2*G(21)*f3(3)+2*G(23)*f1(3)+G(53)*f3(6)+G(55)*f1(6)-G(11)*f1(6)-G(9)*f3(6);
    C(119) = 2*G(27)*f2(3)+2*G(31)*f1(3)+2*G(59)*f2(6)-G(8)-G(52)+2*G(63)*f1(6);
    C(139) = 2*G(27)*f3(3)+2*G(32)*f1(3)+2*G(59)*f3(6)-G(9)-G(53)+2*G(64)*f1(6);
    C(97) = 2*G(28)*f2(1)+2*G(30)*f3(1)+2*G(60)*f2(4)+2*G(62)*f3(4)-G(51)-G(7);
    C(43) = 2*G(40)*f2(6)+2*G(42)*f1(6)-G(54)*f1(3)-G(52)*f2(3)+G(8)*f2(3)+G(10)*f1(3);
    C(83) = 2*G(41)*f3(6)+2*G(43)*f1(6)-G(55)*f1(3)-G(53)*f3(3)+G(9)*f3(3)+G(11)*f1(3);
    C(172) = -G(45)*f2(2)+G(1)*f2(2)+G(2)*f1(2)+2*G(33)*f2(5)+2*G(34)*f1(5)-G(46)*f1(2);
    C(174) = G(45)*f2(4)+G(46)*f1(4)-G(1)*f2(4)-G(2)*f1(4)+2*G(13)*f2(1)+2*G(14)*f1(1);
    C(182) = -G(45)*f3(2)+G(1)*f3(2)+G(3)*f1(2)+2*G(33)*f3(5)-G(47)*f1(2)+2*G(35)*f1(5);
    C(184) = G(45)*f3(4)+G(47)*f1(4)-G(1)*f3(4)-G(3)*f1(4)+2*G(13)*f3(1)+2*G(15)*f1(1);
    C(171) = -G(46)*f1(1)-G(45)*f2(1)+G(1)*f2(1)+G(2)*f1(1)+2*G(33)*f2(4)+2*G(34)*f1(4);
    C(181) = -G(47)*f1(1)-G(45)*f3(1)+G(1)*f3(1)+G(3)*f1(1)+2*G(33)*f3(4)+2*G(35)*f1(4);
    C(26) = G(55)*f2(6)+G(56)*f3(6)-G(12)*f3(6)+2*G(23)*f2(3)+2*G(24)*f3(3)-G(11)*f2(6);
    C(14) = G(56)*f2(4)-G(12)*f2(4)-G(10)*f3(4)+2*G(22)*f3(1)+2*G(24)*f2(1)+G(54)*f3(4);
    C(16) = G(56)*f2(6)-G(12)*f2(6)+2*G(22)*f3(3)+2*G(24)*f2(3)+G(54)*f3(6)-G(10)*f3(6);
    C(24) = G(56)*f3(4)-G(12)*f3(4)-G(11)*f2(4)+2*G(23)*f2(1)+2*G(24)*f3(1)+G(55)*f2(4);
    C(78) = 2*G(61)*f3(5)+2*G(62)*f2(5)-G(51)-G(7)+2*G(29)*f3(2)+2*G(30)*f2(2);
    C(180) = f1(1)*f2(5)-f1(1)*f1(6)+f1(5)*f2(1)-f2(4)*f1(2)-f1(4)*f2(2)+f1(4)*f1(3);
    C(130) = -f1(1)*f2(6)+f2(5)*f2(1)-f1(6)*f2(1)-f2(4)*f2(2)+f2(4)*f1(3)+f1(4)*f2(3);
    C(190) = f1(1)*f3(5)-f1(5)*f1(3)+f1(5)*f3(1)+f1(6)*f1(2)-f3(4)*f1(2)-f1(4)*f3(2);
    C(80) = -f2(5)*f2(3)+f2(6)*f2(2)-f2(6)*f3(1)-f3(6)*f2(1)+f2(4)*f3(3)+f3(4)*f2(3);
    C(100) = -f2(5)*f3(3)-f3(5)*f2(3)+f2(6)*f3(2)+f3(6)*f2(2)-f3(6)*f3(1)+f3(4)*f3(3);
    C(160) = -f3(5)*f1(3)+f3(5)*f3(1)-f1(5)*f3(3)+f3(6)*f1(2)+f1(6)*f3(2)-f3(4)*f3(2);
    C(128) = -G(2)-G(46)+2*G(25)*f2(2)+2*G(29)*f1(2)+2*G(57)*f2(5)+2*G(61)*f1(5);
    C(157) = -G(3)-G(47)+2*G(26)*f3(1)+2*G(28)*f1(1)+2*G(58)*f3(4)+2*G(60)*f1(4);
    C(67) = -G(8)-G(52)+2*G(31)*f3(1)+2*G(32)*f2(1)+2*G(63)*f3(4)+2*G(64)*f2(4);
    C(68) = -G(9)-G(53)+2*G(32)*f2(2)+2*G(63)*f3(5)+2*G(64)*f2(5)+2*G(31)*f3(2);
    C(69) = -G(12)-G(56)+2*G(31)*f3(3)+2*G(32)*f2(3)+2*G(63)*f3(6)+2*G(64)*f2(6);
    C(132) = G(4)*f3(2)+G(9)*f1(2)+2*G(36)*f3(5)+2*G(41)*f1(5)-G(53)*f1(2)-G(48)*f3(2)-f3(2);
    C(93) = G(5)*f2(3)+G(7)*f3(3)+2*G(37)*f2(6)+2*G(39)*f3(6)-G(51)*f3(3)-G(49)*f2(3)-f2(3);
    C(76) = -G(6)*f3(6)+2*G(18)*f3(3)+G(50)*f3(6)+G(51)*f2(6)-G(7)*f2(6)+2*G(19)*f2(3)-f3(6);
    C(114) = -G(8)*f1(4)-G(4)*f2(4)+2*G(16)*f2(1)+2*G(20)*f1(1)+G(48)*f2(4)+G(52)*f1(4)-f2(4);
    C(42) = G(8)*f2(2)+G(10)*f1(2)+2*G(40)*f2(5)+2*G(42)*f1(5)-G(54)*f1(2)-G(52)*f2(2)+2*G(71);
    C(81) = G(11)*f1(1)+2*G(41)*f3(4)+2*G(43)*f1(4)-G(55)*f1(1)-G(53)*f3(1)+G(9)*f3(1)+2*G(72);
    C(135) = 2*G(16)*f3(2)+2*G(21)*f1(2)+G(48)*f3(5)+G(53)*f1(5)-G(9)*f1(5)-G(4)*f3(5)-f3(5);
    C(96) = 2*G(19)*f3(3)+G(49)*f2(6)+G(51)*f3(6)-G(7)*f3(6)-G(5)*f2(6)+2*G(17)*f2(3)-f2(6);
    C(45) = 2*G(20)*f2(2)+2*G(22)*f1(2)+G(52)*f2(5)+G(54)*f1(5)-G(8)*f2(5)-G(10)*f1(5)+2*G(79);
    C(137) = 2*G(27)*f3(1)+2*G(32)*f1(1)+2*G(59)*f3(4)+2*G(64)*f1(4)-G(4)-G(48)+1;
    C(77) = 2*G(29)*f3(1)+2*G(30)*f2(1)+2*G(61)*f3(4)+2*G(62)*f2(4)-G(6)-G(50)+1;
    C(111) = 2*G(36)*f2(4)+2*G(40)*f1(4)-G(52)*f1(1)-G(48)*f2(1)+G(4)*f2(1)+G(8)*f1(1)-f2(1);
    C(73) = -G(50)*f3(3)+G(6)*f3(3)+G(7)*f2(3)+2*G(38)*f3(6)+2*G(39)*f2(6)-G(51)*f2(3)-f3(3);
    C(84) = G(55)*f1(4)-G(11)*f1(4)-G(9)*f3(4)+2*G(21)*f3(1)+2*G(23)*f1(1)+G(53)*f3(4)+2*G(80);
    C(118) = 2*G(59)*f2(5)+2*G(63)*f1(5)-G(4)-G(48)+2*G(27)*f2(2)+2*G(31)*f1(2)+1;
    C(98) = 2*G(60)*f2(5)+2*G(62)*f3(5)-G(5)-G(49)+2*G(28)*f2(2)+2*G(30)*f3(2)+1;
    C(159) = -G(5)-G(49)+2*G(58)*f3(6)+2*G(60)*f1(6)+2*G(26)*f3(3)+2*G(28)*f1(3)+1;
    C(129) = -G(6)-G(50)+2*G(61)*f1(6)+2*G(25)*f2(3)+2*G(29)*f1(3)+2*G(57)*f2(6)+1;
    C(173) = 2*G(65)+G(1)*f2(3)+G(2)*f1(3)+2*G(33)*f2(6)+2*G(34)*f1(6)-G(46)*f1(3)-G(45)*f2(3);
    C(183) = 2*G(66)+G(1)*f3(3)+G(3)*f1(3)+2*G(33)*f3(6)+2*G(35)*f1(6)-G(47)*f1(3)-G(45)*f3(3);
    C(176) = 2*G(73)+2*G(13)*f2(3)+2*G(14)*f1(3)+G(45)*f2(6)+G(46)*f1(6)-G(1)*f2(6)-G(2)*f1(6);
    C(186) = 2*G(74)+2*G(13)*f3(3)+2*G(15)*f1(3)+G(45)*f3(6)+G(47)*f1(6)-G(1)*f3(6)-G(3)*f1(6);
    C(121) = -f1(1)-G(46)*f2(1)-G(50)*f1(1)+G(2)*f2(1)+G(6)*f1(1)+2*G(34)*f2(4)+2*G(38)*f1(4);
    C(152) = -f1(2)+G(3)*f3(2)+G(5)*f1(2)+2*G(35)*f3(5)+2*G(37)*f1(5)-G(47)*f3(2)-G(49)*f1(2);
    C(124) = -f1(4)+2*G(18)*f1(1)+G(46)*f2(4)+G(50)*f1(4)-G(2)*f2(4)-G(6)*f1(4)+2*G(14)*f2(1);
    C(155) = -f1(5)-G(3)*f3(5)-G(5)*f1(5)+2*G(15)*f3(2)+2*G(17)*f1(2)+G(47)*f3(5)+G(49)*f1(5);
    C(112) = G(4)*f2(2)+G(8)*f1(2)+2*G(36)*f2(5)+2*G(40)*f1(5)-G(52)*f1(2)-G(48)*f2(2)+2*G(67)-f2(2);
    C(113) = G(4)*f2(3)+2*G(36)*f2(6)+2*G(40)*f1(6)-G(52)*f1(3)-G(48)*f2(3)+G(8)*f1(3)+2*G(71)-f2(3);
    C(133) = G(4)*f3(3)+2*G(36)*f3(6)+2*G(41)*f1(6)-G(53)*f1(3)-G(48)*f3(3)+G(9)*f1(3)+2*G(72)-f3(3);
    C(92) = G(5)*f2(2)+G(7)*f3(2)+2*G(37)*f2(5)+2*G(39)*f3(5)-G(51)*f3(2)-G(49)*f2(2)+2*G(68)-f2(2);
    C(72) = G(6)*f3(2)+G(7)*f2(2)+2*G(38)*f3(5)+2*G(39)*f2(5)-G(51)*f2(2)-G(50)*f3(2)+2*G(70)-f3(2);
    C(74) = -G(7)*f2(4)-G(6)*f3(4)+2*G(18)*f3(1)+2*G(19)*f2(1)+G(50)*f3(4)+G(51)*f2(4)+2*G(77)-f3(4);
    C(94) = -G(7)*f3(4)-G(5)*f2(4)+2*G(17)*f2(1)+2*G(19)*f3(1)+G(49)*f2(4)+G(51)*f3(4)+2*G(78)-f2(4);
    C(131) = G(9)*f1(1)+2*G(36)*f3(4)+2*G(41)*f1(4)-G(53)*f1(1)-G(48)*f3(1)+G(4)*f3(1)+2*G(67)-f3(1);
    C(134) = -G(9)*f1(4)-G(4)*f3(4)+2*G(16)*f3(1)+2*G(21)*f1(1)+G(48)*f3(4)+G(53)*f1(4)+2*G(75)-f3(4);
    C(115) = 2*G(16)*f2(2)+2*G(20)*f1(2)+G(48)*f2(5)+G(52)*f1(5)-G(8)*f1(5)-G(4)*f2(5)+2*G(75)-f2(5);
    C(95) = 2*G(17)*f2(2)+2*G(19)*f3(2)+G(49)*f2(5)+G(51)*f3(5)-G(7)*f3(5)-G(5)*f2(5)+2*G(76)-f2(5);
    C(75) = 2*G(18)*f3(2)+2*G(19)*f2(2)+G(50)*f3(5)+G(51)*f2(5)-G(7)*f2(5)-G(6)*f3(5)+2*G(78)-f3(5);
    C(116) = 2*G(20)*f1(3)+G(48)*f2(6)+G(52)*f1(6)-G(8)*f1(6)-G(4)*f2(6)+2*G(16)*f2(3)+2*G(79)-f2(6);
    C(136) = 2*G(21)*f1(3)+G(48)*f3(6)+G(53)*f1(6)-G(9)*f1(6)-G(4)*f3(6)+2*G(16)*f3(3)+2*G(80)-f3(6);
    C(147) = 2*G(25)*f3(1)+2*G(26)*f2(1)+2*G(30)*f1(1)+2*G(57)*f3(4)+2*G(58)*f2(4)+2*G(62)*f1(4)-G(2)-G(46);
    C(149) = 2*G(25)*f3(3)+2*G(26)*f2(3)+2*G(30)*f1(3)+2*G(57)*f3(6)+2*G(58)*f2(6)+2*G(62)*f1(6)-G(51)-G(7);
    C(91) = 2*G(37)*f2(4)+2*G(39)*f3(4)-G(51)*f3(1)-G(49)*f2(1)+G(5)*f2(1)+G(7)*f3(1)+2*G(70)-f2(1);
    C(71) = 2*G(38)*f3(4)+2*G(39)*f2(4)-G(51)*f2(1)-G(50)*f3(1)+G(6)*f3(1)+G(7)*f2(1)+2*G(69)-f3(1);
    C(148) = 2*G(58)*f2(5)+2*G(62)*f1(5)-G(3)-G(47)+2*G(25)*f3(2)+2*G(26)*f2(2)+2*G(30)*f1(2)+2*G(57)*f3(5);
    C(122) = 2*G(65)-f1(2)-G(50)*f1(2)+G(2)*f2(2)+G(6)*f1(2)+2*G(34)*f2(5)+2*G(38)*f1(5)-G(46)*f2(2);
    C(153) = 2*G(68)+G(3)*f3(3)+G(5)*f1(3)+2*G(35)*f3(6)+2*G(37)*f1(6)-G(47)*f3(3)-G(49)*f1(3)-f1(3);
    C(123) = 2*G(69)+G(2)*f2(3)+G(6)*f1(3)+2*G(34)*f2(6)+2*G(38)*f1(6)-G(46)*f2(3)-G(50)*f1(3)-f1(3);
    C(125) = 2*G(73)-f1(5)-G(2)*f2(5)-G(6)*f1(5)+2*G(14)*f2(2)+2*G(18)*f1(2)+G(46)*f2(5)+G(50)*f1(5);
    C(156) = 2*G(76)+2*G(15)*f3(3)+2*G(17)*f1(3)+G(47)*f3(6)+G(49)*f1(6)-G(3)*f3(6)-G(5)*f1(6)-f1(6);
    C(126) = 2*G(77)+2*G(14)*f2(3)+2*G(18)*f1(3)+G(46)*f2(6)+G(50)*f1(6)-G(2)*f2(6)-G(6)*f1(6)-f1(6);
    C(151) = -f1(1)+2*G(66)-G(47)*f3(1)-G(49)*f1(1)+G(3)*f3(1)+G(5)*f1(1)+2*G(35)*f3(4)+2*G(37)*f1(4);
    C(154) = -f1(4)+2*G(74)+G(47)*f3(4)+G(49)*f1(4)-G(3)*f3(4)-G(5)*f1(4)+2*G(15)*f3(1)+2*G(17)*f1(1);
    C(63) = -G(53)*f2(3)+G(8)*f3(3)+G(9)*f2(3)+G(12)*f1(3)+2*G(40)*f3(6)+2*G(41)*f2(6)+2*G(44)*f1(6)-G(56)*f1(3)-G(52)*f3(3);
    C(66) = G(56)*f1(6)-G(12)*f1(6)-G(8)*f3(6)+2*G(20)*f3(3)+2*G(21)*f2(3)+2*G(24)*f1(3)+G(52)*f3(6)+G(53)*f2(6)-G(9)*f2(6);
    C(142) = G(2)*f3(2)+G(3)*f2(2)+G(7)*f1(2)+2*G(34)*f3(5)+2*G(35)*f2(5)+2*G(39)*f1(5)-G(51)*f1(2)-G(46)*f3(2)-G(47)*f2(2)+2*G(66);
    C(143) = G(2)*f3(3)+G(3)*f2(3)+G(7)*f1(3)+2*G(35)*f2(6)+2*G(39)*f1(6)-G(51)*f1(3)-G(46)*f3(3)-G(47)*f2(3)+2*G(34)*f3(6)+2*G(70);
    C(144) = -G(7)*f1(4)-G(2)*f3(4)-G(3)*f2(4)+2*G(14)*f3(1)+2*G(15)*f2(1)+2*G(19)*f1(1)+G(46)*f3(4)+G(47)*f2(4)+G(51)*f1(4)+2*G(73);
    C(145) = 2*G(19)*f1(2)+G(46)*f3(5)+G(47)*f2(5)+G(51)*f1(5)-G(7)*f1(5)-G(2)*f3(5)-G(3)*f2(5)+2*G(14)*f3(2)+2*G(15)*f2(2)+2*G(74);
    C(146) = 2*G(19)*f1(3)+G(46)*f3(6)+G(47)*f2(6)+G(51)*f1(6)-G(7)*f1(6)-G(2)*f3(6)-G(3)*f2(6)+2*G(14)*f3(3)+2*G(15)*f2(3)+2*G(78);
    C(141) = 2*G(34)*f3(4)+2*G(35)*f2(4)+2*G(39)*f1(4)-G(51)*f1(1)-G(46)*f3(1)-G(47)*f2(1)+G(2)*f3(1)+G(3)*f2(1)+G(7)*f1(1)+2*G(65);
    C(61) = 2*G(71)+G(8)*f3(1)+G(9)*f2(1)+G(12)*f1(1)+2*G(40)*f3(4)+2*G(41)*f2(4)+2*G(44)*f1(4)-G(56)*f1(1)-G(52)*f3(1)-G(53)*f2(1);
    C(62) = 2*G(72)-G(52)*f3(2)-G(53)*f2(2)+G(8)*f3(2)+G(9)*f2(2)+G(12)*f1(2)+2*G(40)*f3(5)+2*G(41)*f2(5)+2*G(44)*f1(5)-G(56)*f1(2);
    C(64) = 2*G(79)+G(56)*f1(4)-G(12)*f1(4)-G(8)*f3(4)-G(9)*f2(4)+2*G(20)*f3(1)+2*G(21)*f2(1)+2*G(24)*f1(1)+G(52)*f3(4)+G(53)*f2(4);
    C(65) = 2*G(80)-G(12)*f1(5)-G(8)*f3(5)-G(9)*f2(5)+2*G(20)*f3(2)+2*G(21)*f2(2)+2*G(24)*f1(2)+G(52)*f3(5)+G(53)*f2(5)+G(56)*f1(5);
    C(150) = -f1(1)*f3(6)-f2(5)*f1(3)+f2(5)*f3(1)+f3(5)*f2(1)-f1(5)*f2(3)+f2(6)*f1(2)+f1(6)*f2(2)-f1(6)*f3(1)-f2(4)*f3(2)-f3(4)*f2(2)+f3(4)*f1(3)+f1(4)*f3(3);

    C = C./repmat(sqrt(sum(C.*conj(C),2)),1,size(C,2));

end