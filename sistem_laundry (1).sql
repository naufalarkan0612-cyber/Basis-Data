-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 24 Jun 2026 pada 03.05
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_detail_transaksi`
--

CREATE TABLE `tabel_detail_transaksi` (
  `id_detail` varchar(10) NOT NULL,
  `id_transaksi` varchar(10) DEFAULT NULL,
  `id_paket` varchar(10) DEFAULT NULL,
  `berat_kg` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabel_detail_transaksi`
--

INSERT INTO `tabel_detail_transaksi` (`id_detail`, `id_transaksi`, `id_paket`, `berat_kg`) VALUES
('D01', 'T01', 'PK01', 3.00),
('D02', 'T01', 'PK02', 2.00),
('D03', 'T02', 'PK01', 2.00),
('D04', 'T03', 'PK03', 4.00),
('D05', 'T04', 'PK01', 2.00),
('D06', 'T05', 'PK02', 3.00),
('D07', 'T05', 'PK03', 5.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_paket`
--

CREATE TABLE `tabel_paket` (
  `id_paket` varchar(10) NOT NULL,
  `nama_paket` varchar(100) NOT NULL,
  `harga_per_kg` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabel_paket`
--

INSERT INTO `tabel_paket` (`id_paket`, `nama_paket`, `harga_per_kg`) VALUES
('PK01', 'Cuci kering', 5.00),
('PK02', 'Setrika', 10.00),
('PK03', 'Express', 15.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_pegawai`
--

CREATE TABLE `tabel_pegawai` (
  `id_pegawai` varchar(10) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `jabatan_pegawai` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabel_pegawai`
--

INSERT INTO `tabel_pegawai` (`id_pegawai`, `nama_pegawai`, `jabatan_pegawai`) VALUES
('PG01', 'Luna', 'Admin'),
('PG02', 'Deri', 'Kasir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_pelanggan`
--

CREATE TABLE `tabel_pelanggan` (
  `id_pelanggan` varchar(10) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `no_telepon_pelanggan` varchar(15) DEFAULT NULL,
  `alamat_pelanggan` text DEFAULT NULL,
  `email_pelanggan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabel_pelanggan`
--

INSERT INTO `tabel_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `no_telepon_pelanggan`, `alamat_pelanggan`, `email_pelanggan`) VALUES
('P01', 'Arkan', '02367652398', 'Magelang', NULL),
('P02', 'Excel', '09878888598', 'Yogya', NULL),
('P03', 'Fahmi', '88543276854', 'Magelang', NULL),
('P04', 'Nabilla', '07678989876', 'Klaten', NULL),
('P05', 'Zaydan', '09578765454', 'Yogya', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_pembayaran`
--

CREATE TABLE `tabel_pembayaran` (
  `id_pembayaran` varchar(10) NOT NULL,
  `id_transaksi` varchar(10) DEFAULT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL,
  `metode_bayar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabel_pembayaran`
--

INSERT INTO `tabel_pembayaran` (`id_pembayaran`, `id_transaksi`, `total_harga`, `metode_bayar`) VALUES
('BY01', 'T01', 18.00, NULL),
('BY02', 'T02', 20.00, NULL),
('BY03', 'T03', 20.00, NULL),
('BY04', 'T04', 2.00, NULL),
('BY05', 'T05', 55.00, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_transaksi`
--

CREATE TABLE `tabel_transaksi` (
  `id_transaksi` varchar(10) NOT NULL,
  `id_pelanggan` varchar(10) DEFAULT NULL,
  `id_pegawai` varchar(10) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `metode_bayar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabel_transaksi`
--

INSERT INTO `tabel_transaksi` (`id_transaksi`, `id_pelanggan`, `id_pegawai`, `tanggal_masuk`, `status`, `metode_bayar`) VALUES
('T01', 'P01', 'PG01', '2026-05-10', 'Dicuci', 'Cash'),
('T02', 'P02', 'PG01', '2026-05-11', 'Selesai', 'Transfer'),
('T03', 'P03', 'PG02', '2026-05-12', 'Diproses', 'Cash'),
('T04', 'P04', 'PG01', '2026-05-13', 'Dicuci', 'QRIS'),
('T05', 'P05', 'PG02', '2026-05-13', 'Selesai', 'Cash');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tabel_detail_transaksi`
--
ALTER TABLE `tabel_detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_paket` (`id_paket`);

--
-- Indeks untuk tabel `tabel_paket`
--
ALTER TABLE `tabel_paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indeks untuk tabel `tabel_pegawai`
--
ALTER TABLE `tabel_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indeks untuk tabel `tabel_pelanggan`
--
ALTER TABLE `tabel_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD UNIQUE KEY `idx_email_pelanggan` (`email_pelanggan`);

--
-- Indeks untuk tabel `tabel_pembayaran`
--
ALTER TABLE `tabel_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indeks untuk tabel `tabel_transaksi`
--
ALTER TABLE `tabel_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `idx_tanggal_masuk` (`tanggal_masuk`),
  ADD KEY `idx_status` (`status`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tabel_detail_transaksi`
--
ALTER TABLE `tabel_detail_transaksi`
  ADD CONSTRAINT `tabel_detail_transaksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `tabel_transaksi` (`id_transaksi`),
  ADD CONSTRAINT `tabel_detail_transaksi_ibfk_2` FOREIGN KEY (`id_paket`) REFERENCES `tabel_paket` (`id_paket`);

--
-- Ketidakleluasaan untuk tabel `tabel_pembayaran`
--
ALTER TABLE `tabel_pembayaran`
  ADD CONSTRAINT `tabel_pembayaran_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `tabel_transaksi` (`id_transaksi`);

--
-- Ketidakleluasaan untuk tabel `tabel_transaksi`
--
ALTER TABLE `tabel_transaksi`
  ADD CONSTRAINT `tabel_transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tabel_pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `tabel_transaksi_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `tabel_pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
