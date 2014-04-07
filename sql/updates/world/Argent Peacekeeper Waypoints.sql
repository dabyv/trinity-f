UPDATE creature_template SET InhabitType=4 WHERE entry=35587;
DELETE FROM creature_template_addon WHERE entry=35587;

DELETE FROM creature WHERE id=35587;
INSERT INTO creature VALUES
(78186,35587,571,1,1,0,0,5815.75,563.632,666.388,3.24,180,0,0,12600,39940,2,0,0,0);

DELETE FROM creature_addon WHERE guid=78186;
INSERT INTO creature_addon VALUES(78186,78186,22471,0,257,0,'');

DELETE FROM waypoint_data where id=78186;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES (78186, 1, 5804.21, 561.45, 666.388, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES (78186, 2, 5770.37, 587.736, 666.388, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES (78186, 3, 5727.9, 620.731, 666.388, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES (78186, 4, 5726.91, 633.924, 666.388, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES (78186, 5, 5770.24, 697.633, 666.388, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES (78186, 6, 5798.72, 718.738, 666.388, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES (78186, 7, 5822.09, 702.071, 666.388, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES (78186, 8, 5882.25, 659.156, 666.388, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES (78186, 9, 5877.21, 645.72, 666.388, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES (78186, 10, 5849.25, 612.713, 666.388, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES (78186, 11, 5841.52, 592.843, 666.388, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES (78186, 12, 5836.2, 579.204, 666.388, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES (78186, 13, 5816.59, 567.374, 666.388, 0, 0, 0, 100, 0);
