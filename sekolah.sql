-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2023 at 04:16 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sekolah`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabel_hubungan`
--

CREATE TABLE `tabel_hubungan` (
  `id_hub` int(10) NOT NULL,
  `id_siswa` int(10) NOT NULL,
  `id_ortu` int(10) NOT NULL,
  `status_hubungan` enum('Kandung','Tiri','Wali') NOT NULL,
  `keterangan` enum('Ayah','Ibu','Paman','Tante','Wali') NOT NULL,
  `status_ortu` enum('Hidup','Alm') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_hubungan`
--

INSERT INTO `tabel_hubungan` (`id_hub`, `id_siswa`, `id_ortu`, `status_hubungan`, `keterangan`, `status_ortu`) VALUES
(1, 2, 3, 'Kandung', 'Ibu', 'Hidup'),
(4, 5, 6, 'Kandung', 'Ayah', 'Alm'),
(8, 4, 4, 'Kandung', 'Paman', 'Hidup');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_kelas`
--

CREATE TABLE `tabel_kelas` (
  `id_kelas` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jurusan` enum('IPA','IPS','BAHASA INDONESIA') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_kelas`
--

INSERT INTO `tabel_kelas` (`id_kelas`, `nama`, `jurusan`) VALUES
(1, '4N', 'IPA'),
(2, '4O', 'IPS'),
(3, '4C', 'IPS'),
(7, '4N', 'IPA'),
(8, '4X', 'IPA'),
(9, '4K', 'IPA');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_ortu`
--

CREATE TABLE `tabel_ortu` (
  `id_ortu` int(10) NOT NULL,
  `nik` varchar(15) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `pendidikan` varchar(20) NOT NULL,
  `pekerjaan` varchar(20) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(15) NOT NULL,
  `status` enum('Hidup','Alm') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_ortu`
--

INSERT INTO `tabel_ortu` (`id_ortu`, `nik`, `nama`, `pendidikan`, `pekerjaan`, `telp`, `alamat`, `jenis_kelamin`, `agama`, `status`) VALUES
(3, '243536', 'Mila', 'S1', 'Direktur', '0978876', 'jl.indah', 'P', 'Islam', 'Hidup'),
(6, '111111', 'Rahmawati', 'S2', 'Dosen', '09888998', 'Jl.Bismillah', 'P', 'Islam', 'Hidup'),
(8, '2232', 'Nicolas', 'S3', 'Profesor', '099898', 'Jl.Masyaallah', 'P', 'Kristen', 'Hidup'),
(9, '20202020', 'Salsabila', 'S2', 'Manager', '0899789', 'jl.Wadidaw', 'P', 'Islam', 'Hidup'),
(10, '123', 'Mahmud', 'S2', 'Dosen', '087888867', 'jl.Baru', 'L', 'Islam', 'Hidup'),
(20, '1', 'Rahman', 'S1', 'Wiraswasta', '087823788', 'Jl.Ganteng', 'L', 'Islam', 'Hidup'),
(2111, '6', 'Imam', ' S2', 'Dosen', '098899779', 'jl.keramat', 'L', 'Islam', 'Hidup');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_poin`
--

CREATE TABLE `tabel_poin` (
  `id_poin` int(10) NOT NULL,
  `nama_poin` varchar(30) NOT NULL,
  `bobot` varchar(10) NOT NULL,
  `jenis` enum('Prestasi','Pelanggaran') NOT NULL,
  `status` enum('True','False') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_poin`
--

INSERT INTO `tabel_poin` (`id_poin`, `nama_poin`, `bobot`, `jenis`, `status`) VALUES
(1, 'Siswa Teladan', '45', 'Prestasi', 'True'),
(2, 'Juara Kelas 1,2,3', '30', 'Prestasi', 'True'),
(3, 'Juara Umum', '40', 'Prestasi', 'True'),
(4, 'Juara 1 Lomba Tingkat Kab/Kota', '25', 'Prestasi', 'True'),
(5, 'Juara 2 Lomba Tingkat Kab/kota', '20', 'Prestasi', 'True'),
(6, 'Juara 3 Lomba Tingkat Kab/Kota', '15', 'Prestasi', 'True'),
(7, 'Datang Terlambat', '5', 'Pelanggaran', 'True'),
(8, 'Keluar Kelas tanpa izin', '5', 'Pelanggaran', 'True'),
(9, 'Tidak berseragam lengkap ', '5', 'Pelanggaran', 'True'),
(10, 'melompat pagar atau jendela', '10', 'Pelanggaran', 'True'),
(11, 'Bersikap tidak sopan/ menentan', '25', 'Pelanggaran', 'True'),
(12, 'Merokok / membawa rokok ', '25', 'Pelanggaran', 'True'),
(13, 'Membawa senjata tajam ', '75', 'Pelanggaran', 'True'),
(14, 'Menikah', '100', 'Pelanggaran', 'True'),
(15, 'Berzinah', '100', 'Pelanggaran', 'True'),
(16, 'Tidak melaksanakan tugas piket', '5', 'Pelanggaran', 'True'),
(17, 'Memalsu raport', '25', 'Pelanggaran', 'True');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_semester`
--

CREATE TABLE `tabel_semester` (
  `id_semester` int(10) NOT NULL,
  `id_siswa` int(10) NOT NULL,
  `id_poin` int(10) NOT NULL,
  `id_wali` int(10) NOT NULL,
  `id_ortu` int(10) NOT NULL,
  `id_kelas` int(10) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `semester` enum('Ganjil','Genap') NOT NULL,
  `status` enum('Lulus','Tidak Lulus') NOT NULL,
  `tingkat_kelas` enum('10','11','12') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_semester`
--

INSERT INTO `tabel_semester` (`id_semester`, `id_siswa`, `id_poin`, `id_wali`, `id_ortu`, `id_kelas`, `tanggal`, `semester`, `status`, `tingkat_kelas`) VALUES
(5, 4, 2, 1, 1, 1, '10 july 2023', 'Genap', 'Lulus', '12'),
(6, 2, 4, 2, 3, 3, '12 januari 2020', 'Ganjil', 'Lulus', '12'),
(12, 3, 8, 4, 2, 2, '11 januari 2020', 'Ganjil', 'Lulus', '10'),
(13, 6, 3, 3, 4, 2, '10 november 2002', 'Genap', 'Lulus', '11');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_siswa`
--

CREATE TABLE `tabel_siswa` (
  `id_siswa` int(10) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `nisn` varchar(15) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `nik` varchar(13) NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tgl_lahir` varchar(50) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `telpon` varchar(13) NOT NULL,
  `status` enum('aktif','tidak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_siswa`
--

INSERT INTO `tabel_siswa` (`id_siswa`, `nis`, `nisn`, `nama`, `nik`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `alamat`, `telpon`, `status`) VALUES
(4, '122', '2110010419', ' Rahmi Maulida', '1234554', 'Banajrmasin', '21 mei 2003', 'P', 'Jl.indah', '08998987998', 'aktif'),
(5, '342', '2190879', 'Hilda Nurfadila', '1232254', 'Banajrmasin', '20 september 2003', 'P', 'Jl.permata', '03456998', 'aktif'),
(6, '2355', '21102223419', ' Noor Azijah', '123344', 'Banajrmasin', '2 januari 2003', 'P', 'Jl.Rahasia', '1111228', 'aktif'),
(7, '4452', '2199899', 'Khalisa ariani', '122254', 'Banjarmasin', '29 februari 2003', 'P', 'Jl.cantik', '0897878788', 'aktif'),
(8, '8', '123', 'Rizki darmawan', '123333', 'Banajrmasin', '21 januari 2003', 'L', 'Jl.Cinta', '0988878888', 'aktif'),
(9, '9', '2020', 'Risda Novianti', '2323', 'Banjarmasin', '12 juni 2003', 'P', 'jl.Anjay', '089978', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_user`
--

CREATE TABLE `tabel_user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` enum('User','Admin') NOT NULL,
  `status` enum('Aktif','Tidak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_user`
--

INSERT INTO `tabel_user` (`id_user`, `username`, `password`, `level`, `status`) VALUES
(1, 'rahmi', 'rahmi1', 'Admin', 'Aktif'),
(2, 'lida', 'maulida', 'User', 'Aktif'),
(4, 'lida', 'lida', 'User', 'Tidak'),
(7, 'anjay', 'njay123', 'User', 'Aktif'),
(8, 'lidaiki', '1234567', 'Admin', 'Tidak'),
(9, 'Bismillah', 'Bismillah', 'Admin', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_wali_kelas`
--

CREATE TABLE `tabel_wali_kelas` (
  `id_wali` int(10) NOT NULL,
  `nik` varchar(15) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `pendidikan` varchar(30) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `matpel` varchar(15) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `status` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_wali_kelas`
--

INSERT INTO `tabel_wali_kelas` (`id_wali`, `nik`, `nama`, `jenis_kelamin`, `pendidikan`, `telp`, `matpel`, `alamat`, `status`) VALUES
(1, '01928374', 'saidi', 'L', 's1', '089786799', 'agama', 'jl sultan adam', 'aktif'),
(2, '312313', 'yadi S', 'L', 's2', '0987654999', 'sejarah indones', 'jl handil bakti', 'aktif'),
(6, '213', 'Suripto', 'L', 'SMA', '098765642', 'Olahraga', 'jl A yani', 'Aktif'),
(7, '5002', 'fatimah', 'P', 'S1', '098877789', 'Agama', 'Jl.Indah', 'Aktif'),
(8, '8', 'angelista', 'P', 'S1', '099898', '0899789', 'jl.Astaghfirullah', 'Aktif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabel_hubungan`
--
ALTER TABLE `tabel_hubungan`
  ADD PRIMARY KEY (`id_hub`),
  ADD UNIQUE KEY `id_siswa_2` (`id_siswa`,`id_ortu`),
  ADD UNIQUE KEY `id_siswa_3` (`id_siswa`,`id_ortu`),
  ADD UNIQUE KEY `id_ortu` (`id_ortu`),
  ADD KEY `id_siswa` (`id_siswa`,`id_ortu`);

--
-- Indexes for table `tabel_kelas`
--
ALTER TABLE `tabel_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `tabel_ortu`
--
ALTER TABLE `tabel_ortu`
  ADD PRIMARY KEY (`id_ortu`);

--
-- Indexes for table `tabel_poin`
--
ALTER TABLE `tabel_poin`
  ADD PRIMARY KEY (`id_poin`);

--
-- Indexes for table `tabel_semester`
--
ALTER TABLE `tabel_semester`
  ADD PRIMARY KEY (`id_semester`),
  ADD UNIQUE KEY `id_siswa_2` (`id_siswa`,`id_wali`,`id_ortu`,`id_poin`),
  ADD UNIQUE KEY `id_siswa_3` (`id_siswa`,`id_wali`,`id_ortu`,`id_poin`),
  ADD UNIQUE KEY `id_wali` (`id_wali`),
  ADD KEY `id_siswa` (`id_siswa`,`id_wali`,`id_ortu`,`id_poin`),
  ADD KEY `id_poin` (`id_poin`),
  ADD KEY `id_ortu` (`id_ortu`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `tabel_siswa`
--
ALTER TABLE `tabel_siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `tabel_user`
--
ALTER TABLE `tabel_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tabel_wali_kelas`
--
ALTER TABLE `tabel_wali_kelas`
  ADD PRIMARY KEY (`id_wali`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabel_hubungan`
--
ALTER TABLE `tabel_hubungan`
  MODIFY `id_hub` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tabel_kelas`
--
ALTER TABLE `tabel_kelas`
  MODIFY `id_kelas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tabel_ortu`
--
ALTER TABLE `tabel_ortu`
  MODIFY `id_ortu` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2114;

--
-- AUTO_INCREMENT for table `tabel_poin`
--
ALTER TABLE `tabel_poin`
  MODIFY `id_poin` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tabel_semester`
--
ALTER TABLE `tabel_semester`
  MODIFY `id_semester` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tabel_siswa`
--
ALTER TABLE `tabel_siswa`
  MODIFY `id_siswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tabel_user`
--
ALTER TABLE `tabel_user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tabel_wali_kelas`
--
ALTER TABLE `tabel_wali_kelas`
  MODIFY `id_wali` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
