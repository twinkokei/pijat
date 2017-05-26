/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.5.5-10.1.21-MariaDB : Database - pijat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pijat` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `pijat`;

/*Table structure for table `banks` */

DROP TABLE IF EXISTS `banks`;

CREATE TABLE `banks` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) NOT NULL,
  `bank_account_number` varchar(100) NOT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `banks` */

insert  into `banks`(`bank_id`,`bank_name`,`bank_account_number`) values (1,'Mandiri',''),(2,'BCA',''),(3,'BRI','');

/*Table structure for table `branches` */

DROP TABLE IF EXISTS `branches`;

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(200) NOT NULL,
  `branch_desc` text NOT NULL,
  `branch_address` text NOT NULL,
  `branch_phone` varchar(100) NOT NULL,
  `branch_city` varchar(100) NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `branches` */

insert  into `branches`(`branch_id`,`branch_name`,`branch_desc`,`branch_address`,`branch_phone`,`branch_city`) values (5,'SPA Pijat Majapahit','Pijat','Jl Majapahit','083938191981','Surabaya'),(6,'SPA Pijat Sudirman','Pijat','Jl.Panglima Sudirman','024819411939','Surabaya'),(7,'SPA Pahlawan','Pijat','Jl Pahlawan','089379397947','Jakarta');

/*Table structure for table `infrastruktur` */

DROP TABLE IF EXISTS `infrastruktur`;

CREATE TABLE `infrastruktur` (
  `infrastruktur_id` int(11) NOT NULL AUTO_INCREMENT,
  `infrastruktur_name` varchar(200) NOT NULL,
  `infrastruktur_warna` varchar(200) NOT NULL,
  `infrastruktur_img` text NOT NULL,
  PRIMARY KEY (`infrastruktur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `infrastruktur` */

insert  into `infrastruktur`(`infrastruktur_id`,`infrastruktur_name`,`infrastruktur_warna`,`infrastruktur_img`) values (1,'nama 1','warna 1','1491202890_1490933442_kursi_relax2.png'),(3,'nama 2','warna 2','1490927932_unnamed(1).jpg'),(4,'DV','SFSFF','1491202901_1490933442_kursi_relax2.png');

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `item_id` int(20) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(200) NOT NULL,
  `item_hpp` int(50) NOT NULL,
  `item_margin` int(50) NOT NULL,
  `item_harga_jual` int(50) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `item` */

insert  into `item`(`item_id`,`item_name`,`item_hpp`,`item_margin`,`item_harga_jual`) values (1,'minyak',30000,5000,50000),(5,'minyak Zaitun',20000,5000,30000),(6,'Lulur Kunyit',20000,10000,40000);

/*Table structure for table `item_stocks` */

DROP TABLE IF EXISTS `item_stocks`;

