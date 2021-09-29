% Input: coefficient matrix C of size 4x27

% Monomial vector: [w*x^2*z*y, w*x*y^2*z, z^3*x*w, w*y*z^3, w*x^2*y, x^3*y, w*x*y^2, y^3*x, x*z^2*w, z^2*x^2, z^2*y*w, z^2*y*x, z^2*y^2, z^4, z*x*w, z*x^2, z*y*w, z*y^2, z^3, x*w, x^2, w*y, x*y, y^2, z^2, z, 1]

function [w, x, y, z] = std_p6pf_refract_colpiv(C)

    M = zeros(126,162);

    M([1, 506, 1389, 2524, 4163, 4292, 4668, 4923, 6181, 6436, 9209, 9714, 11605]) = C(1);
    M([127, 632, 764, 1515, 2650, 4289, 4920, 5175, 6433, 6688, 9335, 9966, 11857]) = C(5);
    M([253, 884, 1767, 2902, 4415, 4544, 5424, 5679, 7063, 9461, 10468, 10722, 13117]) = C(9);
    M([379, 1010, 1142, 1893, 2025, 3028, 4541, 5676, 9587, 10465, 10594, 10974, 13369]) = C(13);
    M([505, 1388, 2523, 3406, 4667, 4922, 6180, 6435, 7693, 7948, 9713, 11604, 14251]) = C(17);
    M([4159, 4664, 4793, 5048, 6177, 6306, 6561, 7690, 7819, 8074, 9839, 11730, 14377]) = C(21);
    M([631, 1514, 2649, 3532, 4919, 5174, 6432, 6687, 7945, 8200, 9965, 11856, 14503]) = C(25);
    M([757, 1646, 2781, 5168, 5297, 6681, 6810, 8194, 8323, 8452, 10343, 12234, 14881]) = C(29);
    M([883, 1766, 2901, 3658, 5423, 5678, 7062, 10467, 10721, 12355, 12484, 13116, 15763]) = C(33);
    M([4411, 5420, 5549, 5804, 7059, 7188, 7317, 8575, 10847, 12352, 12610, 13242, 15889]) = C(37);
    M([1009, 1892, 2024, 3027, 3784, 5675, 10464, 10593, 10973, 12481, 12736, 13368, 16015]) = C(41);
    M([4537, 5672, 5801, 5930, 7314, 7443, 10461, 11099, 12478, 12607, 12862, 13494, 16141]) = C(45);
    M([1135, 2018, 2150, 3159, 5927, 7440, 10587, 11225, 12730, 12859, 12988, 13620, 16267]) = C(49);
    M([1261, 2270, 2402, 3285, 6053, 7566, 11343, 11477, 13738, 13867, 13996, 14124, 16771]) = C(53);
    M([1765, 2900, 3657, 3910, 7061, 8701, 10466, 12354, 12483, 13115, 15130, 15762, 17527]) = C(57);
    M([5419, 7058, 7187, 7316, 8574, 8698, 8827, 12351, 12609, 13241, 15256, 15888, 17653]) = C(61);
    M([1891, 3026, 3783, 4036, 10463, 10592, 12480, 12735, 13367, 15127, 15382, 16014, 17779]) = C(65);
    M([2017, 3158, 7439, 10586, 12729, 12858, 12987, 13619, 15376, 15505, 15634, 16266, 18031]) = C(69);
    M([2269, 3284, 7565, 11342, 13737, 13866, 13995, 14123, 16384, 16513, 16642, 16770, 18535]) = C(73);
    M([2899, 3656, 3909, 8700, 8953, 12353, 12482, 15129, 15761, 16894, 17526, 18661]) = C(77);
    M([7057, 8573, 8697, 8826, 8950, 9079, 12350, 12608, 15255, 15887, 17020, 17652, 18787]) = C(81);
    M([3025, 3782, 4035, 12479, 12734, 15126, 15381, 16013, 16891, 17146, 17778, 18913]) = C(85);
    M([10459, 12476, 12605, 12860, 15123, 15252, 15507, 16139, 16888, 17017, 17272, 17904, 19039]) = C(89);
    M([10585, 12728, 12857, 12986, 15375, 15504, 15633, 16265, 17140, 17269, 17398, 18030, 19165]) = C(93);
    M([13735, 16382, 16511, 16640, 18147, 18276, 18405, 18533, 19282, 19411, 19540, 19668, 20173]) = C(101);
    M([16381, 18146, 18275, 18404, 19281, 19410, 19539, 19667, 19786, 19915, 20044, 20172, 20299]) = C(105);
    M([45, 298, 547, 906, 1430, 1789, 2549, 2934, 3691, 3925, 4206, 4334, 4459, 4583, 4704, 4965, 5444, 5697, 6215, 6447, 6970, 7076, 8710, 9226, 9356, 9483, 9717, 9993, 10480, 10744, 11615, 11875, 12383, 12512, 13134, 15138, 15767, 17528]) = C(58);
    M([675, 1054, 1555, 1914, 2063, 2690, 3049, 3557, 3816, 4069, 4962, 5216, 5719, 6468, 6729, 7979, 8211, 9982, 10238, 10484, 10611, 10995, 11632, 11859, 12135, 12494, 12748, 13390, 14513, 14773, 15155, 15410, 16032, 16900, 17154, 17783, 18914]) = C(86);
    M([4329, 4582, 4957, 5088, 5342, 5694, 5845, 5969, 6470, 6594, 6855, 7334, 7461, 7967, 8105, 8337, 10108, 10364, 10483, 11121, 11758, 11985, 12261, 12510, 12620, 12874, 13516, 14639, 14899, 15157, 15281, 15536, 16158, 16903, 17026, 17280, 17909, 19040]) = C(90);
    M([1306, 2292, 2441, 3303, 4581, 5713, 5844, 5972, 6097, 7350, 7485, 7586, 10502, 11116, 11246, 11365, 11499, 12503, 12641, 12873, 13270, 13497, 13647, 13770, 13880, 14008, 14146, 16151, 16285, 16417, 16541, 16670, 16788, 18163, 18286, 18414, 18539, 19670]) = C(98);
    M([2314, 3323, 5715, 7356, 7484, 7609, 10501, 11364, 12518, 12642, 12903, 13510, 13640, 13759, 13886, 14013, 14145, 15149, 15287, 15519, 15916, 16143, 16293, 16416, 16526, 16654, 16792, 17915, 18049, 18181, 18305, 18434, 18552, 19297, 19420, 19548, 19673, 20174]) = C(102);
    M([10503, 11386, 12517, 12648, 12902, 13758, 13909, 14033, 15164, 15288, 15549, 16156, 16286, 16405, 16532, 16659, 16791, 16913, 17051, 17283, 17680, 17907, 18057, 18180, 18290, 18418, 18556, 19049, 19183, 19315, 19439, 19568, 19686, 19801, 19924, 20052, 20177, 20300]) = C(106);
    M([208, 461, 710, 843, 1070, 1218, 1593, 1953, 2081, 2713, 3097, 3854, 4089, 4369, 4622, 4993, 5254, 5734, 6504, 6737, 9275, 9390, 9646, 10007, 10282, 10516, 10644, 11033, 11905, 12165, 12546, 12801, 13424, 15174, 15428, 16057, 17818]) = C(67);
    M([586, 965, 1466, 1826, 2601, 2961, 3469, 3727, 3980, 4747, 5001, 5504, 5754, 6253, 6514, 7007, 7120, 7764, 7997, 8766, 9000, 9768, 10523, 10780, 11645, 11920, 12406, 12534, 13175, 14299, 14559, 15195, 15818, 16940, 17569, 18700]) = C(79);
    M([4366, 4619, 4994, 5125, 5379, 5732, 5882, 6006, 6507, 6631, 6892, 7372, 7499, 8005, 8142, 8375, 9905, 10146, 10521, 11158, 12023, 12298, 12547, 12658, 12912, 13553, 14677, 14937, 15194, 15318, 15573, 16196, 16941, 17064, 17318, 17947, 19078]) = C(91);
    M([1343, 2330, 2478, 3341, 4618, 5750, 5881, 6009, 6134, 7387, 7522, 7624, 10539, 10913, 11154, 11403, 11536, 12541, 12678, 12911, 13535, 13684, 13807, 13918, 14046, 14183, 16189, 16323, 16454, 16578, 16707, 16826, 18201, 18324, 18452, 18577, 19708]) = C(99);
    M([2351, 3360, 5752, 7393, 7521, 7646, 10538, 11402, 12555, 12679, 12940, 13307, 13548, 13797, 13924, 14051, 14182, 15187, 15324, 15557, 16181, 16330, 16453, 16564, 16692, 16829, 17953, 18087, 18218, 18342, 18471, 18590, 19335, 19458, 19586, 19711, 20212]) = C(103);
    M([10540, 11423, 12554, 12685, 12939, 13796, 13946, 14070, 15201, 15325, 15586, 15953, 16194, 16443, 16570, 16697, 16828, 16951, 17088, 17321, 17945, 18094, 18217, 18328, 18456, 18593, 19087, 19221, 19352, 19476, 19605, 19724, 19839, 19962, 20090, 20215, 20338]) = C(107);
    M([4278, 4531, 4780, 4911, 5165, 5518, 5668, 5918, 6293, 6417, 6678, 7157, 7284, 7411, 7792, 7928, 8160, 8663, 8808, 8932, 9040, 9163, 9806, 9933, 10946, 11701, 11808, 12461, 12697, 13341, 14336, 14463, 14724, 15361, 15983, 17103, 17732, 18863]) = C(84);
    M([4404, 4657, 5032, 5163, 5417, 5770, 5920, 6044, 6545, 6669, 6930, 7410, 7537, 8044, 8180, 8412, 10058, 10185, 10559, 11198, 11953, 12060, 12587, 12695, 12949, 13593, 14588, 14715, 14976, 15234, 15358, 15613, 16235, 16978, 17101, 17355, 17984, 19115]) = C(92);
    M([876, 1255, 1763, 2116, 2264, 2898, 3253, 5284, 5415, 6046, 6797, 6921, 7536, 8296, 8432, 8538, 10310, 10437, 10685, 11324, 12205, 12312, 12839, 12947, 13075, 13719, 14840, 14967, 15102, 15486, 15610, 15739, 16361, 17230, 17353, 17481, 18110, 19241]) = C(96);
    M([1381, 2368, 2516, 3379, 4656, 5788, 5919, 6047, 6172, 7425, 7560, 7662, 10577, 11066, 11193, 11441, 11576, 12580, 12716, 12948, 13465, 13572, 13847, 13955, 14083, 14223, 16100, 16227, 16362, 16494, 16618, 16747, 16865, 18238, 18361, 18489, 18614, 19745]) = C(100);
    M([2389, 3398, 5790, 7431, 7559, 7684, 10576, 11440, 12593, 12717, 12978, 13460, 13587, 13835, 13962, 14089, 14222, 15226, 15362, 15594, 16111, 16218, 16493, 16601, 16729, 16869, 17864, 17991, 18126, 18258, 18382, 18511, 18629, 19372, 19495, 19623, 19748, 20249]) = C(104);
    M([10578, 11461, 12592, 12723, 12977, 13834, 13984, 14108, 15239, 15363, 15624, 16106, 16233, 16481, 16608, 16735, 16868, 16990, 17126, 17358, 17875, 17982, 18257, 18365, 18493, 18633, 18998, 19125, 19260, 19392, 19516, 19645, 19763, 19876, 19999, 20127, 20252, 20375]) = C(108);

    [L,~,Pi] = lu(M(:,1:33));
    Pi = Pi';
    M = [Pi*L Pi(:,34:end)]\M(:,34:end);
    M = M(34:end,:);

    [L,UR,Pi] = lu(M(:,1:40));
    Pi = Pi';
    M = [Pi*L Pi(:,41:end)]\M(:,41:end);
    MP = M(1:40,:);
    NP = M(41:end,:);

    [Q,U,Pi] = qr(NP(:,1:end-5));
    A = UR\[MP(:,1:end-5)*Pi MP(:,end-4:end)];
    B = U(:,1:53)\[U(:,54:end) Q'*NP(:,end-4:end)];
    M = [-A(:,end-35:end)+A(:,1:end-36)*B; -B];

    xP = [90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 1, 2, 100, 101, 102, 103, 104, 3, 105, 106, 107, 108, 109, 110, 111, 112, 5, 6, 7, 8, 10, 113, 114, 11, 115, 116, 13, 14, 16, 117, 118, 119, 120, 121, 122, 123, 124, 20, 21, 22, 23, 25, 26, 125, 27, 28, 30, 32, 33, 35, 38, 41, 42, 43, 44, 46, 126, 127, 48, 49, 51, 53, 54, 56, 59, 128, 129, 62, 63, 65, 67, 68, 70, 73, 76, 77, 79, 82, 86];
    P1 = [(1:84)*Pi 85:89];
    T = getT(M,[90:129 P1(1:end-36)],P1(end-35:end),xP);

    [V,~] = eig(T);
    sol = V([32, 33, 34, 35],:)./(ones(4,1)*V(36,:));

    if(find(isnan( sol(:) )) > 0)
        w = zeros(1,0);
        x = zeros(1,0);
        y = zeros(1,0);
        z = zeros(1,0);
    else
        %I = find(not(imag( sol(1,:) )));
        w = sol(1,:);
        x = sol(2,:);
        y = sol(3,:);
        z = sol(4,:);
    end

end