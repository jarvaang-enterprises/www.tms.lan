--
-- Database: `laravel`
--
CREATE DATABASE IF NOT EXISTS `laravel` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `laravel`;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--
-- Creation: Nov 21, 2019 at 12:54 PM
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELATIONS FOR TABLE `failed_jobs`:
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--
-- Creation: Nov 21, 2019 at 12:54 PM
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELATIONS FOR TABLE `migrations`:
--

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_11_21_113028_create_tasks_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--
-- Creation: Nov 21, 2019 at 12:54 PM
--

CREATE TABLE `password_resets` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELATIONS FOR TABLE `password_resets`:
--

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--
-- Creation: Nov 21, 2019 at 12:54 PM
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_complete` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELATIONS FOR TABLE `tasks`:
--   `user_id`
--       `users` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- Creation: Nov 21, 2019 at 12:54 PM
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELATIONS FOR TABLE `users`:
--

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@example.com', '2019-11-21 09:54:25', '$2y$10$WFfki7O3xa8F0ZEetSqUJuKhLCaijt3Ul.zqqo6g2m1Bw6B4XNO7.', 'FTf01MOgdv', '2019-11-21 09:54:25', '2019-11-21 09:54:25'),
(2, 'Malvina Gorczany', 'ewell.ondricka@example.net', '2019-11-21 09:54:25', '$2y$10$dMrKqP/SC94GIaRybBFSd.AYxp.Uu3uJ76KZb4vBoRlDPSl7h.tjK', 'XgEPZfmqB2', '2019-11-21 09:54:30', '2019-11-21 09:54:30'),
(3, 'Maegan Hoppe', 'jeanette.mcdermott@example.net', '2019-11-21 09:54:25', '$2y$10$xJxHH/V5HZmDTQB9Ziatru9Hifj4TlSbIN95UucQuyrR4W5CoP4Qu', 'IKEdmP53rp', '2019-11-21 09:54:30', '2019-11-21 09:54:30'),
(4, 'Cody Breitenberg', 'marina42@example.com', '2019-11-21 09:54:25', '$2y$10$pDIMH3N2/K1m191LX0tWPu0X.KMUgJ9DAcuNbzZmT8I7f.GA7aOne', 'nRuZUwcqPL', '2019-11-21 09:54:30', '2019-11-21 09:54:30'),
(5, 'Lisa Hammes', 'mittie.kub@example.net', '2019-11-21 09:54:25', '$2y$10$ZiciBtm45Vaf2b0sKpjuiuRtJgljPkn2WNOxlK3K598eVNLh3Muj6', 'z9vwkHOGAS', '2019-11-21 09:54:31', '2019-11-21 09:54:31'),
(6, 'Casandra Von', 'leilani.cassin@example.com', '2019-11-21 09:54:25', '$2y$10$ImJp73PB4bCT.Rukf3k1e.bQK4ofbJJOgZmp7xqjBux7.0lGIPBfC', '0KX0NCnH8W', '2019-11-21 09:54:31', '2019-11-21 09:54:31'),
(7, 'Mr. Damien Graham II', 'haag.rene@example.net', '2019-11-21 09:54:25', '$2y$10$hMNX8GvbUt4FTeDsf8Gv4.E5tUqOp36eS9kf8ZPv68lOZ2eUNSiIy', 'mxuhkxPkLx', '2019-11-21 09:54:31', '2019-11-21 09:54:31'),
(8, 'Cassandra Nolan V', 'mgrimes@example.net', '2019-11-21 09:54:26', '$2y$10$mgF3lFkO4fbeJZgVbfF70.afopOLIFN/.T4mFI06s9gcwsrM65up2', '4pfa7Q6LdK', '2019-11-21 09:54:31', '2019-11-21 09:54:31'),
(9, 'Nella Feil', 'bradtke.elva@example.net', '2019-11-21 09:54:26', '$2y$10$AlfGrHDG.JNykmXMqqXrq.HPMSOK1OYAlTB2V55VF/UW/mYIhjc7G', 'nVDQSP2Igw', '2019-11-21 09:54:31', '2019-11-21 09:54:31'),
(10, 'Ms. Ayla Wehner III', 'kreiger.nona@example.net', '2019-11-21 09:54:26', '$2y$10$qMXVqVutpjsPEZhOv6UcVuhcA3gVJnmPUmin1oCfZuaotz.KhGdQC', 'xBJKVk5mRq', '2019-11-21 09:54:31', '2019-11-21 09:54:31'),
(11, 'Verner Harber', 'schultz.juliana@example.com', '2019-11-21 09:54:26', '$2y$10$g62FvJTWEXW.suu8jnXu..ou3AClzIFlflydj1a6qsHN5ElCvEsLm', 'BSbQdy4bRZ', '2019-11-21 09:54:31', '2019-11-21 09:54:31'),
(12, 'Ms. Alexandra Koch Sr.', 'irma71@example.net', '2019-11-21 09:54:26', '$2y$10$QESFHJ82jTdcWnt/R6pl7.iWBY//TiBHrvyzfgbC.7qjOvY4/GdvC', '8KM97RsRWi', '2019-11-21 09:54:31', '2019-11-21 09:54:31'),
(13, 'Cindy Moen Sr.', 'kirstin.donnelly@example.com', '2019-11-21 09:54:26', '$2y$10$5CN.UvauU3Rl9XoBlNjYsO0U4fizaOo3UdDw/A85Q3Y8.MCNQcXJu', 'QhCldgPd8o', '2019-11-21 09:54:31', '2019-11-21 09:54:31'),
(14, 'Nedra Turcotte', 'ines.waters@example.org', '2019-11-21 09:54:26', '$2y$10$eO8zklsQxaWLaC/O3VgG4.7uu0OAfmSGJ3biU5G55Y9vV8l6H6py.', 'KnXRsE17b4', '2019-11-21 09:54:31', '2019-11-21 09:54:31'),
(15, 'Erik Cremin', 'ryder53@example.net', '2019-11-21 09:54:26', '$2y$10$2WoFuzWTjCITbmlX0AlyhebHnVlZ7ovci1oZPDzBHYr9z7V7tLkr6', 'OfqFJ5v9xg', '2019-11-21 09:54:32', '2019-11-21 09:54:32'),
(16, 'Dr. Gracie Stanton MD', 'schuster.gabe@example.com', '2019-11-21 09:54:26', '$2y$10$.pEUhc.N9/5D6Ad/C3ZQCe7sxZyTE3yVDW9rmhmWZKtKpVkuBoV2y', 'xghhmz9Sqh', '2019-11-21 09:54:32', '2019-11-21 09:54:32'),
(17, 'Randy Kiehn', 'mbartoletti@example.net', '2019-11-21 09:54:26', '$2y$10$68gE1QLCGxxI1qPIInqEAer2yD3iZe6rZ1ULITkBiRwNuZcZR2aZi', 'MZvF3fg9di', '2019-11-21 09:54:32', '2019-11-21 09:54:32'),
(18, 'Mr. Colin Stanton I', 'tvonrueden@example.net', '2019-11-21 09:54:26', '$2y$10$HeDNbu5d0H9crc1EL3onUuitx6uDa0jB3TA6d/Jgucx28jpDeY/vi', 'kYw1aHPJVb', '2019-11-21 09:54:32', '2019-11-21 09:54:32'),
(19, 'Janiya Nolan', 'jorge.lakin@example.com', '2019-11-21 09:54:27', '$2y$10$3ENGrxJQFzAPgmkC3zqw2uYnLAbVakQ2brkmymuJa6ESsayUCxK6q', 'Xo79yAYhEX', '2019-11-21 09:54:32', '2019-11-21 09:54:32'),
(20, 'Gaston Langworth', 'dallas57@example.org', '2019-11-21 09:54:27', '$2y$10$w.hhOwWbFZ6qzDp3VqOmS.BvzqaWym55G1t6aqhIz5jLTKMFWJwfy', 'Lxv0fWMffc', '2019-11-21 09:54:32', '2019-11-21 09:54:32'),
(21, 'Tyreek Wehner', 'mona.yundt@example.org', '2019-11-21 09:54:27', '$2y$10$tOVHaokY9SAik2QQwvxLI.Ej13.uhJzc0jCUSCBkK5KcLbx83heE6', 'RXHYobTAin', '2019-11-21 09:54:32', '2019-11-21 09:54:32'),
(22, 'Jerald Pfeffer', 'schmidt.cathy@example.com', '2019-11-21 09:54:27', '$2y$10$IDJ5S9.iFLcTKwPguDFvQed0/skU3cXYR1eb62j7M2YkIE696/44S', 'mYgKgZzCw7', '2019-11-21 09:54:32', '2019-11-21 09:54:32'),
(23, 'Prof. Vern Cremin', 'aryanna64@example.net', '2019-11-21 09:54:27', '$2y$10$5ARGWgoKbLnnCjQzEpZqAuVczfSBa/zODdrm4WzMLpVqZUT.iJ.yS', '7DsEP9GCeG', '2019-11-21 09:54:32', '2019-11-21 09:54:32'),
(24, 'Thelma Gaylord', 'kacie.huels@example.com', '2019-11-21 09:54:27', '$2y$10$UqQvaoV11HdF47kLEVQ/AuLmsyO6JlekAd.OkoExW8xZbuyElNdfa', 'VzuIov1IWu', '2019-11-21 09:54:32', '2019-11-21 09:54:32'),
(25, 'Prof. Connie O\'Kon', 'carroll.lexie@example.org', '2019-11-21 09:54:27', '$2y$10$0aV7ldMYKfntSxQOIVRvQOsnt6ltm7gACP1KqGlwCAhK6AJY/H1fi', 'CmYS81dITE', '2019-11-21 09:54:32', '2019-11-21 09:54:32'),
(26, 'Chase Wiza', 'fromaguera@example.org', '2019-11-21 09:54:27', '$2y$10$RuDMVfcB0cMQt4c8L6qUme5oYYuAhtUdzdx/4bumwlT6QglZO0m6y', 'pluyf30Ym1', '2019-11-21 09:54:32', '2019-11-21 09:54:32'),
(27, 'Myrna Bechtelar', 'murphy.camylle@example.org', '2019-11-21 09:54:27', '$2y$10$.01KLjLgn11PfAS2Auyl7.eUxPEASIoqxvrLBE1RYO9m0X7cF0n3m', 'alQGEylEWK', '2019-11-21 09:54:32', '2019-11-21 09:54:32'),
(28, 'Kavon Adams', 'erdman.maggie@example.com', '2019-11-21 09:54:27', '$2y$10$La9HCJF2ysDG/446Lesim.phqrIvsmFJ3E/gpDXJlYoS1T0fkwOdO', '1FsmZIY1qA', '2019-11-21 09:54:32', '2019-11-21 09:54:32'),
(29, 'Mr. Saige Kuhic DDS', 'elise.stehr@example.net', '2019-11-21 09:54:28', '$2y$10$vqljaDN/4Ge8Dgi.HC08metWUEjoAWCz9Em5J2MnE16PMTl6tWq2W', 'HdxzoYhuAQ', '2019-11-21 09:54:32', '2019-11-21 09:54:32'),
(30, 'Janelle Kreiger Sr.', 'deontae.walter@example.net', '2019-11-21 09:54:28', '$2y$10$17jafbQbZUgcwC2SPK/EROycRCNhMjXmMsOh3iQJNcOzcF1XT0Ipm', 'CL42OJrwA5', '2019-11-21 09:54:33', '2019-11-21 09:54:33'),
(31, 'Darrell Lockman', 'anabelle11@example.net', '2019-11-21 09:54:28', '$2y$10$tOX6qrxqfijVKZqSxgNhN.lq.Y/E8dtXXTZZxyp1rhhPy.LdOJOCy', '1WjY4ZSgCp', '2019-11-21 09:54:33', '2019-11-21 09:54:33'),
(32, 'Timmothy Runolfsson', 'ima.stoltenberg@example.com', '2019-11-21 09:54:28', '$2y$10$PBEN4f6qugQC5lw0JP8u.ux59TXIo4uAH7MVEmUSXhdidPpwqQOnO', 'GNfNzyRmUt', '2019-11-21 09:54:33', '2019-11-21 09:54:33'),
(33, 'Courtney Cartwright', 'callie18@example.org', '2019-11-21 09:54:28', '$2y$10$s2cWVwFFeco/mcgdNCRVPOj3.0WRQbqgr7snZMkn0cmGd5oipdDCe', 'ysW74lPLmc', '2019-11-21 09:54:33', '2019-11-21 09:54:33'),
(34, 'Mr. Austyn Hane', 'sanford.annalise@example.org', '2019-11-21 09:54:28', '$2y$10$nhHu9DfUBsi5mgrASLjMDOhcOnrqQ2dIaqlV4F5F5WccN6i/B9KL.', 'Bmu51OEZe8', '2019-11-21 09:54:33', '2019-11-21 09:54:33'),
(35, 'Dr. Keshawn Eichmann DVM', 'jodie.ziemann@example.org', '2019-11-21 09:54:28', '$2y$10$sg92pvbVaGWGQ2OsJchKJ.iiEMOsHGg2Wsv4QMe0xRjTdiAZ1gk3m', 'Kl482BZ8wp', '2019-11-21 09:54:33', '2019-11-21 09:54:33'),
(36, 'Janis Bayer', 'murray.rosanna@example.org', '2019-11-21 09:54:28', '$2y$10$016MbDAhvnh0mIplX0aAJ.GKXygipEEsAiblG4dH/gpP6R9GOvyay', 'lLQvYVMgUc', '2019-11-21 09:54:33', '2019-11-21 09:54:33'),
(37, 'Joshua Wintheiser IV', 'kshlerin.trent@example.org', '2019-11-21 09:54:28', '$2y$10$HzdtN2H7sPACSNMsmoQGK.iCa9QJuf/buSVX1/BAHmXu52KnT0FFm', 'VJziG8fjkr', '2019-11-21 09:54:33', '2019-11-21 09:54:33'),
(38, 'Marielle Hudson', 'kuhn.grayce@example.org', '2019-11-21 09:54:28', '$2y$10$JrU45FO60i9zI0knYR99oOxCHPB/Nm0C7YWxCzaRmu.XVEeSDaf6i', 'wrckdl1zZv', '2019-11-21 09:54:33', '2019-11-21 09:54:33'),
(39, 'Shaun Lehner', 'price.stroman@example.net', '2019-11-21 09:54:28', '$2y$10$1rZnU8zXvZdVwj3YhdT4w.WSzpOXMo5aIkN20Uju2aPObhfiYFN3m', 'PUzVxxUdFn', '2019-11-21 09:54:33', '2019-11-21 09:54:33'),
(40, 'Milan Morissette', 'tvon@example.com', '2019-11-21 09:54:29', '$2y$10$bujz0rrNGjLS7WwU9C2V..sROtLB3KAhnqi6Xb6/8XW9uzUl4FkQm', 'MAhFCSDrAM', '2019-11-21 09:54:33', '2019-11-21 09:54:33'),
(41, 'Neal Nader', 'simone18@example.org', '2019-11-21 09:54:29', '$2y$10$V0RWKCzMjlCUaJIebYFqjONTxMFVeLpA/RH254gsNg4GPcxKKDgdi', 'MgBa2cyEDr', '2019-11-21 09:54:33', '2019-11-21 09:54:33'),
(42, 'Urban Stracke DVM', 'kozey.marcos@example.com', '2019-11-21 09:54:29', '$2y$10$OLC7JLeIMD2WcbRcSH2fouKvNaNhFUJQIar8i6fvGAOtcY8Bi2nbS', 'MAW0Ud6RcC', '2019-11-21 09:54:33', '2019-11-21 09:54:33'),
(43, 'Meta Larkin', 'nathen77@example.com', '2019-11-21 09:54:29', '$2y$10$Vwjrk5SRqn0tgrz98/dUuuQbalnpHTBRSfgz4CHYEFZ4ySj1/n3vi', 'dyOmop0SJk', '2019-11-21 09:54:33', '2019-11-21 09:54:33'),
(44, 'Derick McLaughlin DDS', 'irempel@example.net', '2019-11-21 09:54:29', '$2y$10$M0HPpW5Cb9QoF05EfwLa2O.phKJ9rxMTsypvNwUySuiS43ReZ6Xle', 'ASFaQ32GXp', '2019-11-21 09:54:33', '2019-11-21 09:54:33'),
(45, 'Sarina Altenwerth', 'ila11@example.org', '2019-11-21 09:54:29', '$2y$10$fhnr5Yul0yentpAfzCFfJe6.idPccLVNozu1wuvdzlWSE1Rz3TDES', '7bhMJWieu3', '2019-11-21 09:54:33', '2019-11-21 09:54:33'),
(46, 'Amparo Haag', 'schuster.blaze@example.com', '2019-11-21 09:54:29', '$2y$10$giOeghqMHDdpUwpO67FeV.zhBksMQ9RtzIRXVirTtibqEtvXL5qKu', 'iw6raBMFGA', '2019-11-21 09:54:34', '2019-11-21 09:54:34'),
(47, 'Prof. Amelie Friesen MD', 'clotilde74@example.com', '2019-11-21 09:54:29', '$2y$10$IlrKD5inCvY3ijyqFShiRuf1b94.hpG4/jVMMWVAny1Yp4AHCSgca', 'QvFyPa2WBv', '2019-11-21 09:54:34', '2019-11-21 09:54:34'),
(48, 'Quinn Bashirian Sr.', 'kemmer.madelynn@example.net', '2019-11-21 09:54:29', '$2y$10$DDD6DMF10rDboufJ3w8eru0PAfl4zulRZ2.jQv54X24jcW.dn2yqq', 'poFsQudgoa', '2019-11-21 09:54:34', '2019-11-21 09:54:34'),
(49, 'Josiah Rippin Sr.', 'berta77@example.org', '2019-11-21 09:54:29', '$2y$10$DOWK0Shz2gS.hJzt40uTmuOQoPOzbj4YJuI/LdYXa4wxUhh2DXdyG', 'uYkRLjLpLR', '2019-11-21 09:54:34', '2019-11-21 09:54:34'),
(50, 'Prof. Wilbert Greenfelder DDS', 'alyson.cole@example.org', '2019-11-21 09:54:30', '$2y$10$rhz3UlvM67TRlh.7tOVuj.fuA1o0BkFlwQa9uTs7iJSiSzmK/BvdK', 'Yv6CzggLTc', '2019-11-21 09:54:34', '2019-11-21 09:54:34'),
(51, 'Lambert Treutel V', 'janiya95@example.org', '2019-11-21 09:54:30', '$2y$10$7ejkOU9c/FogLggL.TN4cOy7u00lF5nTcXA/Y3habHvnVjYwBLHGm', 'INgzwzZR7G', '2019-11-21 09:54:34', '2019-11-21 09:54:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
