-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: project_basdat
-- ------------------------------------------------------
-- Server version	8.4.8

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jenis_layanan`
--

DROP TABLE IF EXISTS `jenis_layanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jenis_layanan` (
  `id_layanan` varchar(10) NOT NULL,
  `nama_layanan` varchar(50) NOT NULL,
  `estimasi_hari_layanan` int NOT NULL,
  `biaya_tambahan` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_layanan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_layanan`
--

LOCK TABLES `jenis_layanan` WRITE;
/*!40000 ALTER TABLE `jenis_layanan` DISABLE KEYS */;
INSERT INTO `jenis_layanan` VALUES ('LY001','Reguler',5,0.00),('LY002','Express',3,5000.00),('LY003','Same Day',1,15000.00),('LY004','Next Day',2,10000.00),('LY005','Cargo Darat',7,0.00),('LY006','Cargo Laut',14,0.00),('LY007','Cargo Udara',3,25000.00),('LY008','Ekonomi',8,0.00),('LY009','Premium',2,12000.00),('LY010','Super Express',1,20000.00),('LY011','Frozen Food',2,18000.00),('LY012','Dokumen Kilat',1,10000.00),('LY013','Elektronik Aman',3,15000.00),('LY014','Barang Pecah Belah',4,17000.00),('LY015','Heavy Package',5,12000.00),('LY016','Logistik Bisnis',4,8000.00),('LY017','E-Commerce Reguler',5,3000.00),('LY018','E-Commerce Express',2,7000.00),('LY019','Layanan Prioritas',1,25000.00),('LY020','Internasional',10,50000.00);
/*!40000 ALTER TABLE `jenis_layanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kurir`
--

DROP TABLE IF EXISTS `kurir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kurir` (
  `id_kurir` varchar(10) NOT NULL,
  `nama_kurir` varchar(100) NOT NULL,
  `no_telepon_kurir` varchar(15) NOT NULL,
  `jenis_kendaraan` varchar(30) NOT NULL,
  `plat_nomor` varchar(15) NOT NULL,
  `status_kurir` varchar(20) NOT NULL,
  PRIMARY KEY (`id_kurir`),
  UNIQUE KEY `no_telepon_kurir` (`no_telepon_kurir`),
  UNIQUE KEY `plat_nomor` (`plat_nomor`),
  CONSTRAINT `kurir_chk_1` CHECK ((`status_kurir` in (_utf8mb4'Tersedia',_utf8mb4'Bertugas',_utf8mb4'Tidak Tersedia')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kurir`
--

LOCK TABLES `kurir` WRITE;
/*!40000 ALTER TABLE `kurir` DISABLE KEYS */;
INSERT INTO `kurir` VALUES ('K001','Eko Saputra','083222222211','Motor','AB1234AA','Tersedia'),('K002','Doni Wijaya','083222222212','Motor','AB1235AA','Bertugas'),('K003','Fajar Nugroho','083222222213','Mobil','AB1236AA','Tersedia'),('K004','Rian Kurnia','083222222214','Motor','AB1237AA','Tersedia'),('K005','Hadi Setiawan','083222222215','Mobil','AB1238AA','Bertugas'),('K006','Taufik Hidayat','083222222216','Motor','AB1239AA','Tersedia'),('K007','Bagus Pratama','083222222217','Motor','AB1240AA','Tersedia'),('K008','Iqbal Ramadhan','083222222218','Mobil','AB1241AA','Bertugas'),('K009','Rizal Maulana','083222222219','Motor','AB1242AA','Tersedia'),('K010','Agung Saputra','083222222210','Motor','AB1243AA','Tersedia'),('K011','Andika Putra','083222222111','Mobil','AB1244AA','Tersedia'),('K012','Feri Kurniawan','083222222112','Motor','AB1245AA','Bertugas'),('K013','Ardiansyah','083222222113','Motor','AB1246AA','Tersedia'),('K014','Yusuf Hamdani','083222222114','Mobil','AB1247AA','Bertugas'),('K015','Dimas Prakoso','083222222115','Motor','AB1248AA','Tersedia'),('K016','Ilham Saputra','083222222116','Motor','AB1249AA','Tersedia'),('K017','Mochammad Aldi','083222222117','Mobil','AB1250AA','Bertugas'),('K018','Bambang Setiawan','083222222118','Motor','AB1251AA','Tersedia'),('K019','Wahyu Nugroho','083222222119','Motor','AB1252AA','Bertugas'),('K020','Rendy Pratama','083222222220','Mobil','AB1253AA','Tersedia');
/*!40000 ALTER TABLE `kurir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paket`
--

DROP TABLE IF EXISTS `paket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paket` (
  `id_paket` varchar(10) NOT NULL,
  `nomor_resi` varchar(20) NOT NULL,
  `id_pengirim` varchar(10) NOT NULL,
  `id_penerima` varchar(10) NOT NULL,
  `id_kurir` varchar(10) NOT NULL,
  `id_rute` varchar(10) NOT NULL,
  `id_tarif` varchar(10) NOT NULL,
  `id_layanan` varchar(10) NOT NULL,
  `id_status` varchar(10) NOT NULL,
  `tanggal_pengiriman` date NOT NULL,
  `jenis_barang` varchar(100) NOT NULL,
  `nilai_barang` decimal(15,2) DEFAULT NULL,
  `total_biaya` decimal(12,2) DEFAULT NULL,
  `berat_barang` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_paket`),
  UNIQUE KEY `nomor_resi` (`nomor_resi`),
  KEY `id_pengirim` (`id_pengirim`),
  KEY `id_penerima` (`id_penerima`),
  KEY `id_rute` (`id_rute`),
  KEY `id_tarif` (`id_tarif`),
  KEY `id_layanan` (`id_layanan`),
  KEY `idx_paket_status` (`id_status`),
  KEY `idx_paket_tanggal` (`tanggal_pengiriman`),
  KEY `idx_paket_kurir` (`id_kurir`),
  CONSTRAINT `paket_ibfk_1` FOREIGN KEY (`id_pengirim`) REFERENCES `pengirim` (`id_pengirim`),
  CONSTRAINT `paket_ibfk_2` FOREIGN KEY (`id_penerima`) REFERENCES `penerima` (`id_penerima`),
  CONSTRAINT `paket_ibfk_3` FOREIGN KEY (`id_kurir`) REFERENCES `kurir` (`id_kurir`),
  CONSTRAINT `paket_ibfk_4` FOREIGN KEY (`id_rute`) REFERENCES `rute` (`id_rute`),
  CONSTRAINT `paket_ibfk_5` FOREIGN KEY (`id_tarif`) REFERENCES `tarif` (`id_tarif`),
  CONSTRAINT `paket_ibfk_6` FOREIGN KEY (`id_layanan`) REFERENCES `jenis_layanan` (`id_layanan`),
  CONSTRAINT `paket_ibfk_7` FOREIGN KEY (`id_status`) REFERENCES `status_pengiriman` (`id_status`),
  CONSTRAINT `paket_chk_1` CHECK ((`nilai_barang` >= 0)),
  CONSTRAINT `paket_chk_2` CHECK ((`total_biaya` >= 0)),
  CONSTRAINT `paket_chk_3` CHECK ((`berat_barang` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paket`
--

LOCK TABLES `paket` WRITE;
/*!40000 ALTER TABLE `paket` DISABLE KEYS */;
INSERT INTO `paket` VALUES ('PK001','LGT260001','R001','P001','K001','RT001','T001','LY001','ST003','2026-01-06','Laptop',8500000.00,20000.00,2.00),('PK002','LGT260002','R002','P002','K002','RT002','T002','LY002','ST003','2026-01-06','Sepatu',700000.00,20000.00,1.00),('PK003','LGT260003','R003','P003','K003','RT003','T003','LY003','ST003','2026-01-06','Buku',250000.00,38500.00,3.00),('PK004','LGT260004','R004','P004','K004','RT004','T004','LY004','ST003','2026-02-06','Tas',500000.00,30000.00,2.00),('PK005','LGT260005','R005','P005','K005','RT005','T005','LY005','ST003','2026-02-06','Pakaian',350000.00,15000.00,1.00),('PK006','LGT260006','R006','P006','K006','RT006','T006','LY006','ST003','2026-02-06','Mainan',450000.00,19000.00,2.00),('PK007','LGT260007','R007','P007','K007','RT007','T007','LY007','ST003','2026-03-06','Handphone',4000000.00,47000.00,1.00),('PK008','LGT260008','R008','P008','K008','RT008','T008','LY008','ST003','2026-03-06','Aksesoris',150000.00,22000.00,1.00),('PK009','LGT260009','R009','P009','K009','RT009','T009','LY009','ST003','2026-03-06','Kosmetik',300000.00,40000.00,2.00),('PK010','LGT260010','R010','P010','K010','RT010','T010','LY010','ST003','2026-04-06','Dokumen',100000.00,41500.00,1.00),('PK011','LGT260011','R011','P011','K011','RT011','T011','LY011','ST003','2026-04-06','Laptop Gaming',9500000.00,73000.00,3.00),('PK012','LGT260012','R012','P012','K012','RT012','T012','LY012','ST003','2026-04-06','Kamera',5000000.00,55000.00,2.00),('PK013','LGT260013','R013','P013','K013','RT013','T013','LY013','ST003','2026-05-06','Printer',2500000.00,95000.00,5.00),('PK014','LGT260014','R014','P014','K014','RT014','T014','LY014','ST003','2026-05-06','Monitor',3000000.00,86000.00,4.00),('PK015','LGT260015','R015','P015','K015','RT015','T015','LY015','ST003','2026-05-06','Helm',750000.00,41000.00,2.00),('PK016','LGT260016','R016','P016','K016','RT016','T016','LY016','ST003','2026-06-06','TV LED',6000000.00,117000.00,7.00),('PK017','LGT260017','R017','P017','K017','RT017','T017','LY017','ST003','2026-06-06','Sparepart Motor',1500000.00,111000.00,6.00),('PK018','LGT260018','R018','P018','K018','RT018','T018','LY018','ST003','2026-06-06','Mesin Jahit',2200000.00,149000.00,8.00),('PK019','LGT260019','R019','P019','K019','RT019','T019','LY019','ST003','2026-07-06','Peralatan Dapur',1200000.00,115000.00,5.00),('PK020','LGT260020','R020','P020','K020','RT020','T020','LY020','ST003','2026-07-06','Jam Tangan',850000.00,73000.00,1.00),('PK021','LGT260021','R001','P001','K001','RT001','T001','LY001','ST001','2026-08-01','Keyboard',300000.00,20000.00,2.00);
/*!40000 ALTER TABLE `paket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembayaran`
--

DROP TABLE IF EXISTS `pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pembayaran` (
  `id_pembayaran` varchar(10) NOT NULL,
  `id_paket` varchar(10) NOT NULL,
  `jumlah_dibayar` decimal(15,2) NOT NULL,
  `metode_pembayaran` varchar(50) NOT NULL,
  `tgl_pembayaran` date NOT NULL,
  `status_pembayaran` varchar(20) NOT NULL,
  PRIMARY KEY (`id_pembayaran`),
  KEY `id_paket` (`id_paket`),
  CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id_paket`),
  CONSTRAINT `pembayaran_chk_1` CHECK ((`jumlah_dibayar` >= 0)),
  CONSTRAINT `pembayaran_chk_2` CHECK ((`status_pembayaran` in (_utf8mb4'Lunas',_utf8mb4'Belum Lunas',_utf8mb4'Gagal')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayaran`
--

LOCK TABLES `pembayaran` WRITE;
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
INSERT INTO `pembayaran` VALUES ('PB001','PK001',8520000.00,'Transfer Bank','2026-06-01','Lunas'),('PB002','PK002',720000.00,'QRIS','2026-06-01','Lunas'),('PB003','PK003',288500.00,'Transfer Bank','2026-06-01','Lunas'),('PB004','PK004',530000.00,'Tunai','2026-06-02','Lunas'),('PB005','PK005',365000.00,'QRIS','2026-06-02','Lunas'),('PB006','PK006',469000.00,'Transfer Bank','2026-06-02','Lunas'),('PB007','PK007',4047000.00,'QRIS','2026-06-03','Lunas'),('PB008','PK008',172000.00,'Transfer Bank','2026-06-03','Lunas'),('PB009','PK009',340000.00,'Tunai','2026-06-03','Lunas'),('PB010','PK010',141500.00,'QRIS','2026-06-04','Lunas'),('PB011','PK011',9573000.00,'Transfer Bank','2026-06-04','Lunas'),('PB012','PK012',5055000.00,'QRIS','2026-06-04','Lunas'),('PB013','PK013',2595000.00,'Transfer Bank','2026-06-05','Lunas'),('PB014','PK014',3086000.00,'Transfer Bank','2026-06-05','Lunas'),('PB015','PK015',791000.00,'Tunai','2026-06-05','Lunas'),('PB016','PK016',6117000.00,'Transfer Bank','2026-06-06','Lunas'),('PB017','PK017',1611000.00,'QRIS','2026-06-06','Lunas'),('PB018','PK018',2349000.00,'Transfer Bank','2026-06-06','Lunas'),('PB019','PK019',1315000.00,'Tunai','2026-06-07','Lunas'),('PB020','PK020',923000.00,'QRIS','2026-06-07','Lunas');
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penerima`
--

DROP TABLE IF EXISTS `penerima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penerima` (
  `id_penerima` varchar(10) NOT NULL,
  `nama_penerima` varchar(100) NOT NULL,
  `alamat_penerima` varchar(255) NOT NULL,
  `no_hp_penerima` varchar(15) NOT NULL,
  PRIMARY KEY (`id_penerima`),
  UNIQUE KEY `no_hp_penerima` (`no_hp_penerima`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerima`
--

LOCK TABLES `penerima` WRITE;
/*!40000 ALTER TABLE `penerima` DISABLE KEYS */;
INSERT INTO `penerima` VALUES ('P001','Nadia Putri','Jl. Teratai 1, Jakarta','082111111111'),('P002','Arif Rahman','Jl. Kenari 2, Bandung','082111111112'),('P003','Dian Lestari','Jl. Flamboyan 3, Surabaya','082111111113'),('P004','Teguh Prasetyo','Jl. Mangga 4, Semarang','082111111114'),('P005','Vina Maharani','Jl. Rambutan 5, Yogyakarta','082111111115'),('P006','Farhan Akbar','Jl. Durian 6, Solo','082111111116'),('P007','Lia Anggraini','Jl. Nangka 7, Surabaya','082111111117'),('P008','Rio Saputra','Jl. Jambu 8, Jakarta','082111111118'),('P009','Salsa Nabila','Jl. Cempaka 9, Mataram','082111111119'),('P010','Aldi Firmansyah','Jl. Cemara 10, Jakarta','082111111120'),('P011','Nina Karlina','Jl. Pinus 11, Parepare','082111111121'),('P012','Yoga Pratama','Jl. Beringin 12, Jakarta','082111111122'),('P013','Putri Ayu','Jl. Akasia 13, Medan','082111111123'),('P014','Reza Maulana','Jl. Angsana 14, Jambi','082111111124'),('P015','Mila Safitri','Jl. Kamboja 15, Padang','082111111125'),('P016','Dika Saputra','Jl. Wijaya Kusuma 16, Batam','082111111126'),('P017','Anisa Rahma','Jl. Sawo 17, Pontianak','082111111127'),('P018','Fikri Ramadhan','Jl. Kelapa 18, Samarinda','082111111128'),('P019','Wulan Sari','Jl. Asoka 19, Balikpapan','082111111129'),('P020','Galih Nugraha','Jl. Melur 20, Jakarta','082111111130');
/*!40000 ALTER TABLE `penerima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengirim`
--

DROP TABLE IF EXISTS `pengirim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengirim` (
  `id_pengirim` varchar(10) NOT NULL,
  `nama_pengirim` varchar(100) NOT NULL,
  `alamat_pengirim` varchar(255) NOT NULL,
  `no_telepon_pengirim` varchar(15) NOT NULL,
  PRIMARY KEY (`id_pengirim`),
  UNIQUE KEY `no_telepon_pengirim` (`no_telepon_pengirim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengirim`
--

LOCK TABLES `pengirim` WRITE;
/*!40000 ALTER TABLE `pengirim` DISABLE KEYS */;
INSERT INTO `pengirim` VALUES ('R001','Budi Santoso','Jl. Malioboro 12, Yogyakarta','081234567801'),('R002','Andi Pratama','Jl. Diponegoro 5, Semarang','081234567802'),('R003','Siti Nurhaliza','Jl. Slamet Riyadi 8, Surakarta','081234567803'),('R004','Rina Wulandari','Jl. Sudirman 15, Jakarta','081234567804'),('R005','Agus Salim','Jl. Ahmad Yani 21, Surabaya','081234567805'),('R006','Dewi Lestari','Jl. Gatot Subroto 7, Bandung','081234567806'),('R007','Eko Saputra','Jl. Pemuda 19, Malang','081234567807'),('R008','Fajar Nugroho','Jl. Merdeka 4, Bogor','081234567808'),('R009','Linda Sari','Jl. Veteran 11, Denpasar','081234567809'),('R010','Rudi Hartono','Jl. Kartini 3, Bekasi','081234567810'),('R011','Yuni Astuti','Jl. Hasanuddin 9, Makassar','081234567811'),('R012','Doni Wijaya','Jl. Imam Bonjol 17, Tangerang','081234567812'),('R013','Fitri Handayani','Jl. Cendrawasih 25, Pontianak','081234567813'),('R014','Ahmad Fauzi','Jl. Anggrek 13, Palembang','081234567814'),('R015','Nur Aini','Jl. Melati 6, Pekanbaru','081234567815'),('R016','Hendra Gunawan','Jl. Kenanga 10, Medan','081234567816'),('R017','Maya Putri','Jl. Dahlia 5, Batam','081234567817'),('R018','Rizky Kurniawan','Jl. Pahlawan 18, Balikpapan','081234567818'),('R019','Tina Marlina','Jl. Rajawali 14, Samarinda','081234567819'),('R020','Bayu Prakoso','Jl. Mawar 2, Cirebon','081234567820');
/*!40000 ALTER TABLE `pengirim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayat_tracking`
--

DROP TABLE IF EXISTS `riwayat_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwayat_tracking` (
  `id_tracking` varchar(10) NOT NULL,
  `id_paket` varchar(10) NOT NULL,
  `id_status` varchar(10) NOT NULL,
  `waktu` datetime NOT NULL,
  PRIMARY KEY (`id_tracking`),
  KEY `id_status` (`id_status`),
  KEY `idx_riwayat_paket` (`id_paket`),
  KEY `idx_riwayat_waktu` (`waktu`),
  CONSTRAINT `riwayat_tracking_ibfk_1` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id_paket`),
  CONSTRAINT `riwayat_tracking_ibfk_2` FOREIGN KEY (`id_status`) REFERENCES `status_pengiriman` (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayat_tracking`
--

LOCK TABLES `riwayat_tracking` WRITE;
/*!40000 ALTER TABLE `riwayat_tracking` DISABLE KEYS */;
INSERT INTO `riwayat_tracking` VALUES ('TR001','PK001','ST001','2026-06-01 08:00:00'),('TR002','PK001','ST002','2026-06-02 10:00:00'),('TR003','PK001','ST003','2026-06-03 14:00:00'),('TR004','PK002','ST004','2026-06-01 09:00:00'),('TR005','PK002','ST002','2026-06-02 08:00:00'),('TR006','PK002','ST003','2026-06-03 16:00:00'),('TR007','PK003','ST005','2026-06-01 10:00:00'),('TR008','PK003','ST003','2026-06-01 18:00:00'),('TR009','PK004','ST001','2026-06-02 08:00:00'),('TR010','PK004','ST003','2026-06-03 09:00:00'),('TR011','PK005','ST004','2026-06-02 09:00:00'),('TR012','PK005','ST003','2026-06-05 14:00:00'),('TR013','PK006','ST005','2026-06-02 10:00:00'),('TR014','PK006','ST003','2026-06-10 08:00:00'),('TR015','PK007','ST001','2026-06-03 08:00:00'),('TR016','PK007','ST003','2026-06-04 12:00:00'),('TR017','PK008','ST004','2026-06-03 09:00:00'),('TR018','PK008','ST003','2026-06-06 10:00:00'),('TR019','PK009','ST005','2026-06-03 10:00:00'),('TR020','PK009','ST003','2026-06-04 16:00:00'),('TR021','PK010','ST001','2026-06-04 15:00:00'),('TR022','PK010','ST003','2026-06-04 18:00:00'),('TR023','PK011','ST001','2026-06-04 08:00:00'),('TR024','PK011','ST003','2026-06-05 14:00:00'),('TR025','PK012','ST004','2026-06-04 09:00:00'),('TR026','PK012','ST003','2026-06-06 11:00:00'),('TR027','PK013','ST005','2026-06-05 10:00:00'),('TR028','PK013','ST003','2026-06-07 16:00:00'),('TR029','PK014','ST001','2026-06-05 15:00:00'),('TR030','PK014','ST003','2026-06-08 10:00:00'),('TR031','PK015','ST001','2026-06-05 08:00:00'),('TR032','PK015','ST003','2026-06-07 12:00:00'),('TR033','PK016','ST004','2026-06-06 09:00:00'),('TR034','PK016','ST003','2026-06-09 14:00:00'),('TR035','PK017','ST005','2026-06-06 10:00:00'),('TR036','PK017','ST003','2026-06-10 08:00:00'),('TR037','PK018','ST001','2026-06-06 15:00:00'),('TR038','PK018','ST003','2026-06-10 12:00:00'),('TR039','PK019','ST005','2026-06-07 11:00:00'),('TR040','PK019','ST003','2026-06-09 18:00:00'),('TR041','PK020','ST001','2026-06-07 16:00:00'),('TR042','PK020','ST003','2026-06-12 09:00:00');
/*!40000 ALTER TABLE `riwayat_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rute`
--

DROP TABLE IF EXISTS `rute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rute` (
  `id_rute` varchar(10) NOT NULL,
  `kota_asal` varchar(50) NOT NULL,
  `kota_tujuan` varchar(50) NOT NULL,
  `jarak_km` decimal(8,2) NOT NULL,
  `estimasi_hari_rute` int NOT NULL,
  PRIMARY KEY (`id_rute`),
  CONSTRAINT `rute_chk_1` CHECK ((`jarak_km` > 0)),
  CONSTRAINT `rute_chk_2` CHECK ((`estimasi_hari_rute` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rute`
--

LOCK TABLES `rute` WRITE;
/*!40000 ALTER TABLE `rute` DISABLE KEYS */;
INSERT INTO `rute` VALUES ('RT001','Yogyakarta','Jakarta',560.00,2),('RT002','Semarang','Bandung',420.00,1),('RT003','Surakarta','Surabaya',330.00,1),('RT004','Jakarta','Semarang',450.00,1),('RT005','Surabaya','Yogyakarta',390.00,1),('RT006','Bandung','Solo',350.00,1),('RT007','Malang','Surabaya',90.00,1),('RT008','Bogor','Jakarta',60.00,1),('RT009','Denpasar','Mataram',200.00,1),('RT010','Bekasi','Jakarta',30.00,1),('RT011','Makassar','Parepare',180.00,1),('RT012','Tangerang','Jakarta',30.00,1),('RT013','Pontianak','Medan',850.00,2),('RT014','Palembang','Jambi',240.00,1),('RT015','Pekanbaru','Padang',270.00,1),('RT016','Medan','Batam',1200.00,3),('RT017','Batam','Pontianak',1400.00,3),('RT018','Balikpapan','Samarinda',130.00,1),('RT019','Samarinda','Balikpapan',130.00,1),('RT020','Cirebon','Jakarta',220.00,1);
/*!40000 ALTER TABLE `rute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_pengiriman`
--

DROP TABLE IF EXISTS `status_pengiriman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_pengiriman` (
  `id_status` varchar(10) NOT NULL,
  `nama_status` varchar(50) NOT NULL,
  PRIMARY KEY (`id_status`),
  UNIQUE KEY `nama_status` (`nama_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_pengiriman`
--

LOCK TABLES `status_pengiriman` WRITE;
/*!40000 ALTER TABLE `status_pengiriman` DISABLE KEYS */;
INSERT INTO `status_pengiriman` VALUES ('ST005','Dalam Perjalanan'),('ST002','Dalam Transit'),('ST003','Delivered'),('ST004','Paket Diproses'),('ST001','Paket Diterima');
/*!40000 ALTER TABLE `status_pengiriman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarif`
--

DROP TABLE IF EXISTS `tarif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarif` (
  `id_tarif` varchar(10) NOT NULL,
  `id_rute` varchar(10) NOT NULL,
  `id_layanan` varchar(10) NOT NULL,
  `tarif_per_kg` decimal(10,2) NOT NULL,
  `biaya_dasar` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_tarif`),
  UNIQUE KEY `id_rute` (`id_rute`,`id_layanan`),
  KEY `id_layanan` (`id_layanan`),
  CONSTRAINT `tarif_ibfk_1` FOREIGN KEY (`id_rute`) REFERENCES `rute` (`id_rute`),
  CONSTRAINT `tarif_ibfk_2` FOREIGN KEY (`id_layanan`) REFERENCES `jenis_layanan` (`id_layanan`),
  CONSTRAINT `tarif_chk_1` CHECK ((`tarif_per_kg` >= 0)),
  CONSTRAINT `tarif_chk_2` CHECK ((`biaya_dasar` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarif`
--

LOCK TABLES `tarif` WRITE;
/*!40000 ALTER TABLE `tarif` DISABLE KEYS */;
INSERT INTO `tarif` VALUES ('T001','RT001','LY001',5000.00,10000.00),('T002','RT002','LY002',5000.00,10000.00),('T003','RT003','LY003',4500.00,10000.00),('T004','RT004','LY004',5000.00,10000.00),('T005','RT005','LY005',5000.00,10000.00),('T006','RT006','LY006',4500.00,10000.00),('T007','RT007','LY007',7000.00,15000.00),('T008','RT008','LY008',7000.00,15000.00),('T009','RT009','LY009',6500.00,15000.00),('T010','RT010','LY010',6500.00,15000.00),('T011','RT011','LY011',10000.00,25000.00),('T012','RT012','LY012',10000.00,25000.00),('T013','RT013','LY013',11000.00,25000.00),('T014','RT014','LY014',11000.00,25000.00),('T015','RT015','LY015',7000.00,15000.00),('T016','RT016','LY016',12000.00,25000.00),('T017','RT017','LY017',13000.00,30000.00),('T018','RT018','LY018',14000.00,30000.00),('T019','RT019','LY019',12000.00,30000.00),('T020','RT020','LY020',8000.00,15000.00);
/*!40000 ALTER TABLE `tarif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_detail_pengiriman`
--

DROP TABLE IF EXISTS `vw_detail_pengiriman`;
/*!50001 DROP VIEW IF EXISTS `vw_detail_pengiriman`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_detail_pengiriman` AS SELECT 
 1 AS `nomor_resi`,
 1 AS `nama_pengirim`,
 1 AS `nama_penerima`,
 1 AS `nama_kurir`,
 1 AS `nama_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_rekap_pembayaran`
--

DROP TABLE IF EXISTS `vw_rekap_pembayaran`;
/*!50001 DROP VIEW IF EXISTS `vw_rekap_pembayaran`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_rekap_pembayaran` AS SELECT 
 1 AS `nomor_resi`,
 1 AS `metode_pembayaran`,
 1 AS `jumlah_dibayar`,
 1 AS `status_pembayaran`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_detail_pengiriman`
--

/*!50001 DROP VIEW IF EXISTS `vw_detail_pengiriman`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_detail_pengiriman` AS select `p`.`nomor_resi` AS `nomor_resi`,`pg`.`nama_pengirim` AS `nama_pengirim`,`pn`.`nama_penerima` AS `nama_penerima`,`k`.`nama_kurir` AS `nama_kurir`,`sp`.`nama_status` AS `nama_status` from ((((`paket` `p` join `pengirim` `pg` on((`p`.`id_pengirim` = `pg`.`id_pengirim`))) join `penerima` `pn` on((`p`.`id_penerima` = `pn`.`id_penerima`))) join `kurir` `k` on((`p`.`id_kurir` = `k`.`id_kurir`))) join `status_pengiriman` `sp` on((`p`.`id_status` = `sp`.`id_status`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_rekap_pembayaran`
--

/*!50001 DROP VIEW IF EXISTS `vw_rekap_pembayaran`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rekap_pembayaran` AS select `p`.`nomor_resi` AS `nomor_resi`,`pb`.`metode_pembayaran` AS `metode_pembayaran`,`pb`.`jumlah_dibayar` AS `jumlah_dibayar`,`pb`.`status_pembayaran` AS `status_pembayaran` from (`paket` `p` join `pembayaran` `pb` on((`p`.`id_paket` = `pb`.`id_paket`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-26  9:14:31
