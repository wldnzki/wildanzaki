-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Nov 2024 pada 08.15
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
-- Database: `pt_bendi_car`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LoginPenyewa` (IN `userName` VARCHAR(100), IN `passWord` VARCHAR(50))   BEGIN
    SELECT ID_Penyewa, Nama_Penyewa, Alamat, No_Telepon, Identitas
    FROM Penyewa
    WHERE Nama_Penyewa = userName AND Identitas = passWord;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kendaraan`
--

CREATE TABLE `kendaraan` (
  `ID_Kendaraan` int(11) NOT NULL,
  `Nama_Kendaraan` varchar(100) DEFAULT NULL,
  `Jenis_Kendaraan` varchar(50) DEFAULT NULL,
  `Plat_Nomor` varchar(20) DEFAULT NULL,
  `Harga_Sewa_Jabodetabek` decimal(10,2) DEFAULT NULL,
  `Harga_Sewa_Luar_Jabodetabek` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_bulanan`
--

CREATE TABLE `laporan_bulanan` (
  `ID_Laporan` int(11) NOT NULL,
  `Periode_Bulan` date DEFAULT NULL,
  `Total_Pendapatan` decimal(10,2) DEFAULT NULL,
  `Total_Denda` decimal(10,2) DEFAULT NULL,
  `Total_Transaksi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `ID_Pengembalian` int(11) NOT NULL,
  `ID_Transaksi` int(11) DEFAULT NULL,
  `Kondisi_Kendaraan` text DEFAULT NULL,
  `Keterlambatan` int(11) DEFAULT 0,
  `Biaya_Denda` decimal(10,2) DEFAULT NULL,
  `Total_Pembayaran` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyewa`
--

CREATE TABLE `penyewa` (
  `ID_Penyewa` int(11) NOT NULL,
  `Nama_Penyewa` varchar(100) DEFAULT NULL,
  `Alamat` text DEFAULT NULL,
  `No_Telepon` varchar(15) DEFAULT NULL,
  `Identitas` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sopir`
--

CREATE TABLE `sopir` (
  `ID_Sopir` int(11) NOT NULL,
  `Nama_Sopir` varchar(100) DEFAULT NULL,
  `Harga_Sewa_Jabodetabek` decimal(10,2) DEFAULT NULL,
  `Harga_Sewa_Luar_Jabodetabek` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_penyewaan`
--

CREATE TABLE `transaksi_penyewaan` (
  `ID_Transaksi` int(11) NOT NULL,
  `ID_Penyewa` int(11) DEFAULT NULL,
  `ID_Kendaraan` int(11) DEFAULT NULL,
  `ID_Sopir` int(11) DEFAULT NULL,
  `Tanggal_Peminjaman` date DEFAULT NULL,
  `Tanggal_Pengembalian_Terjadwal` date DEFAULT NULL,
  `Biaya_Transaksi` decimal(10,2) DEFAULT NULL,
  `Status_Pengembalian` enum('Belum Dikembalikan','Sudah Dikembalikan') DEFAULT 'Belum Dikembalikan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level`) VALUES
(1, '23753121', '123', '1'),
(2, '23753121', '1234', '2'),
(3, '23753121', '123', '2'),
(4, '23753121', '123', '2');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`ID_Kendaraan`);

--
-- Indeks untuk tabel `laporan_bulanan`
--
ALTER TABLE `laporan_bulanan`
  ADD PRIMARY KEY (`ID_Laporan`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`ID_Pengembalian`),
  ADD KEY `ID_Transaksi` (`ID_Transaksi`);

--
-- Indeks untuk tabel `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`ID_Penyewa`);

--
-- Indeks untuk tabel `sopir`
--
ALTER TABLE `sopir`
  ADD PRIMARY KEY (`ID_Sopir`);

--
-- Indeks untuk tabel `transaksi_penyewaan`
--
ALTER TABLE `transaksi_penyewaan`
  ADD PRIMARY KEY (`ID_Transaksi`),
  ADD KEY `ID_Penyewa` (`ID_Penyewa`),
  ADD KEY `ID_Kendaraan` (`ID_Kendaraan`),
  ADD KEY `ID_Sopir` (`ID_Sopir`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `ID_Kendaraan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `laporan_bulanan`
--
ALTER TABLE `laporan_bulanan`
  MODIFY `ID_Laporan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `ID_Pengembalian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `penyewa`
--
ALTER TABLE `penyewa`
  MODIFY `ID_Penyewa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sopir`
--
ALTER TABLE `sopir`
  MODIFY `ID_Sopir` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transaksi_penyewaan`
--
ALTER TABLE `transaksi_penyewaan`
  MODIFY `ID_Transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`ID_Transaksi`) REFERENCES `transaksi_penyewaan` (`ID_Transaksi`);

--
-- Ketidakleluasaan untuk tabel `transaksi_penyewaan`
--
ALTER TABLE `transaksi_penyewaan`
  ADD CONSTRAINT `transaksi_penyewaan_ibfk_1` FOREIGN KEY (`ID_Penyewa`) REFERENCES `penyewa` (`ID_Penyewa`),
  ADD CONSTRAINT `transaksi_penyewaan_ibfk_2` FOREIGN KEY (`ID_Kendaraan`) REFERENCES `kendaraan` (`ID_Kendaraan`),
  ADD CONSTRAINT `transaksi_penyewaan_ibfk_3` FOREIGN KEY (`ID_Sopir`) REFERENCES `sopir` (`ID_Sopir`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
