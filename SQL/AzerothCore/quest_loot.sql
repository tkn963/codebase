-- Quest: RequiredItemId1
UPDATE `item_template` SET `Flags`=2048 WHERE `entry` IN (725, 735, 750, 752, 772, 773, 780, 782, 829, 884, 915, 1019, 1075, 1129, 1221, 1256, 1261, 1274, 1467, 1519, 1524, 1532, 1598, 1894, 2466, 2536, 2606, 2611, 2636, 2671, 2676, 2702, 2725, 2734, 2742, 2749, 2794, 2798, 2799, 2834, 2843, 2855, 2856, 2858, 2859, 2872, 2875, 2876, 2909, 3014, 3083, 3110, 3156, 3162, 3218, 3236, 3253, 3256, 3265, 3266, 3297, 3337, 3339, 3340, 3348, 3354, 3397, 3409, 3476, 3496, 3505, 3658, 3692, 3714, 3715, 3716, 3838, 3863, 3901, 3910, 3911, 3915, 3916, 3917, 3918, 3919, 3923, 4016, 4029, 4053, 4104, 4106, 4435, 4450, 4495, 4503, 4506, 4512, 4513, 4527, 4582, 4626, 4627, 4628, 4630, 4739, 4742, 4751, 4752, 4758, 4769, 4770, 4801, 4803, 4845, 4848, 4862, 4870, 4871, 4886, 4887, 4892, 4893, 4898, 5017, 5026, 5030, 5051, 5055, 5058, 5064, 5065, 5075, 5078, 5085, 5086, 5087, 5096, 5098, 5117, 5134, 5143, 5166, 5168, 5170, 5203, 5204, 5336, 5348, 5359, 5360, 5385, 5386, 5412, 5413, 5414, 5481, 5490, 5519, 5582, 5620, 5659, 5664, 5675, 5794, 5795, 5796, 5797, 5801, 5803, 5805, 5808, 5809, 5840, 5842, 5847, 5848, 5855, 5879, 5883, 5884, 5938, 5952, 5959, 6067, 6079, 6080, 6083, 6166, 6168, 6169, 6181, 6184, 6246, 6248, 6250, 6257, 6281, 6443, 6634, 6640, 6799, 6838, 6844, 6846, 6847, 6912, 6989, 6994, 6995, 7126, 7128, 7231, 7267, 7270, 7675, 7847, 7968, 8009, 8074, 8244, 8391, 8392, 8393, 8394, 8396, 8483, 8587, 8973, 9237, 9238, 9247, 9308, 9309, 9369, 9460, 9523, 10509, 10551, 10593, 10639, 11018, 11114, 11129, 11172, 11184, 11185, 11186, 11188, 11266, 11316, 11318, 11404, 11407, 11467, 11468, 11472, 11477, 11478, 11503, 11509, 11515, 11754, 11818, 11829, 11830, 11834, 12230, 12235, 12236, 12237, 12291, 12336, 12366, 12367, 12444, 12622, 12753, 12771, 12822, 12829, 12840, 12841, 12843, 13174, 13350, 13545, 13853, 14544, 14619, 16312, 16581, 16746, 16786, 16976, 17306, 17309, 17326, 17327, 17328, 17422, 17423, 17502, 17503, 17504, 17642, 17643, 17684, 18143, 18144, 18145, 18146, 18147, 18206, 18207, 18357, 18358, 18360, 18362, 18590, 18792, 18944, 18945, 18947, 18952, 18956, 18958, 18961, 19002, 19003, 19018, 19698, 19701, 19704, 19802, 20023, 20027, 20028, 20029, 20373, 20375, 20378, 20384, 20404, 20482, 20513, 20514, 20515, 20519, 20772, 20797, 20884, 20885, 20886, 20888, 20889, 20890, 20926, 20927, 20931, 20934, 20951, 21027, 21137, 21138, 21147, 21211, 21377, 21383, 21757, 21771, 21808, 21928, 21937, 21982, 22094, 22138, 22381, 22525, 22526, 22527, 22528, 22529, 22566, 22570, 22579, 22580, 22624, 22633, 22634, 22639, 22641, 22642, 22889, 22892, 22934, 23165, 23217, 23269, 23336, 23387, 23483, 23588, 23589, 23643, 23677, 23679, 23685, 23706, 23757, 23834, 23845, 23849, 23869, 23894, 23984, 23994, 24026, 24041, 24049, 24152, 24153, 24156, 24236, 24238, 24240, 24246, 24280, 24291, 24368, 24372, 24374, 24375, 24401, 24426, 24449, 24469, 24473, 24480, 24485, 24486, 24493, 24497, 24542, 25416, 25433, 25460, 25463, 25554, 25672, 25678, 25719, 25744, 25802, 25807, 25812, 25891, 27807, 27861, 28417, 28527, 28552, 28970, 29051, 29113, 29154, 29161, 29163, 29209, 29338, 29425, 29426, 29459, 29464, 29475, 29480, 29545, 29739, 29740, 29797, 29801, 29822, 30157, 30174, 30184, 30315, 30327, 30529, 30596, 30640, 30679, 30743, 30791, 30792, 30798, 30809, 30810, 30819, 30840, 31119, 31132, 31278, 31651, 31653, 31656, 31753, 31757, 31814, 31941, 32388, 32464, 32470, 32509, 32715, 32723, 33071, 33084, 33085, 33086, 33102, 33103, 33106, 33109, 33112, 33120, 33123, 33126, 33175, 33188, 33202, 33337, 33348, 33351, 33355, 33420, 33487, 33605, 33628, 34028, 34031, 34040, 34043, 34069, 34088, 34089, 34133, 34387, 34618, 34709, 34774, 34775, 34786, 34787, 34800, 34814, 34909, 34956, 34972, 34974, 34976, 34977, 34983, 35123, 35188, 35222, 35234, 35483, 35492, 35493, 35629, 35685, 35686, 35711, 35802, 36776, 36852, 36957, 37010, 37104, 37136, 37199, 37229, 37248, 37251, 37580, 37662, 37882, 38326, 38505, 38514, 38551, 38610, 38620, 38677, 38681, 38700, 39150, 39160, 39161, 39167, 39227, 39301, 39328, 40394, 41399, 41424, 41504, 41514, 42510, 42640, 42770, 42780, 43089, 43169, 43225, 43259, 43291, 44001, 44220, 44529, 44569, 44577, 44631, 44921, 45003, 46381, 46859, 50432);
UPDATE `item_template` SET `Flags`=67584 WHERE `entry` IN (7119, 35726, 35747, 35798, 36728, 36729, 36736, 36803, 36819, 36825, 37121, 37124, 37185, 37359, 37411, 37412, 37569, 37879, 38686, 40066, 40645, 40744, 42423, 44047, 44319);
-- Quest: RequiredItemId2
UPDATE `item_template` SET `Flags`=2048 WHERE `entry` IN (1013, 1130, 2728, 2735, 2744, 2750, 2925, 3084, 3157, 3163, 3254, 3257, 3264, 3411, 3901, 4522, 4740, 4753, 4759, 4802, 4844, 4849, 4888, 4894, 4897, 5018, 5062, 5584, 5841, 5854, 6247, 6249, 6251, 6258, 6652, 6809, 6839, 6845, 6930, 6952, 6991, 7293, 7846, 8052, 8391, 8392, 8393, 8396, 9589, 10511, 11018, 11184, 11185, 11188, 11269, 11318, 11479, 11725, 11831, 12335, 12607, 12623, 12735, 13354, 13356, 13357, 15849, 15852, 15924, 18335, 18792, 18953, 19699, 19702, 19705, 20374, 20376, 20513, 20514, 20858, 20861, 20864, 20935, 21149, 21936, 22567, 23167, 23707, 23833, 24040, 24081, 24279, 24427, 29481, 29546, 30782, 30849, 31317, 32717, 33039, 33187, 34042, 34070, 35484, 35782, 37137, 41503, 41558, 42542, 42927, 46889);
UPDATE `item_template` SET `Flags`=67584 WHERE `entry` IN (36875, 44320);
-- Quest: RequiredItemId3
UPDATE `item_template` SET `Flags`=2048 WHERE `entry` IN (2378, 2730, 2738, 2745, 2751, 2939, 3412, 3509, 4843, 4895, 4896, 5019, 5585, 5853, 6252, 6259, 7848, 8073, 8392, 8393, 8394, 9591, 11185, 11480, 12337, 18954, 19700, 19703, 19706, 20377, 20858, 20859, 20860, 20861, 20862, 20863, 20864, 20865, 20944, 21148, 21935, 22677, 24042, 30783, 32716, 35795, 38638, 39328);
-- Quest: RequiredItemId4
UPDATE `item_template` SET `Flags`=2048 WHERE `entry` IN (732, 2732, 2740, 2748, 3510, 3720, 9592, 11184, 12219, 12735, 12753, 16743, 17411, 18335, 18955, 20858, 20859, 20860, 20861, 20862, 20863, 20864, 20865, 21146, 23166, 24043, 32718, 41363);
-- Book of Runes Chapter 1, 2, 3
UPDATE `item_template` SET `Flags`=3136 WHERE `entry` IN (33778, 33779, 33780);
-- Golem Blueprint Section 1, 2, 3
UPDATE `item_template` SET `Flags`=3136 WHERE `entry` IN (36849, 36850, 36851);
-- Grizzly Hide
UPDATE `item_template` SET `Flags`=2048 WHERE `entry`=37020;
-- Grizzly Flank
UPDATE `item_template` SET `Flags`=2048 WHERE `entry`=37200;
-- Demonic Rune Stone
UPDATE `item_template` SET `Flags`=2048 WHERE `entry`=28513;
-- Bleeding Hollow Blood
UPDATE `item_template` SET `Flags`=2112 WHERE `entry`=30425;
-- Shredder Operating Manual
UPDATE `item_template` SET `Flags`=3136 WHERE `entry` IN (16645, 16646, 16647, 16648, 16649, 16650, 16651, 16652, 16653, 16654, 16655, 16656);
-- Icetip Venom Sac
UPDATE `item_template` SET `Flags`=67840 WHERE `entry`=40944;
-- Sunscale Feather
UPDATE `item_template` SET `Flags`=2112 WHERE `entry`=5165;
-- Charred Razormane Wand
UPDATE `item_template` SET `Flags`=2048 WHERE `entry`=5092;
-- Razormane Backstabber
UPDATE `item_template` SET `Flags`=2048 WHERE `entry`=5093;
-- Razormane War Shield
UPDATE `item_template` SET `Flags`=2048 WHERE `entry`=5094;
-- Uncured Caribou Hide
UPDATE `item_template` SET `Flags`=3136 WHERE `entry`=35288;
-- Black Blood of Yogg-Saron Sample
UPDATE `item_template` SET `Flags`=67584 WHERE `entry`=36725;

