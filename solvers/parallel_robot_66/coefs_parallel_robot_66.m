function C = coefs_parallel_robot_66(data)

    X = data{1};
    Y = data{2};
    L = data{3};

    C = zeros(6,46);

    C([2,3,4,5,6,8,9,10,11,12,14,15,16,17,18,20,21,22,23,24,26,27,28,29,30,32,33,34,35,36,38,39,40,41,42,44,45,46,47,48,50,51,52,53,54,193,194,195,196,197,198,211,212,213,214,215,216,229,230,231,232,233,234]) = 1;
    C(271) = -L(1);
    C(206) = -4*Y(4);
    C([92,128,224]) = 4*Y(4);
    C(218) = -4*Y(5);
    C([62,134,188]) = 4*Y(5);
    C(182) = -4*Y(6);
    C([74,104,200]) = 4*Y(6);
    C(207) = -4*Y(7);
    C([93,129,225]) = 4*Y(7);
    C(219) = -4*Y(8);
    C([63,135,189]) = 4*Y(8);
    C(183) = -4*Y(9);
    C([75,105,201]) = 4*Y(9);
    C(208) = -4*Y(10);
    C([94,130,226]) = 4*Y(10);
    C(220) = -4*Y(11);
    C([64,136,190]) = 4*Y(11);
    C(184) = -4*Y(12);
    C([76,106,202]) = 4*Y(12);
    C(209) = -4*Y(13);
    C([95,131,227]) = 4*Y(13);
    C(221) = -4*Y(14);
    C([65,137,191]) = 4*Y(14);
    C(185) = -4*Y(15);
    C([77,107,203]) = 4*Y(15);
    C(210) = -4*Y(16);
    C([96,132,228]) = 4*Y(16);
    C(222) = -4*Y(17);
    C([66,138,192]) = 4*Y(17);
    C(186) = -4*Y(18);
    C([78,108,204]) = 4*Y(18);
    C(152) = -4*Y(4)*X(5)-4*Y(5)*X(4);
    C(248) = 4*Y(4)*X(5)-4*Y(5)*X(4);
    C(164) = -4*Y(4)*X(6)-4*Y(6)*X(4);
    C(242) = -4*Y(4)*X(6)+4*Y(6)*X(4);
    C(170) = -4*Y(5)*X(6)-4*Y(6)*X(5);
    C(236) = 4*Y(5)*X(6)-4*Y(6)*X(5);
    C(153) = -4*Y(7)*X(8)-4*Y(8)*X(7);
    C(249) = 4*Y(7)*X(8)-4*Y(8)*X(7);
    C(165) = -4*Y(7)*X(9)-4*Y(9)*X(7);
    C(243) = -4*Y(7)*X(9)+4*Y(9)*X(7);
    C(171) = -4*Y(8)*X(9)-4*Y(9)*X(8);
    C(237) = 4*Y(8)*X(9)-4*Y(9)*X(8);
    C(154) = -4*Y(10)*X(11)-4*Y(11)*X(10);
    C(250) = 4*Y(10)*X(11)-4*Y(11)*X(10);
    C(166) = -4*Y(10)*X(12)-4*Y(12)*X(10);
    C(244) = -4*Y(10)*X(12)+4*Y(12)*X(10);
    C(172) = -4*Y(11)*X(12)-4*Y(12)*X(11);
    C(238) = 4*Y(11)*X(12)-4*Y(12)*X(11);
    C(155) = -4*Y(13)*X(14)-4*Y(14)*X(13);
    C(251) = 4*Y(13)*X(14)-4*Y(14)*X(13);
    C(167) = -4*Y(13)*X(15)-4*Y(15)*X(13);
    C(245) = -4*Y(13)*X(15)+4*Y(15)*X(13);
    C(173) = -4*Y(14)*X(15)-4*Y(15)*X(14);
    C(239) = 4*Y(14)*X(15)-4*Y(15)*X(14);
    C(156) = -4*Y(16)*X(17)-4*Y(17)*X(16);
    C(252) = 4*Y(16)*X(17)-4*Y(17)*X(16);
    C(168) = -4*Y(16)*X(18)-4*Y(18)*X(16);
    C(246) = -4*Y(16)*X(18)+4*Y(18)*X(16);
    C(174) = -4*Y(17)*X(18)-4*Y(18)*X(17);
    C(240) = 4*Y(17)*X(18)-4*Y(18)*X(17);
    C([68,80]) = -2*Y(4)-2*X(4);
    C([56,254]) = 2*Y(4)-2*X(4);
    C([86,110]) = -2*Y(5)-2*X(5);
    C([98,260]) = 2*Y(5)-2*X(5);
    C([116,122]) = -2*Y(6)-2*X(6);
    C([140,266]) = 2*Y(6)-2*X(6);
    C([69,81]) = -2*Y(7)-2*X(7);
    C([57,255]) = 2*Y(7)-2*X(7);
    C([87,111]) = -2*Y(8)-2*X(8);
    C([99,261]) = 2*Y(8)-2*X(8);
    C([117,123]) = -2*Y(9)-2*X(9);
    C([141,267]) = 2*Y(9)-2*X(9);
    C([70,82]) = -2*Y(10)-2*X(10);
    C([58,256]) = 2*Y(10)-2*X(10);
    C([88,112]) = -2*Y(11)-2*X(11);
    C([100,262]) = 2*Y(11)-2*X(11);
    C([118,124]) = -2*Y(12)-2*X(12);
    C([142,268]) = 2*Y(12)-2*X(12);
    C([71,83]) = -2*Y(13)-2*X(13);
    C([59,257]) = 2*Y(13)-2*X(13);
    C([89,113]) = -2*Y(14)-2*X(14);
    C([101,263]) = 2*Y(14)-2*X(14);
    C([119,125]) = -2*Y(15)-2*X(15);
    C([143,269]) = 2*Y(15)-2*X(15);
    C([72,84]) = -2*Y(16)-2*X(16);
    C([60,258]) = 2*Y(16)-2*X(16);
    C([90,114]) = -2*Y(17)-2*X(17);
    C([102,264]) = 2*Y(17)-2*X(17);
    C([120,126]) = -2*Y(18)-2*X(18);
    C([144,270]) = 2*Y(18)-2*X(18);
    C(146) = Y(4)^2+Y(5)^2+Y(6)^2+X(4)^2+X(5)^2+X(6)^2-L(2)-2*Y(4)*X(4)+2*Y(5)*X(5)+2*Y(6)*X(6);
    C(158) = Y(4)^2+Y(5)^2+Y(6)^2+X(4)^2+X(5)^2+X(6)^2-L(2)+2*Y(4)*X(4)-2*Y(5)*X(5)+2*Y(6)*X(6);
    C(176) = Y(4)^2+Y(5)^2+Y(6)^2+X(4)^2+X(5)^2+X(6)^2-L(2)+2*Y(4)*X(4)+2*Y(5)*X(5)-2*Y(6)*X(6);
    C(148) = Y(10)^2+Y(11)^2+Y(12)^2+X(10)^2+X(11)^2+X(12)^2-L(4)-2*Y(10)*X(10)+2*Y(11)*X(11)+2*Y(12)*X(12);
    C(160) = Y(10)^2+Y(11)^2+Y(12)^2+X(10)^2+X(11)^2+X(12)^2-L(4)+2*Y(10)*X(10)-2*Y(11)*X(11)+2*Y(12)*X(12);
    C(178) = Y(10)^2+Y(11)^2+Y(12)^2+X(10)^2+X(11)^2+X(12)^2-L(4)+2*Y(10)*X(10)+2*Y(11)*X(11)-2*Y(12)*X(12);
    C(149) = Y(13)^2+Y(14)^2+Y(15)^2+X(13)^2+X(14)^2+X(15)^2-L(5)-2*Y(13)*X(13)+2*Y(14)*X(14)+2*Y(15)*X(15);
    C(161) = Y(13)^2+Y(14)^2+Y(15)^2+X(13)^2+X(14)^2+X(15)^2-L(5)+2*Y(13)*X(13)-2*Y(14)*X(14)+2*Y(15)*X(15);
    C(179) = Y(13)^2+Y(14)^2+Y(15)^2+X(13)^2+X(14)^2+X(15)^2-L(5)+2*Y(13)*X(13)+2*Y(14)*X(14)-2*Y(15)*X(15);
    C(147) = -2*Y(7)*X(7)+2*Y(8)*X(8)+2*Y(9)*X(9)+Y(7)^2+Y(8)^2+Y(9)^2+X(7)^2+X(8)^2+X(9)^2-L(3);
    C(159) = 2*Y(7)*X(7)-2*Y(8)*X(8)+2*Y(9)*X(9)+Y(7)^2+Y(8)^2+Y(9)^2+X(7)^2+X(8)^2+X(9)^2-L(3);
    C(177) = 2*Y(7)*X(7)+2*Y(8)*X(8)-2*Y(9)*X(9)+Y(7)^2+Y(8)^2+Y(9)^2+X(7)^2+X(8)^2+X(9)^2-L(3);
    C(150) = -2*Y(16)*X(16)+2*Y(17)*X(17)+2*Y(18)*X(18)+Y(16)^2+Y(17)^2+Y(18)^2+X(16)^2+X(17)^2+X(18)^2-L(6);
    C(162) = 2*Y(16)*X(16)-2*Y(17)*X(17)+2*Y(18)*X(18)+Y(16)^2+Y(17)^2+Y(18)^2+X(16)^2+X(17)^2+X(18)^2-L(6);
    C(180) = 2*Y(16)*X(16)+2*Y(17)*X(17)-2*Y(18)*X(18)+Y(16)^2+Y(17)^2+Y(18)^2+X(16)^2+X(17)^2+X(18)^2-L(6);
    C(272) = -L(2)-2*Y(4)*X(4)-2*Y(5)*X(5)-2*Y(6)*X(6)+Y(4)^2+Y(5)^2+Y(6)^2+X(4)^2+X(5)^2+X(6)^2;
    C(273) = -L(3)-2*Y(7)*X(7)-2*Y(8)*X(8)-2*Y(9)*X(9)+Y(7)^2+Y(8)^2+Y(9)^2+X(7)^2+X(8)^2+X(9)^2;
    C(274) = -L(4)-2*Y(10)*X(10)-2*Y(11)*X(11)-2*Y(12)*X(12)+Y(10)^2+Y(11)^2+Y(12)^2+X(10)^2+X(11)^2+X(12)^2;
    C(275) = -L(5)-2*Y(13)*X(13)-2*Y(14)*X(14)-2*Y(15)*X(15)+Y(13)^2+Y(14)^2+Y(15)^2+X(13)^2+X(14)^2+X(15)^2;
    C(276) = -L(6)-2*Y(16)*X(16)-2*Y(17)*X(17)-2*Y(18)*X(18)+Y(16)^2+Y(17)^2+Y(18)^2+X(16)^2+X(17)^2+X(18)^2;

    C = C./repmat(sqrt(sum(C.*conj(C),2)),1,size(C,2));

end