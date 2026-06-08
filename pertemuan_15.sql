-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2026 at 03:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pertemuan 15`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_transaksi` (IN `p_id_pelanggan` INT, IN `p_id_buku` INT, IN `p_jumlah` INT)   BEGIN
    DECLARE v_harga DECIMAL(10,2);
    DECLARE v_stok INT;
    DECLARE v_total_harga DECIMAL(10,2);

    SELECT harga, stok INTO v_harga, v_stok
    FROM buku
    WHERE id_buku = p_id_buku;

    IF v_stok IS NULL THEN
        SELECT 'Error: Not Found!' AS pesan;
        
    ELSEIF v_stok < p_jumlah THEN
        SELECT 'Error: Out of Stock!' AS pesan;

    ELSE
        SET v_total_harga = v_harga * p_jumlah;

        START TRANSACTION;

        UPDATE buku
        SET stok = stok - p_jumlah
        WHERE id_buku = p_id_buku;

        INSERT INTO transaksi (id_pelanggan, id_buku, jumlah, total_harga, tanggal_transaksi)
        VALUES (p_id_pelanggan, p_id_buku, p_jumlah, v_total_harga, CURDATE());

        UPDATE pelanggan
        SET total_belanja = total_belanja + v_total_harga
        WHERE id_pelanggan = p_id_pelanggan;

        COMMIT;

        SELECT 'Success' AS pesan;
    END IF;

END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `hitung_diskon` (`total_belanja` DECIMAL(15,2)) RETURNS DECIMAL(5,2) DETERMINISTIC BEGIN
    DECLARE persentase_diskon DECIMAL(5,2);

    SET persentase_diskon = CASE 
        WHEN total_belanja < 1000000 THEN 0.00
        WHEN total_belanja BETWEEN 1000000 AND 5000000 THEN 5.00
        ELSE 10.00
    END;

    RETURN persentase_diskon;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `penulis` varchar(100) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `total_belanja` decimal(10,2) DEFAULT 0.00,
  `status_member` enum('REGULER','GOLD','PLATINUM') DEFAULT 'REGULER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `pelanggan`
--
DELIMITER $$
CREATE TRIGGER `update_status_member` AFTER UPDATE ON `pelanggan` FOR EACH ROW BEGIN
    IF NEW.total_belanja >= 5000000 THEN
        UPDATE pelanggan 
        SET status_member = 'PLATINUM' 
        WHERE id_pelanggan = NEW.id_pelanggan;
        
    ELSEIF NEW.total_belanja >= 1000000 THEN
        UPDATE pelanggan 
        SET status_member = 'GOLD' 
        WHERE id_pelanggan = NEW.id_pelanggan;
        
    ELSE
        UPDATE pelanggan 
        SET status_member = 'REGULER' 
        WHERE id_pelanggan = NEW.id_pelanggan;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_buku` (`id_buku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