-- Ruby Lilac
UPDATE `gameobject` SET `spawntimesecs`=1 WHERE `id`=188489;

-- Gurgleboggle's Bauble
UPDATE `gameobject` SET `spawntimesecs`=1 WHERE `id`=187885;
-- Burblegobble's Bauble
UPDATE `gameobject` SET `spawntimesecs`=1 WHERE `id`=187886;

-- Warsong Munitions
UPDATE `creature_loot_template` SET `Chance`=38 WHERE `Entry`=24566 AND `Item`=34709;
UPDATE `creature_loot_template` SET `Chance`=38 WHERE `Entry`=25294 AND `Item`=34709;
UPDATE `creature_loot_template` SET `Chance`=38 WHERE `Entry`=25445 AND `Item`=34709;
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=24566 AND `ItemId`=34709;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (24566, 0, 34709);
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=25294 AND `ItemId`=34709;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (25294, 1, 34709);
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=25445 AND `ItemId`=34709;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (25445, 1, 34709);

-- Super Strong Metal Plate
UPDATE `creature_loot_template` SET `Chance`=35 WHERE `Entry`=25496 AND `Item`=34786;
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=25496 AND `ItemId`=34786;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (25496, 2, 34786);

-- Bloodspore Carpel
UPDATE `creature_loot_template` SET `Chance`=36 WHERE `Entry`=25468 AND `Item`=34974;
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=25468 AND `ItemId`=34974;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (25468, 0, 34974);

