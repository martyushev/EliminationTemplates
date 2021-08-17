% Input: coefficient matrix C of size 4x80

% Monomial vector: [z^3*w^3, z^3*x*w^2, z^3*w*x^2, z^3*x^3, z^3*y*w^2, z^3*w*x*y, z^3*x^2*y, z^3*w*y^2, z^3*x*y^2, z^3*y^3, z^2*w^3, z^2*w^2*x, z^2*x^2*w, z^2*x^3, y*z^2*w^2, y*x*z^2*w, z^2*x^2*y, y^2*z^2*w, x*y^2*z^2, y^3*z^2, z^3*w^2, z^3*x*w, z^3*x^2, w*y*z^3, z^3*y*x, z^3*y^2, w^3*z, z*w^2*x, z*w*x^2, x^3*z, y*z*w^2, z*w*x*y, z*x^2*y, z*w*y^2, z*y^2*x, z*y^3, z^2*w^2, x*z^2*w, z^2*x^2, z^2*y*w, z^2*y*x, z^2*y^2, z^3*w, z^3*x, z^3*y, w^3, x*w^2, x^2*w, x^3, y*w^2, y*x*w, y*x^2, y^2*w, y^2*x, y^3, z*w^2, z*x*w, z*x^2, z*y*w, z*y*x, z*y^2, z^2*w, z^2*x, z^2*y, z^3, w^2, x*w, x^2, w*y, x*y, y^2, z*w, x*z, z*y, z^2, w, x, y, z, 1]

