function C = coefs_opt_pnp_nakanoC(data)

    M = data{1};

    C = zeros(6,35);

    C(121) = 8*M(14)-8*M(24)+8*M(28)-8*M(48);
    C(122) = 8*M(17)-8*M(27)-8*M(55)+8*M(65);
    C(126) = -8*M(20)+8*M(50)-8*M(12)+8*M(72);
    C(124) = 8*M(32)+8*M(10)-8*M(70)-8*M(62);
    C(123) = -8*M(34)+8*M(54)-8*M(58)+8*M(68);
    C(125) = -8*M(63)-8*M(19)+8*M(49)+8*M(33);
    C(57) = -2*M(6)+2*M(78)+2*M(44)-4*M(22)-4*M(58);
    C(165) = 2*M(6)+2*M(78)+2*M(44)+4*M(22)-4*M(58);
    C(17) = -4*M(15)-4*M(33)+2*M(3)-2*M(39)+2*M(79);
    C(185) = 4*M(15)-4*M(33)+2*M(3)+2*M(39)+2*M(79);
    C(58) = -4*M(26)-4*M(62)+2*M(2)-2*M(74)+2*M(40);
    C(166) = 4*M(26)-4*M(62)+2*M(2)+2*M(74)+2*M(40);
    C(18) = -4*M(30)-4*M(12)-2*M(6)+2*M(42)+2*M(80);
    C(186) = 4*M(30)-4*M(12)+2*M(6)+2*M(42)+2*M(80);
    C(163) = -2*M(38)-2*M(4)-2*M(76)-4*M(60)+4*M(24);
    C(55) = -2*M(38)-2*M(4)+2*M(76)+4*M(60)+4*M(24);
    C(67) = 2*M(38)-2*M(74)+2*M(4)-4*M(66)-4*M(48);
    C(151) = 2*M(38)+2*M(74)+2*M(4)+4*M(66)-4*M(48);
    C(68) = -2*M(39)+2*M(75)+2*M(7)-4*M(47)-4*M(65);
    C(152) = 2*M(39)+2*M(75)+2*M(7)+4*M(47)-4*M(65);
    C(154) = -4*M(52)+4*M(70)-2*M(2)-2*M(40)-2*M(76);
    C(70) = 4*M(52)+4*M(70)-2*M(2)-2*M(40)+2*M(76);
    C(168) = -4*M(56)+4*M(20)-2*M(42)-2*M(8)-2*M(80);
    C(60) = 4*M(56)+4*M(20)-2*M(42)+2*M(8)-2*M(80);
    C(155) = -4*M(67)+4*M(49)-2*M(3)-2*M(43)-2*M(79);
    C(71) = 4*M(67)+4*M(49)-2*M(3)+2*M(43)-2*M(79);
    C(182) = -2*M(75)-2*M(7)-2*M(43)-4*M(35)+4*M(17);
    C(14) = -2*M(75)-2*M(7)+2*M(43)+4*M(35)+4*M(17);
    C(183) = -2*M(78)-2*M(8)-2*M(44)-4*M(16)+4*M(34);
    C(15) = -2*M(78)+2*M(8)-2*M(44)+4*M(16)+4*M(34);
    C([205, 208]) = -M(2)-M(38)-M(74)+M(4)+M(40)+M(76);
    C([85, 88]) = -M(2)-M(38)+M(74)+M(4)+M(40)-M(76);
    C(28) = -M(2)+M(38)-M(74)-M(4)+M(40)-M(76);
    C(4) = -M(2)+M(38)+M(74)-M(4)+M(40)+M(76);
    C(1) = M(2)-M(38)-M(74)+M(4)-M(40)-M(76);
    C(25) = M(2)-M(38)+M(74)+M(4)-M(40)+M(76);
    C([206, 209]) = -M(3)-M(39)-M(75)+M(7)+M(43)+M(79);
    C(89) = -M(3)-M(39)+M(75)-M(7)-M(43)+M(79);
    C([26, 29]) = -M(3)+M(39)-M(75)+M(7)-M(43)+M(79);
    C(5) = -M(3)+M(39)+M(75)-M(7)+M(43)+M(79);
    C(2) = M(3)-M(39)-M(75)+M(7)-M(43)-M(79);
    C(86) = M(3)+M(39)-M(75)+M(7)+M(43)-M(79);
    C([207, 210]) = -M(6)-M(42)-M(78)+M(8)+M(44)+M(80);
    C(90) = -M(6)-M(42)+M(78)-M(8)-M(44)+M(80);
    C(27) = -M(6)+M(42)-M(78)-M(8)+M(44)-M(80);
    C([3, 6]) = M(6)-M(42)-M(78)-M(8)+M(44)+M(80);
    C(30) = M(6)-M(42)+M(78)+M(8)-M(44)+M(80);
    C(87) = M(6)+M(42)-M(78)+M(8)+M(44)-M(80);
    C(11) = -2*M(12)-2*M(30)-2*M(6)+2*M(42)+2*M(78)-2*M(16)-2*M(34);
    C(203) = -2*M(12)+2*M(30)+2*M(6)+2*M(42)+2*M(78)+2*M(16)-2*M(34);
    C(149) = 2*M(12)-2*M(30)-2*M(6)-2*M(42)+2*M(78)+2*M(16)-2*M(34);
    C(23) = 2*M(12)+2*M(30)+2*M(6)-2*M(42)+2*M(78)-2*M(16)-2*M(34);
    C(20) = -2*M(16)-2*M(34)-2*M(8)+2*M(44)-2*M(80)+2*M(12)+2*M(30);
    C(146) = -2*M(16)+2*M(34)-2*M(8)-2*M(44)+2*M(80)-2*M(12)+2*M(30);
    C(200) = 2*M(16)-2*M(34)+2*M(8)+2*M(44)+2*M(80)-2*M(12)+2*M(30);
    C(8) = 2*M(16)+2*M(34)+2*M(8)-2*M(44)-2*M(80)+2*M(12)+2*M(30);
    C(24) = -2*M(17)-2*M(35)-2*M(15)-2*M(33)+2*M(3)-2*M(39)+2*M(75);
    C(12) = -2*M(17)-2*M(35)+2*M(15)+2*M(33)-2*M(3)+2*M(39)+2*M(75);
    C(204) = 2*M(17)-2*M(35)-2*M(15)+2*M(33)-2*M(3)-2*M(39)-2*M(75);
    C(150) = 2*M(17)-2*M(35)+2*M(15)-2*M(33)+2*M(3)+2*M(39)-2*M(75);
    C(73) = -2*M(22)-2*M(58)-2*M(6)-2*M(42)+2*M(78)+2*M(20)+2*M(56);
    C(34) = -2*M(22)-2*M(58)-2*M(20)-2*M(56)-2*M(8)+2*M(44)+2*M(80);
    C(76) = -2*M(22)-2*M(58)+2*M(20)+2*M(56)+2*M(8)+2*M(44)-2*M(80);
    C(193) = -2*M(22)+2*M(58)-2*M(6)-2*M(42)-2*M(78)+2*M(20)-2*M(56);
    C(112) = -2*M(22)+2*M(58)-2*M(20)+2*M(56)+2*M(8)-2*M(44)+2*M(80);
    C(196) = -2*M(22)+2*M(58)+2*M(20)-2*M(56)-2*M(8)-2*M(44)-2*M(80);
    C(109) = 2*M(22)-2*M(58)+2*M(6)-2*M(42)+2*M(78)+2*M(20)-2*M(56);
    C(31) = 2*M(22)+2*M(58)+2*M(6)-2*M(42)-2*M(78)+2*M(20)+2*M(56);
    C(33) = -2*M(26)-2*M(62)-2*M(4)+2*M(40)+2*M(76)+2*M(24)+2*M(60);
    C(75) = -2*M(26)-2*M(62)+2*M(4)+2*M(40)-2*M(76)-2*M(24)-2*M(60);
    C(36) = -2*M(26)-2*M(62)+2*M(24)+2*M(60)+2*M(2)-2*M(38)-2*M(74);
    C(195) = -2*M(26)+2*M(62)-2*M(4)-2*M(40)-2*M(76)+2*M(24)-2*M(60);
    C(111) = -2*M(26)+2*M(62)+2*M(4)-2*M(40)+2*M(76)-2*M(24)+2*M(60);
    C(198) = -2*M(26)+2*M(62)+2*M(24)-2*M(60)-2*M(2)-2*M(38)-2*M(74);
    C(114) = 2*M(26)-2*M(62)+2*M(24)-2*M(60)+2*M(2)-2*M(38)+2*M(74);
    C(78) = 2*M(26)+2*M(62)+2*M(24)+2*M(60)-2*M(2)-2*M(38)+2*M(74);
    C(95) = -2*M(48)+2*M(66)+2*M(4)-2*M(40)-2*M(76)-2*M(52)+2*M(70);
    C(191) = -2*M(48)+2*M(66)+2*M(4)+2*M(40)+2*M(76)+2*M(52)-2*M(70);
    C(83) = 2*M(48)+2*M(66)-2*M(4)-2*M(40)+2*M(76)+2*M(52)+2*M(70);
    C(53) = 2*M(48)+2*M(66)-2*M(4)+2*M(40)-2*M(76)-2*M(52)-2*M(70);
    C(49) = -2*M(49)-2*M(67)-2*M(47)-2*M(65)+2*M(3)-2*M(39)+2*M(75);
    C(79) = -2*M(49)-2*M(67)+2*M(47)+2*M(65)+2*M(3)+2*M(39)-2*M(75);
    C(82) = -2*M(49)-2*M(67)+2*M(47)+2*M(65)-2*M(7)-2*M(43)+2*M(79);
    C(94) = -2*M(49)+2*M(67)-2*M(47)+2*M(65)-2*M(7)+2*M(43)+2*M(79);
    C(187) = 2*M(49)-2*M(67)-2*M(47)+2*M(65)-2*M(3)-2*M(39)-2*M(75);
    C(190) = 2*M(49)-2*M(67)-2*M(47)+2*M(65)-2*M(7)-2*M(43)-2*M(79);
    C(91) = 2*M(49)-2*M(67)+2*M(47)-2*M(65)-2*M(3)+2*M(39)+2*M(75);
    C(52) = 2*M(49)+2*M(67)+2*M(47)+2*M(65)-2*M(7)+2*M(43)-2*M(79);
    C(50) = -2*M(52)-2*M(70)+2*M(2)-2*M(38)+2*M(74)+2*M(48)+2*M(66);
    C(80) = -2*M(52)-2*M(70)+2*M(2)+2*M(38)-2*M(74)-2*M(48)-2*M(66);
    C(92) = 2*M(52)-2*M(70)+2*M(2)-2*M(38)-2*M(74)+2*M(48)-2*M(66);
    C(188) = 2*M(52)-2*M(70)+2*M(2)+2*M(38)+2*M(74)-2*M(48)+2*M(66);
    C(9) = -2*M(79)-2*M(17)-2*M(35)+2*M(15)+2*M(33)+2*M(7)-2*M(43);
    C(147) = -2*M(79)-2*M(17)+2*M(35)-2*M(15)+2*M(33)+2*M(7)+2*M(43);
    C(201) = -2*M(79)+2*M(17)-2*M(35)-2*M(15)+2*M(33)-2*M(7)-2*M(43);
    C(21) = -2*M(79)+2*M(17)+2*M(35)+2*M(15)+2*M(33)-2*M(7)+2*M(43);
    C(13) = -2*M(2)+2*M(38)-2*M(4)+2*M(40)-4*M(10)+4*M(32)+4*M(14)-4*M(28);
    C([181, 184]) = 2*M(2)+2*M(38)-2*M(4)-2*M(40)+4*M(10)-4*M(32)+4*M(14)-4*M(28);
    C(56) = -2*M(3)+2*M(75)-2*M(7)+2*M(79)+4*M(63)-4*M(19)+4*M(27)-4*M(55);
    C([164, 167]) = 2*M(3)+2*M(75)-2*M(7)-2*M(79)-4*M(63)+4*M(19)+4*M(27)-4*M(55);
    C(16) = -4*M(14)+4*M(28)-4*M(32)+4*M(10)+2*M(2)-2*M(38)+2*M(4)-2*M(40);
    C(59) = -4*M(27)+4*M(55)-4*M(63)+4*M(19)+2*M(3)-2*M(75)+2*M(7)-2*M(79);
    C(69) = -2*M(42)+2*M(78)-2*M(44)+2*M(80)-4*M(50)+4*M(72)+4*M(54)-4*M(68);
    C([153, 156]) = 2*M(42)+2*M(78)-2*M(44)-2*M(80)+4*M(50)-4*M(72)+4*M(54)-4*M(68);
    C(72) = -4*M(54)+4*M(68)+4*M(50)-4*M(72)+2*M(42)-2*M(78)+2*M(44)-2*M(80);
    C(19) = -2*M(13)-2*M(31)-2*M(5)+2*M(41)-2*M(77)+2*M(1)-2*M(37)+2*M(73)-2*M(11)-2*M(29);
    C(10) = -2*M(13)-2*M(31)-2*M(5)+2*M(41)+2*M(77)+2*M(1)-2*M(37)-2*M(73)-2*M(11)-2*M(29);
    C([145, 148]) = -2*M(13)+2*M(31)-2*M(5)-2*M(41)+2*M(77)-2*M(1)-2*M(37)+2*M(73)+2*M(11)-2*M(29);
    C([199, 202]) = 2*M(13)-2*M(31)+2*M(5)+2*M(41)+2*M(77)+2*M(1)+2*M(37)+2*M(73)-2*M(11)+2*M(29);
    C(7) = 2*M(13)+2*M(31)+2*M(5)-2*M(41)-2*M(77)-2*M(1)+2*M(37)+2*M(73)+2*M(11)+2*M(29);
    C(22) = 2*M(13)+2*M(31)+2*M(5)-2*M(41)+2*M(77)-2*M(1)+2*M(37)-2*M(73)+2*M(11)+2*M(29);
    C(74) = -2*M(25)-2*M(61)-2*M(9)-2*M(45)+2*M(81)+2*M(1)+2*M(37)-2*M(73)-2*M(21)-2*M(57);
    C([194, 197]) = -2*M(25)+2*M(61)-2*M(9)-2*M(45)-2*M(81)-2*M(1)-2*M(37)-2*M(73)+2*M(21)-2*M(57);
    C([110, 113]) = 2*M(25)-2*M(61)+2*M(9)-2*M(45)+2*M(81)+2*M(1)-2*M(37)+2*M(73)-2*M(21)+2*M(57);
    C(32) = 2*M(25)+2*M(61)+2*M(9)-2*M(45)-2*M(81)-2*M(1)+2*M(37)+2*M(73)+2*M(21)+2*M(57);
    C(81) = -2*M(53)-2*M(71)-2*M(9)-2*M(45)+2*M(81)+2*M(5)+2*M(41)-2*M(77)-2*M(51)-2*M(69);
    C(54) = -2*M(53)-2*M(71)+2*M(9)-2*M(45)+2*M(81)-2*M(5)+2*M(41)-2*M(77)-2*M(51)-2*M(69);
    C([93, 96]) = -2*M(53)+2*M(71)+2*M(9)-2*M(45)-2*M(81)+2*M(5)-2*M(41)-2*M(77)+2*M(51)-2*M(69);
    C([189, 192]) = 2*M(53)-2*M(71)+2*M(9)+2*M(45)+2*M(81)+2*M(5)+2*M(41)+2*M(77)-2*M(51)+2*M(69);
    C(51) = 2*M(53)+2*M(71)-2*M(9)+2*M(45)-2*M(81)+2*M(5)-2*M(41)+2*M(77)+2*M(51)+2*M(69);
    C(84) = 2*M(53)+2*M(71)+2*M(9)+2*M(45)-2*M(81)-2*M(5)-2*M(41)+2*M(77)+2*M(51)+2*M(69);
    C(35) = -2*M(73)-2*M(21)-2*M(57)-2*M(25)-2*M(61)-2*M(9)+2*M(45)+2*M(81)+2*M(1)-2*M(37);
    C(77) = 2*M(73)+2*M(21)+2*M(57)+2*M(25)+2*M(61)+2*M(9)+2*M(45)-2*M(81)-2*M(1)-2*M(37);
    C(161) = -2*M(12)-2*M(30)-4*M(22)+4*M(58)-2*M(6)-2*M(42)-2*M(78)+2*M(16)+2*M(34)-4*M(54)+4*M(72)-4*M(46)+4*M(64);
    C(119) = -2*M(12)+2*M(30)+4*M(22)+4*M(58)+2*M(6)-2*M(42)-2*M(78)-2*M(16)+2*M(34)-4*M(54)+4*M(72)+4*M(46)-4*M(64);
    C(131) = 2*M(12)-2*M(30)-4*M(22)+4*M(58)-2*M(6)+2*M(42)-2*M(78)-2*M(16)+2*M(34)-4*M(54)-4*M(72)-4*M(46)-4*M(64);
    C(65) = 2*M(12)+2*M(30)+4*M(22)+4*M(58)+2*M(6)+2*M(42)-2*M(78)+2*M(16)+2*M(34)-4*M(54)-4*M(72)+4*M(46)+4*M(64);
    C(62) = -2*M(16)-2*M(34)-2*M(8)-2*M(44)+2*M(80)+4*M(54)+4*M(72)-4*M(46)-4*M(64)-4*M(20)-4*M(56)-2*M(12)-2*M(30);
    C(128) = -2*M(16)+2*M(34)-2*M(8)+2*M(44)-2*M(80)-4*M(54)-4*M(72)-4*M(46)-4*M(64)+4*M(20)-4*M(56)+2*M(12)-2*M(30);
    C(116) = 2*M(16)-2*M(34)+2*M(8)-2*M(44)-2*M(80)+4*M(54)-4*M(72)-4*M(46)+4*M(64)+4*M(20)+4*M(56)+2*M(12)-2*M(30);
    C(158) = 2*M(16)+2*M(34)+2*M(8)+2*M(44)+2*M(80)-4*M(54)+4*M(72)-4*M(46)+4*M(64)-4*M(20)+4*M(56)-2*M(12)-2*M(30);
    C(132) = -2*M(17)+2*M(35)+4*M(27)-4*M(63)-4*M(23)+4*M(59)-2*M(15)+2*M(33)-4*M(47)-4*M(65)+2*M(3)-2*M(39)+2*M(75);
    C(120) = -2*M(17)+2*M(35)+4*M(27)+4*M(63)+4*M(23)+4*M(59)+2*M(15)-2*M(33)+4*M(47)-4*M(65)-2*M(3)+2*M(39)+2*M(75);
    C(66) = 2*M(17)+2*M(35)-4*M(27)-4*M(63)+4*M(23)+4*M(59)+2*M(15)+2*M(33)+4*M(47)+4*M(65)+2*M(3)+2*M(39)-2*M(75);
    C(162) = 2*M(17)+2*M(35)-4*M(27)+4*M(63)-4*M(23)+4*M(59)-2*M(15)-2*M(33)-4*M(47)+4*M(65)-2*M(3)-2*M(39)-2*M(75);
    C(43) = -2*M(22)-2*M(58)+4*M(50)+4*M(68)-2*M(6)+2*M(42)-2*M(78)-4*M(46)-4*M(64)-2*M(20)-2*M(56)-4*M(12)-4*M(30);
    C(97) = -2*M(22)+2*M(58)+4*M(50)-4*M(68)-2*M(6)+2*M(42)+2*M(78)-4*M(46)+4*M(64)-2*M(20)+2*M(56)-4*M(12)-4*M(30);
    C(100) = 2*M(22)-2*M(58)-4*M(50)+4*M(68)+4*M(46)-4*M(64)+2*M(20)-2*M(56)-4*M(16)-4*M(34)-2*M(8)+2*M(44)+2*M(80);
    C(139) = 2*M(22)-2*M(58)+4*M(50)+4*M(68)+2*M(6)+2*M(42)-2*M(78)+4*M(46)+4*M(64)-2*M(20)+2*M(56)-4*M(12)+4*M(30);
    C(142) = 2*M(22)-2*M(58)+4*M(50)+4*M(68)+4*M(46)+4*M(64)-2*M(20)+2*M(56)+4*M(16)-4*M(34)+2*M(8)+2*M(44)-2*M(80);
    C(46) = 2*M(22)+2*M(58)-4*M(50)-4*M(68)+4*M(46)+4*M(64)+2*M(20)+2*M(56)+4*M(16)+4*M(34)+2*M(8)-2*M(44)+2*M(80);
    C(169) = 2*M(22)+2*M(58)+4*M(50)-4*M(68)+2*M(6)+2*M(42)+2*M(78)+4*M(46)-4*M(64)-2*M(20)-2*M(56)-4*M(12)+4*M(30);
    C(172) = 2*M(22)+2*M(58)+4*M(50)-4*M(68)+4*M(46)-4*M(64)-2*M(20)-2*M(56)-4*M(16)+4*M(34)-2*M(8)-2*M(44)-2*M(80);
    C(48) = -2*M(26)-2*M(62)-4*M(18)-4*M(36)+4*M(14)+4*M(32)-2*M(24)-2*M(60)-2*M(2)+2*M(38)-2*M(74)-4*M(48)-4*M(66);
    C(144) = -2*M(26)+2*M(62)-4*M(18)+4*M(36)+4*M(14)-4*M(32)-2*M(24)+2*M(60)+2*M(2)+2*M(38)-2*M(74)-4*M(48)-4*M(66);
    C(141) = 2*M(26)-2*M(62)+4*M(18)-4*M(36)+2*M(4)+2*M(40)-2*M(76)-4*M(14)+4*M(32)+2*M(24)-2*M(60)-4*M(52)-4*M(70);
    C(99) = 2*M(26)-2*M(62)+4*M(18)+4*M(36)-2*M(4)+2*M(40)+2*M(76)+4*M(14)+4*M(32)-2*M(24)+2*M(60)+4*M(52)-4*M(70);
    C(102) = 2*M(26)-2*M(62)+4*M(18)+4*M(36)+4*M(14)+4*M(32)-2*M(24)+2*M(60)-2*M(2)+2*M(38)+2*M(74)-4*M(48)+4*M(66);
    C(171) = 2*M(26)+2*M(62)+4*M(18)-4*M(36)-2*M(4)-2*M(40)-2*M(76)+4*M(14)-4*M(32)-2*M(24)-2*M(60)-4*M(52)+4*M(70);
    C(174) = 2*M(26)+2*M(62)+4*M(18)-4*M(36)+4*M(14)-4*M(32)-2*M(24)-2*M(60)+2*M(2)+2*M(38)+2*M(74)-4*M(48)+4*M(66);
    C(45) = 2*M(26)+2*M(62)+4*M(18)+4*M(36)+2*M(4)-2*M(40)+2*M(76)-4*M(14)-4*M(32)+2*M(24)+2*M(60)+4*M(52)+4*M(70);
    C(41) = -2*M(48)-2*M(66)+2*M(4)-2*M(40)-2*M(76)-4*M(24)-4*M(60)-2*M(52)-2*M(70)-4*M(18)-4*M(36)+4*M(10)+4*M(28);
    C(179) = -2*M(48)-2*M(66)+2*M(4)+2*M(40)+2*M(76)-4*M(24)+4*M(60)+2*M(52)+2*M(70)-4*M(18)+4*M(36)-4*M(10)+4*M(28);
    C(137) = 2*M(48)-2*M(66)-2*M(4)-2*M(40)+2*M(76)+4*M(24)+4*M(60)+2*M(52)-2*M(70)-4*M(18)+4*M(36)+4*M(10)-4*M(28);
    C(107) = 2*M(48)-2*M(66)-2*M(4)+2*M(40)-2*M(76)+4*M(24)-4*M(60)-2*M(52)+2*M(70)-4*M(18)-4*M(36)-4*M(10)-4*M(28);
    C(40) = -2*M(49)-2*M(67)-4*M(23)-4*M(59)+4*M(19)+4*M(55)-2*M(47)-2*M(65)+2*M(7)-2*M(43)-2*M(79)-4*M(17)-4*M(35);
    C(103) = -2*M(49)+2*M(67)-4*M(23)+4*M(59)-4*M(15)-4*M(33)+4*M(19)-4*M(55)-2*M(47)+2*M(65)+2*M(3)-2*M(39)+2*M(75);
    C(133) = -2*M(49)+2*M(67)+4*M(23)+4*M(59)+4*M(15)-4*M(33)+4*M(19)+4*M(55)+2*M(47)-2*M(65)+2*M(3)+2*M(39)-2*M(75);
    C(136) = -2*M(49)+2*M(67)+4*M(23)+4*M(59)+4*M(19)+4*M(55)+2*M(47)-2*M(65)+2*M(7)+2*M(43)-2*M(79)-4*M(17)+4*M(35);
    C(106) = 2*M(49)-2*M(67)+4*M(23)-4*M(59)-4*M(19)+4*M(55)+2*M(47)-2*M(65)+2*M(7)-2*M(43)+2*M(79)-4*M(17)-4*M(35);
    C(175) = 2*M(49)+2*M(67)-4*M(23)+4*M(59)-4*M(15)+4*M(33)-4*M(19)+4*M(55)-2*M(47)-2*M(65)-2*M(3)-2*M(39)-2*M(75);
    C(178) = 2*M(49)+2*M(67)-4*M(23)+4*M(59)-4*M(19)+4*M(55)-2*M(47)-2*M(65)+2*M(7)+2*M(43)+2*M(79)-4*M(17)+4*M(35);
    C(37) = 2*M(49)+2*M(67)+4*M(23)+4*M(59)+4*M(15)+4*M(33)-4*M(19)-4*M(55)+2*M(47)+2*M(65)-2*M(3)+2*M(39)+2*M(75);
    C(104) = -2*M(52)+2*M(70)-4*M(26)+4*M(62)-4*M(18)-4*M(36)-4*M(10)-4*M(28)-2*M(2)+2*M(38)-2*M(74)+2*M(48)-2*M(66);
    C(134) = -2*M(52)+2*M(70)+4*M(26)+4*M(62)+4*M(18)-4*M(36)-4*M(10)+4*M(28)-2*M(2)-2*M(38)+2*M(74)-2*M(48)+2*M(66);
    C(176) = 2*M(52)+2*M(70)-4*M(26)+4*M(62)-4*M(18)+4*M(36)-4*M(10)+4*M(28)-2*M(2)-2*M(38)-2*M(74)-2*M(48)-2*M(66);
    C(38) = 2*M(52)+2*M(70)+4*M(26)+4*M(62)+4*M(18)+4*M(36)-4*M(10)-4*M(28)-2*M(2)+2*M(38)+2*M(74)+2*M(48)+2*M(66);
    C(63) = 2*M(79)-2*M(17)-2*M(35)+4*M(27)+4*M(63)-4*M(49)-4*M(67)-4*M(23)-4*M(59)-2*M(15)-2*M(33)-2*M(7)-2*M(43);
    C(117) = 2*M(79)-2*M(17)+2*M(35)+4*M(27)+4*M(63)-4*M(49)+4*M(67)+4*M(23)+4*M(59)+2*M(15)-2*M(33)-2*M(7)+2*M(43);
    C(129) = 2*M(79)+2*M(17)-2*M(35)-4*M(27)+4*M(63)-4*M(49)-4*M(67)+4*M(23)-4*M(59)+2*M(15)-2*M(33)+2*M(7)-2*M(43);
    C(159) = 2*M(79)+2*M(17)+2*M(35)-4*M(27)+4*M(63)-4*M(49)+4*M(67)-4*M(23)+4*M(59)-2*M(15)-2*M(33)+2*M(7)+2*M(43);
    C(61) = -2*M(13)-2*M(31)-2*M(5)-2*M(41)+2*M(77)+4*M(51)+4*M(69)+2*M(1)+2*M(37)-2*M(73)+2*M(11)+2*M(29)-4*M(21)-4*M(57);
    C(64) = -2*M(13)-2*M(31)+2*M(5)+2*M(41)-2*M(77)-2*M(1)-2*M(37)+2*M(73)+2*M(11)+2*M(29)+4*M(25)+4*M(61)-4*M(53)-4*M(71);
    C(127) = -2*M(13)+2*M(31)-2*M(5)+2*M(41)-2*M(77)-4*M(51)-4*M(69)-2*M(1)+2*M(37)-2*M(73)-2*M(11)+2*M(29)+4*M(21)-4*M(57);
    C(118) = -2*M(13)+2*M(31)+2*M(5)-2*M(41)-2*M(77)+2*M(1)-2*M(37)-2*M(73)-2*M(11)+2*M(29)-4*M(25)-4*M(61)-4*M(53)+4*M(71);
    C(130) = 2*M(13)-2*M(31)-2*M(5)+2*M(41)-2*M(77)-2*M(1)+2*M(37)-2*M(73)+2*M(11)-2*M(29)-4*M(25)+4*M(61)-4*M(53)-4*M(71);
    C(115) = 2*M(13)-2*M(31)+2*M(5)-2*M(41)-2*M(77)+4*M(51)-4*M(69)+2*M(1)-2*M(37)-2*M(73)+2*M(11)-2*M(29)-4*M(21)-4*M(57);
    C(160) = 2*M(13)+2*M(31)-2*M(5)-2*M(41)-2*M(77)+2*M(1)+2*M(37)+2*M(73)-2*M(11)-2*M(29)+4*M(25)-4*M(61)-4*M(53)+4*M(71);
    C(157) = 2*M(13)+2*M(31)+2*M(5)+2*M(41)+2*M(77)-4*M(51)+4*M(69)-2*M(1)-2*M(37)-2*M(73)-2*M(11)-2*M(29)+4*M(21)-4*M(57);
    C(44) = -2*M(25)-2*M(61)+4*M(53)+4*M(71)-2*M(9)+2*M(45)-2*M(81)+2*M(1)-2*M(37)+2*M(73)-4*M(11)-4*M(29)+2*M(21)+2*M(57);
    C(98) = -2*M(25)+2*M(61)+4*M(53)-4*M(71)-2*M(9)+2*M(45)+2*M(81)-2*M(1)+2*M(37)+2*M(73)+4*M(11)+4*M(29)-2*M(21)+2*M(57);
    C(140) = 2*M(25)-2*M(61)+4*M(53)+4*M(71)+2*M(9)+2*M(45)-2*M(81)+2*M(1)+2*M(37)-2*M(73)-4*M(11)+4*M(29)+2*M(21)-2*M(57);
    C(170) = 2*M(25)+2*M(61)+4*M(53)-4*M(71)+2*M(9)+2*M(45)+2*M(81)-2*M(1)-2*M(37)-2*M(73)+4*M(11)-4*M(29)-2*M(21)-2*M(57);
    C(42) = -2*M(53)-2*M(71)-2*M(9)+2*M(45)+2*M(81)+2*M(5)-2*M(41)-2*M(77)+2*M(51)+2*M(69)+4*M(11)+4*M(29)-4*M(21)-4*M(57);
    C(39) = -2*M(53)-2*M(71)+2*M(9)-2*M(45)-2*M(81)-4*M(13)-4*M(31)-2*M(5)+2*M(41)+2*M(77)+2*M(51)+2*M(69)+4*M(25)+4*M(61);
    C(135) = -2*M(53)+2*M(71)-2*M(9)-2*M(45)+2*M(81)-4*M(13)+4*M(31)-2*M(5)-2*M(41)+2*M(77)-2*M(51)+2*M(69)-4*M(25)-4*M(61);
    C(108) = -2*M(53)+2*M(71)-2*M(9)+2*M(45)-2*M(81)-2*M(5)+2*M(41)-2*M(77)-2*M(51)+2*M(69)-4*M(11)-4*M(29)+4*M(21)-4*M(57);
    C(138) = 2*M(53)-2*M(71)-2*M(9)-2*M(45)+2*M(81)-2*M(5)-2*M(41)+2*M(77)+2*M(51)-2*M(69)+4*M(11)-4*M(29)-4*M(21)-4*M(57);
    C(105) = 2*M(53)-2*M(71)-2*M(9)+2*M(45)-2*M(81)-4*M(13)-4*M(31)-2*M(5)+2*M(41)-2*M(77)+2*M(51)-2*M(69)-4*M(25)+4*M(61);
    C(180) = 2*M(53)+2*M(71)-2*M(9)-2*M(45)-2*M(81)+2*M(5)+2*M(41)+2*M(77)-2*M(51)-2*M(69)-4*M(11)+4*M(29)+4*M(21)-4*M(57);
    C(177) = 2*M(53)+2*M(71)+2*M(9)+2*M(45)+2*M(81)-4*M(13)+4*M(31)-2*M(5)-2*M(41)-2*M(77)-2*M(51)-2*M(69)+4*M(25)-4*M(61);
    C(143) = -2*M(73)-2*M(21)+2*M(57)+4*M(13)-4*M(31)+4*M(51)+4*M(69)-2*M(25)+2*M(61)+2*M(9)+2*M(45)-2*M(81)+2*M(1)+2*M(37);
    C(47) = -2*M(73)+2*M(21)+2*M(57)+4*M(13)+4*M(31)-4*M(51)-4*M(69)-2*M(25)-2*M(61)+2*M(9)-2*M(45)+2*M(81)-2*M(1)+2*M(37);
    C(173) = 2*M(73)-2*M(21)-2*M(57)+4*M(13)-4*M(31)+4*M(51)-4*M(69)+2*M(25)+2*M(61)-2*M(9)-2*M(45)-2*M(81)+2*M(1)+2*M(37);
    C(101) = 2*M(73)+2*M(21)-2*M(57)+4*M(13)+4*M(31)-4*M(51)+4*M(69)+2*M(25)-2*M(61)-2*M(9)+2*M(45)+2*M(81)-2*M(1)+2*M(37);

    C = C./repmat(sqrt(sum(C.*conj(C),2)),1,size(C,2));

end