-- Fizzcrank Spare Parts
UPDATE `creature_loot_template` SET `Chance`=43 WHERE `Entry`=25752 AND `Item`=34972;
UPDATE `creature_loot_template` SET `Chance`=43 WHERE `Entry`=25753 AND `Item`=34972;
UPDATE `creature_loot_template` SET `Chance`=43 WHERE `Entry`=25758 AND `Item`=34972;
UPDATE `creature_loot_template` SET `Chance`=43 WHERE `Entry`=25814 AND `Item`=34972;
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=25752 AND `ItemId`=34972;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (25752, 0, 34972);
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=25753 AND `ItemId`=34972;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (25753, 0, 34972);
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=25758 AND `ItemId`=34972;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (25758, 0, 34972);
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=25814 AND `ItemId`=34972;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (25814, 0, 34972);

-- Scourged Earth
UPDATE `creature_loot_template` SET `Chance`=48 WHERE `Entry`=26202 AND `Item`=34774;
UPDATE `creature_loot_template` SET `Chance`=48 WHERE `Entry`=25700 AND `Item`=34774;
UPDATE `creature_loot_template` SET `Chance`=48 WHERE `Entry`=25701 AND `Item`=34774;
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=26202 AND `ItemId`=34774;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (26202, 1, 34774);
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=25700 AND `ItemId`=34774;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (25700, 1, 34774);
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=25701 AND `ItemId`=34774;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (25701, 1, 34774);

