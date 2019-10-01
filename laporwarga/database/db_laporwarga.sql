-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Sep 2019 pada 19.41
-- Versi server: 10.1.39-MariaDB
-- Versi PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_laporwarga`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` varchar(10) NOT NULL,
  `nama_admin` varchar(20) NOT NULL,
  `jk_admin` enum('L','P') NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `tlp_admin` varchar(12) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `rt` varchar(3) NOT NULL,
  `rw` varchar(3) NOT NULL,
  `kelurahan` varchar(20) NOT NULL,
  `kecamatan` varchar(20) NOT NULL,
  `kota` varchar(20) NOT NULL,
  `provinsi` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `jk_admin`, `jabatan`, `tlp_admin`, `alamat`, `rt`, `rw`, `kelurahan`, `kecamatan`, `kota`, `provinsi`, `username`, `password`, `level`) VALUES
('ADM001', 'Aziz', 'L', 'Ketua RT 01', '021021021021', 'Jalan Jalan no.9', '1', '4', 'Tanah Baru', 'Beji', 'Depok', 'Jawa Barat', 'ryukazuya', 'bf0c98cd233487cb4db2db0a221a818a', 'admin1'),
('ADM002', 'Aziz', 'L', 'Ketua RT 01', '021021021021', 'Jalan Jalan no.9 rt 01/rw 04', '1', '4', 'Tanah Baru', 'Beji', 'Depok', 'Jawa Barat', 'ketuart', 'bf0c98cd233487cb4db2db0a221a818a', 'admin1'),
('ADM003', 'aziz', 'L', 'Petugas Kelurahan', '021021021021', 'jl.m.ali.2 no.9', '1', '4', 'tanah baru', 'beji', 'depok', 'jawa barat', 'kelurahan', 'bf0c98cd233487cb4db2db0a221a818a', 'admin2'),
('ADM004', 'dul', 'L', 'Petugas Puskesmas', '021021021021', 'Jalan Jalan no.9 rt 01/rw 04', '1', '4', 'Tanah Baru', 'Beji', 'Depok', 'Jawa Barat', 'puskesmas', 'bf0c98cd233487cb4db2db0a221a818a', 'admin3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(1) NOT NULL,
  `kategori` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`) VALUES
(1, 'Keamanan dan Ketertiban'),
(2, 'Kebersihan Lingkungan'),
(3, 'Kesehatan'),
(4, 'Dampak Lingkungan'),
(5, 'Lain-Lain');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `id_laporan` varchar(10) NOT NULL,
  `foto_laporan` varchar(100) NOT NULL,
  `judul_laporan` varchar(30) NOT NULL,
  `isi_laporan` text NOT NULL,
  `id_kategori` int(1) NOT NULL,
  `id_user` varchar(10) NOT NULL,
  `status_pelapor` enum('Warga Asli','Bukan Waraga Asli') NOT NULL,
  `lat` varchar(17) NOT NULL,
  `lon` varchar(16) NOT NULL,
  `status_laporan` enum('lapor','periksa','valid','tidak valid','tindaklanjut','selesai') NOT NULL,
  `tgl_kirim` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `laporan`
--

INSERT INTO `laporan` (`id_laporan`, `foto_laporan`, `judul_laporan`, `isi_laporan`, `id_kategori`, `id_user`, `status_pelapor`, `lat`, `lon`, `status_laporan`, `tgl_kirim`) VALUES
('LPR001', './img/laporan/Desert.jpg', 'test lapor 1', 'Mohon maaf saya hanya mencoba fungsi lapor apakah berfungsi atau tidak', 1, 'USR001', 'Warga Asli', '-6.37740036122224', '106.806110143661', 'lapor', '2019-07-26'),
('LPR002', './img/laporan/Lighthouse.jpg', 'test lapor 2', 'Mohon maaf saya hanya mencoba fungsi lapor apakah berfungsi atau tidak', 3, 'USR001', 'Warga Asli', '-6.37733638655439', '106.806346178054', 'tindaklanjut', '2019-07-26'),
('LPR003', './img/laporan/1564243005275933910359.jpg', 'Test kamera', 'Test fungsi kamera', 3, 'USR001', 'Warga Asli', '-6.41663931576164', '106.813479751290', 'lapor', '2019-07-27'),
('LPR004', './img/laporan/15642459887971906954658.jpg', 'Test Kamera kedua', 'Percobaah fungsi kamera pada android', 2, 'USR001', 'Warga Asli', '-6.4147994350286', '106.815296303866', 'lapor', '2019-07-27'),
('LPR005', './img/laporan/13731546_1049373105154344_6909105132843238821_n.jpg', 'Pengujian Fitur Lapor', 'Menguji Fitur Lapor apakah berfungsi atau tidak', 4, 'USR002', 'Warga Asli', '-6.37750698565094', '106.806217432022', 'tindaklanjut', '2019-07-29'),
('LPR006', './img/laporan/1564425346031223867744.jpg', 'Kipas angin saya rusak', 'Kipas angin saya rusak tolong dibenerin', 5, 'USR002', 'Warga Asli', '-6.40827786751657', '106.814489364624', 'lapor', '2019-07-29'),
('LPR007', './img/laporan/401ac6a72b2f4d9525e055bc9a0e805a.jpg', 'Nyamuk demam berdarah', 'Di rumah saya banyak sekali nyamuk dan anak saya terkena penyakit DBD, mohon diberantas nyamuknya pak', 4, 'USR002', 'Warga Asli', '-6.37618702325150', '106.806368484067', 'lapor', '2019-07-29'),
('LPR008', './img/laporan/15648129947211234688827.jpg', 'Laporan orang hilang', 'Lapor pak saya ingin melapor', 4, 'USR002', 'Warga Asli', '-6.37616579723203', '106.801698002491', 'lapor', '2019-08-03'),
('LPR009', './img/laporan/15648138656851203615628.jpg', 'Laporan kesehatan warga', 'Warga terjangkit penyakit aneh tolong segera ditangani', 3, 'USR002', 'Warga Asli', '-6.37731814052262', '106.808185928202', 'lapor', '2019-08-03'),
('LPR010', './img/laporan/15649730141411040002379.jpg', 'Listrik', 'Listrik mati', 5, 'USR002', 'Warga Asli', '-6.40707574812874', '106.813365707639', 'selesai', '2019-08-05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id_pgmn` varchar(10) NOT NULL,
  `judul_pgmn` varchar(50) NOT NULL,
  `isi_pgmn` text NOT NULL,
  `id_admin` varchar(10) NOT NULL,
  `tgl_pgmn` date NOT NULL,
  `tgl_acara` date NOT NULL,
  `mulai_acara` time NOT NULL,
  `selesai_acara` time NOT NULL,
  `tempat_acara` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengumuman`
--

INSERT INTO `pengumuman` (`id_pgmn`, `judul_pgmn`, `isi_pgmn`, `id_admin`, `tgl_pgmn`, `tgl_acara`, `mulai_acara`, `selesai_acara`, `tempat_acara`) VALUES
('PGN001', 'Pengumuman Aplikasi Lapor Warga', 'Diumumkan kepada seluruh masyarakat bahwa aplikasi lapor warga berfungsi, semoga dapat dimanfaatkan sebagaimana mestinya', 'ADM001', '2019-07-08', '2019-07-26', '11:11:00', '22:22:00', 'Dimanasaja'),
('PGN002', 'Test Pengumuman ke 2 ', 'Dengan adanya aplikasi lapor warga diharapkan dapat mempermudah dalam proses pelaporan warga menjadi lebih efisien dan juga membantu pihak kelurahan dalam menangani laporan warga.', 'ADM001', '2019-07-08', '2019-07-30', '10:10:00', '12:12:00', 'Universitas Krisnadwipayana'),
('PGN003', 'test 3', 'mencoba pengumuman ke tiga', 'ADM001', '2019-07-08', '2019-07-31', '13:14:00', '18:19:00', 'Digidaaw'),
('PGN004', 'test 4', 'test pengumuman ke empat', 'ADM001', '2019-07-08', '2019-07-26', '10:10:00', '11:11:00', 'Disini aja'),
('PGN005', 'test pengumuman ke 5', 'ini adaalh pengumuman ke 5', 'ADM001', '2019-07-08', '2019-07-31', '01:02:00', '03:04:00', 'Disinininini'),
('PGN006', 'test ke 6', 'dan ini pengumuman ke enam', 'ADM001', '2019-07-08', '2019-08-07', '15:08:00', '19:09:00', 'Jalan sesama'),
('PGN007', 'Pemmn bergilir', 'kn ilkukn pemmn bergilir per 3 jm', 'ADM003', '2019-08-05', '0000-00-00', '00:00:00', '00:00:00', 'Universitas Krisnadwipayana');

-- --------------------------------------------------------

--
-- Struktur dari tabel `selesai`
--

CREATE TABLE `selesai` (
  `id_selesai` int(11) NOT NULL,
  `id_laporan` varchar(10) NOT NULL,
  `id_user` varchar(10) NOT NULL,
  `id_admin` varchar(10) NOT NULL,
  `tgl_selesai` date NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `selesai`
--

INSERT INTO `selesai` (`id_selesai`, `id_laporan`, `id_user`, `id_admin`, `tgl_selesai`, `keterangan`) VALUES
(1, 'LPR001', 'USR001', 'ADM004', '2019-07-30', 'laporan telah selesai ditindaklanjuti'),
(2, 'LPR010', 'USR002', 'ADM004', '2019-08-05', 'listrik nyl');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` varchar(10) NOT NULL,
  `nama_user` varchar(20) NOT NULL,
  `jk_user` enum('L','P') NOT NULL,
  `tlp_user` varchar(12) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `rt` varchar(3) NOT NULL,
  `rw` varchar(3) NOT NULL,
  `kelurahan` varchar(20) NOT NULL,
  `kecamatan` varchar(20) NOT NULL,
  `kota` varchar(20) NOT NULL,
  `provinsi` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `jk_user`, `tlp_user`, `alamat`, `rt`, `rw`, `kelurahan`, `kecamatan`, `kota`, `provinsi`, `username`, `password`, `level`) VALUES
