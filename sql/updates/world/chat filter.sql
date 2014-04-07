CREATE TABLE IF NOT EXISTS `letter_analogs` (
  `letter` varchar(1) NOT NULL DEFAULT '',
  `analogs` varchar(128) DEFAULT '',
  PRIMARY KEY (`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 MAX_ROWS=26;

DELETE FROM `letter_analogs` WHERE `letter` >= 'a' AND `letter` <= 'z';
INSERT INTO `letter_analogs` VALUES 
('a', 'а@'),
('b', 'бьв'),
('c', 'с'),
('d', 'д'),
('e', 'её'),
('f', 'ф'),
('g', 'г'),
('h', 'хн'),
('i', 'ий'),
('j', 'яж'),
('k', 'к'),
('l', 'л'),
('m', 'м'),
('n', 'н'),
('o', 'о0'),
('p', 'пр'),
('q', 'к'),
('r', 'рг'),
('s', 'с$'),
('t', 'т'),
('u', 'ую'),
('v', 'в'),
('w', 'вшщ'),
('x', 'х'),
('y', 'иу'),
('z', 'з3');


DROP TABLE IF EXISTS `bad_word`;
CREATE TABLE `bad_word` (
  `bad_word` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`bad_word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bad word';


DELETE FROM `trinity_string` WHERE `entry` BETWEEN 20000 AND 20001;
INSERT INTO `trinity_string` VALUES (20000, 'Message shoma be dalile dar bar dashtane kalame gheyr-r-mojaz ersal nashod. Kalame: \'%s\'.', NULL, NULL, NULL, NULL, 

NULL, NULL, NULL, '');

