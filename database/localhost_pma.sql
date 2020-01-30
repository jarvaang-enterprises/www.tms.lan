--
-- Database: `pma`
--
CREATE DATABASE IF NOT EXISTS `pma` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `pma`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

--
-- RELATIONS FOR TABLE `pma__bookmark`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

--
-- RELATIONS FOR TABLE `pma__central_columns`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

--
-- RELATIONS FOR TABLE `pma__column_info`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- RELATIONS FOR TABLE `pma__designer_settings`:
--

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('admin.olympia.lan', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- RELATIONS FOR TABLE `pma__export_templates`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

--
-- RELATIONS FOR TABLE `pma__favorite`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

--
-- RELATIONS FOR TABLE `pma__history`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- RELATIONS FOR TABLE `pma__navigationhiding`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

--
-- RELATIONS FOR TABLE `pma__pdf_pages`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--
-- Creation: Nov 20, 2019 at 09:25 AM
-- Last update: Nov 24, 2019 at 07:17 PM
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- RELATIONS FOR TABLE `pma__recent`:
--

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('admin.olympia.lan', '[{\"db\":\"tenant_management_sys\",\"table\":\"pay_info\"},{\"db\":\"tenant_management_sys\",\"table\":\"payment_details\"},{\"db\":\"tenant_management_sys\",\"table\":\"rent_credit\"},{\"db\":\"tenant_management_sys\",\"table\":\"defaulters_rent\"},{\"db\":\"tenant_management_sys\",\"table\":\"house_info\"},{\"db\":\"tenant_management_sys\",\"table\":\"NINS\"},{\"db\":\"tenant_management_sys\",\"table\":\"tenant_images\"},{\"db\":\"tenant_management_sys\",\"table\":\"Manager\"},{\"db\":\"tenant_management_sys\",\"table\":\"rentals_info\"},{\"db\":\"tenant_management_sys\",\"table\":\"tenant_details\"}]'),
('laravel', '[{\"db\":\"laravel\",\"table\":\"tasks\"},{\"db\":\"laravel\",\"table\":\"users\"},{\"db\":\"laravel\",\"table\":\"password_resets\"}]'),
('phpmyadminuser', '[{\"db\":\"laravel\",\"table\":\"tasks\"},{\"db\":\"tenant_management_sys\",\"table\":\"house_info\"},{\"db\":\"tenant_management_sys\",\"table\":\"pay_info\"},{\"db\":\"tenant_management_sys\",\"table\":\"defaulters_rent\"},{\"db\":\"tenant_management_sys\",\"table\":\"rentals_info\"},{\"db\":\"tenant_management_sys\",\"table\":\"accounts\"},{\"db\":\"tenant_management_sys\",\"table\":\"NINS\"},{\"db\":\"tenant_management_sys\",\"table\":\"payment_details\"},{\"db\":\"tenant_management_sys\",\"table\":\"tenant_details\"},{\"db\":\"tenant_management_sys\",\"table\":\"Manager\"}]'),
('pma', '[{\"db\":\"pma\",\"table\":\"pma__userconfig\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

--
-- RELATIONS FOR TABLE `pma__relation`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

--
-- RELATIONS FOR TABLE `pma__savedsearches`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- RELATIONS FOR TABLE `pma__table_coords`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- RELATIONS FOR TABLE `pma__table_info`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- RELATIONS FOR TABLE `pma__table_uiprefs`:
--

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('admin.olympia.lan', 'tenant_management_sys', 'house_info', '{\"sorted_col\":\"`house_id` ASC\"}', '2019-11-19 09:06:46'),
('admin.olympia.lan', 'tenant_management_sys', 'tenant_details', '{\"sorted_col\":\"`tenant_details`.`ten_id` ASC\"}', '2019-11-22 13:21:26');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

--
-- RELATIONS FOR TABLE `pma__tracking`:
--

--
-- Dumping data for table `pma__tracking`
--

INSERT INTO `pma__tracking` (`db_name`, `table_name`, `version`, `date_created`, `date_updated`, `schema_snapshot`, `schema_sql`, `data_sql`, `tracking`, `tracking_active`) VALUES
('tenant_management_sys', 'tenant_details', 1, '2019-11-19 10:32:37', '2019-11-19 10:48:55', 'a:2:{s:7:\"COLUMNS\";a:7:{i:0;a:8:{s:5:\"Field\";s:6:\"ten_id\";s:4:\"Type\";s:7:\"int(11)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:14:\"auto_increment\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:7:\"ten_nin\";s:4:\"Type\";s:11:\"varchar(14)\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"UNI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:11:\"ten_contact\";s:4:\"Type\";s:12:\"varchar(200)\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";s:9:\"Not Given\";s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:9:\"ten_email\";s:4:\"Type\";s:11:\"varchar(35)\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";s:9:\"Not Given\";s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:8:\"ten_pAdd\";s:4:\"Type\";s:12:\"varchar(100)\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";s:9:\"Not Given\";s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:5;a:8:{s:5:\"Field\";s:8:\"house_id\";s:4:\"Type\";s:11:\"varchar(11)\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:6;a:8:{s:5:\"Field\";s:10:\"ten_img_id\";s:4:\"Type\";s:12:\"timestamp(6)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"UNI\";s:7:\"Default\";s:20:\"CURRENT_TIMESTAMP(6)\";s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:3:{i:0;a:13:{s:5:\"Table\";s:14:\"tenant_details\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:6:\"ten_id\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:2:\"21\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:14:\"tenant_details\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"ten_nin\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:7:\"ten_nin\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:2:\"21\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:2;a:13:{s:5:\"Table\";s:14:\"tenant_details\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:10:\"ten_img_id\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:10:\"ten_img_id\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:2:\"21\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2019-11-19 10:32:37 admin.olympia.lan\nDROP TABLE IF EXISTS `tenant_details`;\n# log 2019-11-19 10:32:37 admin.olympia.lan\n\nCREATE TABLE `tenant_details` (\n  `ten_id` int(11) NOT NULL,\n  `ten_nin` varchar(14) NOT NULL,\n  `ten_contact` varchar(200) NOT NULL DEFAULT \'Not Given\',\n  `ten_email` varchar(35) NOT NULL DEFAULT \'Not Given\',\n  `ten_pAdd` varchar(100) NOT NULL DEFAULT \'Not Given\',\n  `house_id` varchar(11) NOT NULL,\n  `ten_img_id` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;\n\n# log 2019-11-19 10:48:55 admin.olympia.lan\nALTER TABLE `tenant_details` CHANGE `house_id` `house_id` INT(11) NOT NULL;', '\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- RELATIONS FOR TABLE `pma__userconfig`:
--

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('admin.olympia.lan', '2019-05-09 11:15:55', '{\"collation_connection\":\"utf8mb4_unicode_ci\"}'),
('laravel', '2019-11-21 11:03:51', '{\"collation_connection\":\"utf8mb4_unicode_ci\"}'),
('olympia', '2019-05-09 11:14:30', '{\"collation_connection\":\"utf8mb4_unicode_ci\"}'),
('phpmyadminuser', '2019-05-25 09:41:09', '{\"collation_connection\":\"utf8mb4_unicode_ci\"}'),
('pma', '2019-11-07 03:48:57', '{\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

--
-- RELATIONS FOR TABLE `pma__usergroups`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- RELATIONS FOR TABLE `pma__users`:
--

--
-- Dumping data for table `pma__users`
--

INSERT INTO `pma__users` (`username`, `usergroup`) VALUES
('admin.olympia.lan', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;