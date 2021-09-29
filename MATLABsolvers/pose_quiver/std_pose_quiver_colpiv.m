% Input: coefficient matrix C of size 4x18

% Monomial vector: [x^2*w, y^2*w, z*x*w, z*y*w, z^2*w, x*w, x^2, y*w, x*y, y^2, x*z, y*z, z^2, w, x, y, z, 1]

function [w, x, y, z] = std_pose_quiver_colpiv(C)

    M = zeros(65,85);

    M([133, 521, 591, 652, 719, 788, 1052, 1370, 1957, 2155, 3259, 3326, 3458, 3849]) = C(1);
    M([263, 914, 2021, 2087, 2218, 2285, 2417, 2676, 3389, 3588, 4109]) = C(5);
    M([458, 976, 1046, 1107, 1174, 1243, 1312, 1695, 2347, 2480, 3649, 3716, 3783, 4434]) = C(17);
    M([2343, 2541, 2607, 2738, 2805, 2872, 3066, 3316, 3382, 3514, 3970, 4039, 4368, 4889]) = C(33);
    M([1238, 1566, 1763, 1832, 2737, 2870, 3446, 3512, 3644, 4165, 4234, 4366, 4498, 5019]) = C(41);
    M([2473, 2736, 2802, 2868, 2935, 3002, 3131, 3511, 3577, 3709, 4295, 4364, 4563, 5084]) = C(45);
    M([1303, 1761, 1828, 1897, 2867, 3000, 3641, 3707, 3774, 4425, 4494, 4561, 4628, 5149]) = C(49);
    M([1693, 3841, 3972, 4168, 4300, 4432, 4689, 4821, 4953, 5214]) = C(53);
    M([3643, 3836, 3906, 3967, 4037, 4164, 4233, 4365, 4497, 4685, 4754, 4886, 5018, 5279]) = C(57);
    M([3062, 3130, 3196, 3708, 3966, 4036, 4097, 4294, 4363, 4562, 4815, 4884, 5083, 5344]) = C(61);
    M([3773, 4161, 4231, 4292, 4362, 4424, 4493, 4560, 4627, 4945, 5014, 5081, 5148, 5409]) = C(65);
    M([4423, 4681, 4751, 4812, 4882, 4944, 5013, 5080, 5147, 5205, 5274, 5341, 5408, 5474]) = C(69);
    M([15, 82, 146, 213, 345, 803, 864, 996, 1065, 1264, 1517, 2169, 2367, 3471, 3538, 3670, 4191]) = C(10);
    M([861, 928, 1125, 1646, 3338, 3404, 3535, 3602, 3734, 3991, 4123, 4320, 4841]) = C(30);
    M([2030, 2097, 2161, 2228, 2360, 2558, 2624, 2755, 2822, 2889, 3083, 3399, 3531, 3987, 4056, 4385, 4906]) = C(34);
    M([1056, 1255, 1583, 1780, 1849, 2160, 2227, 2358, 2754, 2887, 3529, 3661, 4182, 4251, 4383, 4515, 5036]) = C(42);
    M([2225, 2292, 2356, 2423, 2490, 2753, 2819, 2885, 2952, 3019, 3148, 3594, 3726, 4312, 4381, 4580, 5101]) = C(46);
    M([1251, 1320, 1778, 1845, 1914, 2355, 2422, 2488, 2884, 3017, 3724, 3791, 4442, 4511, 4578, 4645, 5166]) = C(50);
    M([3330, 3397, 3461, 3528, 3660, 3923, 3984, 4054, 4181, 4250, 4382, 4514, 4702, 4771, 4903, 5035, 5296]) = C(58);
    M([2682, 3079, 3147, 3213, 3395, 3526, 3593, 3725, 4053, 4114, 4311, 4380, 4579, 4832, 4901, 5100, 5361]) = C(62);
    M([3525, 3592, 3656, 3723, 3790, 4248, 4309, 4379, 4441, 4510, 4577, 4644, 4962, 5031, 5098, 5165, 5426]) = C(66);
    M([3980, 4112, 4176, 4308, 4440, 4768, 4829, 4899, 4961, 5030, 5097, 5164, 5222, 5291, 5358, 5425, 5491]) = C(70);
    M([32, 98, 229, 296, 428, 880, 947, 1144, 1665, 2186, 2252, 2383, 2450, 2517, 3554, 3621, 3753, 4339]) = C(15);
    M([552, 683, 749, 881, 1013, 1400, 1467, 1534, 3291, 3357, 3488, 3555, 3687, 3879, 4011, 4208, 4729]) = C(23);
    M([1982, 2048, 2179, 2246, 2378, 2576, 2642, 2773, 2840, 2907, 3101, 3350, 3417, 3549, 4005, 4074, 4403, 4924]) = C(35);
    M([812, 1074, 1273, 1601, 1798, 1867, 2178, 2376, 2772, 2905, 3480, 3547, 3679, 4200, 4269, 4401, 4533, 5054]) = C(43);
    M([2177, 2243, 2374, 2441, 2508, 2771, 2837, 2903, 2970, 3037, 3166, 3545, 3612, 3744, 4330, 4399, 4598, 5119]) = C(47);
    M([1072, 1269, 1338, 1796, 1863, 1932, 2373, 2506, 2902, 3035, 3675, 3742, 3809, 4460, 4529, 4596, 4663, 5184]) = C(51);
    M([3282, 3348, 3479, 3546, 3678, 3870, 3941, 4002, 4072, 4199, 4268, 4400, 4532, 4720, 4789, 4921, 5053, 5314]) = C(59);
    M([3097, 3165, 3231, 3347, 3413, 3544, 3611, 3743, 4000, 4071, 4132, 4329, 4398, 4597, 4850, 4919, 5118, 5379]) = C(63);
    M([3477, 3543, 3674, 3741, 3808, 4195, 4266, 4327, 4397, 4459, 4528, 4595, 4662, 4980, 5049, 5116, 5183, 5444]) = C(67);
    M([3867, 3998, 4194, 4326, 4458, 4715, 4786, 4847, 4917, 4979, 5048, 5115, 5182, 5240, 5309, 5376, 5443, 5509]) = C(71);
    M([180, 637, 834, 1098, 1416, 1621, 1818, 2003, 2201, 3305, 3372, 3504, 3895, 3962, 4289, 4810]) = C(28);
    M([245, 1481, 2002, 2068, 2199, 2266, 2398, 2791, 2923, 3370, 3437, 3569, 4025, 4092, 4419, 4940]) = C(36);
    M([310, 2067, 2133, 2264, 2331, 2463, 2722, 2856, 2988, 3117, 3184, 3250, 3435, 3634, 4155]) = C(40);
    M([375, 832, 1094, 1293, 1546, 1816, 1883, 2198, 2396, 3500, 3567, 3699, 4220, 4287, 4549, 5070]) = C(44);
    M([440, 1676, 2197, 2263, 2394, 2461, 2528, 2921, 3053, 3565, 3632, 3764, 4350, 4417, 4614, 5135]) = C(48);
    M([505, 1092, 1289, 1358, 1741, 1881, 1948, 2393, 2526, 3695, 3762, 3829, 4480, 4547, 4679, 5200]) = C(52);
    M([1025, 3302, 3368, 3499, 3566, 3698, 3890, 4022, 4219, 4286, 4548, 4740, 4807, 5069, 5330]) = C(60);
    M([1155, 3367, 3433, 3564, 3631, 3763, 4020, 4152, 4349, 4416, 4613, 4870, 4937, 5134, 5395]) = C(64);
    M([1220, 3497, 3563, 3694, 3761, 3828, 4215, 4347, 4479, 4546, 4678, 5000, 5067, 5199, 5460]) = C(68);
    M([1740, 3887, 4018, 4214, 4346, 4478, 4735, 4867, 4999, 5066, 5198, 5260, 5327, 5459, 5525]) = C(72);

    [L,~,Pi] = lu(M(:,1:30));
    Pi = Pi';
    M = [Pi*L Pi(:,31:end)]\M(:,31:end);
    M = M(31:end,:);

    [L,UR,Pi] = lu(M(:,1:20));
    Pi = Pi';
    M = [Pi*L Pi(:,21:end)]\M(:,21:end);
    MP = M(1:20,:);
    NP = M(21:end,:);

    [Q,U,Pi] = qr(NP(:,1:end-5));
    A = UR\[MP(:,1:end-5)*Pi MP(:,end-4:end)];
    B = U(:,1:15)\[U(:,16:end) Q'*NP(:,end-4:end)];
    M = [-A(:,end-19:end)+A(:,1:end-20)*B; -B];

    xP = [36, 37, 38, 39, 40, 41, 42, 43, 44, 2, 45, 3, 46, 47, 5, 48, 6, 49, 8, 50, 51, 52, 12, 13, 14, 53, 17, 18, 54, 21, 25, 26, 55, 29, 33];
    P1 = [(1:30)*Pi 31:35];
    T = getT(M,[36:55 P1(1:end-20)],P1(end-19:end),xP);

    [V,~] = eig(T);
    sol = V([16, 17, 18, 19],:)./(ones(4,1)*V(20,:));

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