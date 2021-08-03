% Input: coefficient matrix C of size 6x21

% Monomial vector: [v^2, w*v, w^2, x*v, x*w, x^2, v*y, w*y, x*y, y^2, v*z, w*z, x*z, y*z, z^2, v, w, x, y, z, 1]

function [v, w, x, y, z] = nstd_optpose2pt_v2(C)

    M = zeros(181,205);

    M([33, 211, 738, 1829, 1999, 2554, 3646, 5441, 5633, 7091, 7269, 7814, 8890, 10686, 11602, 15047, 15213, 15401, 15774, 16680, 16850, 17944, 19741, 21192, 24981, 25165, 29526, 30059, 30772, 32771, 33309, 33670, 34029]) = C(1);
    M([395, 573, 1100, 2191, 2361, 2916, 4008, 5803, 5995, 6358, 7453, 7631, 8176, 9252, 11048, 11964, 15575, 16136, 17042, 17212, 18306, 19920, 20103, 21554, 25343, 26973, 29881, 30602, 31315, 33129, 33852, 34572]) = C(13);
    M([757, 935, 1281, 2553, 2723, 3097, 4189, 6176, 6539, 7815, 7993, 8357, 9433, 12145, 15228, 15756, 15944, 16317, 17393, 17570, 18487, 20284, 21735, 25523, 25888, 27154, 29514, 29691, 30074, 30418, 30773, 31138, 32038]) = C(19);
    M([938, 1116, 1462, 2734, 2904, 3278, 4370, 6165, 6357, 6720, 7996, 8174, 8538, 9614, 11229, 12326, 15409, 15937, 16125, 17404, 17751, 18668, 20282, 20465, 21916, 26069, 30254, 30606, 31135, 31319, 31860, 33487, 36020]) = C(25);
    M([1300, 1478, 1643, 3096, 3266, 3459, 4551, 6527, 6719, 6901, 8358, 8536, 8719, 9795, 11410, 12507, 15771, 16299, 16498, 17585, 17755, 18849, 20644, 20827, 22097, 25524, 27335, 30243, 30964, 31677, 33491, 34214, 34934]) = C(31);
    M([2567, 2745, 3091, 3639, 3809, 4183, 4732, 7070, 7262, 7806, 8901, 9079, 9443, 9976, 11591, 12688, 16676, 17392, 17584, 17947, 18117, 18475, 19030, 21187, 21370, 22278, 25708, 25885, 26250, 27516, 28780, 30055, 33307]) = C(37);
    M([2748, 2926, 3272, 3820, 3990, 4364, 4913, 7251, 7443, 7987, 9082, 9260, 9624, 10157, 11772, 12869, 16857, 17385, 17765, 18128, 18298, 18656, 19211, 21368, 21551, 22459, 25705, 26066, 26431, 27697, 28961, 30605, 33853]) = C(43);
    M([3110, 3288, 3453, 4182, 4352, 4545, 5094, 7794, 7986, 8349, 9444, 9622, 9805, 10338, 12134, 13050, 17566, 17754, 18490, 18660, 18837, 19392, 21730, 21913, 22640, 25886, 26070, 30070, 30978, 32223, 32403, 34211, 36201]) = C(49);
    M([4196, 4374, 4539, 4725, 4895, 5088, 5275, 8880, 9072, 9435, 9987, 10165, 10348, 10519, 12677, 13231, 17943, 18471, 18659, 18851, 19033, 19203, 19380, 19573, 22273, 22456, 22821, 26248, 26432, 26612, 27878, 32220, 35477]) = C(55);
    M([7816, 7994, 8340, 8888, 9058, 9432, 9981, 10690, 10882, 11616, 11794, 12158, 12691, 13401, 13955, 20288, 20661, 21205, 21375, 21733, 22288, 22999, 23726, 26794, 27152, 27517, 28059, 29142, 29707, 30417, 32785, 32952, 33669]) = C(61);
    M([7997, 8175, 8521, 9069, 9239, 9613, 10162, 10871, 11063, 11245, 11797, 11975, 12339, 12872, 13582, 14136, 19753, 20281, 20469, 20842, 21386, 21556, 21914, 22469, 22997, 23180, 23907, 26791, 26975, 27698, 31858, 34756, 35115]) = C(67);
    M([8359, 8537, 8702, 9431, 9601, 9794, 10343, 11244, 11426, 12159, 12337, 12520, 13053, 13763, 14317, 20643, 20831, 21023, 21748, 21918, 22095, 22650, 23359, 24088, 27153, 27333, 28240, 29695, 30432, 31506, 31862, 32404, 32581]) = C(73);
    M([9445, 9623, 9788, 9974, 10144, 10337, 10524, 11595, 11787, 12150, 12702, 12880, 13063, 13234, 13944, 14498, 21201, 21729, 21917, 22109, 22291, 22461, 22638, 22831, 23721, 23904, 24269, 27515, 27699, 27879, 28421, 32401, 35658]) = C(79);
    M([12160, 12338, 12503, 12689, 12859, 13052, 13239, 13405, 13597, 13779, 13969, 14147, 14330, 14501, 14668, 14860, 23358, 23557, 23739, 23909, 24086, 24279, 24445, 24628, 24812, 28058, 28238, 28422, 28602, 29323, 31510, 32966, 34758]) = C(85);
    M([17406, 17571, 17938, 18108, 18482, 19031, 19751, 21209, 21387, 21751, 22284, 23729, 25002, 25548, 25719, 25896, 26270, 26800, 27527, 28784, 29145, 30079, 30431, 30779, 31148, 32039, 32772, 32949, 33332, 33676, 34031, 34396, 35296]) = C(91);
    M([17590, 17768, 18481, 18651, 18844, 19393, 20294, 20657, 21752, 21930, 22113, 22646, 23356, 24091, 25530, 25911, 26081, 27160, 30419, 30794, 30965, 31702, 31868, 32040, 32243, 32414, 32584, 33501, 34222, 34935, 36025, 36205, 36563]) = C(103);
    M([18495, 18673, 18838, 19024, 19194, 19387, 19574, 21188, 21380, 21743, 22295, 22473, 22656, 22827, 23718, 24272, 25892, 26080, 26273, 26443, 26632, 27522, 27705, 27889, 28782, 28966, 32231, 33328, 34236, 35481, 35661, 36202, 36744]) = C(109);
    M([21753, 21931, 22096, 22282, 22452, 22645, 22832, 23009, 23372, 23743, 23921, 24104, 24275, 24442, 24815, 27159, 27358, 27540, 27710, 27899, 28065, 28432, 29144, 29326, 31872, 32412, 32582, 32953, 33690, 34764, 35120, 35662, 35839]) = C(115);
    M([25916, 26094, 26264, 26434, 26633, 26810, 27173, 27544, 27722, 27895, 28062, 28435, 28807, 28977, 29151, 32046, 32238, 32430, 33677, 34052, 34223, 34960, 35126, 35298, 35501, 35672, 35842, 36035, 36213, 36387, 36564, 36748, 36925]) = C(121);
    M([66, 244, 771, 1862, 2032, 2587, 3679, 5474, 5666, 7124, 7302, 7847, 8923, 10719, 11635, 15080, 15246, 15434, 15807, 16713, 16883, 17977, 19774, 21225, 25014, 25198, 29559, 30092, 30805, 32804, 33342, 33703, 34062]) = C(2);
    M([428, 606, 1133, 2224, 2394, 2949, 4041, 5836, 6028, 6391, 7486, 7664, 8209, 9285, 11081, 11997, 15608, 16169, 17075, 17245, 18339, 19953, 20136, 21587, 25376, 27006, 29914, 30635, 31348, 33162, 33885, 34605]) = C(14);
    M([790, 968, 1314, 2586, 2756, 3130, 4222, 6209, 6572, 7848, 8026, 8390, 9466, 12178, 15261, 15789, 15977, 16350, 17426, 17603, 18520, 20317, 21768, 25556, 25921, 27187, 29547, 29724, 30107, 30451, 30806, 31171, 32071]) = C(20);
    M([971, 1149, 1495, 2767, 2937, 3311, 4403, 6198, 6390, 6753, 8029, 8207, 8571, 9647, 11262, 12359, 15442, 15970, 16158, 17437, 17784, 18701, 20315, 20498, 21949, 26102, 30287, 30639, 31168, 31352, 31893, 33520, 36053]) = C(26);
    M([1333, 1511, 1676, 3129, 3299, 3492, 4584, 6560, 6752, 6934, 8391, 8569, 8752, 9828, 11443, 12540, 15804, 16332, 16531, 17618, 17788, 18882, 20677, 20860, 22130, 25557, 27368, 30276, 30997, 31710, 33524, 34247, 34967]) = C(32);
    M([2600, 2778, 3124, 3672, 3842, 4216, 4765, 7103, 7295, 7839, 8934, 9112, 9476, 10009, 11624, 12721, 16709, 17425, 17617, 17980, 18150, 18508, 19063, 21220, 21403, 22311, 25741, 25918, 26283, 27549, 28813, 30088, 33340]) = C(38);
    M([2781, 2959, 3305, 3853, 4023, 4397, 4946, 7284, 7476, 8020, 9115, 9293, 9657, 10190, 11805, 12902, 16890, 17418, 17798, 18161, 18331, 18689, 19244, 21401, 21584, 22492, 25738, 26099, 26464, 27730, 28994, 30638, 33886]) = C(44);
    M([3143, 3321, 3486, 4215, 4385, 4578, 5127, 7827, 8019, 8382, 9477, 9655, 9838, 10371, 12167, 13083, 17599, 17787, 18523, 18693, 18870, 19425, 21763, 21946, 22673, 25919, 26103, 30103, 31011, 32256, 32436, 34244, 36234]) = C(50);
    M([4229, 4407, 4572, 4758, 4928, 5121, 5308, 8913, 9105, 9468, 10020, 10198, 10381, 10552, 12710, 13264, 17976, 18504, 18692, 18884, 19066, 19236, 19413, 19606, 22306, 22489, 22854, 26281, 26465, 26645, 27911, 32253, 35510]) = C(56);
    M([7849, 8027, 8373, 8921, 9091, 9465, 10014, 10723, 10915, 11649, 11827, 12191, 12724, 13434, 13988, 20321, 20694, 21238, 21408, 21766, 22321, 23032, 23759, 26827, 27185, 27550, 28092, 29175, 29740, 30450, 32818, 32985, 33702]) = C(62);
    M([8030, 8208, 8554, 9102, 9272, 9646, 10195, 10904, 11096, 11278, 11830, 12008, 12372, 12905, 13615, 14169, 19786, 20314, 20502, 20875, 21419, 21589, 21947, 22502, 23030, 23213, 23940, 26824, 27008, 27731, 31891, 34789, 35148]) = C(68);
    M([8392, 8570, 8735, 9464, 9634, 9827, 10376, 11277, 11459, 12192, 12370, 12553, 13086, 13796, 14350, 20676, 20864, 21056, 21781, 21951, 22128, 22683, 23392, 24121, 27186, 27366, 28273, 29728, 30465, 31539, 31895, 32437, 32614]) = C(74);
    M([9478, 9656, 9821, 10007, 10177, 10370, 10557, 11628, 11820, 12183, 12735, 12913, 13096, 13267, 13977, 14531, 21234, 21762, 21950, 22142, 22324, 22494, 22671, 22864, 23754, 23937, 24302, 27548, 27732, 27912, 28454, 32434, 35691]) = C(80);
    M([12193, 12371, 12536, 12722, 12892, 13085, 13272, 13438, 13630, 13812, 14002, 14180, 14363, 14534, 14701, 14893, 23391, 23590, 23772, 23942, 24119, 24312, 24478, 24661, 24845, 28091, 28271, 28455, 28635, 29356, 31543, 32999, 34791]) = C(86);
    M([17439, 17604, 17971, 18141, 18515, 19064, 19784, 21242, 21420, 21784, 22317, 23762, 25035, 25581, 25752, 25929, 26303, 26833, 27560, 28817, 29178, 30112, 30464, 30812, 31181, 32072, 32805, 32982, 33365, 33709, 34064, 34429, 35329]) = C(92);
    M([17623, 17801, 18514, 18684, 18877, 19426, 20327, 20690, 21785, 21963, 22146, 22679, 23389, 24124, 25563, 25944, 26114, 27193, 30452, 30827, 30998, 31735, 31901, 32073, 32276, 32447, 32617, 33534, 34255, 34968, 36058, 36238, 36596]) = C(104);
    M([18528, 18706, 18871, 19057, 19227, 19420, 19607, 21221, 21413, 21776, 22328, 22506, 22689, 22860, 23751, 24305, 25925, 26113, 26306, 26476, 26665, 27555, 27738, 27922, 28815, 28999, 32264, 33361, 34269, 35514, 35694, 36235, 36777]) = C(110);
    M([21786, 21964, 22129, 22315, 22485, 22678, 22865, 23042, 23405, 23776, 23954, 24137, 24308, 24475, 24848, 27192, 27391, 27573, 27743, 27932, 28098, 28465, 29177, 29359, 31905, 32445, 32615, 32986, 33723, 34797, 35153, 35695, 35872]) = C(116);
    M([25949, 26127, 26297, 26467, 26666, 26843, 27206, 27577, 27755, 27928, 28095, 28468, 28840, 29010, 29184, 32079, 32271, 32463, 33710, 34085, 34256, 34993, 35159, 35331, 35534, 35705, 35875, 36068, 36246, 36420, 36597, 36781, 36958]) = C(122);
    M([1905, 2065, 2620, 3162, 3712, 4447, 4606, 4795, 4962, 5158, 5348, 8947, 9143, 9506, 10060, 10238, 10421, 10589, 12743, 13301, 18015, 18187, 18378, 18538, 18726, 18924, 19106, 19270, 19447, 19646, 22340, 22523, 22888, 26314, 26498, 26678, 27944, 32286, 35543]) = C(57);
    M([10774, 10934, 11488, 11676, 12411, 12570, 12759, 12926, 13122, 13312, 13472, 13668, 13850, 14042, 14220, 14403, 14571, 14734, 14930, 23074, 23265, 23425, 23630, 23812, 23976, 24153, 24352, 24512, 24695, 24879, 28124, 28304, 28488, 28668, 29389, 29770, 31577, 33038, 34824]) = C(87);
    M([25073, 25233, 25606, 26167, 26334, 26501, 26706, 26881, 27244, 27617, 27795, 27965, 28128, 28505, 28880, 29044, 29218, 30856, 32113, 32308, 32503, 33396, 33744, 34124, 34290, 34477, 34668, 35033, 35193, 35364, 35574, 35739, 35908, 36102, 36280, 36453, 36630, 36814, 36991]) = C(123);
    M([136, 314, 843, 1934, 2104, 2659, 5546, 5738, 7194, 7372, 7917, 8995, 10791, 11707, 15318, 15506, 15877, 16783, 16955, 18048, 19846, 21297, 25086, 25270, 29631, 30164, 30877, 32876, 33414, 33775, 34134]) = C(4);
    M([317, 495, 1024, 2115, 2285, 2840, 5727, 5919, 6282, 7375, 7553, 8098, 9176, 10972, 11888, 15499, 15687, 16058, 16964, 17136, 17494, 18229, 19844, 20027, 21478, 25267, 25451, 25812, 26897, 31239, 34496]) = C(10);
    M([498, 676, 1205, 2296, 2466, 3021, 5908, 6100, 6463, 7556, 7734, 8279, 9357, 11153, 12069, 15680, 16239, 17145, 17317, 18410, 20025, 20208, 21659, 25448, 27078, 29986, 30707, 31420, 33234, 33957, 34677]) = C(16);
    M([860, 1038, 1386, 2658, 2828, 3202, 6281, 6644, 7918, 8096, 8460, 9538, 12250, 15861, 16049, 16420, 17498, 17675, 18591, 20389, 21840, 25628, 25993, 27259, 29619, 29796, 30177, 30523, 30878, 31243, 32143]) = C(22);
    M([1041, 1219, 1567, 2839, 3009, 3383, 6270, 6462, 6825, 8099, 8277, 8641, 9719, 11334, 12431, 16042, 16230, 17507, 17856, 18772, 20387, 20570, 22021, 26174, 30357, 30711, 31240, 31424, 31965, 33592, 36125]) = C(28);
    M([1403, 1581, 1748, 3201, 3371, 3564, 6632, 6824, 7006, 8461, 8639, 8822, 9900, 11515, 12612, 16404, 16601, 17688, 17860, 18953, 20749, 20932, 22202, 25629, 27440, 30348, 31069, 31782, 33596, 34319, 35039]) = C(34);
    M([2670, 2848, 3196, 3744, 3914, 4288, 7175, 7367, 7911, 9004, 9182, 9546, 10081, 11696, 12793, 17497, 17687, 18050, 18222, 18580, 19134, 21292, 21475, 22383, 25813, 25990, 26355, 27621, 28885, 30160, 33412]) = C(40);
    M([2851, 3029, 3377, 3925, 4095, 4469, 7356, 7548, 8092, 9185, 9363, 9727, 10262, 11877, 12974, 17490, 17868, 18231, 18403, 18761, 19315, 21473, 21656, 22564, 25810, 26171, 26536, 27802, 29066, 30710, 33958]) = C(46);
    M([3213, 3391, 3558, 4287, 4457, 4650, 7899, 8091, 8454, 9547, 9725, 9908, 10443, 12239, 13155, 17671, 17859, 18593, 18765, 18942, 19496, 21835, 22018, 22745, 25991, 26175, 31081, 32328, 32508, 34316, 36306]) = C(52);
    M([4299, 4477, 4644, 4830, 5000, 5193, 8985, 9177, 9540, 10090, 10268, 10451, 10624, 12782, 13336, 18576, 18764, 18954, 19136, 19308, 19485, 19677, 22378, 22561, 22926, 26353, 26537, 26717, 27983, 32325, 35582]) = C(58);
    M([7919, 8097, 8445, 8993, 9163, 9537, 10795, 10987, 11719, 11897, 12261, 12796, 13506, 14060, 20393, 20764, 21308, 21480, 21838, 22392, 23104, 23831, 26899, 27257, 27622, 28164, 29247, 29812, 30522, 33057, 33774]) = C(64);
    M([8100, 8278, 8626, 9174, 9344, 9718, 10976, 11168, 11350, 11900, 12078, 12442, 12977, 13687, 14241, 20386, 20574, 20945, 21489, 21661, 22019, 22573, 23102, 23285, 24012, 26896, 27080, 27803, 31963, 34861, 35220]) = C(70);
    M([8462, 8640, 8807, 9536, 9706, 9899, 11349, 11531, 12262, 12440, 12623, 13158, 13868, 14422, 20748, 20936, 21126, 21851, 22023, 22200, 22754, 23464, 24193, 27258, 27438, 28345, 29800, 31611, 31967, 32509, 32686]) = C(76);
    M([9548, 9726, 9893, 10079, 10249, 10442, 11700, 11892, 12255, 12805, 12983, 13166, 13339, 14049, 14603, 21834, 22022, 22212, 22394, 22566, 22743, 22935, 23826, 24009, 24374, 27620, 27804, 27984, 28526, 32506, 35763]) = C(82);
    M([12263, 12441, 12608, 12794, 12964, 13157, 13510, 13702, 13884, 14072, 14250, 14433, 14606, 14773, 14965, 23463, 23660, 23842, 24014, 24191, 24383, 24550, 24733, 24917, 28163, 28343, 28527, 28707, 29428, 31615, 34863]) = C(88);
    M([17509, 17676, 18043, 18213, 18587, 19856, 21312, 21490, 21854, 22389, 23834, 25651, 25824, 26001, 26374, 26905, 27632, 28889, 29250, 30182, 30536, 30884, 31253, 32144, 32877, 33054, 33435, 33781, 34136, 34501, 35401]) = C(94);
    M([17512, 17857, 18224, 18394, 18768, 19845, 20037, 20400, 21493, 21671, 22035, 22570, 23099, 24015, 25833, 26182, 26555, 26903, 27086, 27813, 29070, 30722, 31246, 31434, 33615, 33969, 34498, 34682, 35223, 36126, 36487]) = C(100);
    M([17693, 17871, 18586, 18756, 18949, 20399, 20762, 21855, 22033, 22216, 22751, 23461, 24196, 25635, 26014, 26186, 27265, 30524, 31070, 31805, 31973, 32145, 32347, 32519, 32689, 33606, 34327, 35040, 36130, 36310, 36668]) = C(106);
    M([18598, 18776, 18943, 19129, 19299, 19492, 21293, 21485, 21848, 22398, 22576, 22759, 22932, 23823, 24377, 25997, 26185, 26376, 26548, 26736, 27627, 27810, 27994, 28887, 29071, 32336, 34339, 35586, 35766, 36307, 36849]) = C(112);
    M([21856, 22034, 22201, 22387, 22557, 22750, 23114, 23477, 23846, 24024, 24207, 24380, 24547, 24920, 27264, 27461, 27643, 27815, 28003, 28170, 28537, 29249, 29431, 31977, 32517, 32687, 33058, 34869, 35225, 35767, 35944]) = C(118);
    M([26019, 26197, 26369, 26539, 26915, 27278, 27647, 27825, 28000, 28167, 28540, 28910, 29082, 29256, 32151, 32343, 32533, 33782, 34328, 35063, 35231, 35403, 35605, 35777, 35947, 36140, 36318, 36492, 36669, 36853, 37030]) = C(124);
    M([166, 344, 874, 2135, 2689, 5577, 5768, 7224, 7402, 7947, 9025, 10822, 11738, 15349, 15537, 15907, 16813, 16986, 18078, 19877, 21328, 25117, 25301, 29661, 30195, 30908, 32907, 33445, 33806, 34165]) = C(5);
    M([347, 525, 1055, 2316, 2870, 5758, 5949, 6312, 7405, 7583, 8128, 9206, 11003, 11919, 15530, 15718, 16088, 16994, 17167, 17525, 18259, 19875, 20058, 21509, 25298, 25482, 25843, 26928, 31270, 34527]) = C(11);
    M([528, 706, 1236, 2497, 3051, 5939, 6130, 6493, 7586, 7764, 8309, 9387, 11184, 12100, 15711, 16269, 17175, 17348, 18440, 20056, 20239, 21690, 25479, 27109, 30017, 30738, 31451, 33265, 33988, 34708]) = C(17);
    M([890, 1068, 1417, 2859, 3232, 6311, 6674, 7948, 8126, 8490, 9568, 12281, 15892, 16080, 16450, 17529, 17706, 18621, 20420, 21871, 25659, 26024, 27290, 29650, 29827, 30207, 30554, 30909, 31274, 32174]) = C(23);
    M([1071, 1249, 1598, 3040, 3413, 6301, 6492, 6855, 8129, 8307, 8671, 9749, 11365, 12462, 16073, 16261, 17537, 17887, 18802, 20418, 20601, 22052, 26205, 30387, 30742, 31271, 31455, 31996, 33623, 36156]) = C(29);
    M([1433, 1611, 1779, 3402, 3594, 6663, 6854, 7036, 8491, 8669, 8852, 9930, 11546, 12643, 16435, 16631, 17718, 17891, 18983, 20780, 20963, 22233, 25660, 27471, 30379, 31100, 31813, 33627, 34350, 35070]) = C(35);
    M([2700, 2878, 3227, 3945, 4318, 7206, 7397, 7941, 9034, 9212, 9576, 10111, 11727, 12824, 17528, 17717, 18080, 18253, 18611, 19164, 21323, 21506, 22414, 25844, 26021, 26386, 27652, 28916, 30191, 33443]) = C(41);
    M([2881, 3059, 3408, 4126, 4499, 7387, 7578, 8122, 9215, 9393, 9757, 10292, 11908, 13005, 17521, 17898, 18261, 18434, 18792, 19345, 21504, 21687, 22595, 25841, 26202, 26567, 27833, 29097, 30741, 33989]) = C(47);
    M([3243, 3421, 3589, 4488, 4680, 7930, 8121, 8484, 9577, 9755, 9938, 10473, 12270, 13186, 17702, 17890, 18623, 18796, 18973, 19526, 21866, 22049, 22776, 26022, 26206, 31111, 32359, 32539, 34347, 36337]) = C(53);
    M([4329, 4507, 4675, 5031, 5223, 9016, 9207, 9570, 10120, 10298, 10481, 10654, 12813, 13367, 18607, 18795, 18984, 19166, 19339, 19516, 19707, 22409, 22592, 22957, 26384, 26568, 26748, 28014, 32356, 35613]) = C(59);
    M([7949, 8127, 8476, 9194, 9567, 10826, 11017, 11749, 11927, 12291, 12826, 13537, 14091, 20424, 20794, 21338, 21511, 21869, 22422, 23135, 23862, 26930, 27288, 27653, 28195, 29278, 29842, 30553, 33088, 33805]) = C(65);
    M([8130, 8308, 8657, 9375, 9748, 11007, 11198, 11380, 11930, 12108, 12472, 13007, 13718, 14272, 20417, 20605, 20975, 21519, 21692, 22050, 22603, 23133, 23316, 24043, 26927, 27111, 27834, 31994, 34892, 35251]) = C(71);
    M([8492, 8670, 8838, 9737, 9929, 11379, 11561, 12292, 12470, 12653, 13188, 13899, 14453, 20779, 20967, 21156, 21881, 22054, 22231, 22784, 23495, 24224, 27289, 27469, 28376, 29831, 31642, 31998, 32540, 32717]) = C(77);
    M([9578, 9756, 9924, 10280, 10472, 11731, 11922, 12285, 12835, 13013, 13196, 13369, 14080, 14634, 21865, 22053, 22242, 22424, 22597, 22774, 22965, 23857, 24040, 24405, 27651, 27835, 28015, 28557, 32537, 35794]) = C(83);
    M([12293, 12471, 12639, 12995, 13187, 13541, 13732, 13914, 14102, 14280, 14463, 14636, 14804, 14996, 23494, 23690, 23872, 24045, 24222, 24413, 24581, 24764, 24948, 28194, 28374, 28558, 28738, 29459, 31646, 34894]) = C(89);
    M([17539, 17707, 18244, 18617, 19886, 21342, 21520, 21884, 22419, 23865, 25681, 25855, 26032, 26404, 26936, 27663, 28920, 29281, 30212, 30566, 30915, 31284, 32175, 32908, 33085, 33465, 33812, 34167, 34532, 35432]) = C(95);
    M([17542, 17888, 18425, 18798, 19876, 20067, 20430, 21523, 21701, 22065, 22600, 23130, 24046, 25863, 26213, 26585, 26934, 27117, 27844, 29101, 30752, 31277, 31465, 33645, 34000, 34529, 34713, 35254, 36157, 36518]) = C(101);
    M([17723, 17901, 18787, 18979, 20429, 20792, 21885, 22063, 22246, 22781, 23492, 24227, 25666, 26044, 26217, 27296, 30555, 31101, 31835, 32004, 32176, 32377, 32550, 32720, 33637, 34358, 35071, 36161, 36341, 36699]) = C(107);
    M([18628, 18806, 18974, 19330, 19522, 21324, 21515, 21878, 22428, 22606, 22789, 22962, 23854, 24408, 26028, 26216, 26406, 26579, 26766, 27658, 27841, 28025, 28918, 29102, 32367, 34369, 35617, 35797, 36338, 36880]) = C(113);
    M([21886, 22064, 22232, 22588, 22780, 23144, 23507, 23876, 24054, 24237, 24410, 24578, 24951, 27295, 27491, 27673, 27846, 28033, 28201, 28568, 29280, 29462, 32008, 32548, 32718, 33089, 34900, 35256, 35798, 35975]) = C(119);
    M([26049, 26227, 26570, 26945, 27308, 27677, 27855, 28030, 28198, 28571, 28940, 29113, 29287, 32182, 32373, 32563, 33813, 34359, 35093, 35262, 35434, 35635, 35808, 35978, 36171, 36349, 36523, 36700, 36884, 37061]) = C(125);
    M([902, 2163, 5605, 10850, 15377, 15565, 17014, 19905, 21356, 25147, 30223, 30938, 32935, 33836, 34195]) = C(6);
    M([1083, 2344, 5786, 11031, 15558, 15746, 17195, 17553, 19903, 20086, 21537, 25328, 26958, 31300, 34557]) = C(12);
    M([1264, 2525, 5967, 11212, 15739, 17376, 20084, 20267, 21718, 25509, 27139, 30045, 30766, 31481, 34738]) = C(18);
    M([1445, 2887, 15920, 16108, 17557, 17734, 20448, 21899, 25689, 27320, 29678, 29855, 30582, 30939, 32204]) = C(24);
    M([1626, 3068, 6329, 11393, 16101, 16289, 17915, 20446, 20629, 22080, 30770, 31301, 32026, 33653, 36186]) = C(30);
    M([1807, 3430, 6691, 11574, 16463, 17919, 20808, 20991, 22261, 25690, 27501, 30407, 31128, 31843, 35100]) = C(36);
    M([3255, 3973, 7234, 11755, 17556, 18281, 18639, 21351, 21534, 22442, 26051, 27682, 28946, 30219, 33473]) = C(42);
    M([3436, 4154, 7415, 11936, 17549, 18462, 18820, 21532, 21715, 22623, 25871, 26232, 27863, 29127, 30769]) = C(48);
    M([3617, 4516, 7958, 12298, 17730, 17918, 18824, 19001, 21894, 22077, 22804, 26052, 32569, 34377, 36367]) = C(54);
    M([4703, 5059, 9044, 12841, 18635, 18823, 19367, 19544, 22437, 22620, 22985, 26414, 28044, 32386, 35643]) = C(60);
    M([8504, 9222, 10854, 13565, 20452, 21539, 21897, 23163, 23890, 27318, 28225, 29308, 30581, 33116, 33835]) = C(66);
    M([8685, 9403, 11035, 13746, 20445, 20633, 21720, 22078, 23161, 23344, 24071, 26957, 32024, 34922, 35281]) = C(72);
    M([8866, 9765, 13927, 20807, 20995, 22082, 22259, 23523, 24252, 27319, 27499, 28406, 29859, 31670, 32747]) = C(78);
    M([9952, 10308, 11759, 14108, 21893, 22081, 22625, 22802, 23885, 24068, 24433, 27681, 28587, 32567, 35824]) = C(84);
    M([12667, 13023, 13569, 14832, 23522, 24073, 24250, 24609, 24792, 24976, 28224, 28404, 28768, 29489, 31674]) = C(90);
    M([17735, 18272, 25883, 26060, 26964, 27691, 29311, 30943, 31312, 32205, 32936, 33113, 33840, 34197, 35462]) = C(96);
    M([17916, 18453, 19904, 23158, 26241, 26962, 27145, 27872, 31305, 31493, 34028, 34559, 35284, 36187, 36548]) = C(102);
    M([18815, 23520, 25694, 26245, 27324, 30583, 31129, 32032, 32206, 32578, 32750, 33665, 34386, 35101, 36729]) = C(108);
    M([19002, 19358, 21352, 23882, 26056, 26244, 26607, 27686, 27869, 28053, 28948, 32395, 35827, 36368, 36910]) = C(114);
    M([22260, 22616, 24606, 27323, 27874, 28229, 28596, 29310, 29492, 32036, 32576, 32748, 33117, 34928, 36005]) = C(120);
    M([26598, 28226, 29141, 29315, 32210, 33841, 34387, 35290, 35464, 35836, 36008, 36199, 36377, 36730, 37091]) = C(126);

    [L,~,P] = lu(M(:,1:163));
    L = [L [zeros(163,18); eye(18)]];
    M1 = (P'*L)\M;
    M2 = M1(end-17:end,164:181);
    M3 = M1(end-17:end,182:end);

    A = zeros(24);
    A(1:18,:) = -M2\M3;
    A([115, 212, 453, 310, 479, 528]) = 1;

    [V,~] = eig(A);
    sol = V([15, 21, 22, 23, 18],:)./(ones(5,1)*V(24,:));

    if(find(isnan( sol(:) )) > 0)
        v = zeros(1,0);
        w = zeros(1,0);
        x = zeros(1,0);
        y = zeros(1,0);
        z = zeros(1,0);
    else
        %I = find(not(imag( sol(1,:) )));
        v = sol(1,:);
        w = sol(2,:);
        x = sol(3,:);
        y = sol(4,:);
        z = sol(5,:);
    end

end