CREATE TABLE `item_stocks` (
  `item_stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `item` int(11) NOT NULL,
  `item_qty` int(11) NOT NULL,
  `branch` int(11) NOT NULL,
  PRIMARY KEY (`item_stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `item_stocks` */

/*Table structure for table `journal_types` */

DROP TABLE IF EXISTS `journal_types`;

CREATE TABLE `journal_types` (
  `journal_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_type_name` varchar(200) NOT NULL,
  PRIMARY KEY (`journal_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `journal_types` */

insert  into `journal_types`(`journal_type_id`,`journal_type_name`) values (1,'Penjualan'),(2,'Pembelian'),(3,'Pemasukan lainnya'),(4,'Pengeluaran lainnya');

/*Table structure for table `journals` */

DROP TABLE IF EXISTS `journals`;

CREATE TABLE `journals` (
  `journal_id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_type_id` int(11) NOT NULL,
  `data_id` int(11) NOT NULL,
  `data_url` text NOT NULL,
  `journal_debit` int(11) NOT NULL,
  `journal_credit` int(11) NOT NULL,
  `journal_piutang` int(11) NOT NULL,
  `journal_hutang` int(11) NOT NULL,
  `journal_date` date NOT NULL,
  `journal_desc` text NOT NULL,
  `bank_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `journals` */

insert  into `journals`(`journal_id`,`journal_type_id`,`data_id`,`data_url`,`journal_debit`,`journal_credit`,`journal_piutang`,`journal_hutang`,`journal_date`,`journal_desc`,`bank_id`,`user_id`,`branch_id`) values (1,1,2,'',24000,0,0,0,'2017-02-28','Meja Meja 4',0,11,3),(2,1,0,'',53000,0,0,0,'2017-03-01','Meja Meja 2',0,11,3),(3,1,0,'',55000,0,0,0,'2017-03-01','Meja Meja 2',0,11,3),(4,1,0,'',55000,0,0,0,'2017-03-01','Meja Meja 4',0,11,3),(5,1,0,'',55000,0,0,0,'2017-03-01','Meja Meja 4',0,11,3),(6,1,0,'',55000,0,0,0,'2017-03-01','Meja Meja 4',0,11,3),(7,1,0,'',55000,0,0,0,'2017-03-01','Meja Meja 4',0,11,3),(8,1,0,'',55000,0,0,0,'2017-03-01','Meja Meja 4',0,11,3),(9,1,0,'',55000,0,0,0,'2017-03-01','Meja Meja 4',0,11,3),(10,1,0,'',55000,0,0,0,'2017-03-01','Meja Meja 4',0,11,3),(11,1,0,'',55000,0,0,0,'2017-03-01','Meja Meja 4',0,11,3),(12,1,0,'',55000,0,0,0,'2017-03-01','Meja Meja 4',0,11,3),(13,1,0,'',55000,0,0,0,'2017-03-01','Meja Meja 4',0,11,3),(14,1,15,'',55000,0,0,0,'2017-03-01','Meja Meja 4',0,11,3),(15,1,16,'',55000,0,0,0,'2017-03-01','Meja Meja 4',0,11,3),(16,1,17,'',110000,0,0,0,'2017-03-01','Meja Meja 4',0,11,3);

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_name` varbinary(30) NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `kategori` */

insert  into `kategori`(`kategori_id`,`kategori_name`) values (1,'Bakmie'),(2,'Nasi'),(3,'Kwetiauw'),(4,'Minuman'),(5,'Paket'),(11,'Go Food');

/*Table structure for table `kategori_paket_pijat` */

DROP TABLE IF EXISTS `kategori_paket_pijat`;

CREATE TABLE `kategori_paket_pijat` (
  `kategori_paket_pijat_id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_paket_pijat_name` varchar(200) NOT NULL,
  PRIMARY KEY (`kategori_paket_pijat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kategori_paket_pijat` */

/*Table structure for table `member_items` */

DROP TABLE IF EXISTS `member_items`;

CREATE TABLE `member_items` (
  `member_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`member_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `member_items` */

/*Table structure for table `members` */

DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(100) NOT NULL,
  `member_phone` varchar(100) NOT NULL,
  `member_alamat` varchar(30) NOT NULL,
  `member_email` varchar(200) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `members` */

insert  into `members`(`member_id`,`member_name`,`member_phone`,`member_alamat`,`member_email`) values (21,'adar','932580220','jl mana','kak@gmail.com'),(22,'kak','01491241','jl mana','kak@gmail.com'),(26,'nama 1','082385932','jl mana','nama1@gmail.com');

/*Table structure for table `office` */

DROP TABLE IF EXISTS `office`;

CREATE TABLE `office` (
  `office_id` int(11) NOT NULL,
  `office_name` varchar(200) NOT NULL,
  `office_img` text NOT NULL,
  `office_desc` text NOT NULL,
  `office_address` text NOT NULL,
  `office_phone` varchar(100) NOT NULL,
  `office_email` varchar(300) NOT NULL,
  `office_city` varchar(100) NOT NULL,
  `office_owner` varchar(100) NOT NULL,
  `office_owner_phone` varchar(100) NOT NULL,
  `office_owner_address` varchar(100) NOT NULL,
  `office_owner_email` varchar(100) NOT NULL,
  PRIMARY KEY (`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `office` */

insert  into `office`(`office_id`,`office_name`,`office_img`,`office_desc`,`office_address`,`office_phone`,`office_email`,`office_city`,`office_owner`,`office_owner_phone`,`office_owner_address`,`office_owner_email`) values (1,'ZEE HOLISTIC LIVING','1491447710_unnamed (1).jpg','','																																																																																																																																																																																																																		JL. RAYA LONTAR 226 SURABAYA																																																																																																																																																																																																																								','(031)-04408-0-02','twoinone@gmail.com','SURABAYA','Danu Ariska','0856-343-423','Surabaya','danuariksa@gmail.com');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL,
  `branch` int(11) NOT NULL,
  `member` int(11) NOT NULL,
  `order_sub_total` int(11) NOT NULL,
  `diskon` int(11) NOT NULL,
  `order_total` int(11) NOT NULL,
  `payment` int(11) NOT NULL,
  `change` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `bank` int(11) NOT NULL,
  `bank_account_number` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `order` */

/*Table structure for table `order_tmp` */

DROP TABLE IF EXISTS `order_tmp`;

CREATE TABLE `order_tmp` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `member` int(11) NOT NULL,
  `reservasi` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `branch` int(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `order_tmp` */

/*Table structure for table `paket_pijat` */

DROP TABLE IF EXISTS `paket_pijat`;

CREATE TABLE `paket_pijat` (
  `paket_pijat_id` int(11) NOT NULL AUTO_INCREMENT,
  `paket_pijat_name` varchar(200) NOT NULL,
  `paket_pijat_harga` int(11) NOT NULL,
  PRIMARY KEY (`paket_pijat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `paket_pijat` */

insert  into `paket_pijat`(`paket_pijat_id`,`paket_pijat_name`,`paket_pijat_harga`) values (1,'Pijat Enak',150000),(3,'Pijat Ples Ples',2500000),(4,'Paket A',200000),(5,'Paket B',50000);

/*Table structure for table `paket_pijat_details` */

DROP TABLE IF EXISTS `paket_pijat_details`;

CREATE TABLE `paket_pijat_details` (
  `paket_pijat_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `paket_pijat` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `item_qty` int(11) NOT NULL,
  PRIMARY KEY (`paket_pijat_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `paket_pijat_details` */

/*Table structure for table `partners` */

DROP TABLE IF EXISTS `partners`;

CREATE TABLE `partners` (
  `partner_id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_name` varchar(100) NOT NULL,
  PRIMARY KEY (`partner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `partners` */

insert  into `partners`(`partner_id`,`partner_name`) values (1,'Bakmi Gili');

/*Table structure for table `payment_methods` */

DROP TABLE IF EXISTS `payment_methods`;

CREATE TABLE `payment_methods` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method_name` varchar(100) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `payment_methods` */

insert  into `payment_methods`(`payment_method_id`,`payment_method_name`) values (1,'Cash'),(2,'Debit'),(3,'Credit');

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_jumlah` int(11) NOT NULL,
  `payment_sisa` int(11) NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `payments` */

/*Table structure for table `permits` */

DROP TABLE IF EXISTS `permits`;

CREATE TABLE `permits` (
  `permit_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NOT NULL,
  `side_menu_id` int(11) NOT NULL,
  `permit_acces` varchar(10) NOT NULL,
  PRIMARY KEY (`permit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=812 DEFAULT CHARSET=latin1;

/*Data for the table `permits` */

insert  into `permits`(`permit_id`,`user_type_id`,`side_menu_id`,`permit_acces`) values (241,4,1,'0'),(242,4,2,'c,r,u,d'),(243,4,3,'0'),(244,4,4,'0'),(245,4,5,'0'),(246,4,6,'0'),(247,4,7,''),(248,4,8,''),(249,4,9,'c,r,u,d'),(250,4,10,'c,r,u,d'),(251,4,11,''),(252,4,12,'c,r,u,d'),(253,4,13,''),(254,4,14,''),(255,4,15,'c,r,u,d'),(256,4,16,''),(257,4,17,''),(258,4,18,''),(259,4,19,''),(260,4,20,''),(261,4,21,''),(262,4,22,'c,r,u,d'),(263,4,23,''),(264,4,24,''),(699,1,1,'0'),(700,1,2,'c,r,u,d'),(701,1,3,'0'),(702,1,4,'0'),(703,1,5,'0'),(704,1,6,'0'),(705,1,7,'c,r,u,d'),(706,1,8,'c,r,u,d'),(707,1,9,'c,r,u,d'),(708,1,10,'c,r,u,d'),(709,1,11,'c,r,u,d'),(710,1,12,'c,r,u,d'),(711,1,13,'c,r,u,d'),(712,1,14,'c,r,u,d'),(713,1,15,'c,r,u,d'),(714,1,16,'c,r,u,d'),(715,1,17,'c,r,u,d'),(716,1,18,'c,r,u,d'),(717,1,19,'c,r,u,d'),(718,1,20,'c,r,u,d'),(719,1,21,'c,r,u,d'),(720,1,22,'c,r,u,d'),(721,1,23,'c,r,u,d'),(722,1,24,'c,r,u,d'),(723,1,25,'c,r,u,d'),(724,1,26,'c,r,u,d'),(725,1,27,'c,r,u,d'),(726,1,28,'c,r,u,d'),(727,1,30,'c,r,u,d'),(728,3,1,'0'),(729,3,2,'c,r,u,d'),(730,3,3,'0'),(731,3,4,'0'),(732,3,5,'0'),(733,3,6,'0'),(734,3,7,'c,r,u,d'),(735,3,8,'c,r,u,d'),(736,3,9,'c,r,u,d'),(737,3,10,'c,r,u,d'),(738,3,11,'c,r,u,d'),(739,3,12,'c,r,u,d'),(740,3,13,'c,r,u,d'),(741,3,14,'c,r,u,d'),(742,3,15,'c,r,u,d'),(743,3,16,'c,r,u,d'),(744,3,17,'c,r,u,d'),(745,3,18,'c,r,u,d'),(746,3,19,'c,r,u,d'),(747,3,20,'c,r,u,d'),(748,3,21,'c,r,u,d'),(749,3,22,'c,r,u,d'),(750,3,23,'c,r,u,d'),(751,3,24,'c,r,u,d'),(752,3,25,'c,r,u,d'),(753,3,26,'c,r,u,d'),(754,3,27,'c,r,u,d'),(755,3,28,'c,r,u,d'),(784,2,1,'0'),(785,2,2,'c,r,u,d'),(786,2,3,'0'),(787,2,4,'0'),(788,2,5,'0'),(789,2,6,'0'),(790,2,7,''),(791,2,8,'c,r,u,d'),(792,2,9,'c,r,u,d'),(793,2,10,'c,r,u,d'),(794,2,11,''),(795,2,12,'c,r,u,d'),(796,2,13,'c,r,u,d'),(797,2,14,'c,r,u,d'),(798,2,15,'c,r,u,d'),(799,2,16,'c,r,u,d'),(800,2,17,'c,r,u,d'),(801,2,18,'c,r,u,d'),(802,2,19,'c,r,u,d'),(803,2,20,'c,r,u,d'),(804,2,21,'c,r,u,d'),(805,2,22,'c,r,u,d'),(806,2,23,''),(807,2,24,''),(808,2,25,''),(809,2,26,''),(810,2,27,''),(811,2,28,'c,r,u,d');

/*Table structure for table `purchases` */

DROP TABLE IF EXISTS `purchases`;

CREATE TABLE `purchases` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_date` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `purchase_qty` int(11) NOT NULL,
  `purchase_price` int(11) NOT NULL,
  `purchase_total` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

/*Data for the table `purchases` */

/*Table structure for table `reservasi` */

DROP TABLE IF EXISTS `reservasi`;

CREATE TABLE `reservasi` (
  `reservasi_id` int(11) NOT NULL AUTO_INCREMENT,
  `reservasi_code` varchar(200) NOT NULL,
  `reservasi_date1` datetime NOT NULL,
  `reservasi_date2` datetime NOT NULL,
  `order_code` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`reservasi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `reservasi` */

/*Table structure for table `ruangan` */

DROP TABLE IF EXISTS `ruangan`;

CREATE TABLE `ruangan` (
  `ruangan_id` int(11) NOT NULL AUTO_INCREMENT,
  `ruangan_name` varchar(100) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`ruangan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `ruangan` */

insert  into `ruangan`(`ruangan_id`,`ruangan_name`,`branch_id`) values (9,'Utama',5),(10,'Mawar',5),(12,'kaktus',7),(13,'Utama',7);

/*Table structure for table `ruangan_infrastruktur` */

DROP TABLE IF EXISTS `ruangan_infrastruktur`;

CREATE TABLE `ruangan_infrastruktur` (
  `ruangan_infrastruktur_id` int(10) unsigned NOT NULL,
  `ruangan` int(11) NOT NULL,
  `branch` int(11) NOT NULL,
  `infrastruktur` int(11) NOT NULL,
  `infrastruktur_name` varchar(200) NOT NULL,
  `koordinat_x` int(11) NOT NULL,
  `koordinat_y` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`ruangan_infrastruktur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ruangan_infrastruktur` */

insert  into `ruangan_infrastruktur`(`ruangan_infrastruktur_id`,`ruangan`,`branch`,`infrastruktur`,`infrastruktur_name`,`koordinat_x`,`koordinat_y`,`status`) values (0,0,0,0,'',-159,9,0);

/*Table structure for table `side_menus` */

DROP TABLE IF EXISTS `side_menus`;

CREATE TABLE `side_menus` (
  `side_menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `side_menu_name` varchar(100) NOT NULL,
  `side_menu_url` varchar(100) NOT NULL,
  `side_menu_parent` int(11) NOT NULL,
  `side_menu_icon` varchar(100) NOT NULL,
  `side_menu_level` int(11) NOT NULL,
  `side_menu_type_parent` int(11) NOT NULL,
  PRIMARY KEY (`side_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `side_menus` */

insert  into `side_menus`(`side_menu_id`,`side_menu_name`,`side_menu_url`,`side_menu_parent`,`side_menu_icon`,`side_menu_level`,`side_menu_type_parent`) values (1,'Master','#',0,'fa fa-edit',1,0),(2,'Order','order.php',0,'fa fa-cutlery',1,1),(3,'Transaksi','#',0,'fa fa-shopping-cart',1,0),(4,'Accounting','#',0,'fa fa-list-alt',1,0),(5,'Laporan','#',0,'fa fa-list-alt',1,0),(6,'Setting','#',0,'fa fa-cog',1,0),(7,'Cabang','branch.php',1,'',2,1),(8,'Ruangan','building.php',1,'',2,1),(9,'Infrastruktur','infrastruktur.php',1,'',2,1),(10,'Paket Pijat','paket_pijat.php',1,'',2,1),(11,'Partner','partner.php',1,'',2,0),(12,'Member','member.php',1,'',2,1),(13,'item','item.php',1,'',2,1),(14,'Voucher','voucher.php',0,'',0,0),(15,'Reservasi','reserved.php',3,'',2,1),(16,'Pembelian','purchase.php',3,'',2,1),(17,'Stok','stock.php',3,'',2,1),(18,'Arus Kas','arus_kas.php',4,'',2,1),(19,'Pemasukan Dan Pengeluaran Lainnya','jurnal_umum.php',4,'',2,1),(20,'Laporan Detail','report_detail.php',5,'',2,1),(21,'Laporan Harian','report_harian.php',5,'',2,1),(22,'Infrastruktur','infrastruktur_setting.php',6,'',2,1),(23,'User','user.php',6,'',2,1),(24,'Type User','user_type.php',6,'',2,1),(25,'Penyesuaian Stock','penyesuaian_stock.php',0,'',0,1),(26,'Laporan Penyesuaian Stock','report_penyesuaian_stock.php',5,'',2,1),(27,'Kategori Menu','kategori_menu.php',0,'',0,1),(28,'Profil','office.php',6,'',2,1);

/*Table structure for table `statement` */

DROP TABLE IF EXISTS `statement`;

CREATE TABLE `statement` (
  `statement_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `tekanan` int(11) NOT NULL,
  `asma` int(11) NOT NULL,
  `inhaler` int(11) NOT NULL,
  `leher` int(11) NOT NULL,
  `kulit` int(11) NOT NULL,
  `kulit_jabarkan` varchar(100) NOT NULL,
  `selain_diatas` int(11) NOT NULL,
  `selain_jabarkan` varchar(100) NOT NULL,
  `alergi` int(11) NOT NULL,
  `alergi_jabarkan` varchar(100) NOT NULL,
  `hamil` int(11) NOT NULL,
  `usia_kandungan` varchar(100) NOT NULL,
  `kontak_lens` int(11) NOT NULL,
  `melepas_lens` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `spesial` int(11) NOT NULL,
  `jawaban` int(11) NOT NULL,
  `tidak_menyembunyikan` int(11) NOT NULL,
  `tanggung_jawab` int(11) NOT NULL,
  PRIMARY KEY (`statement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `statement` */

insert  into `statement`(`statement_id`,`member_id`,`tekanan`,`asma`,`inhaler`,`leher`,`kulit`,`kulit_jabarkan`,`selain_diatas`,`selain_jabarkan`,`alergi`,`alergi_jabarkan`,`hamil`,`usia_kandungan`,`kontak_lens`,`melepas_lens`,`level`,`spesial`,`jawaban`,`tidak_menyembunyikan`,`tanggung_jawab`) values (1,21,2,2,2,2,2,'',2,'',2,'',2,'',2,2,3,1,1,1,1),(2,22,2,2,2,2,2,'',2,'',2,'',2,'',1,1,2,1,1,1,1),(6,25,1,1,1,1,1,'cedera',2,'',2,'',2,'',1,1,3,1,1,1,1);

/*Table structure for table `suppliers` */

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(50) NOT NULL,
  `supplier_phone` int(11) NOT NULL,
  `supplier_email` varchar(100) NOT NULL,
  `supplier_addres` varchar(100) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `suppliers` */

insert  into `suppliers`(`supplier_id`,`supplier_name`,`supplier_phone`,`supplier_email`,`supplier_addres`) values (6,'Bakmi Gili Pusat',315484702,'bakmie.gili@gmail.com','MT. Haryono No. 42'),(7,'majapahit',2147483647,'ajajiji@gmail.com','jl majapahit'),(8,'',0,'','');

/*Table structure for table `user_types` */

DROP TABLE IF EXISTS `user_types`;

CREATE TABLE `user_types` (
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_name` varchar(200) NOT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `user_types` */

insert  into `user_types`(`user_type_id`,`user_type_name`) values (1,'Administrator'),(2,'Kasir'),(3,'Owner'),(4,'Waitress');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) DEFAULT NULL,
  `user_login` varchar(100) DEFAULT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_code` varchar(100) DEFAULT NULL,
  `user_phone` varchar(100) DEFAULT NULL,
  `user_img` text NOT NULL,
  `user_active_status` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`user_id`,`user_type_id`,`user_login`,`user_password`,`user_name`,`user_code`,`user_phone`,`user_img`,`user_active_status`,`branch_id`) values (11,3,'admin','21232f297a57a5a743894a0e4a801fc3','admin','A0001','03125435432','',1,3),(32,3,'maria','fe01ce2a7fbac8fafaed7c982a04e229','maria','','1111','',1,4),(34,1,'budi','101eb6ad45137d043a8e3f8fb3990135','budi','','3232','',1,3),(39,2,'dita','fe01ce2a7fbac8fafaed7c982a04e229','Dita','','085731404513','',1,3),(40,4,'elina','fe01ce2a7fbac8fafaed7c982a04e229','Lina','','085852731314','',1,4),(41,1,'admin12','21232f297a57a5a743894a0e4a801fc3','admin','','01491241','',1,6);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;