function [w, x, y, z] = nstd_unsynch_relpose_colpiv(C)

    M = zeros(139,155);

    M([56, 192, 330, 616, 754, 1030, 1435, 1570, 1714, 1988, 2128, 2410, 2834, 2970, 3252, 3629, 3785, 3909, 4203, 4343, 4606, 5052, 5192, 5471, 5896, 6276, 6429, 6556, 6848, 6989, 7253, 7661, 7802, 8082, 8523, 8918, 9071, 9198, 9490, 9631, 9895, 10295, 10435, 10714, 11151, 11543, 11683, 11962, 12398, 12791, 13233, 13356, 13512, 13774, 13914, 14208, 14600, 14736, 15016, 15430]) = C(245);
    M([195, 331, 469, 755, 893, 1169, 1574, 1709, 1853, 2127, 2267, 2549, 2973, 3109, 3391, 3768, 3924, 4048, 4342, 4482, 4745, 5191, 5331, 5610, 6035, 6415, 6568, 6695, 6987, 7128, 7392, 7800, 7941, 8221, 8662, 9057, 9210, 9337, 9629, 9770, 10034, 10434, 10574, 10853, 11290, 11682, 11822, 12101, 12537, 12930, 13372, 13495, 13651, 13913, 14053, 14347, 14739, 14875, 15155, 15569]) = C(249);
    M([612, 748, 886, 1033, 1171, 1308, 1991, 2126, 2270, 2405, 2545, 2688, 3251, 3387, 3530, 4185, 4341, 4465, 4620, 4760, 4884, 5469, 5609, 5749, 6174, 6832, 6985, 7112, 7265, 7406, 7531, 8078, 8219, 8360, 8801, 9474, 9627, 9754, 9907, 10048, 10173, 10712, 10852, 10992, 11429, 11960, 12100, 12240, 12676, 13069, 13789, 13912, 14068, 14191, 14331, 14486, 15017, 15153, 15294, 15708]) = C(253);
    M([1446, 1582, 1720, 2006, 2144, 2420, 3659, 3794, 3938, 4212, 4352, 4634, 5058, 5194, 5476, 6270, 6426, 6550, 6844, 6984, 7247, 7693, 7833, 8112, 8537, 8917, 9070, 9197, 9489, 9630, 9894, 10302, 10443, 10723, 11164, 11546, 11686, 11965, 12402, 12815, 13227, 13380, 13507, 13799, 13940, 14204, 14601, 14741, 15020, 15432, 16013, 16136, 16292, 16554, 16694, 16988, 18770, 18906, 19186, 20434]) = C(285);
    M([1585, 1721, 1859, 2145, 2283, 2559, 3798, 3933, 4077, 4351, 4491, 4773, 5197, 5333, 5615, 6409, 6565, 6689, 6983, 7123, 7386, 7832, 7972, 8251, 8676, 9056, 9209, 9336, 9628, 9769, 10033, 10441, 10582, 10862, 11303, 11685, 11825, 12104, 12541, 12954, 13366, 13519, 13646, 13938, 14079, 14343, 14740, 14880, 15159, 15571, 16152, 16275, 16431, 16693, 16833, 17127, 18909, 19045, 19325, 20573]) = C(289);
    M([2002, 2138, 2276, 2423, 2561, 2698, 4215, 4350, 4494, 4629, 4769, 4912, 5475, 5611, 5754, 6826, 6982, 7106, 7261, 7401, 7525, 8110, 8250, 8390, 8815, 9473, 9626, 9753, 9906, 10047, 10172, 10719, 10860, 11001, 11442, 11963, 12103, 12243, 12680, 13093, 13783, 13936, 14063, 14216, 14357, 14482, 15018, 15158, 15298, 15710, 16569, 16692, 16848, 16971, 17111, 17266, 19187, 19323, 19464, 20712]) = C(293);
    M([2836, 2972, 3110, 3257, 3395, 3532, 5049, 5184, 5328, 5463, 5603, 5746, 5892, 6028, 6171, 7660, 7816, 7940, 8095, 8235, 8359, 8527, 8667, 8807, 10307, 10460, 10587, 10740, 10881, 11006, 11136, 11277, 11418, 11559, 11712, 11839, 11992, 12133, 12258, 12380, 12520, 12660, 12794, 12934, 13074, 14623, 14746, 14902, 15025, 15165, 15320, 15434, 15570, 15711, 15847]) = C(297);
    M([3670, 3806, 3944, 4230, 4368, 4644, 6300, 6435, 6579, 6853, 6993, 7275, 7699, 7835, 8117, 8911, 9067, 9191, 9485, 9625, 9888, 10334, 10474, 10753, 11178, 11553, 11694, 11974, 12415, 12819, 13226, 13379, 13506, 13798, 13939, 14203, 14604, 14744, 15023, 15456, 16007, 16160, 16287, 16579, 16720, 16984, 17403, 17526, 17682, 17944, 18084, 18378, 18771, 18911, 19190, 19604, 19740, 20020, 20436, 20851]) = C(301);
    M([3809, 3945, 4083, 4369, 4507, 4783, 6439, 6574, 6718, 6992, 7132, 7414, 7838, 7974, 8256, 9050, 9206, 9330, 9624, 9764, 10027, 10473, 10613, 10892, 11317, 11692, 11833, 12113, 12554, 12958, 13365, 13518, 13645, 13937, 14078, 14342, 14743, 14883, 15162, 15595, 16146, 16299, 16426, 16718, 16859, 17123, 17542, 17665, 17821, 18083, 18223, 18517, 18910, 19050, 19329, 19743, 19879, 20159, 20575, 20990]) = C(305);
    M([4226, 4362, 4500, 4647, 4785, 4922, 6856, 6991, 7135, 7270, 7410, 7553, 8116, 8252, 8395, 9467, 9623, 9747, 9902, 10042, 10166, 10751, 10891, 11031, 11456, 11970, 12111, 12252, 12693, 13097, 13782, 13935, 14062, 14215, 14356, 14481, 15021, 15161, 15301, 15734, 16563, 16716, 16843, 16996, 17137, 17262, 17959, 18082, 18238, 18361, 18501, 18656, 19188, 19328, 19468, 20021, 20157, 20298, 20714, 21129]) = C(309);
    M([5060, 5196, 5334, 5481, 5619, 5756, 7690, 7825, 7969, 8104, 8244, 8387, 8533, 8669, 8812, 10301, 10457, 10581, 10736, 10876, 11000, 11168, 11308, 11448, 11558, 11711, 11838, 11991, 12132, 12257, 12387, 12528, 12669, 12797, 12937, 13077, 14617, 14770, 14897, 15050, 15191, 15316, 15435, 15575, 15715, 15849, 18793, 18916, 19072, 19195, 19335, 19490, 20438, 20574, 20715, 21268]) = C(313);
    M([7701, 7837, 7975, 8122, 8260, 8397, 10331, 10466, 10610, 10745, 10885, 11028, 11174, 11310, 11453, 11552, 11708, 11832, 11987, 12127, 12251, 12419, 12559, 12699, 12804, 12945, 13086, 14616, 14769, 14896, 15049, 15190, 15315, 15438, 15578, 15718, 15873, 18787, 18940, 19067, 19220, 19361, 19486, 19627, 19750, 19906, 20029, 20169, 20324, 20439, 20579, 20719, 20855, 20991, 21132, 21270, 21407]) = C(317);
    M([104, 240, 378, 1487, 1622, 1766, 2040, 2180, 2882, 3018, 3300, 3689, 3843, 3969, 4261, 4401, 4666, 6336, 6616, 7313, 7721, 7862, 8142, 8575, 8978, 9258, 9955, 10355, 10495, 10774, 11603, 11743, 12022, 12851, 13292, 13416, 13571, 13834, 13974, 14267, 14660, 14796, 15076, 15490]) = C(246);
    M([243, 379, 517, 1626, 1761, 1905, 2179, 2319, 3021, 3157, 3439, 3828, 3982, 4108, 4400, 4540, 4805, 6475, 6755, 7452, 7860, 8001, 8281, 8714, 9117, 9397, 10094, 10494, 10634, 10913, 11742, 11882, 12161, 12990, 13431, 13555, 13710, 13973, 14113, 14406, 14799, 14935, 15215, 15629]) = C(250);
    M([660, 796, 934, 2043, 2178, 2322, 2457, 2597, 3299, 3435, 3578, 4245, 4399, 4525, 4678, 4818, 4944, 6892, 7172, 7591, 8138, 8279, 8420, 8853, 9534, 9814, 10233, 10772, 10912, 11052, 12020, 12160, 12300, 13129, 13848, 13972, 14127, 14251, 14391, 14545, 15077, 15213, 15354, 15768]) = C(254);
    M([1494, 1630, 1768, 3711, 3846, 3990, 4264, 4404, 5106, 5242, 5524, 6330, 6484, 6610, 6902, 7042, 7307, 8977, 9257, 9954, 10362, 10503, 10783, 11216, 11606, 11746, 12025, 13287, 13567, 14264, 14661, 14801, 15080, 15492, 16072, 16196, 16351, 16614, 16754, 17047, 18830, 18966, 19246, 20494]) = C(286);
    M([1633, 1769, 1907, 3850, 3985, 4129, 4403, 4543, 5245, 5381, 5663, 6469, 6623, 6749, 7041, 7181, 7446, 9116, 9396, 10093, 10501, 10642, 10922, 11355, 11745, 11885, 12164, 13426, 13706, 14403, 14800, 14940, 15219, 15631, 16211, 16335, 16490, 16753, 16893, 17186, 18969, 19105, 19385, 20633]) = C(290);
    M([2050, 2186, 2324, 4267, 4402, 4546, 4681, 4821, 5523, 5659, 5802, 6886, 7040, 7166, 7319, 7459, 7585, 9533, 9813, 10232, 10779, 10920, 11061, 11494, 12023, 12163, 12303, 13843, 14123, 14542, 15078, 15218, 15358, 15770, 16628, 16752, 16907, 17031, 17171, 17325, 19247, 19383, 19524, 20772]) = C(294);
    M([2884, 3020, 3158, 5101, 5236, 5380, 5515, 5655, 5940, 6076, 6219, 7720, 7874, 8000, 8153, 8293, 8419, 10367, 10647, 11066, 11196, 11337, 11478, 11619, 11899, 12318, 12440, 12580, 12720, 12854, 12994, 13134, 14682, 14806, 14961, 15085, 15225, 15379, 15494, 15630, 15771, 15907]) = C(298);
    M([3718, 3854, 3992, 6352, 6487, 6631, 6905, 7045, 7747, 7883, 8165, 8971, 9125, 9251, 9543, 9683, 9948, 11613, 11754, 12034, 12467, 13286, 13566, 14263, 14664, 14804, 15083, 16067, 16347, 17044, 17462, 17586, 17741, 18004, 18144, 18437, 18831, 18971, 19250, 19664, 19800, 20080, 20496, 20911]) = C(302);
    M([3857, 3993, 4131, 6491, 6626, 6770, 7044, 7184, 7886, 8022, 8304, 9110, 9264, 9390, 9682, 9822, 10087, 11752, 11893, 12173, 12606, 13425, 13705, 14402, 14803, 14943, 15222, 16206, 16486, 17183, 17601, 17725, 17880, 18143, 18283, 18576, 18970, 19110, 19389, 19803, 19939, 20219, 20635, 21050]) = C(306);
    M([4274, 4410, 4548, 6908, 7043, 7187, 7322, 7462, 8164, 8300, 8443, 9527, 9681, 9807, 9960, 10100, 10226, 12030, 12171, 12312, 12745, 13842, 14122, 14541, 15081, 15221, 15361, 16623, 16903, 17322, 18018, 18142, 18297, 18421, 18561, 18715, 19248, 19388, 19528, 20081, 20217, 20358, 20774, 21189]) = C(310);
    M([5108, 5244, 5382, 7742, 7877, 8021, 8156, 8296, 8581, 8717, 8860, 10361, 10515, 10641, 10794, 10934, 11060, 11618, 11898, 12317, 12447, 12588, 12729, 12857, 12997, 13137, 14677, 14957, 15376, 15495, 15635, 15775, 15909, 18852, 18976, 19131, 19255, 19395, 19549, 20498, 20634, 20775, 21328]) = C(314);
    M([7749, 7885, 8023, 10383, 10518, 10662, 10797, 10937, 11222, 11358, 11501, 11612, 11766, 11892, 12045, 12185, 12311, 12864, 13005, 13146, 14676, 14956, 15375, 15498, 15638, 15778, 18847, 19127, 19546, 19686, 19810, 19965, 20089, 20229, 20383, 20499, 20639, 20779, 20915, 21051, 21192, 21330, 21467]) = C(318);
    M([411, 1658, 2076, 2216, 2914, 3051, 3732, 4012, 4709, 6378, 6658, 7355, 7764, 7905, 9020, 9300, 9997, 10399, 10539, 11647, 11787, 12066, 12895, 13459, 13877, 14017, 14704, 14840, 15120, 15534]) = C(247);
    M([550, 1797, 2215, 2355, 3053, 3190, 3871, 4151, 4848, 6517, 6797, 7494, 7903, 8044, 9159, 9439, 10136, 10538, 10678, 11786, 11926, 12205, 13034, 13598, 14016, 14156, 14843, 14979, 15259, 15673]) = C(251);
    M([967, 2214, 2493, 2633, 3331, 3468, 4288, 4568, 4987, 6934, 7214, 7633, 8181, 8322, 9576, 9856, 10275, 10816, 10956, 12064, 12204, 12344, 13173, 14015, 14294, 14434, 15121, 15257, 15398, 15812]) = C(255);
    M([1801, 3882, 4300, 4440, 5138, 5275, 6373, 6653, 7350, 9019, 9299, 9996, 10405, 10546, 11650, 11790, 13329, 13609, 14306, 14705, 14845, 15124, 15536, 16239, 16657, 16797, 18874, 19010, 19290, 20538]) = C(287);
    M([1940, 4021, 4439, 4579, 5277, 5414, 6512, 6792, 7489, 9158, 9438, 10135, 10544, 10685, 11789, 11929, 13468, 13748, 14445, 14844, 14984, 15263, 15675, 16378, 16796, 16936, 19013, 19149, 19429, 20677]) = C(291);
    M([2357, 4438, 4717, 4857, 5555, 5692, 6929, 7209, 7628, 9575, 9855, 10274, 10822, 10963, 12067, 12207, 13885, 14165, 14584, 15122, 15262, 15402, 15814, 16795, 17074, 17214, 19291, 19427, 19568, 20816]) = C(295);
    M([3191, 5272, 5551, 5691, 5972, 6109, 7763, 8043, 8462, 10409, 10689, 11108, 11239, 11380, 11661, 11941, 12360, 12484, 12624, 12898, 13038, 13178, 14849, 15128, 15268, 15538, 15674, 15815, 15951]) = C(299);
    M([4025, 6523, 6941, 7081, 7779, 7916, 9014, 9294, 9991, 11656, 11797, 13328, 13608, 14305, 14708, 14848, 16109, 16389, 17086, 17629, 18047, 18187, 18875, 19015, 19294, 19708, 19844, 20124, 20540, 20955]) = C(303);
    M([4164, 6662, 7080, 7220, 7918, 8055, 9153, 9433, 10130, 11795, 11936, 13467, 13747, 14444, 14847, 14987, 16248, 16528, 17225, 17768, 18186, 18326, 19014, 19154, 19433, 19847, 19983, 20263, 20679, 21094]) = C(307);
    M([4581, 7079, 7358, 7498, 8196, 8333, 9570, 9850, 10269, 12073, 12214, 13884, 14164, 14583, 15125, 15265, 16665, 16945, 17364, 18185, 18464, 18604, 19292, 19432, 19572, 20125, 20261, 20402, 20818, 21233]) = C(311);
    M([5415, 7913, 8192, 8332, 8613, 8750, 10404, 10684, 11103, 11660, 11940, 12359, 12490, 12631, 12901, 13041, 14719, 14999, 15418, 15539, 15679, 15819, 15953, 19019, 19298, 19438, 20542, 20678, 20819, 21372]) = C(315);
    M([8056, 10554, 10833, 10973, 11254, 11391, 11655, 11935, 12354, 12907, 13048, 14718, 14998, 15417, 15542, 15682, 18889, 19169, 19588, 19853, 20132, 20272, 20543, 20683, 20823, 20959, 21095, 21236, 21374, 21511]) = C(319);
    M([135, 1526, 3751, 6393, 9035]) = C(4);
    M([274, 1665, 3890, 6532, 9174]) = C(8);
    M([413, 1804, 4029, 6671, 9313]) = C(12);
    M([552, 1943, 4168, 6810, 9452]) = C(16);
    M([691, 2082, 4307, 6949, 9591]) = C(20);
    M([830, 2221, 4446, 7088, 9730]) = C(24);
    M([969, 2360, 4585, 7227, 9869]) = C(28);
    M([1108, 2499, 4724, 7366, 10008]) = C(32);
    M([1247, 2638, 4863, 7505, 10147]) = C(36);
    M([1386, 2777, 5002, 7644, 10286]) = C(40);
    M([1525, 3750, 6392, 9034, 13344]) = C(44);
    M([1664, 3889, 6531, 9173, 13483]) = C(48);
    M([1803, 4028, 6670, 9312, 13622]) = C(52);
    M([1942, 4167, 6809, 9451, 13761]) = C(56);
    M([2081, 4306, 6948, 9590, 13900]) = C(60);
    M([2220, 4445, 7087, 9729, 14039]) = C(64);
    M([2359, 4584, 7226, 9868, 14178]) = C(68);
    M([2498, 4723, 7365, 10007, 14317]) = C(72);
    M([2637, 4862, 7504, 10146, 14456]) = C(76);
    M([2776, 5001, 7643, 10285, 14595]) = C(80);
    M([2915, 5140, 7782, 10424, 11676]) = C(84);
    M([3054, 5279, 7921, 10563, 11815]) = C(88);
    M([3193, 5418, 8060, 10702, 11954]) = C(92);
    M([3332, 5557, 8199, 10841, 12093]) = C(96);
    M([3471, 5696, 8338, 10980, 12232]) = C(100);
    M([3610, 5835, 8477, 11119, 12371]) = C(104);
    M([3749, 6391, 9033, 13343, 16124]) = C(108);
    M([3888, 6530, 9172, 13482, 16263]) = C(112);
    M([4027, 6669, 9311, 13621, 16402]) = C(116);
    M([4166, 6808, 9450, 13760, 16541]) = C(120);
    M([4305, 6947, 9589, 13899, 16680]) = C(124);
    M([4444, 7086, 9728, 14038, 16819]) = C(128);
    M([4583, 7225, 9867, 14177, 16958]) = C(132);
    M([4722, 7364, 10006, 14316, 17097]) = C(136);
    M([4861, 7503, 10145, 14455, 17236]) = C(140);
    M([5000, 7642, 10284, 14594, 17375]) = C(144);
    M([5139, 7781, 10423, 11675, 14734]) = C(148);
    M([5278, 7920, 10562, 11814, 14873]) = C(152);
    M([5417, 8059, 10701, 11953, 15012]) = C(156);
    M([5556, 8198, 10840, 12092, 15151]) = C(160);
    M([5695, 8337, 10979, 12231, 15290]) = C(164);
    M([5834, 8476, 11118, 12370, 15429]) = C(168);
    M([5973, 8615, 11257, 12509, 12927]) = C(172);
    M([6112, 8754, 11396, 12648, 13066]) = C(176);
    M([6251, 8893, 11535, 12787, 13205]) = C(180);
    M([6390, 9032, 13342, 16123, 17514]) = C(184);
    M([6529, 9171, 13481, 16262, 17653]) = C(188);
    M([6668, 9310, 13620, 16401, 17792]) = C(192);
    M([6807, 9449, 13759, 16540, 17931]) = C(196);
    M([6946, 9588, 13898, 16679, 18070]) = C(200);
    M([7085, 9727, 14037, 16818, 18209]) = C(204);
    M([7224, 9866, 14176, 16957, 18348]) = C(208);
    M([7363, 10005, 14315, 17096, 18487]) = C(212);
    M([7502, 10144, 14454, 17235, 18626]) = C(216);
    M([7641, 10283, 14593, 17374, 18765]) = C(220);
    M([7780, 10422, 11674, 14733, 18904]) = C(224);
    M([7919, 10561, 11813, 14872, 19043]) = C(228);
    M([8058, 10700, 11952, 15011, 19182]) = C(232);
    M([8197, 10839, 12091, 15150, 19321]) = C(236);
    M([8336, 10978, 12230, 15289, 19460]) = C(240);
    M([8475, 11117, 12369, 15428, 19599]) = C(244);
    M([8614, 11256, 12508, 12926, 15568]) = C(248);
    M([8753, 11395, 12647, 13065, 15707]) = C(252);
    M([8892, 11534, 12786, 13204, 15846]) = C(256);
    M([10421, 11673, 14732, 18903, 19738]) = C(264);
    M([10560, 11812, 14871, 19042, 19877]) = C(268);
    M([10699, 11951, 15010, 19181, 20016]) = C(272);
    M([10838, 12090, 15149, 19320, 20155]) = C(276);
    M([10977, 12229, 15288, 19459, 20294]) = C(280);
    M([11116, 12368, 15427, 19598, 20433]) = C(284);
    M([11255, 12507, 12925, 15567, 20572]) = C(288);
    M([11394, 12646, 13064, 15706, 20711]) = C(292);
    M([11533, 12785, 13203, 15845, 20850]) = C(296);
    M(15985) = C(300);
    M([12506, 12924, 15566, 20571, 20989]) = C(304);
    M([12645, 13063, 15705, 20710, 21128]) = C(308);
    M([12784, 13202, 15844, 20849, 21267]) = C(312);
    M([15984, 21406]) = C(316);
    M([15983, 21405, 21545]) = C(320);

    [L,~,Pi] = lu(M(:,1:95));
    Pi = Pi';
    M = [Pi*L Pi(:,96:end)]\M(:,96:end);
    M = M(96:end,:);

    [L,UR,Pi] = lu(M(:,1:20));
    Pi = Pi';
    M = [Pi*L Pi(:,21:end)]\M(:,21:end);
    MP = M(1:20,:);
    NP = M(21:end,:);

    [Q,U,Pi] = qr(NP(:,1:end-5));
    A = UR\[MP(:,1:end-5)*Pi MP(:,end-4:end)];
    B = U(:,1:24)\[U(:,25:end) Q'*NP(:,end-4:end)];
    M = [-A(:,end-15:end)+A(:,1:end-16)*B; -B];

    xP = [41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 51, 52, 53, 54, 55, 56, 21, 22, 23, 24, 25, 26, 57, 58, 59, 33, 34, 35, 60, 39];
    P1 = [(1:35)*Pi 36:40];
    T = getT(M,[41:60 P1(1:end-16)],P1(end-15:end),xP);

    [V,~] = eig(T);
    sol = V([12, 13, 14, 15],:)./(ones(4,1)*V(16,:));

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