('USR001', 'Abdul Aziz', 'L', '081261461404', 'jl.m.ali.2 no.9', '1', '4', 'Tanah Baru', 'Beji', 'Depok', 'Jawa Barat', 'azizenzo', 'bf0c98cd233487cb4db2db0a221a818a', 'user'),
('USR002', 'Warga', 'L', '021021021021', 'jl.m.ali.2 no.9', '1', '4', 'Tanah Baru', 'Beji', 'Depok', 'Jawa Barat', 'warga', 'bf0c98cd233487cb4db2db0a221a818a', 'user'),
('USR003', 'test', 'L', '02199665544', 'jl.m.ali.2', '1', '2', 'Tanah Baru', 'Beji', 'Depok', 'Jawa Barat', 'test', '81dc9bdb52d04dc20036dbd8313ed055', 'user'),
('USR004', 'test2', 'L', '02199665544', 'jl.m.ali.2', '1', '2', 'Tanah Baru', 'Beji', 'Depok', 'Jawa Barat', 'test2', '81dc9bdb52d04dc20036dbd8313ed055', 'user'),
('USR005', 'aziz', 'P', '02199665544', 'jl.m.ali.2', '1', '2', 'Tanah Baru', 'Beji', 'Depok', 'Jawa Barat', 'azizenzo', 'd93591bdf7860e1e4ee2fca799911215', 'user');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id_pgmn`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `selesai`
--
ALTER TABLE `selesai`
  ADD PRIMARY KEY (`id_selesai`),
  ADD KEY `id_laporan` (`id_laporan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `selesai`
--
ALTER TABLE `selesai`
  MODIFY `id_selesai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `laporan_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);

--
-- Ketidakleluasaan untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD CONSTRAINT `pengumuman_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Ketidakleluasaan untuk tabel `selesai`
--
ALTER TABLE `selesai`
  ADD CONSTRAINT `selesai_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `selesai_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `selesai_ibfk_4` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
