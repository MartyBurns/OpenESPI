-- phpMyAdmin SQL Dump
-- version 3.5.4
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Apr 09, 2013 at 12:37 PM
-- Server version: 5.5.28
-- PHP Version: 5.4.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `datacustodian`
--

-- --------------------------------------------------------

--
-- Table structure for table `accumulation_behavior`
--

CREATE TABLE IF NOT EXISTS `accumulation_behavior` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `accumulation_behavior`
--

INSERT INTO `accumulation_behavior` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 0, 0, 0),
(2, 1, 1, 0),
(3, 2, 2, 0),
(4, 3, 3, 0),
(5, 4, 4, 0),
(6, 6, 5, 0),
(7, 9, 6, 0),
(8, 10, 7, 0),
(9, 12, 8, 0),
(10, 13, 9, 0),
(11, 14, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `authorization_status`
--

CREATE TABLE IF NOT EXISTS `authorization_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `authorization_status`
--

INSERT INTO `authorization_status` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 0, 0, 0),
(2, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `batch_item_info`
--

CREATE TABLE IF NOT EXISTS `batch_item_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `status_reason` varchar(256) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `operation` bigint(20) DEFAULT NULL,
  `status_code` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAC9F279538943F23` (`status_code`),
  KEY `FKAC9F2795B9476106` (`operation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `commodity`
--

CREATE TABLE IF NOT EXISTS `commodity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `commodity`
--

INSERT INTO `commodity` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 0, 0, 0),
(2, 1, 1, 0),
(3, 2, 2, 0),
(4, 3, 3, 0),
(5, 4, 4, 0),
(6, 5, 5, 0),
(7, 6, 6, 0),
(8, 7, 7, 0),
(9, 8, 8, 0),
(10, 9, 9, 0),
(11, 10, 10, 0),
(12, 11, 11, 0),
(13, 12, 12, 0),
(14, 13, 13, 0),
(15, 14, 14, 0),
(16, 15, 15, 0),
(17, 16, 16, 0),
(18, 17, 17, 0),
(19, 18, 18, 0),
(20, 19, 19, 0),
(21, 20, 20, 0),
(22, 21, 21, 0),
(23, 22, 22, 0),
(24, 23, 23, 0),
(25, 24, 24, 0),
(26, 25, 25, 0);

-- --------------------------------------------------------

--
-- Table structure for table `consumption_tier`
--

CREATE TABLE IF NOT EXISTS `consumption_tier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `consumption_tier`
--

INSERT INTO `consumption_tier` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 0, 0, 0),
(2, 1, 1, 0),
(3, 2, 2, 0),
(4, 3, 3, 0),
(5, 4, 4, 0),
(6, 5, 5, 0),
(7, 6, 6, 0),
(8, 7, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cpp`
--

CREATE TABLE IF NOT EXISTS `cpp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `cpp`
--

INSERT INTO `cpp` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 0, 0, 0),
(2, 1, 1, 0),
(3, 2, 2, 0),
(4, 3, 3, 0),
(5, 4, 4, 0),
(6, 5, 5, 0),
(7, 6, 6, 0),
(8, 7, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `crudoperation`
--

CREATE TABLE IF NOT EXISTS `crudoperation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `crudoperation`
--

INSERT INTO `crudoperation` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 0, 0, 0),
(2, 1, 1, 0),
(3, 2, 2, 0),
(4, 3, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE IF NOT EXISTS `currency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 0, 0, 0),
(2, 840, 1, 0),
(3, 978, 2, 0),
(4, 36, 3, 0),
(5, 124, 4, 0),
(6, 756, 5, 0),
(7, 156, 6, 0),
(8, 208, 7, 0),
(9, 826, 8, 0),
(10, 392, 9, 0),
(11, 578, 10, 0),
(12, 643, 11, 0),
(13, 752, 12, 0),
(14, 356, 13, 0);

-- --------------------------------------------------------

--
-- Table structure for table `data_custodian`
--

