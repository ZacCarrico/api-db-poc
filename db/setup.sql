CREATE DATABASE db;
use db;

CREATE TABLE `site` (
  `name` varchar(50) NOT NULL,
  `address` varchar(250) NOT NULL,
  `instrument_id` int unsigned NOT NULL,
  UNIQUE (`name`, `address`, `instrument_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

insert  into `site`(`name`,`address`,`instrument_id`) values
('site1','address1',1),
('site1','address1',2),
('site2','address2',3);

CREATE TABLE `instrument` (
  `id` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `mac` varchar(250),
  `container` varchar(250),
  UNIQUE (`id`, `name`, `mac`, `container`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

insert  into `instrument`(`id`,`name`,`mac`,`container`) values
(1,'inst1','mac1',NULL),
(2,'inst2',NULL,'uuid1'),
(2,'inst2',NULL,'uuid2');

CREATE TABLE `container` (
  `id` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

insert  into `container`(`id`,`description`) values
('uuid1', 'some description'),
('uuid2', 'some other description');