-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 07 Jun 2020 pada 12.13
-- Versi Server: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ucic_akademik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'dosen', 'Dosen'),
(3, 'mahasiswa', 'Mahasiswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(1, '::1', 'admin@admin', 1591461097),
(6, '::1', '12345', 1591490350),
(7, '::1', 'mahasiswa@gmail.com', 1591494383),
(8, '::1', 'admin@admin.com', 1591524098);

-- --------------------------------------------------------

--
-- Stand-in structure for view `qmatakuliah`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `qmatakuliah` (
`kd_matkul` varchar(6)
,`nama_matkul` varchar(50)
,`sks` int(11)
,`nama_dosen` varchar(50)
,`nama_semester` varchar(10)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_blok`
--

CREATE TABLE `tbl_blok` (
  `id_blok` int(11) NOT NULL,
  `kode_blok` int(11) NOT NULL,
  `nama_blok` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_dosen`
--

CREATE TABLE `tbl_dosen` (
  `id_dosen` int(11) NOT NULL,
  `nidn` varchar(10) NOT NULL,
  `kd_user` varchar(15) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `agama` varchar(10) NOT NULL,
  `jk` varchar(2) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `spesial_mengajar` varchar(100) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `status` enum('Tetap','Tidak Tetap') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_dosen`
--

INSERT INTO `tbl_dosen` (`id_dosen`, `nidn`, `kd_user`, `nama_dosen`, `tempat_lahir`, `tanggal_lahir`, `agama`, `jk`, `alamat`, `spesial_mengajar`, `jabatan`, `telp`, `status`) VALUES
(6, '2018', '', 'Puja Irawan Dim', 'Cirebon', '1995-05-20', 'Katolik', 'L', 'ciledug', 'MYSQLI', 'Dosen', '089', 'Tetap');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_dosen_wali`
--

CREATE TABLE `tbl_dosen_wali` (
  `nim` varchar(20) NOT NULL,
  `kd_dosen` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_krs`
--

CREATE TABLE `tbl_krs` (
  `id_krs` int(11) NOT NULL,
  `nim` varchar(10) NOT NULL,
  `id_semester` int(11) NOT NULL,
  `idtable_ta` int(11) NOT NULL,
  `bukti_pembayaran` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_krs`
--

INSERT INTO `tbl_krs` (`id_krs`, `nim`, `id_semester`, `idtable_ta`, `bukti_pembayaran`) VALUES
(1, '1234', 1, 1, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kurikulum`
--

CREATE TABLE `tbl_kurikulum` (
  `id_kurikulum` int(11) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kurikulum`
--

INSERT INTO `tbl_kurikulum` (`id_kurikulum`, `tahun`, `ket`) VALUES
(1, '2019', 'Kurikulum 2019');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mahasiswa`
--

CREATE TABLE `tbl_mahasiswa` (
  `nim` varchar(10) NOT NULL,
  `kd_user` varchar(15) NOT NULL,
  `kd_jurusan` int(11) NOT NULL,
  `kd_doswal` int(11) NOT NULL,
  `nama_mahasiswa` varchar(50) NOT NULL,
  `jk` varchar(2) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `angkatan` int(11) NOT NULL,
  `foto` varchar(20) NOT NULL,
  `asal_sekolah` varchar(50) NOT NULL,
  `thn_lulus` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_mahasiswa`
--

INSERT INTO `tbl_mahasiswa` (`nim`, `kd_user`, `kd_jurusan`, `kd_doswal`, `nama_mahasiswa`, `jk`, `no_telp`, `tempat_lahir`, `tanggal_lahir`, `email`, `agama`, `alamat`, `angkatan`, `foto`, `asal_sekolah`, `thn_lulus`) VALUES
('1234', 'MHS1234', 0, 1, 'Moh. Yahya', 'L', '089656729025', 'Cirebon', '2020-06-07', 'inikangyahya@gmail.com', 'Islam', 'As', 2016, '1234.png', 'SMK Informatika', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_matakuliah`
--

CREATE TABLE `tbl_matakuliah` (
  `kd_matkul` varchar(6) NOT NULL,
  `nama_matkul` varchar(50) NOT NULL,
  `sks` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_matakuliah`
--

INSERT INTO `tbl_matakuliah` (`kd_matkul`, `nama_matkul`, `sks`, `id_semester`, `id_dosen`) VALUES
('2002', 'Aljabar Linear dan Matriks', 3, 1, 1),
('2006', 'Bahasa Inggris 1', 2, 1, 1),
('2007', 'Pendidikan Agama', 2, 1, 1),
('2010', 'Kalkulus 1', 3, 1, 1),
('2016', 'Kalkulus 2', 3, 1, 1),
('2024', 'Rekayasa Perangkat Lunak 1', 3, 1, 1),
('2026', 'Bahasa Inggris 4', 2, 1, 1),
('2028', 'Logika Matematika', 3, 1, 1),
('2029', 'Rekayasa Perangkat Lunak 2', 3, 1, 1),
('2030', 'Sistem Operasi', 3, 1, 1),
('2033', 'Bahasa Inggris 5', 2, 1, 1),
('2035', 'Matematika Diskrit', 3, 1, 1),
('2076', 'Arsitektur Organisasi Komputer', 3, 1, 1),
('2078', 'Bahasa Inggris 2', 2, 1, 1),
('2080', 'Bahasa Inggris 3', 2, 1, 1),
('2081', 'Algoritma dan Pemrograman 1', 4, 1, 1),
('2099', 'Struktur Data', 4, 1, 1),
('2109', 'Kewirausahaan 1', 2, 1, 1),
('2125', 'Pembangunan Karakter', 2, 1, 1),
('2134', 'Tata Tulis Karya Ilmiah', 2, 1, 1),
('2142', 'Statistik Probabilitas', 2, 1, 1),
('2151', 'Sistem Basis Data', 3, 1, 1),
('2159', 'Perancangan Basis Data', 3, 1, 1),
('2178', 'Pengantar Teknologi Informasi', 4, 1, 1),
('2193', 'Pemrograman Visual', 4, 1, 1),
('2200', 'Pemrograman Internet', 4, 1, 1),
('2202', 'Pendidikan Pancasila dan Kewarganegaraan', 2, 1, 1),
('2207', 'Algoritma dan Pemrograman 2', 4, 1, 1),
('2210', 'Sistem Terdistribusi', 3, 1, 1),
('2212', 'Pemrograman Berorientasi Objek (J2SE)', 4, 1, 1),
('2219', 'Rekayasa Aplikasi Internet (PHP Framework)', 3, 1, 1),
('2241', 'Jaringan Komputer 1 (Konsep Jaringan)', 3, 1, 1),
('2242', 'Grafika Komputer dan Pengolahan Citra', 2, 1, 1),
('2243', 'Manajemen Proyek Perangkat Lunak', 3, 1, 1),
('2245', 'Pemodelan dan Simulasi', 2, 1, 1),
('2248', 'Testing dan Implementasi Sistem', 3, 1, 1),
('2251', 'Komunikasi Data dan Jaringan', 2, 1, 1),
('kd_mat', 'nama_matkul', 0, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_perwalian_detail`
--

CREATE TABLE `tbl_perwalian_detail` (
  `nim` varchar(20) NOT NULL,
  `kd_jadwal` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_perwalian_header`
--

CREATE TABLE `tbl_perwalian_header` (
  `nim` varchar(20) NOT NULL,
  `tgl_perwalian` varchar(20) NOT NULL,
  `tgl_persetujuan` varchar(20) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `semester` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_perwalian_header`
--

INSERT INTO `tbl_perwalian_header` (`nim`, `tgl_perwalian`, `tgl_persetujuan`, `status`, `semester`) VALUES
('1234', '2020/02/20', NULL, '0', '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_semester`
--

CREATE TABLE `tbl_semester` (
  `id_semester` int(11) NOT NULL,
  `nama_semester` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_semester`
--

INSERT INTO `tbl_semester` (`id_semester`, `nama_semester`) VALUES
(1, '1'),
(2, '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_ta`
--

CREATE TABLE `tbl_ta` (
  `idtable_ta` int(11) NOT NULL,
  `tahun_ajaran` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_ta`
--

INSERT INTO `tbl_ta` (`idtable_ta`, `tahun_ajaran`, `status`) VALUES
(1, '2019/2020', 'Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `kd_user` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `kd_user`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$12$hxahOnHvfsEO6Jqb6ZSj5uKe27mJlX.LAhIEHo9GJlzePXC87IfwG', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1591524119, 1, 'AD001'),
(16, '::1', '2018', '$2y$10$dsiz97w.nXkCn1lR1hWSp.5EJjQBJ0HVUnlbCp.IHepFbWkdMpsoO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1591513331, NULL, 1, 'DSN2018'),
(17, '::1', '1234', '$2y$10$nMf/0l.Mn.CCKYkk/PNpP.Q0uFwSLLd/4Qmfroe.uCwGh5JZjPpBq', 'inikangyahya@gmail.com', NULL, NULL, NULL, NULL, NULL, 'f37b479718326b0b1c86b9794c25154f1df211b0', '$2y$10$PUvY.ldo2deAUTVEB3Myr.KjEBd66qhFyCqe5pkg0xOqxZAw4IjOO', 1591513442, 1591518473, 1, 'MHS1234');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(15, 16, 2),
(16, 17, 3);

-- --------------------------------------------------------

--
-- Struktur untuk view `qmatakuliah`
--
DROP TABLE IF EXISTS `qmatakuliah`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qmatakuliah`  AS  select `q1`.`kd_matkul` AS `kd_matkul`,`q1`.`nama_matkul` AS `nama_matkul`,`q1`.`sks` AS `sks`,`q2`.`nama_dosen` AS `nama_dosen`,`q3`.`nama_semester` AS `nama_semester` from ((`tbl_matakuliah` `q1` join `tbl_dosen` `q2` on((`q1`.`id_dosen` = `q2`.`id_dosen`))) join `tbl_semester` `q3` on((`q1`.`id_semester` = `q3`.`id_semester`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_blok`
--
ALTER TABLE `tbl_blok`
  ADD PRIMARY KEY (`id_blok`);

--
-- Indexes for table `tbl_dosen`
--
ALTER TABLE `tbl_dosen`
  ADD PRIMARY KEY (`id_dosen`) USING BTREE;

--
-- Indexes for table `tbl_dosen_wali`
--
ALTER TABLE `tbl_dosen_wali`
  ADD PRIMARY KEY (`nim`,`kd_dosen`);

--
-- Indexes for table `tbl_krs`
--
ALTER TABLE `tbl_krs`
  ADD PRIMARY KEY (`id_krs`),
  ADD KEY `nim` (`nim`),
  ADD KEY `id_semester` (`id_semester`),
  ADD KEY `idtable_ta` (`idtable_ta`);

--
-- Indexes for table `tbl_kurikulum`
--
ALTER TABLE `tbl_kurikulum`
  ADD PRIMARY KEY (`id_kurikulum`);

--
-- Indexes for table `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `tbl_matakuliah`
--
ALTER TABLE `tbl_matakuliah`
  ADD PRIMARY KEY (`kd_matkul`);

--
-- Indexes for table `tbl_perwalian_header`
--
ALTER TABLE `tbl_perwalian_header`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `tbl_semester`
--
ALTER TABLE `tbl_semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indexes for table `tbl_ta`
--
ALTER TABLE `tbl_ta`
  ADD PRIMARY KEY (`idtable_ta`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_blok`
--
ALTER TABLE `tbl_blok`
  MODIFY `id_blok` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_dosen`
--
ALTER TABLE `tbl_dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_krs`
--
ALTER TABLE `tbl_krs`
  MODIFY `id_krs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_kurikulum`
--
ALTER TABLE `tbl_kurikulum`
  MODIFY `id_kurikulum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_semester`
--
ALTER TABLE `tbl_semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_ta`
--
ALTER TABLE `tbl_ta`
  MODIFY `idtable_ta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_krs`
--
ALTER TABLE `tbl_krs`
  ADD CONSTRAINT `tbl_krs_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tbl_mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_krs_ibfk_2` FOREIGN KEY (`id_semester`) REFERENCES `tbl_semester` (`id_semester`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_krs_ibfk_4` FOREIGN KEY (`idtable_ta`) REFERENCES `tbl_ta` (`idtable_ta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_perwalian_header`
--
ALTER TABLE `tbl_perwalian_header`
  ADD CONSTRAINT `tbl_perwalian_header_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tbl_mahasiswa` (`nim`);

--
-- Ketidakleluasaan untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
