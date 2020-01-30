--
-- Database: `tenant_management_sys`
--
CREATE DATABASE IF NOT EXISTS `tenant_management_sys` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tenant_management_sys`;

-- --------------------------------------------------------

--
-- Table structure for table `Cashier`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `Cashier` (
  `ID` int(11) NOT NULL,
  `NIN` varchar(14) NOT NULL,
  `fName` varchar(255) NOT NULL,
  `lName` varchar(255) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Tel` int(10) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `complaintscID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Cashier`:
--   `complaintscID`
--       `complaints` -> `cID`
--

--
-- Dumping data for table `Cashier`
--

INSERT INTO `Cashier` (`ID`, `NIN`, `fName`, `lName`, `DOB`, `Tel`, `Email`, `image`, `Address`, `complaintscID`) VALUES
(0, 'CM165658564XM6', 'try', 'try', NULL, 0, 'try@tms.lan', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Clientele`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `Clientele` (
  `NIN` varchar(14) NOT NULL,
  `fName` varchar(255) NOT NULL,
  `lName` varchar(255) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Tel` int(10) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Service_Required` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Clientele`:
--

--
-- Dumping data for table `Clientele`
--

INSERT INTO `Clientele` (`NIN`, `fName`, `lName`, `DOB`, `Tel`, `Email`, `image`, `Address`, `Service_Required`) VALUES
('CM165658564XM5', 'Test', 'Aeon', NULL, 0, 'aanga26@gmail.com', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Manager`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `Manager` (
  `NIN` varchar(14) CHARACTER SET utf8 NOT NULL,
  `DOB` date DEFAULT NULL,
  `Tel` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Manager`:
--   `NIN`
--       `NINS` -> `NIN`
--

--
-- Dumping data for table `Manager`
--

INSERT INTO `Manager` (`NIN`, `DOB`, `Tel`, `Email`, `image`, `Address`) VALUES
('11111111111111', '1964-09-23', '0752464674, 0772464674', 'gssekitto@gmail.com', '/includes/man/images/landlord.jpeg', '230, Luweero\r\nKyengera, Wakimese'),
('CM165658564XM4', '1998-08-19', '0705568794', 'admin@olympia.lan', '/includes/man/images/admin.jpeg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `NINS`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `NINS` (
  `ID` int(11) NOT NULL,
  `NIN` varchar(14) NOT NULL,
  `fName` varchar(255) NOT NULL,
  `lName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `NINS`:
--

--
-- Dumping data for table `NINS`
--

INSERT INTO `NINS` (`ID`, `NIN`, `fName`, `lName`) VALUES
(1, 'CM165658564XM4', 'Lawrence', 'Aeon'),
(5, 'CM165H4FD0P7M9', 'Not Given', 'Katiiti'),
(6, '00000000tendo1', 'Tendo', 'Nakyeyune'),
(7, '00000000000002', 'Jackson', 'Kadumye'),
(8, '00000000000003', 'Florence', 'Musasizi'),
(9, '00000000000004', 'Resty', 'Nakato'),
(10, '00000000000005', 'Andrew', 'Muhima'),
(11, '00000000000006', 'Priscillar Solomy', 'Kigozi'),
(12, '00000000000007', 'Joseph', 'Ofumbo'),
(13, '00000000000008', 'Grace', 'Tumwine'),
(14, '00000000000009', 'Edward', 'Kabugo'),
(15, '00000000000010', 'Micheal', 'Waidha'),
(16, '00000000000011', 'Victoria', 'Nakubulwa'),
(17, '00000000000012', 'Samuel', 'Kibalama'),
(18, '00000000000013', 'Not Given', 'Nambogo'),
(19, '00000000000014', 'Moses', 'Ssenkayi'),
(20, '00000000000015', 'Jimmy', 'Sembatya'),
(21, '00000000000016', 'Aminah', 'Birungi'),
(22, '00000000000017', 'Moses', 'Yiga'),
(23, '00000000000018', 'James', 'Juuko'),
(24, '00000000000019', 'Hadijah', 'Namyalo'),
(25, '00000000000020', 'Nelly', 'Bakoka'),
(26, '00000000000021', 'Philip', 'Kimbugwe'),
(27, '11111111111111', 'Gerald Kalule', 'Ssekitto');

-- --------------------------------------------------------

--
-- Table structure for table `Services`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `Services` (
  `service_id` int(11) NOT NULL,
  `water_meter_no` varchar(12) NOT NULL,
  `water_cust_no` varchar(14) DEFAULT NULL,
  `Umeme_no` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `Services`:
--   `service_id`
--       `house_info` -> `house_id`
--

--
-- Dumping data for table `Services`
--

INSERT INTO `Services` (`service_id`, `water_meter_no`, `water_cust_no`, `Umeme_no`) VALUES
(3, '07-409112', '21137546', '04260133428'),
(4, '07-409112', '21137546', '04256356058'),
(5, '07-409112', '21137546', '04260740719'),
(6, '07-409112', '21137546', 'N/A'),
(7, '07-409112', '21137546', '04261787016'),
(8, '07-409112', '21137546', '04236424141'),
(9, '07-409107', '21137691', '04238755849'),
(10, '17-9225428', NULL, '04236424950'),
(11, '17-9225427', '21152254', '04238383089'),
(12, '13-075265', '21232539', '04237237757'),
(13, '13-078107', '21234383', '04253286316'),
(14, '12-047306', '21212878', '04238738837'),
(30, '0000000000', '00000000', '00000000000');

-- --------------------------------------------------------

--
-- Table structure for table `Trainer`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `Trainer` (
  `NIN` varchar(14) NOT NULL,
  `fName` varchar(255) NOT NULL,
  `lName` varchar(255) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Tel` int(10) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Service_Offered` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Trainer`:
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--
-- Creation: Nov 20, 2019 at 09:25 AM
-- Last update: Nov 24, 2019 at 07:00 PM
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `NIN` varchar(14) NOT NULL,
  `username` varchar(255) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `level` int(1) NOT NULL,
  `confirm` int(2) DEFAULT '0',
  `authkey` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `accounts`:
--   `NIN`
--       `NINS` -> `NIN`
--

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `NIN`, `username`, `pass`, `level`, `confirm`, `authkey`, `status`) VALUES
(1, 'CM165658564XM4', 'admin@olympia.lan', '098f6bcd4621d373cade4e832627b4f6', 1, 1, 'ba0208ceda2a80122f878e91d61388c0', 1),
(5, 'CM165H4FD0P7M9', 'test', '098f6bcd4621d373cade4e832627b4f6', 4, 1, '098f6bcd4621d373cade4e832627b4f6', 1),
(6, '00000000tendo1', 'ntendo', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, '6e722265bad581d9cedbb350a554f1e7', 1),
(7, '00000000000002', 'jkadumye', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, 'b5d37843dcde61cbe3b5e9023f73f435', 1),
(8, '00000000000003', 'mflorence', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, '2b6bc2a909eab7fd872d2cc15fc9c384', 1),
(9, '00000000000004', 'nresty', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, '9fbad4b88e371191c3768394f59b80b1', 0),
(10, '00000000000005', 'tmadrine', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, 'fa1fcca0c22f9731dc72c479a538f22f', 0),
(11, '00000000000006', 'spkigozi', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, 'f2b15e61875dff06c1e441cbbf725db5', 0),
(12, '00000000000007', 'jofumbo', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, 'b88b220c9473d76832173ceaf78d7cbe', 0),
(13, '00000000000008', 'tgrace', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, '699ead786a7b9cde48ec98341b81e62c', 0),
(14, '00000000000009', 'ekabugo', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, '5d20dc9753495102d357e5760efb2937', 0),
(15, '00000000000010', 'mwaidha', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, '9b02129454465615ecafc371f8e8e5be', 0),
(16, '00000000000011', 'nvictoria', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, '618924f7958e7a4a63ab5ed67dfbea79', 0),
(17, '00000000000012', 'ksamuel', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, '6d636037b22bda26f320fbfe44ed8b5b', 0),
(18, '00000000000013', 'nambogo', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, 'a08abddea4d8ae382f26eb2789c22d4b', 0),
(19, '00000000000014', 'msenkayi', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, '3664f57cf185a9f77590dc0eecbd2c0a', 0),
(20, '00000000000015', 'jsembatya', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, 'a030cd70057a6bd70e77cc9de3ae3a0e', 0),
(21, '00000000000016', 'baminah', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, '18c090977680c746d7b528aa17a0add6', 0),
(22, '00000000000017', 'myiga', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 0, '7c5360daf24a364a8d07ac6c1bfa6bc5', 0),
(23, '00000000000018', 'jjuujo', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, 'e6f43b508504e873f0976e9afbf0bcd5', 0),
(24, '00000000000019', 'hnamyalo', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 0, '01422afed3d1c472d87a37b87bf9039d', 0),
(25, '00000000000020', 'nbakoka', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, 'd11361e4b34ae84d79d7e72784b2fcad', 0),
(26, '00000000000021', 'kphilip', '9e9bbdcf1c723753f617a0f2be7c9bfb', 4, 1, '95176b4c4a3ab890a384f6d18cdca8eb', 0),
(27, '11111111111111', 'gssekitto', '9e9bbdcf1c723753f617a0f2be7c9bfb', 1, 1, 'a29a7b2486c0183ad7fea5e0614667b8', 1);

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `appointments` (
  `TrainerNIN` varchar(14) CHARACTER SET latin1 DEFAULT NULL,
  `appointmentDate` date DEFAULT NULL,
  `ClienteleNIN` varchar(14) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `appointments`:
--   `ClienteleNIN`
--       `Clientele` -> `NIN`
--   `TrainerNIN`
--       `Trainer` -> `NIN`
--

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `complaints` (
  `TrainerNIN` varchar(14) DEFAULT NULL,
  `ClienteleNIN` varchar(14) DEFAULT NULL,
  `Complaint` varchar(255) NOT NULL,
  `cID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `complaints`:
--   `ClienteleNIN`
--       `Clientele` -> `NIN`
--   `TrainerNIN`
--       `Trainer` -> `NIN`
--

-- --------------------------------------------------------

--
-- Table structure for table `defaulters_rent`
--
-- Creation: Nov 20, 2019 at 09:25 AM
-- Last update: Nov 24, 2019 at 05:52 PM
--

CREATE TABLE `defaulters_rent` (
  `defaulters_id` int(11) NOT NULL,
  `ten_nin` varchar(14) NOT NULL,
  `amt_defaulted` int(12) NOT NULL,
  `amt_paid` int(11) DEFAULT NULL,
  `date_paid` datetime DEFAULT NULL,
  `for_mth` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `defaulters_rent`:
--   `ten_nin`
--       `tenant_details` -> `ten_nin`
--

--
-- Dumping data for table `defaulters_rent`
--

INSERT INTO `defaulters_rent` (`defaulters_id`, `ten_nin`, `amt_defaulted`, `amt_paid`, `date_paid`, `for_mth`) VALUES
(8, 'CM165H4FD0P7M9', 150000, NULL, NULL, 11),
(10, '00000000tendo1', 2750000, NULL, NULL, 11);

-- --------------------------------------------------------

--
-- Table structure for table `house_info`
--
-- Creation: Nov 20, 2019 at 09:25 AM
-- Last update: Nov 24, 2019 at 07:07 PM
--

CREATE TABLE `house_info` (
  `house_id` int(11) NOT NULL,
  `house_number` varchar(11) NOT NULL,
  `house_location` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `amt_per_mth` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `house_info`:
--

--
-- Dumping data for table `house_info`
--

INSERT INTO `house_info` (`house_id`, `house_number`, `house_location`, `Description`, `amt_per_mth`) VALUES
(1, '0', 'Kyengera', 'Wakimese Residentials', '500000'),
(3, '1.1', 'Kyengera', 'Wakimese Shops', '250000'),
(4, '1.2', 'Kyengera', 'Wakimese Shops', '250000'),
(5, '1.3', 'Kyengera', 'Wakimese Shops', '250000'),
(6, '1.4', 'Kyengera', 'Wakimese Shops', '250000'),
(7, '1.5', 'Kyengera', 'Wakimese Shops', '250000'),
(8, '1.6', 'Kyengera', 'Wakimese Shops', '250000'),
(9, '2.1', 'Kyengera', 'Wakimese Residentials', '350000'),
(10, '2.2', 'Kyengera', 'Wakimese Residentials', '350000'),
(11, '2.3', 'Kyengera', 'Wakimese Residentials', '350000'),
(12, '3.1', 'Kyengera', 'Wakimese Residentials', '350000'),
(13, '3.2', 'Kyengera', 'Wakimese Residentials', '350000'),
(14, '3.3', 'Kyengera', 'Wakimese Residentials', '350000'),
(15, '4.1', 'Kyengera', 'Nantogo Estate', '500000'),
(16, '4.2', 'Kyengera', 'Nantogo Estate', '500000'),
(17, '4.3', 'Kyengera', 'Nantogo Estate', '500000'),
(18, '4.4', 'Kyengera', 'Nantogo Estate', '500000'),
(19, '5.1', 'Kyengera', 'Nantogo Estate', '500000'),
(20, '5.2', 'Kyengera', 'Nantogo Estate', '500000'),
(21, '5.3', 'Kyengera', 'Nantogo Estate', '500000'),
(22, '5.4', 'Kyengera', 'Nantogo Estate', '500000'),
(23, '1.1', 'Luweero', 'Luweero Shops', ''),
(24, '1.2', 'Luweero', 'Luweero Shops', ''),
(25, '1.3', 'Luweero', 'Luweero Shops', ''),
(26, '1.4', 'Luweero', 'Luweero Shops', ''),
(27, '1', 'Wakaliga', 'Wakaliga Residentials', ''),
(28, '2', 'Wakaliga', 'Wakaliga Residentials', ''),
(29, '3', 'Wakaliga', 'Wakaliga Residentials', ''),
(30, '4', 'Mengo', 'Mengo Shop', '150000');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `images` (
  `ID` int(11) NOT NULL,
  `NIN` varchar(14) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `images`:
--   `NIN`
--       `NINS` -> `NIN`
--

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`ID`, `NIN`, `image`) VALUES
(1, 'CM165658564XM4', '2019-05-18-151949.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pay_info`
--
-- Creation: Nov 20, 2019 at 09:25 AM
-- Last update: Nov 24, 2019 at 07:17 PM
--

CREATE TABLE `pay_info` (
  `pay_info_id` int(11) NOT NULL,
  `ten_nin` varchar(14) NOT NULL,
  `days_left` int(11) NOT NULL,
  `current_month` int(2) NOT NULL,
  `month_last_paid` int(2) NOT NULL,
  `mths_paid_left` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `pay_info`:
--   `ten_nin`
--       `tenant_details` -> `ten_nin`
--

--
-- Dumping data for table `pay_info`
--

INSERT INTO `pay_info` (`pay_info_id`, `ten_nin`, `days_left`, `current_month`, `month_last_paid`, `mths_paid_left`) VALUES
(1, 'CM165H4FD0P7M9', 7, 11, 10, 0),
(2, '00000000000003', 6, 11, 11, 0),
(13, '00000000000019', 0, 0, 8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--
-- Creation: Nov 22, 2019 at 10:41 PM
-- Last update: Nov 24, 2019 at 07:17 PM
--

CREATE TABLE `payment_details` (
  `det_id` int(11) NOT NULL,
  `ten_nin` varchar(14) NOT NULL,
  `receiptNo` int(11) DEFAULT NULL,
  `amt_pd` int(11) NOT NULL,
  `date_pd` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `processedBy` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `payment_details`:
--   `ten_nin`
--       `tenant_details` -> `ten_nin`
--

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`det_id`, `ten_nin`, `receiptNo`, `amt_pd`, `date_pd`, `processedBy`) VALUES
(1, 'CM165H4FD0P7M9', 0, 150000, '2019-11-24 22:01:35', ''),
(2, '00000000000003', 1, 250000, '2019-10-09 00:00:00', '11111111111111'),
(3, '00000000000003', 454, 250000, '2019-11-12 00:00:00', '11111111111111'),
(26, '00000000000019', 452, 1500000, '2019-08-02 00:00:00', '11111111111111');

-- --------------------------------------------------------

--
-- Table structure for table `rent_credit`
--
-- Creation: Nov 24, 2019 at 02:24 PM
-- Last update: Nov 24, 2019 at 04:35 PM
--

CREATE TABLE `rent_credit` (
  `ten_nin` varchar(14) NOT NULL,
  `credit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `rent_credit`:
--   `ten_nin`
--       `tenant_details` -> `ten_nin`
--

-- --------------------------------------------------------

--
-- Table structure for table `rentals_info`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `rentals_info` (
  `rent_id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `isRented` tinyint(1) NOT NULL DEFAULT '0',
  `rentedBy` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `rentals_info`:
--   `house_id`
--       `house_info` -> `house_id`
--   `rentedBy`
--       `tenant_details` -> `ten_nin`
--

--
-- Dumping data for table `rentals_info`
--

INSERT INTO `rentals_info` (`rent_id`, `house_id`, `isRented`, `rentedBy`) VALUES
(1, 3, 1, '00000000tendo1'),
(2, 1, 1, '00000000000009'),
(3, 4, 1, '00000000000002'),
(4, 5, 1, '00000000000003'),
(5, 6, 1, '00000000000004'),
(6, 7, 1, '00000000000005'),
(7, 7, 1, '00000000000006'),
(8, 8, 1, '00000000000007'),
(9, 9, 1, '00000000000010'),
(10, 10, 1, '00000000000011'),
(11, 11, 1, '00000000000012'),
(12, 12, 1, '00000000000013'),
(13, 14, 1, '00000000000014'),
(14, 16, 1, '00000000000018'),
(15, 22, 1, '00000000000019'),
(16, 23, 1, '00000000000015'),
(17, 24, 1, '00000000000016'),
(18, 25, 1, '00000000000017'),
(19, 27, 1, '00000000000008'),
(20, 28, 1, '00000000000020'),
(21, 29, 1, '00000000000021'),
(22, 30, 1, 'CM165H4FD0P7M9');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `report` (
  `ID` int(11) NOT NULL,
  `CashierNIN` varchar(255) DEFAULT NULL,
  `content` varchar(255) NOT NULL,
  `ManagerID` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `report`:
--

-- --------------------------------------------------------

--
-- Table structure for table `tenant_details`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `tenant_details` (
  `ten_id` int(11) NOT NULL,
  `ten_nin` varchar(14) NOT NULL,
  `ten_contact` varchar(200) NOT NULL DEFAULT 'Not Given',
  `ten_email` varchar(35) NOT NULL DEFAULT 'Not Given',
  `ten_pAdd` varchar(100) NOT NULL DEFAULT 'Not Given',
  `house_id` int(11) NOT NULL,
  `ten_img_id` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `tenant_details`:
--   `ten_nin`
--       `NINS` -> `NIN`
--

--
-- Dumping data for table `tenant_details`
--

INSERT INTO `tenant_details` (`ten_id`, `ten_nin`, `ten_contact`, `ten_email`, `ten_pAdd`, `house_id`, `ten_img_id`) VALUES
(1, 'CM165H4FD0P7M9', '+256705568794', 'gemiru@gmail.com', 'Mengo', 30, '2019-06-30 09:41:37.405365'),
(2, '00000000tendo1', '', '', '', 3, '2019-11-22 10:42:53.239800'),
(243, '00000000000002', '0785725559', '', '', 4, '2019-11-07 05:44:00.000000'),
(244, '00000000000003', '0773249995', '', '', 5, '2019-11-07 05:44:01.000000'),
(245, '00000000000004', '0782077312', '', '', 6, '2019-11-07 02:49:08.000000'),
(246, '00000000000005', '', '', '', 7, '2019-11-07 02:49:07.000000'),
(247, '00000000000006', '', '', '', 7, '2019-11-07 02:49:09.000000'),
(248, '00000000000007', '', '', '', 8, '2019-11-07 02:49:10.000000'),
(249, '00000000000008', '0772616731', '', '', 27, '2019-11-07 02:49:11.000000'),
(250, '00000000000009', '0702336349, 0752336346', '', '', 1, '2019-11-07 02:49:12.000000'),
(251, '00000000000010', '0771827980', '', '', 9, '2019-11-07 02:49:13.000000'),
(252, '00000000000011', '0789217295', '', '', 10, '2019-11-07 02:49:14.000000'),
(253, '00000000000012', '0776101135', '', '', 11, '2019-11-07 02:49:15.000000'),
(254, '00000000000013', '0789904242', '', '', 12, '2019-11-07 02:49:16.000000'),
(255, '00000000000014', '0754176616', '', '', 14, '2019-11-07 02:49:17.000000'),
(256, '00000000000015', '0788525600, 0701102552', '', '', 23, '2019-11-07 02:49:18.000000'),
(257, '00000000000016', '077459058_, 0700383692', '', '', 24, '2019-11-07 02:49:19.000000'),
(258, '00000000000017', '0778070079', '', '', 25, '2019-11-07 02:49:20.000000'),
(259, '00000000000018', '0752943511, 0775924530', '', '', 16, '2019-11-07 02:49:21.000000'),
(260, '00000000000019', '0701629829', '', '', 22, '2019-11-07 02:49:22.000000'),
(261, '00000000000020', '0754791711, 0756082094', '', '', 28, '2019-11-07 02:49:23.000000'),
(262, '00000000000021', '0702588594', 'Not Given', 'Not Given', 29, '2019-11-07 03:24:48.000000');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_images`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `tenant_images` (
  `ten_img_id` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `ten_img_location` varchar(255) NOT NULL,
  `ten_img_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `tenant_images`:
--   `ten_img_id`
--       `tenant_details` -> `ten_img_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `tenant_info`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `tenant_info` (
  `ten_inf_id` int(11) NOT NULL,
  `ten_id` int(11) NOT NULL,
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_left` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `tenant_info`:
--   `ten_id`
--       `tenant_details` -> `ten_id`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Cashier`
--
ALTER TABLE `Cashier`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `complaintscID` (`complaintscID`);

--
-- Indexes for table `Clientele`
--
ALTER TABLE `Clientele`
  ADD PRIMARY KEY (`NIN`);

--
-- Indexes for table `Manager`
--
ALTER TABLE `Manager`
  ADD PRIMARY KEY (`NIN`);

--
-- Indexes for table `NINS`
--
ALTER TABLE `NINS`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NIN` (`NIN`);

--
-- Indexes for table `Services`
--
ALTER TABLE `Services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `Trainer`
--
ALTER TABLE `Trainer`
  ADD PRIMARY KEY (`NIN`);

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`,`NIN`,`username`),
  ADD UNIQUE KEY `NIN` (`NIN`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `NIN_2` (`NIN`),
  ADD UNIQUE KEY `NIN_4` (`NIN`),
  ADD KEY `NIN_3` (`NIN`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD KEY `ClienteleNIN` (`ClienteleNIN`),
  ADD KEY `TrainerNIN` (`TrainerNIN`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`cID`),
  ADD KEY `tNIN` (`TrainerNIN`),
  ADD KEY `cNIN` (`ClienteleNIN`);

--
-- Indexes for table `defaulters_rent`
--
ALTER TABLE `defaulters_rent`
  ADD PRIMARY KEY (`defaulters_id`,`ten_nin`),
  ADD UNIQUE KEY `defaulters_id` (`defaulters_id`),
  ADD UNIQUE KEY `defaulters_id_2` (`defaulters_id`,`ten_nin`),
  ADD UNIQUE KEY `ten_nin` (`ten_nin`),
  ADD KEY `ten_nin_2` (`ten_nin`);

--
-- Indexes for table `house_info`
--
ALTER TABLE `house_info`
  ADD PRIMARY KEY (`house_id`),
  ADD UNIQUE KEY `house_number` (`house_number`,`house_location`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NIN` (`NIN`);

--
-- Indexes for table `pay_info`
--
ALTER TABLE `pay_info`
  ADD PRIMARY KEY (`pay_info_id`),
  ADD KEY `ten_pay_nin` (`ten_nin`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`det_id`),
  ADD KEY `ten_id` (`ten_nin`),
  ADD KEY `receiptNo` (`receiptNo`);

--
-- Indexes for table `rent_credit`
--
ALTER TABLE `rent_credit`
  ADD PRIMARY KEY (`ten_nin`);

--
-- Indexes for table `rentals_info`
--
ALTER TABLE `rentals_info`
  ADD PRIMARY KEY (`rent_id`),
  ADD UNIQUE KEY `house_number` (`house_id`,`rentedBy`),
  ADD KEY `rentee` (`house_id`,`rentedBy`),
  ADD KEY `renter` (`rentedBy`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CashierNIN` (`CashierNIN`),
  ADD KEY `ManagerID` (`ManagerID`);

--
-- Indexes for table `tenant_details`
--
ALTER TABLE `tenant_details`
  ADD PRIMARY KEY (`ten_id`),
  ADD UNIQUE KEY `ten_nin` (`ten_nin`),
  ADD UNIQUE KEY `ten_img_id` (`ten_img_id`);

--
-- Indexes for table `tenant_images`
--
ALTER TABLE `tenant_images`
  ADD PRIMARY KEY (`ten_img_id`),
  ADD UNIQUE KEY `ten_img_name` (`ten_img_name`);

--
-- Indexes for table `tenant_info`
--
ALTER TABLE `tenant_info`
  ADD PRIMARY KEY (`ten_inf_id`),
  ADD KEY `ten_info` (`ten_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `NINS`
--
ALTER TABLE `NINS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `cID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `defaulters_rent`
--
ALTER TABLE `defaulters_rent`
  MODIFY `defaulters_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `house_info`
--
ALTER TABLE `house_info`
  MODIFY `house_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pay_info`
--
ALTER TABLE `pay_info`
  MODIFY `pay_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `det_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `rentals_info`
--
ALTER TABLE `rentals_info`
  MODIFY `rent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tenant_details`
--
ALTER TABLE `tenant_details`
  MODIFY `ten_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Cashier`
--
ALTER TABLE `Cashier`
  ADD CONSTRAINT `complaintscID` FOREIGN KEY (`complaintscID`) REFERENCES `complaints` (`cID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Manager`
--
ALTER TABLE `Manager`
  ADD CONSTRAINT `manNIN` FOREIGN KEY (`NIN`) REFERENCES `NINS` (`NIN`) ON UPDATE CASCADE;

--
-- Constraints for table `Services`
--
ALTER TABLE `Services`
  ADD CONSTRAINT `sHouse` FOREIGN KEY (`service_id`) REFERENCES `house_info` (`house_id`) ON UPDATE CASCADE;

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `aNIN` FOREIGN KEY (`NIN`) REFERENCES `NINS` (`NIN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `ClienteleNIN` FOREIGN KEY (`ClienteleNIN`) REFERENCES `Clientele` (`NIN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `TrainerNIN` FOREIGN KEY (`TrainerNIN`) REFERENCES `Trainer` (`NIN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `cNIN` FOREIGN KEY (`ClienteleNIN`) REFERENCES `Clientele` (`NIN`),
  ADD CONSTRAINT `tNIN` FOREIGN KEY (`TrainerNIN`) REFERENCES `Trainer` (`NIN`) ON UPDATE CASCADE;

--
-- Constraints for table `defaulters_rent`
--
ALTER TABLE `defaulters_rent`
  ADD CONSTRAINT `def_nin` FOREIGN KEY (`ten_nin`) REFERENCES `tenant_details` (`ten_nin`) ON UPDATE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `NIN` FOREIGN KEY (`NIN`) REFERENCES `NINS` (`NIN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pay_info`
--
ALTER TABLE `pay_info`
  ADD CONSTRAINT `ten_pay_nin` FOREIGN KEY (`ten_nin`) REFERENCES `tenant_details` (`ten_nin`) ON UPDATE CASCADE;

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `ten_pay-det_nin` FOREIGN KEY (`ten_nin`) REFERENCES `tenant_details` (`ten_nin`) ON UPDATE CASCADE;

--
-- Constraints for table `rent_credit`
--
ALTER TABLE `rent_credit`
  ADD CONSTRAINT `rc_ten_nin` FOREIGN KEY (`ten_nin`) REFERENCES `tenant_details` (`ten_nin`) ON UPDATE CASCADE;

--
-- Constraints for table `rentals_info`
--
ALTER TABLE `rentals_info`
  ADD CONSTRAINT `house_id` FOREIGN KEY (`house_id`) REFERENCES `house_info` (`house_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `renter` FOREIGN KEY (`rentedBy`) REFERENCES `tenant_details` (`ten_nin`) ON UPDATE CASCADE;

--
-- Constraints for table `tenant_details`
--
ALTER TABLE `tenant_details`
  ADD CONSTRAINT `ten_nin` FOREIGN KEY (`ten_nin`) REFERENCES `NINS` (`NIN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tenant_images`
--
ALTER TABLE `tenant_images`
  ADD CONSTRAINT `ten_img_id` FOREIGN KEY (`ten_img_id`) REFERENCES `tenant_details` (`ten_img_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tenant_info`
--
ALTER TABLE `tenant_info`
  ADD CONSTRAINT `ten_info` FOREIGN KEY (`ten_id`) REFERENCES `tenant_details` (`ten_id`) ON DELETE CASCADE ON UPDATE CASCADE;