-- Frostberry
UPDATE `creature_loot_template` SET `Chance`=44 WHERE `Entry`=25707 AND `Item`=35492;
UPDATE `creature_loot_template` SET `Chance`=44 WHERE `Entry`=25717 AND `Item`=35492;
UPDATE `creature_loot_template` SET `Chance`=44 WHERE `Entry`=25722 AND `Item`=35492;
UPDATE `creature_loot_template` SET `Chance`=44 WHERE `Entry`=25728 AND `Item`=35492;
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=25707 AND `ItemId`=35492;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (25707, 2, 35492);
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=25717 AND `ItemId`=35492;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (25717, 0, 35492);
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=25722 AND `ItemId`=35492;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (25722, 0, 35492);
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=25728 AND `ItemId`=35492;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (25728, 1, 35492);

-- Black Blood of Yogg-Saron Sample
DELETE FROM `creature_loot_template` WHERE `Entry`=26605 AND `Item`=36725;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES (26605, 36725, 40, 'Anub\'ar Underlord - Black Blood of Yogg-Saron Sample');
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=26605 AND `ItemId`=36725;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (26605, 2, 36725);

-- Scarlet Onslaught Weapon
UPDATE `creature_loot_template` SET `Chance`=54 WHERE `Entry`=27207 AND `Item`=37137;
UPDATE `creature_loot_template` SET `Chance`=54 WHERE `Entry`=27234 AND `Item`=37137;
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=27207 AND `ItemId`=37137;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (27207, 0, 37137);
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=27234 AND `ItemId`=37137;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (27234, 0, 37137);

-- Scarlet Onslaught Armor
UPDATE `creature_loot_template` SET `Chance`=42 WHERE `Entry`=27203 AND `Item`=37136;
UPDATE `creature_loot_template` SET `Chance`=42 WHERE `Entry`=27206 AND `Item`=37136;
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=27203 AND `ItemId`=37136;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (27203, 0, 37136);
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=27206 AND `ItemId`=37136;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (27206, 1, 37136);

-- Forgotten Treasure
UPDATE `creature_loot_template` SET `Chance`=49 WHERE `Entry`=27226 AND `Item`=37580;
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=27226 AND `ItemId`=37580;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (27226, 2, 37580);

-- Emerald Dragon Tier
UPDATE `creature_loot_template` SET `Chance`=46 WHERE `Entry`=27254 AND `Item`=37124;
DELETE FROM `creature_questitem` WHERE `CreatureEntry`=27254 AND `ItemId`=37124;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`) VALUES (27254, 2, 37124);