CREATE TABLE IF NOT EXISTS `data_custodian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(512) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `data_custodian_application_status` bigint(20) DEFAULT NULL,
  `service_status` bigint(20) DEFAULT NULL,
  `service_type` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK88BA4F99C468EB8F` (`data_custodian_application_status`),
  KEY `FK88BA4F9988F19B79` (`service_status`),
  KEY `FK88BA4F99B065A5F8` (`service_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `data_custodian_application_information`
--

CREATE TABLE IF NOT EXISTS `data_custodian_application_information` (
  `data_custodian` bigint(20) NOT NULL,
  `application_information` bigint(20) NOT NULL,
  PRIMARY KEY (`data_custodian`,`application_information`),
  KEY `FKD6E8BA17C805DFCC` (`data_custodian`),
  KEY `FKD6E8BA174C681F83` (`application_information`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_custodian_application_status`
--

CREATE TABLE IF NOT EXISTS `data_custodian_application_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `data_custodian_application_status`
--

INSERT INTO `data_custodian_application_status` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 1, 0, 0),
(2, 2, 1, 0),
(3, 3, 2, 1),
(4, 4, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `data_custodian_authorized_third_partys`
--

CREATE TABLE IF NOT EXISTS `data_custodian_authorized_third_partys` (
  `data_custodian` bigint(20) NOT NULL,
  `authorized_third_partys` bigint(20) NOT NULL,
  PRIMARY KEY (`data_custodian`,`authorized_third_partys`),
  KEY `FKF6D229A3C805DFCC` (`data_custodian`),
  KEY `FKF6D229A3573ED999` (`authorized_third_partys`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_custodian_retail_customers`
--

CREATE TABLE IF NOT EXISTS `data_custodian_retail_customers` (
  `data_custodian` bigint(20) NOT NULL,
  `retail_customers` bigint(20) NOT NULL,
  PRIMARY KEY (`data_custodian`,`retail_customers`),
  KEY `FKCFD957FFC805DFCC` (`data_custodian`),
  KEY `FKCFD957FF2B8A4D2B` (`retail_customers`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_custodian_type`
--

CREATE TABLE IF NOT EXISTS `data_custodian_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `data_custodian_type`
--

INSERT INTO `data_custodian_type` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 1, 0, 0),
(2, 2, 1, 0),
(3, 3, 2, 0),
(4, 4, 3, 0),
(5, 5, 4, 0),
(6, 6, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `data_qualifier`
--

CREATE TABLE IF NOT EXISTS `data_qualifier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `data_qualifier`
--

INSERT INTO `data_qualifier` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 0, 0, 0),
(2, 2, 1, 0),
(3, 4, 2, 0),
(4, 5, 3, 0),
(5, 7, 4, 0),
(6, 8, 5, 0),
(7, 9, 6, 0),
(8, 11, 7, 0),
(9, 12, 8, 0),
(10, 16, 9, 0),
(11, 17, 10, 0),
(12, 23, 11, 0),
(13, 24, 12, 0),
(14, 25, 13, 0),
(15, 26, 14, 0);

-- --------------------------------------------------------

--
-- Table structure for table `date_time_interval`
--

CREATE TABLE IF NOT EXISTS `date_time_interval` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `duration` bigint(20) DEFAULT NULL,
  `start` bigint(20) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dest_rule`
--

CREATE TABLE IF NOT EXISTS `dest_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `direction_of_flow`
--

CREATE TABLE IF NOT EXISTS `direction_of_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `direction_of_flow`
--

INSERT INTO `direction_of_flow` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 0, 0, 0),
(2, 1, 1, 0),
(3, 2, 2, 0),
(4, 3, 3, 0),
(5, 4, 4, 0),
(6, 5, 5, 0),
(7, 7, 6, 0),
(8, 8, 7, 0),
(9, 9, 8, 0),
(10, 10, 9, 0),
(11, 11, 10, 0),
(12, 12, 11, 0),
(13, 11, 10, 0),
(14, 12, 11, 0),
(15, 13, 12, 1),
(16, 14, 13, 0),
(17, 15, 14, 0),
(18, 16, 15, 0),
(19, 17, 16, 0),
(20, 18, 17, 0),
(21, 19, 18, 0),
(22, 20, 19, 0),
(23, 21, 20, 0);

-- --------------------------------------------------------

--
-- Table structure for table `espiobject_factorys`
--

CREATE TABLE IF NOT EXISTS `espiobject_factorys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `identified_object`
--

CREATE TABLE IF NOT EXISTS `identified_object` (
  `dtype` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `up_status` tinyint(4) DEFAULT NULL,
  `role_flags` smallint(6) DEFAULT NULL,
  `data_custodian_default_batch_resource` tinyblob,
  `data_custodian_default_subscription_resource` tinyblob,
  `data_custodian_third_party_id` varchar(32) DEFAULT NULL,
  `data_custodian_third_party_secret` varchar(32) DEFAULT NULL,
  `third_party_application_description` varchar(255) DEFAULT NULL,
  `third_party_application_logo` tinyblob,
  `third_party_application_name` varchar(32) DEFAULT NULL,
  `third_party_application_website` tinyblob,
  `third_party_default_batch_resource` tinyblob,
  `third_party_default_notify_resource` tinyblob,
  `third_party_defaultoauth_callback` tinyblob,
  `third_party_email` varchar(64) DEFAULT NULL,
  `third_party_name` varchar(64) DEFAULT NULL,
  `third_party_phone` varchar(32) DEFAULT NULL,
  `bill_last_period` bigint(20) DEFAULT NULL,
  `bill_to_date` bigint(20) DEFAULT NULL,
  `cost_additional_last_period` bigint(20) DEFAULT NULL,
  `status_time_stamp` bigint(20) DEFAULT NULL,
  `interval_length` int(11) DEFAULT NULL,
  `subscription_parameters` varchar(255) DEFAULT NULL,
  `access_token` varchar(32) DEFAULT NULL,
  `authorization_server` tinyblob,
  `resource` tinyblob,
  `third_party` varchar(32) DEFAULT NULL,
  `flicker_plt` bigint(20) DEFAULT NULL,
  `flicker_pst` bigint(20) DEFAULT NULL,
  `harmonic_voltage` bigint(20) DEFAULT NULL,
  `long_interruptions` bigint(20) DEFAULT NULL,
  `mains_voltage` bigint(20) DEFAULT NULL,
  `measurement_protocol` tinyint(4) DEFAULT NULL,
  `power_frequency` bigint(20) DEFAULT NULL,
  `rapid_voltage_changes` bigint(20) DEFAULT NULL,
  `short_interruptions` bigint(20) DEFAULT NULL,
  `supply_voltage_dips` bigint(20) DEFAULT NULL,
  `supply_voltage_imbalance` bigint(20) DEFAULT NULL,
  `supply_voltage_variations` bigint(20) DEFAULT NULL,
  `temp_overvoltage` bigint(20) DEFAULT NULL,
  `espiinterval` bigint(20) DEFAULT NULL,
  `meter_reading` bigint(20) DEFAULT NULL,
  `reading_type` bigint(20) DEFAULT NULL,
  `address` bigint(20) DEFAULT NULL,
  `data_custodian` bigint(20) DEFAULT NULL,
  `location` bigint(20) DEFAULT NULL,
  `retail_customer` bigint(20) DEFAULT NULL,
  `service_category` bigint(20) DEFAULT NULL,
  `usage_point` bigint(20) DEFAULT NULL,
  `data_custodian_application_status` bigint(20) DEFAULT NULL,
  `third_party_application_status` bigint(20) DEFAULT NULL,
  `third_party_application_type` bigint(20) DEFAULT NULL,
  `third_party_application_use` bigint(20) DEFAULT NULL,
  `billing_period` bigint(20) DEFAULT NULL,
  `currency` bigint(20) DEFAULT NULL,
  `current_billing_period_over_all_consumption` bigint(20) DEFAULT NULL,
  `current_day_last_year_net_consumption` bigint(20) DEFAULT NULL,
  `current_day_net_consumption` bigint(20) DEFAULT NULL,
  `current_day_overall_consumption` bigint(20) DEFAULT NULL,
  `peak_demand` bigint(20) DEFAULT NULL,
  `previous_day_last_year_overall_consumption` bigint(20) DEFAULT NULL,
  `previous_day_net_consumption` bigint(20) DEFAULT NULL,
  `previous_day_overall_consumption` bigint(20) DEFAULT NULL,
  `quality_of_reading` bigint(20) DEFAULT NULL,
  `ratchet_demand` bigint(20) DEFAULT NULL,
  `ratchet_demand_period` bigint(20) DEFAULT NULL,
  `accumulation_behavior` bigint(20) DEFAULT NULL,
  `aggregate` bigint(20) DEFAULT NULL,
  `argument` bigint(20) DEFAULT NULL,
  `commodity` bigint(20) DEFAULT NULL,
  `consumption_tier` bigint(20) DEFAULT NULL,
  `cpp` bigint(20) DEFAULT NULL,
  `data_qualifier` bigint(20) DEFAULT NULL,
  `flow_direction` bigint(20) DEFAULT NULL,
  `interharmonic` bigint(20) DEFAULT NULL,
  `kind` bigint(20) DEFAULT NULL,
  `measuring_period` bigint(20) DEFAULT NULL,
  `phase` bigint(20) DEFAULT NULL,
  `power_of_ten_multiplier` bigint(20) DEFAULT NULL,
  `time_attribute` bigint(20) DEFAULT NULL,
  `tou` bigint(20) DEFAULT NULL,
  `uom` bigint(20) DEFAULT NULL,
  `authorized_period` bigint(20) DEFAULT NULL,
  `published_period` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  `summary_interval` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEB649F63AEC253D0` (`current_day_net_consumption`),
  KEY `FKEB649F63DE3ED2C5` (`previous_day_last_year_overall_consumption`),
  KEY `FKEB649F639E4ADEEF` (`authorized_period`),
  KEY `FKEB649F63A651F306` (`current_billing_period_over_all_consumption`),
  KEY `FKEB649F63F9CC00F3` (`status`),
  KEY `FKEB649F632B03BE7C` (`cpp`),
  KEY `FKEB649F63F2F4AA64` (`quality_of_reading`),
  KEY `FKEB649F6312787DEA` (`measuring_period`),
  KEY `FKEB649F631D4027DE` (`argument`),
  KEY `FKEB649F637BCAE451` (`service_category`),
  KEY `FKEB649F63C805DFCC` (`data_custodian`),
  KEY `FKEB649F63164F8629` (`reading_type`),
  KEY `FKEB649F632241760F` (`billing_period`),
  KEY `FKEB649F63E5D6E423` (`meter_reading`),
  KEY `FKEB649F6345DEE340` (`power_of_ten_multiplier`),
  KEY `FKEB649F63CDE7664D` (`accumulation_behavior`),
  KEY `FKEB649F63F0D86917` (`current_day_last_year_net_consumption`),
  KEY `FKEB649F63D7C27E7E` (`previous_day_overall_consumption`),
  KEY `FKEB649F63C6B4FE39` (`phase`),
  KEY `FKEB649F63289E2D10` (`commodity`),
  KEY `FKEB649F6347BA3F3C` (`published_period`),
  KEY `FKEB649F637B2C3259` (`consumption_tier`),
  KEY `FKEB649F636A3C3FF9` (`ratchet_demand_period`),
  KEY `FKEB649F63412A64E` (`previous_day_net_consumption`),
  KEY `FKEB649F63A4057F48` (`summary_interval`),
  KEY `FKEB649F63618F0B3B` (`location`),
  KEY `FKEB649F63C90FD195` (`aggregate`),
  KEY `FKEB649F633F8BD5EB` (`usage_point`),
  KEY `FKEB649F63D61E2DF7` (`address`),
  KEY `FKEB649F63D1D92A27` (`third_party_application_use`),
  KEY `FKEB649F63357B9EB2` (`kind`),
  KEY `FKEB649F63D915670` (`interharmonic`),
  KEY `FKEB649F636CC14AF6` (`espiinterval`),
  KEY `FKEB649F63435C32AC` (`currency`),
  KEY `FKEB649F63C78E9DAF` (`time_attribute`),
  KEY `FKEB649F633FF8FE2B` (`third_party_application_status`),
  KEY `FKEB649F632CA173EB` (`peak_demand`),
  KEY `FKEB649F63C468EB8F` (`data_custodian_application_status`),
  KEY `FKEB649F63E2C53211` (`ratchet_demand`),
  KEY `FKEB649F63F56C40AC` (`retail_customer`),
  KEY `FKEB649F632B043DEA` (`tou`),
  KEY `FKEB649F63694B627B` (`third_party_application_type`),
  KEY `FKEB649F63E220A559` (`uom`),
  KEY `FKEB649F63B95D57E8` (`flow_direction`),
  KEY `FKEB649F639CECA22B` (`data_qualifier`),
  KEY `FKEB649F631FFB9B00` (`current_day_overall_consumption`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `identified_object_interval_blocks`
--

CREATE TABLE IF NOT EXISTS `identified_object_interval_blocks` (
  `identified_object` bigint(20) NOT NULL,
  `interval_blocks` bigint(20) NOT NULL,
  PRIMARY KEY (`identified_object`,`interval_blocks`),
  UNIQUE KEY `interval_blocks` (`interval_blocks`),
  KEY `FK4748BD648E51FBB0` (`identified_object`),
  KEY `FK4748BD645B19C4BE` (`interval_blocks`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `identified_object_interval_reading`
--

CREATE TABLE IF NOT EXISTS `identified_object_interval_reading` (
  `identified_object` bigint(20) NOT NULL,
  `interval_reading` bigint(20) NOT NULL,
  PRIMARY KEY (`identified_object`,`interval_reading`),
  UNIQUE KEY `interval_reading` (`interval_reading`),
  KEY `FKE37BDA6EA4E75E1` (`identified_object`),
  KEY `FKE37BDA6ED8F5ED4F` (`interval_reading`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interval_reading`
--

CREATE TABLE IF NOT EXISTS `interval_reading` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reading_cost` bigint(20) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `interval_block` bigint(20) DEFAULT NULL,
  `reading_quality` bigint(20) DEFAULT NULL,
  `time_period` bigint(20) DEFAULT NULL,
  `usage_point` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8B7AC5123F8BD5EB` (`usage_point`),
  KEY `FK8B7AC5123A40229` (`reading_quality`),
  KEY `FK8B7AC512DBC9A57D` (`time_period`),
  KEY `FK8B7AC512EF4E7B11` (`interval_block`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kind`
--

CREATE TABLE IF NOT EXISTS `kind` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=126 ;

--
-- Dumping data for table `kind`
--

INSERT INTO `kind` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 0, 0, 0),
(2, 2, 1, 0),
(3, 3, 2, 0),
(4, 4, 3, 0),
(5, 5, 4, 0),
(6, 6, 5, 0),
(7, 7, 6, 0),
(8, 8, 7, 0),
(9, 9, 8, 0),
(10, 10, 9, 0),
(11, 11, 10, 0),
(12, 12, 11, 0),
(13, 13, 12, 0),
(14, 14, 13, 0),
(15, 15, 14, 0),
(16, 16, 15, 0),
(17, 17, 16, 0),
(18, 18, 17, 0),
(19, 19, 18, 0),
(20, 20, 19, 0),
(21, 21, 20, 0),
(22, 22, 21, 1),
(23, 23, 22, 0),
(24, 24, 23, 0),
(25, 25, 24, 0),
(26, 26, 25, 0),
(27, 27, 26, 0),
(28, 28, 27, 0),
(29, 31, 28, 2),
(30, 32, 29, 0),
(31, 33, 30, 0),
(32, 34, 31, 0),
(33, 35, 32, 0),
(34, 36, 33, 0),
(35, 37, 34, 0),
(36, 38, 35, 0),
(37, 40, 36, 0),
(38, 41, 37, 0),
(39, 42, 38, 0),
(40, 43, 39, 0),
(41, 44, 40, 0),
(42, 45, 41, 0),
(43, 46, 42, 0),
(44, 47, 43, 0),
(45, 48, 44, 0),
(46, 49, 45, 0),
(47, 50, 46, 0),
(48, 51, 47, 0),
(49, 52, 48, 0),
(50, 53, 49, 0),
(51, 54, 50, 0),
(52, 55, 51, 0),
(53, 56, 52, 0),
(54, 57, 53, 0),
(55, 58, 54, 0),
(56, 59, 55, 0),
(57, 60, 56, 0),
(58, 64, 57, 0),
(59, 81, 58, 0),
(60, 90, 59, 0),
(61, 91, 60, 0),
(62, 92, 61, 0),
(63, 93, 62, 0),
(64, 94, 63, 0),
(65, 95, 64, 0),
(66, 96, 65, 0),
(67, 97, 66, 0),
(68, 98, 67, 0),
(69, 99, 68, 0),
(70, 100, 69, 0),
(71, 101, 70, 0),
(72, 102, 71, 0),
(73, 103, 72, 0),
(74, 104, 73, 0),
(75, 105, 74, 0),
(76, 106, 75, 0),
(77, 107, 76, 0),
(78, 108, 77, 0),
(79, 109, 78, 0),
(80, 110, 79, 0),
(81, 111, 80, 0),
(82, 112, 81, 0),
(83, 113, 82, 0),
(84, 114, 83, 0),
(85, 115, 84, 0),
(86, 116, 85, 0),
(87, 117, 86, 0),
(88, 118, 87, 0),
(89, 119, 88, 0),
(90, 120, 89, 0),
(91, 121, 90, 0),
(92, 122, 91, 0),
(93, 123, 92, 0),
(94, 124, 93, 0),
(95, 125, 94, 0),
(96, 126, 95, 0),
(97, 127, 96, 0),
(98, 128, 97, 0),
(99, 129, 98, 0),
(100, 130, 99, 0),
(101, 131, 100, 0),
(102, 132, 101, 0),
(103, 133, 102, 0),
(104, 134, 103, 0),
(105, 135, 104, 0),
(106, 136, 105, 0),
(107, 137, 106, 0),
(108, 138, 107, 0),
(109, 139, 108, 0),
(110, 140, 109, 0),
(111, 141, 110, 0),
(112, 142, 111, 0),
(113, 143, 112, 0),
(114, 144, 113, 0),
(115, 145, 114, 0),
(116, 146, 115, 0),
(117, 147, 116, 0),
(118, 148, 117, 0),
(119, 149, 118, 0),
(120, 150, 119, 0),
(121, 151, 120, 0),
(122, 152, 121, 0),
(123, 153, 122, 0),
(124, 154, 123, 0),
(125, 155, 124, 0);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phase_code`
--

CREATE TABLE IF NOT EXISTS `phase_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `phase_code`
--

INSERT INTO `phase_code` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 225, 0, 0),
(2, 224, 1, 0),
(3, 193, 2, 0),
(4, 97, 3, 0),
(5, 97, 4, 0),
(6, 132, 5, 0),
(7, 96, 6, 0),
(8, 66, 7, 0),
(9, 129, 8, 0),
(10, 65, 9, 0),
(11, 33, 10, 0),
(12, 128, 11, 0),
(13, 64, 12, 0),
(14, 32, 13, 0),
(15, 16, 14, 0),
(16, 272, 15, 0),
(17, 784, 16, 0),
(18, 528, 17, 0),
(19, 256, 18, 0),
(20, 768, 19, 0),
(21, 0, 20, 0),
(22, 136, 21, 0),
(23, 72, 22, 0),
(24, 41, 23, 0),
(25, 40, 24, 0),
(26, 17, 25, 0),
(27, 512, 26, 0);

-- --------------------------------------------------------

--
-- Table structure for table `quality_of_reading`
--

CREATE TABLE IF NOT EXISTS `quality_of_reading` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `quality_of_reading`
--

INSERT INTO `quality_of_reading` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 0, 0, 0),
(2, 8, 2, 1),
(3, 9, 3, 0),
(4, 10, 4, 0),
(5, 11, 5, 0),
(6, 12, 6, 0),
(7, 13, 7, 0),
(8, 14, 8, 0),
(9, 15, 9, 0),
(10, 16, 10, 0),
(11, 17, 11, 0),
(12, 18, 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rational_number`
--

CREATE TABLE IF NOT EXISTS `rational_number` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `denominator` bigint(20) DEFAULT NULL,
  `numerator` bigint(20) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reading_interharmonic`
--

CREATE TABLE IF NOT EXISTS `reading_interharmonic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `denominator` bigint(20) DEFAULT NULL,
  `numerator` bigint(20) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reading_quality`
--

CREATE TABLE IF NOT EXISTS `reading_quality` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `quality` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE584EA4CAFAA5FFF` (`quality`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE IF NOT EXISTS `resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `href` tinyblob,
  `reply_to` tinyblob,
  `response_required` varchar(8) DEFAULT NULL,
  `signature_required` tinyint(1) DEFAULT NULL,
  `subscribable` tinyint(1) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `retail_customer`
--

CREATE TABLE IF NOT EXISTS `retail_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_since` datetime NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `authorized_data_custodian` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6834339A3D0E0EF0` (`authorized_data_custodian`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `retail_customer_third_partys`
--

CREATE TABLE IF NOT EXISTS `retail_customer_third_partys` (
  `retail_customer` bigint(20) NOT NULL,
  `third_partys` bigint(20) NOT NULL,
  PRIMARY KEY (`retail_customer`,`third_partys`),
  KEY `FK499288AAF56C40AC` (`retail_customer`),
  KEY `FK499288AA746D3175` (`third_partys`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `retail_customer_usage_points`
--

CREATE TABLE IF NOT EXISTS `retail_customer_usage_points` (
  `retail_customer` bigint(20) NOT NULL,
  `usage_points` bigint(20) NOT NULL,
  PRIMARY KEY (`retail_customer`,`usage_points`),
  KEY `FK1E7DD5C6F56C40AC` (`retail_customer`),
  KEY `FK1E7DD5C6F62D91BA` (`usage_points`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service_category`
--

CREATE TABLE IF NOT EXISTS `service_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `kind` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK72EFE348D7E78B3` (`kind`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `service_kind`
--

CREATE TABLE IF NOT EXISTS `service_kind` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `service_kind`
--

INSERT INTO `service_kind` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 0, 0, 0),
(2, 1, 1, 0),
(3, 2, 2, 0),
(4, 3, 3, 0),
(5, 4, 4, 0),
(6, 5, 5, 0),
(7, 6, 6, 0),
(8, 7, 7, 0),
(9, 8, 8, 0),
(10, 9, 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_status`
--

CREATE TABLE IF NOT EXISTS `service_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `service_status`
--

INSERT INTO `service_status` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 0, 0, 0),
(2, 1, 1, 0),
(3, 2, 2, 0),
(4, 3, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `status_code`
--

CREATE TABLE IF NOT EXISTS `status_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `status_code`
--

INSERT INTO `status_code` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 200, 0, 0),
(2, 201, 1, 0),
(3, 204, 2, 0),
(4, 301, 3, 0),
(5, 302, 4, 0),
(6, 304, 5, 0),
(7, 400, 6, 0),
(8, 401, 7, 0),
(9, 403, 8, 0),
(10, 404, 9, 0),
(11, 405, 10, 0),
(12, 410, 11, 0),
(13, 500, 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `summary_measurement`
--

CREATE TABLE IF NOT EXISTS `summary_measurement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `summary_measurement_value` bigint(20) DEFAULT NULL,
  `time_stamp` bigint(20) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `power_of_ten_multiplier` bigint(20) DEFAULT NULL,
  `uom` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK695998A3E220A559` (`uom`),
  KEY `FK695998A345DEE340` (`power_of_ten_multiplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `third_party`
--

CREATE TABLE IF NOT EXISTS `third_party` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `authorized` tinyint(1) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `application_information` bigint(20) DEFAULT NULL,
  `application_use` bigint(20) DEFAULT NULL,
  `authorized_data_custodian` bigint(20) DEFAULT NULL,
  `data_custodian_application_status` bigint(20) DEFAULT NULL,
  `service_status` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1A321A0EC468EB8F` (`data_custodian_application_status`),
  KEY `FK1A321A0E88F19B79` (`service_status`),
  KEY `FK1A321A0EFCAF9658` (`application_use`),
  KEY `FK1A321A0E4C681F83` (`application_information`),
  KEY `FK1A321A0E3D0E0EF0` (`authorized_data_custodian`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `third_party_application_status`
--

CREATE TABLE IF NOT EXISTS `third_party_application_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `third_party_application_status`
--

INSERT INTO `third_party_application_status` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 1, 0, 0),
(2, 2, 1, 0),
(3, 3, 2, 0),
(4, 4, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `third_party_application_type`
--

CREATE TABLE IF NOT EXISTS `third_party_application_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `third_party_application_type`
--

INSERT INTO `third_party_application_type` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 1, 0, 0),
(2, 2, 1, 0),
(3, 3, 2, 0),
(4, 4, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `third_party_application_types`
--

CREATE TABLE IF NOT EXISTS `third_party_application_types` (
  `third_party` bigint(20) NOT NULL,
  `application_types` bigint(20) NOT NULL,
  PRIMARY KEY (`third_party`,`application_types`),
  KEY `FK328A60D9628E235E` (`third_party`),
  KEY `FK328A60D99AACEC6B` (`application_types`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `third_party_application_use`
--

CREATE TABLE IF NOT EXISTS `third_party_application_use` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `third_party_application_use`
--

INSERT INTO `third_party_application_use` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 1, 0, 0),
(2, 2, 1, 0),
(3, 3, 2, 0),
(4, 4, 3, 0),
(5, 5, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `third_party_authorization_status`
--

CREATE TABLE IF NOT EXISTS `third_party_authorization_status` (
  `third_party` bigint(20) NOT NULL,
  `authorization_status` bigint(20) NOT NULL,
  PRIMARY KEY (`third_party`,`authorization_status`),
  KEY `FKDD7B9809628E235E` (`third_party`),
  KEY `FKDD7B9809D6645379` (`authorization_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `third_party_retail_customers`
--

CREATE TABLE IF NOT EXISTS `third_party_retail_customers` (
  `third_party` bigint(20) NOT NULL,
  `retail_customers` bigint(20) NOT NULL,
  PRIMARY KEY (`third_party`,`retail_customers`),
  KEY `FK6E5B262A628E235E` (`third_party`),
  KEY `FK6E5B262A2B8A4D2B` (`retail_customers`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `time_attribute`
--

CREATE TABLE IF NOT EXISTS `time_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `time_configuration`
--

CREATE TABLE IF NOT EXISTS `time_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `time_period_of_interest`
--

CREATE TABLE IF NOT EXISTS `time_period_of_interest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tou`
--

CREATE TABLE IF NOT EXISTS `tou` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `tou`
--

INSERT INTO `tou` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 0, 0, 0),
(2, 1, 1, 0),
(3, 2, 2, 0),
(4, 3, 3, 0),
(5, 4, 4, 0),
(6, 5, 5, 0),
(7, 6, 6, 0),
(8, 7, 7, 0),
(9, 8, 8, 0),
(10, 9, 9, 0),
(11, 10, 10, 0),
(12, 11, 11, 0),
(13, 12, 12, 0),
(14, 13, 13, 0),
(15, 14, 14, 0),
(16, 15, 15, 0);

-- --------------------------------------------------------

--
-- Table structure for table `unit_multiplier`
--

CREATE TABLE IF NOT EXISTS `unit_multiplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `unit_multiplier`
--

INSERT INTO `unit_multiplier` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, -12, 0, 0),
(2, -9, 1, 0),
(3, -6, 2, 0),
(4, -3, 3, 0),
(5, -2, 4, 0),
(6, -1, 5, 0),
(7, 3, 6, 0),
(8, 6, 7, 0),
(9, 9, 8, 0),
(10, 12, 9, 0),
(11, 0, 10, 0),
(12, 1, 11, 0),
(13, 2, 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `unit_symbol`
--

CREATE TABLE IF NOT EXISTS `unit_symbol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_map` int(11) NOT NULL,
  `type_value` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=124 ;

--
-- Dumping data for table `unit_symbol`
--

INSERT INTO `unit_symbol` (`id`, `type_map`, `type_value`, `version`) VALUES
(1, 61, 0, 0),
(2, 38, 1, 0),
(3, 63, 2, 0),
(4, 71, 3, 0),
(5, 72, 4, 0),
(6, 73, 5, 0),
(7, 29, 6, 0),
(8, 30, 7, 0),
(9, 5, 8, 0),
(10, 25, 9, 0),
(11, 28, 10, 0),
(12, 23, 11, 0),
(13, 27, 12, 0),
(14, 159, 13, 0),
(15, 160, 14, 0),
(16, 9, 15, 0),
(17, 10, 16, 0),
(18, 31, 17, 0),
(19, 32, 18, 0),
(20, 53, 19, 0),
(21, 0, 20, 0),
(22, 33, 21, 0),
(23, 3, 22, 0),
(24, 39, 23, 0),
(25, 2, 24, 0),
(26, 41, 25, 0),
(27, 42, 26, 0),
(28, 69, 27, 0),
(29, 105, 28, 0),
(30, 70, 29, 0),
(31, 106, 30, 0),
(32, 152, 31, 0),
(33, 103, 32, 0),
(34, 68, 33, 0),
(35, 79, 34, 0),
(36, 113, 35, 0),
(37, 22, 36, 0),
(38, 132, 37, 0),
(39, 133, 38, 0),
(40, 8, 39, 0),
(41, 76, 40, 0),
(42, 75, 41, 0),
(43, 114, 42, 0),
(44, 65, 43, 0),
(45, 111, 44, 0),
(46, 119, 45, 0),
(47, 120, 46, 0),
(48, 78, 48, 0),
(49, 144, 49, 0),
(50, 21, 50, 0),
(51, 150, 51, 0),
(52, 77, 52, 0),
(53, 130, 53, 0),
(54, 131, 54, 0),
(55, 51, 55, 0),
(56, 6, 57, 1),
(57, 158, 58, 0),
(58, 47, 59, 0),
(59, 48, 60, 0),
(60, 134, 61, 0),
(61, 157, 62, 0),
(62, 138, 63, 0),
(63, 137, 64, 0),
(64, 143, 65, 0),
(65, 82, 66, 0),
(66, 156, 67, 0),
(67, 139, 68, 0),
(68, 35, 69, 0),
(69, 34, 70, 0),
(70, 49, 71, 0),
(71, 167, 72, 0),
(72, 126, 73, 1),
(73, 125, 74, 0),
(74, 45, 75, 0),
(75, 166, 76, 0),
(76, 127, 77, 0),
(77, 118, 78, 0),
(78, 7, 79, 0),
(79, 147, 80, 0),
(80, 145, 81, 0),
(81, 146, 82, 0),
(82, 80, 83, 0),
(83, 148, 84, 0),
(84, 46, 85, 0),
(85, 43, 86, 0),
(86, 44, 87, 0),
(87, 102, 88, 0),
(88, 155, 89, 0),
(89, 140, 90, 0),
(90, 141, 91, 0),
(91, 142, 92, 0),
(92, 100, 93, 0),
(93, 161, 94, 0),
(94, 163, 95, 0),
(95, 162, 96, 0),
(96, 164, 97, 0),
(97, 101, 98, 0),
(98, 54, 99, 0),
(99, 154, 100, 0),
(100, 4, 101, 0),
(101, 149, 102, 0),
(102, 11, 103, 0),
(103, 109, 104, 0),
(104, 24, 105, 0),
(105, 37, 106, 0),
(106, 169, 107, 0),
(107, 108, 108, 0),
(108, 128, 109, 0),
(109, 129, 110, 0),
(110, 67, 111, 0),
(111, 104, 112, 0),
(112, 117, 113, 0),
(113, 116, 114, 0),
(114, 74, 115, 0),
(115, 151, 116, 0),
(116, 66, 117, 0),
(117, 36, 118, 0),
(118, 107, 119, 0),
(119, 115, 120, 0),
(120, 50, 121, 0),
(121, 81, 122, 0),
(122, 153, 123, 0),
(123, 168, 124, 0);

-- --------------------------------------------------------

--
-- Table structure for table `uuidtype`
--

CREATE TABLE IF NOT EXISTS `uuidtype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `_access_token`
--

CREATE TABLE IF NOT EXISTS `_access_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `_retail_customer`
--

CREATE TABLE IF NOT EXISTS `_retail_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `retail_customerid` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `_third_party`
--

CREATE TABLE IF NOT EXISTS `_third_party` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `third_partyid` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `_token`
--

CREATE TABLE IF NOT EXISTS `_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `batch_item_info`
--
ALTER TABLE `batch_item_info`
  ADD CONSTRAINT `FKAC9F2795B9476106` FOREIGN KEY (`operation`) REFERENCES `crudoperation` (`id`),
  ADD CONSTRAINT `FKAC9F279538943F23` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`id`);

--
-- Constraints for table `data_custodian`
--
ALTER TABLE `data_custodian`
  ADD CONSTRAINT `FK88BA4F99B065A5F8` FOREIGN KEY (`service_type`) REFERENCES `data_custodian_type` (`id`),
  ADD CONSTRAINT `FK88BA4F9988F19B79` FOREIGN KEY (`service_status`) REFERENCES `service_status` (`id`),
  ADD CONSTRAINT `FK88BA4F99C468EB8F` FOREIGN KEY (`data_custodian_application_status`) REFERENCES `data_custodian_application_status` (`id`);

--
-- Constraints for table `data_custodian_application_information`
--
ALTER TABLE `data_custodian_application_information`
  ADD CONSTRAINT `FKD6E8BA174C681F83` FOREIGN KEY (`application_information`) REFERENCES `identified_object` (`id`),
  ADD CONSTRAINT `FKD6E8BA17C805DFCC` FOREIGN KEY (`data_custodian`) REFERENCES `data_custodian` (`id`);

--
-- Constraints for table `data_custodian_authorized_third_partys`
--
ALTER TABLE `data_custodian_authorized_third_partys`
  ADD CONSTRAINT `FKF6D229A3573ED999` FOREIGN KEY (`authorized_third_partys`) REFERENCES `third_party` (`id`),
  ADD CONSTRAINT `FKF6D229A3C805DFCC` FOREIGN KEY (`data_custodian`) REFERENCES `data_custodian` (`id`);

--
-- Constraints for table `data_custodian_retail_customers`
--
ALTER TABLE `data_custodian_retail_customers`
  ADD CONSTRAINT `FKCFD957FF2B8A4D2B` FOREIGN KEY (`retail_customers`) REFERENCES `retail_customer` (`id`),
  ADD CONSTRAINT `FKCFD957FFC805DFCC` FOREIGN KEY (`data_custodian`) REFERENCES `data_custodian` (`id`);

--
-- Constraints for table `identified_object`
--
ALTER TABLE `identified_object`
  ADD CONSTRAINT `FKEB649F631FFB9B00` FOREIGN KEY (`current_day_overall_consumption`) REFERENCES `summary_measurement` (`id`),
  ADD CONSTRAINT `FKEB649F6312787DEA` FOREIGN KEY (`measuring_period`) REFERENCES `time_attribute` (`id`),
  ADD CONSTRAINT `FKEB649F63164F8629` FOREIGN KEY (`reading_type`) REFERENCES `identified_object` (`id`),
  ADD CONSTRAINT `FKEB649F631D4027DE` FOREIGN KEY (`argument`) REFERENCES `rational_number` (`id`),
  ADD CONSTRAINT `FKEB649F632241760F` FOREIGN KEY (`billing_period`) REFERENCES `date_time_interval` (`id`),
  ADD CONSTRAINT `FKEB649F63289E2D10` FOREIGN KEY (`commodity`) REFERENCES `commodity` (`id`),
  ADD CONSTRAINT `FKEB649F632B03BE7C` FOREIGN KEY (`cpp`) REFERENCES `cpp` (`id`),
  ADD CONSTRAINT `FKEB649F632B043DEA` FOREIGN KEY (`tou`) REFERENCES `tou` (`id`),
  ADD CONSTRAINT `FKEB649F632CA173EB` FOREIGN KEY (`peak_demand`) REFERENCES `summary_measurement` (`id`),
  ADD CONSTRAINT `FKEB649F63357B9EB2` FOREIGN KEY (`kind`) REFERENCES `kind` (`id`),
  ADD CONSTRAINT `FKEB649F633F8BD5EB` FOREIGN KEY (`usage_point`) REFERENCES `identified_object` (`id`),
  ADD CONSTRAINT `FKEB649F633FF8FE2B` FOREIGN KEY (`third_party_application_status`) REFERENCES `third_party_application_status` (`id`),
  ADD CONSTRAINT `FKEB649F63412A64E` FOREIGN KEY (`previous_day_net_consumption`) REFERENCES `summary_measurement` (`id`),
  ADD CONSTRAINT `FKEB649F63435C32AC` FOREIGN KEY (`currency`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FKEB649F6345DEE340` FOREIGN KEY (`power_of_ten_multiplier`) REFERENCES `unit_multiplier` (`id`),
  ADD CONSTRAINT `FKEB649F6347BA3F3C` FOREIGN KEY (`published_period`) REFERENCES `date_time_interval` (`id`),
  ADD CONSTRAINT `FKEB649F63618F0B3B` FOREIGN KEY (`location`) REFERENCES `location` (`id`),
  ADD CONSTRAINT `FKEB649F63694B627B` FOREIGN KEY (`third_party_application_type`) REFERENCES `third_party_application_type` (`id`),
  ADD CONSTRAINT `FKEB649F636A3C3FF9` FOREIGN KEY (`ratchet_demand_period`) REFERENCES `date_time_interval` (`id`),
  ADD CONSTRAINT `FKEB649F636CC14AF6` FOREIGN KEY (`espiinterval`) REFERENCES `date_time_interval` (`id`),
  ADD CONSTRAINT `FKEB649F637B2C3259` FOREIGN KEY (`consumption_tier`) REFERENCES `consumption_tier` (`id`),
  ADD CONSTRAINT `FKEB649F637BCAE451` FOREIGN KEY (`service_category`) REFERENCES `service_category` (`id`),
  ADD CONSTRAINT `FKEB649F639CECA22B` FOREIGN KEY (`data_qualifier`) REFERENCES `data_qualifier` (`id`),
  ADD CONSTRAINT `FKEB649F639E4ADEEF` FOREIGN KEY (`authorized_period`) REFERENCES `date_time_interval` (`id`),
  ADD CONSTRAINT `FKEB649F63A4057F48` FOREIGN KEY (`summary_interval`) REFERENCES `date_time_interval` (`id`),
  ADD CONSTRAINT `FKEB649F63A651F306` FOREIGN KEY (`current_billing_period_over_all_consumption`) REFERENCES `summary_measurement` (`id`),
  ADD CONSTRAINT `FKEB649F63AEC253D0` FOREIGN KEY (`current_day_net_consumption`) REFERENCES `summary_measurement` (`id`),
  ADD CONSTRAINT `FKEB649F63B95D57E8` FOREIGN KEY (`flow_direction`) REFERENCES `direction_of_flow` (`id`),
  ADD CONSTRAINT `FKEB649F63C468EB8F` FOREIGN KEY (`data_custodian_application_status`) REFERENCES `data_custodian_application_status` (`id`),
  ADD CONSTRAINT `FKEB649F63C6B4FE39` FOREIGN KEY (`phase`) REFERENCES `phase_code` (`id`),
  ADD CONSTRAINT `FKEB649F63C78E9DAF` FOREIGN KEY (`time_attribute`) REFERENCES `time_attribute` (`id`),
  ADD CONSTRAINT `FKEB649F63C805DFCC` FOREIGN KEY (`data_custodian`) REFERENCES `data_custodian` (`id`),
  ADD CONSTRAINT `FKEB649F63C90FD195` FOREIGN KEY (`aggregate`) REFERENCES `data_qualifier` (`id`),
  ADD CONSTRAINT `FKEB649F63CDE7664D` FOREIGN KEY (`accumulation_behavior`) REFERENCES `accumulation_behavior` (`id`),
  ADD CONSTRAINT `FKEB649F63D1D92A27` FOREIGN KEY (`third_party_application_use`) REFERENCES `third_party_application_use` (`id`),
  ADD CONSTRAINT `FKEB649F63D61E2DF7` FOREIGN KEY (`address`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `FKEB649F63D7C27E7E` FOREIGN KEY (`previous_day_overall_consumption`) REFERENCES `summary_measurement` (`id`),
  ADD CONSTRAINT `FKEB649F63D915670` FOREIGN KEY (`interharmonic`) REFERENCES `reading_interharmonic` (`id`),
  ADD CONSTRAINT `FKEB649F63DE3ED2C5` FOREIGN KEY (`previous_day_last_year_overall_consumption`) REFERENCES `summary_measurement` (`id`),
  ADD CONSTRAINT `FKEB649F63E220A559` FOREIGN KEY (`uom`) REFERENCES `unit_symbol` (`id`),
  ADD CONSTRAINT `FKEB649F63E2C53211` FOREIGN KEY (`ratchet_demand`) REFERENCES `summary_measurement` (`id`),
  ADD CONSTRAINT `FKEB649F63E5D6E423` FOREIGN KEY (`meter_reading`) REFERENCES `identified_object` (`id`),
  ADD CONSTRAINT `FKEB649F63F0D86917` FOREIGN KEY (`current_day_last_year_net_consumption`) REFERENCES `summary_measurement` (`id`),
  ADD CONSTRAINT `FKEB649F63F2F4AA64` FOREIGN KEY (`quality_of_reading`) REFERENCES `quality_of_reading` (`id`),
  ADD CONSTRAINT `FKEB649F63F56C40AC` FOREIGN KEY (`retail_customer`) REFERENCES `retail_customer` (`id`),
  ADD CONSTRAINT `FKEB649F63F9CC00F3` FOREIGN KEY (`status`) REFERENCES `authorization_status` (`id`);

--
-- Constraints for table `identified_object_interval_blocks`
--
ALTER TABLE `identified_object_interval_blocks`
  ADD CONSTRAINT `FK4748BD645B19C4BE` FOREIGN KEY (`interval_blocks`) REFERENCES `identified_object` (`id`),
  ADD CONSTRAINT `FK4748BD648E51FBB0` FOREIGN KEY (`identified_object`) REFERENCES `identified_object` (`id`);

--
-- Constraints for table `identified_object_interval_reading`
--
ALTER TABLE `identified_object_interval_reading`
  ADD CONSTRAINT `FKE37BDA6ED8F5ED4F` FOREIGN KEY (`interval_reading`) REFERENCES `interval_reading` (`id`),
  ADD CONSTRAINT `FKE37BDA6EA4E75E1` FOREIGN KEY (`identified_object`) REFERENCES `identified_object` (`id`);

--
-- Constraints for table `interval_reading`
--
ALTER TABLE `interval_reading`
  ADD CONSTRAINT `FK8B7AC512EF4E7B11` FOREIGN KEY (`interval_block`) REFERENCES `identified_object` (`id`),
  ADD CONSTRAINT `FK8B7AC5123A40229` FOREIGN KEY (`reading_quality`) REFERENCES `reading_quality` (`id`),
  ADD CONSTRAINT `FK8B7AC5123F8BD5EB` FOREIGN KEY (`usage_point`) REFERENCES `identified_object` (`id`),
  ADD CONSTRAINT `FK8B7AC512DBC9A57D` FOREIGN KEY (`time_period`) REFERENCES `date_time_interval` (`id`);

--
-- Constraints for table `reading_quality`
--
ALTER TABLE `reading_quality`
  ADD CONSTRAINT `FKE584EA4CAFAA5FFF` FOREIGN KEY (`quality`) REFERENCES `quality_of_reading` (`id`);

--
-- Constraints for table `retail_customer`
--
ALTER TABLE `retail_customer`
  ADD CONSTRAINT `FK6834339A3D0E0EF0` FOREIGN KEY (`authorized_data_custodian`) REFERENCES `data_custodian` (`id`);

--
-- Constraints for table `retail_customer_third_partys`
--
ALTER TABLE `retail_customer_third_partys`
  ADD CONSTRAINT `FK499288AA746D3175` FOREIGN KEY (`third_partys`) REFERENCES `third_party` (`id`),
  ADD CONSTRAINT `FK499288AAF56C40AC` FOREIGN KEY (`retail_customer`) REFERENCES `retail_customer` (`id`);

--
-- Constraints for table `retail_customer_usage_points`
--
ALTER TABLE `retail_customer_usage_points`
  ADD CONSTRAINT `FK1E7DD5C6F62D91BA` FOREIGN KEY (`usage_points`) REFERENCES `identified_object` (`id`),
  ADD CONSTRAINT `FK1E7DD5C6F56C40AC` FOREIGN KEY (`retail_customer`) REFERENCES `retail_customer` (`id`);

--
-- Constraints for table `service_category`
--
ALTER TABLE `service_category`
  ADD CONSTRAINT `FK72EFE348D7E78B3` FOREIGN KEY (`kind`) REFERENCES `service_kind` (`id`);

--
-- Constraints for table `summary_measurement`
--
ALTER TABLE `summary_measurement`
  ADD CONSTRAINT `FK695998A345DEE340` FOREIGN KEY (`power_of_ten_multiplier`) REFERENCES `unit_multiplier` (`id`),
  ADD CONSTRAINT `FK695998A3E220A559` FOREIGN KEY (`uom`) REFERENCES `unit_symbol` (`id`);

--
-- Constraints for table `third_party`
--
ALTER TABLE `third_party`
  ADD CONSTRAINT `FK1A321A0E3D0E0EF0` FOREIGN KEY (`authorized_data_custodian`) REFERENCES `data_custodian` (`id`),
  ADD CONSTRAINT `FK1A321A0E4C681F83` FOREIGN KEY (`application_information`) REFERENCES `identified_object` (`id`),
  ADD CONSTRAINT `FK1A321A0E88F19B79` FOREIGN KEY (`service_status`) REFERENCES `service_status` (`id`),
  ADD CONSTRAINT `FK1A321A0EC468EB8F` FOREIGN KEY (`data_custodian_application_status`) REFERENCES `data_custodian_application_status` (`id`),
  ADD CONSTRAINT `FK1A321A0EFCAF9658` FOREIGN KEY (`application_use`) REFERENCES `third_party_application_use` (`id`);

--
-- Constraints for table `third_party_application_types`
--
ALTER TABLE `third_party_application_types`
  ADD CONSTRAINT `FK328A60D99AACEC6B` FOREIGN KEY (`application_types`) REFERENCES `third_party_application_type` (`id`),
  ADD CONSTRAINT `FK328A60D9628E235E` FOREIGN KEY (`third_party`) REFERENCES `third_party` (`id`);

--
-- Constraints for table `third_party_authorization_status`
--
ALTER TABLE `third_party_authorization_status`
  ADD CONSTRAINT `FKDD7B9809D6645379` FOREIGN KEY (`authorization_status`) REFERENCES `authorization_status` (`id`),
  ADD CONSTRAINT `FKDD7B9809628E235E` FOREIGN KEY (`third_party`) REFERENCES `third_party` (`id`);

--
-- Constraints for table `third_party_retail_customers`
--
ALTER TABLE `third_party_retail_customers`
  ADD CONSTRAINT `FK6E5B262A2B8A4D2B` FOREIGN KEY (`retail_customers`) REFERENCES `retail_customer` (`id`),
  ADD CONSTRAINT `FK6E5B262A628E235E` FOREIGN KEY (`third_party`) REFERENCES `third_party` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
