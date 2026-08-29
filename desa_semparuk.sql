-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Agu 2026 pada 23.06
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
-- Database: `desa_semparuk`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT 'img/admin/default.png',
  `role` enum('superadmin','admin') DEFAULT 'admin',
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `foto`, `role`, `nama`) VALUES
(1, 'admin', 'admin123', 'img/admin/1788034956_images.jpg', 'admin', 'Administrator'),
(2, 'deojak', '$2y$10$5IPvAg6BCAPSZXq5oymBZeNG1faEngtkpki0rsyOdOe/JWmlbpLW.', 'img/admin/1788033871_profil.jpg', 'superadmin', 'Tri Deo Aditya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `aparatur`
--

CREATE TABLE `aparatur` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `urutan` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `aparatur`
--

INSERT INTO `aparatur` (`id`, `nama`, `jabatan`, `foto`, `urutan`) VALUES
(2, 'Effendi', 'Kepala Desa', 'img/aparatur/1788012674_images.jpg', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `beranda`
--

CREATE TABLE `beranda` (
  `id` int(11) NOT NULL,
  `hero_judul` varchar(255) NOT NULL,
  `hero_deskripsi` text NOT NULL,
  `hero_gambar` varchar(255) NOT NULL,
  `jumlah_penduduk` int(11) DEFAULT 0,
  `jumlah_dusun` int(11) DEFAULT 4,
  `luas_wilayah` decimal(5,2) DEFAULT 0.00,
  `jumlah_rt` int(11) DEFAULT 0,
  `dusun1` varchar(100) DEFAULT NULL,
  `dusun2` varchar(100) DEFAULT NULL,
  `dusun3` varchar(100) DEFAULT NULL,
  `dusun4` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `beranda`
--

INSERT INTO `beranda` (`id`, `hero_judul`, `hero_deskripsi`, `hero_gambar`, `jumlah_penduduk`, `jumlah_dusun`, `luas_wilayah`, `jumlah_rt`, `dusun1`, `dusun2`, `dusun3`, `dusun4`) VALUES
(1, 'Selamat Datang di Desa Semparuk', 'Desa yang asri dengan potensi pertanian, budaya, dan masyarakat yang harmonis.', 'img/1788036507_hero-sawah.jpg', 30267, 4, 90.15, 153, 'Dusun Semparuk Lorong', 'Dusun Semparuk Sutra', 'Dusun Semparuk Bawah', 'Dusun Semparuk Sebangkau');

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `tanggal` date NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `ringkasan` text NOT NULL,
  `isi` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id`, `kategori_id`, `judul`, `tanggal`, `gambar`, `ringkasan`, `isi`) VALUES
(1, 3, 'Berita Contoh', '2026-08-18', 'img/berita/download (2).jpg', 'contoh saja', ''),
(3, 2, 'Penurunan Bendera', '2026-08-29', 'img/berita/1788010232_pengumuman.jpg', 'Kapolsek Semparuk menjadi bla bla', 'bla bla bla bla');

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita_kategori`
--

CREATE TABLE `berita_kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `berita_kategori`
--

INSERT INTO `berita_kategori` (`id`, `nama`) VALUES
(1, 'Pertanian'),
(2, 'Kegiatan'),
(3, 'Pengumuman'),
(4, 'Pariwisata');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dusun`
--

CREATE TABLE `dusun` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `urutan` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dusun`
--

INSERT INTO `dusun` (`id`, `nama`, `urutan`) VALUES
(1, 'Dusun Semparuk Lorong', 1),
(3, 'Dusun Semparuk Sutra', 2),
(4, 'Dusun Semparuk Bawah', 3),
(5, 'Dusun Semparuk Sebangkau', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id` int(11) NOT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `nama` varchar(150) NOT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `fasilitas`
--

INSERT INTO `fasilitas` (`id`, `kategori_id`, `nama`, `kategori`, `gambar`, `deskripsi`) VALUES
(3, 1, 'SMKN 01 SEMPARUK', NULL, 'img/fasilitas/1788014396_sekolah.jpg', 'SMKN 01 SEMPARUK, Jl.Pendidikan, No.19'),
(4, 2, 'Puskesmas Semparuk', NULL, 'img/fasilitas/1788019770_images (1).jpg', 'lalal');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas_kategori`
--

CREATE TABLE `fasilitas_kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `fasilitas_kategori`
--

INSERT INTO `fasilitas_kategori` (`id`, `nama`) VALUES
(1, 'Pendidikan'),
(2, 'Kesehatan'),
(3, 'Keagamaan'),
(4, 'Pemerintahan'),
(5, 'Olahraga');

-- --------------------------------------------------------

--
-- Struktur dari tabel `galeri_album`
--

CREATE TABLE `galeri_album` (
  `id` int(11) NOT NULL,
  `dusun_id` int(11) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `galeri_foto`
--

CREATE TABLE `galeri_foto` (
  `id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `urutan` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontak`
--

CREATE TABLE `kontak` (
  `id` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `jam_pelayanan` varchar(100) NOT NULL,
  `instagram` varchar(100) NOT NULL,
  `facebook` varchar(100) NOT NULL,
  `maps_embed` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kontak`
--

INSERT INTO `kontak` (`id`, `alamat`, `telepon`, `email`, `jam_pelayanan`, `instagram`, `facebook`, `maps_embed`) VALUES
(1, 'Semparuk, Kecamatan Semparuk, Kabupaten Sambas, Kalimantan Barat 79461.', '08xx-xxxx-xxxx', 'admin@semparuk.id', '08:00 - 15:30 WIB', 'desasemparuk.id', 'desasemparuk.id', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15955.866906129137!2d109.07243513122478!3d1.1838182841495064!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31e49da82b529c6d%3A0x65ccdadbb52ae9b4!2sKantor%20Desa%20Semparuk!5e0!3m2!1sid!2sid!4v1788023945880!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"strict-origin-when-cross-origin\"></iframe>');

-- --------------------------------------------------------

--
-- Struktur dari tabel `potensi`
--

CREATE TABLE `potensi` (
  `id` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `potensi`
--

INSERT INTO `potensi` (`id`, `nama`, `gambar`, `deskripsi`) VALUES
(1, 'Sawah', 'img/potensi/1788019522_sawah.jpg', 'Do you say potetial?');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_desa`
--

CREATE TABLE `profil_desa` (
  `id` int(11) NOT NULL,
  `sejarah` longtext NOT NULL,
  `gambar_sejarah` varchar(255) NOT NULL,
  `visi` text NOT NULL,
  `misi` longtext NOT NULL,
  `batas_utara` varchar(150) NOT NULL,
  `batas_selatan` varchar(150) NOT NULL,
  `batas_timur` varchar(150) NOT NULL,
  `batas_barat` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `profil_desa`
--

INSERT INTO `profil_desa` (`id`, `sejarah`, `gambar_sejarah`, `visi`, `misi`, `batas_utara`, `batas_selatan`, `batas_timur`, `batas_barat`) VALUES
(1, 'Desa Semparuk di Kabupaten Sambas, Kalimantan Barat, memiliki akar sejarah yang erat dengan pengembangan wilayah pada masa Kesultanan Sambas serta perkembangan administratif modern.\r\n\r\nKecamatan Semparuk merupakan kecamatan keempat di Kabupaten Sambas yang dibentuk sejak diberlakukannya Undang-undang Nomor 22 Tahun 1999 tentang Pemerintahan Daerah. Kecamatan Semparuk terbentuk secara resmi pada Hari Selasa tanggal 3 Juni 2003 yang merupakan pemekaran dari Kecamatan Pemangkat.', 'img/profil/1788022598_semparuk.jpg', '\"Sambas Berkemajuan\"', 'Pembangunan Jangka Menengah Desa (RPJMDes) tersendiri di kantor desa.', '', '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sosial_media`
--

CREATE TABLE `sosial_media` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `ikon` varchar(50) NOT NULL,
  `link` varchar(255) NOT NULL,
  `urutan` int(11) DEFAULT 1,
  `aktif` enum('Ya','Tidak') DEFAULT 'Ya'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `aparatur`
--
ALTER TABLE `aparatur`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `beranda`
--
ALTER TABLE `beranda`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indeks untuk tabel `berita_kategori`
--
ALTER TABLE `berita_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dusun`
--
ALTER TABLE `dusun`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fasilitas_kategori` (`kategori_id`);

--
-- Indeks untuk tabel `fasilitas_kategori`
--
ALTER TABLE `fasilitas_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `galeri_album`
--
ALTER TABLE `galeri_album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dusun_id` (`dusun_id`);

--
-- Indeks untuk tabel `galeri_foto`
--
ALTER TABLE `galeri_foto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album_id` (`album_id`);

--
-- Indeks untuk tabel `kontak`
--
ALTER TABLE `kontak`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `potensi`
--
ALTER TABLE `potensi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `profil_desa`
--
ALTER TABLE `profil_desa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sosial_media`
--
ALTER TABLE `sosial_media`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `aparatur`
--
ALTER TABLE `aparatur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `beranda`
--
ALTER TABLE `beranda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `berita_kategori`
--
ALTER TABLE `berita_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `dusun`
--
ALTER TABLE `dusun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `fasilitas_kategori`
--
ALTER TABLE `fasilitas_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `galeri_album`
--
ALTER TABLE `galeri_album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `galeri_foto`
--
ALTER TABLE `galeri_foto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kontak`
--
ALTER TABLE `kontak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `potensi`
--
ALTER TABLE `potensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `profil_desa`
--
ALTER TABLE `profil_desa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `sosial_media`
--
ALTER TABLE `sosial_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD CONSTRAINT `berita_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `berita_kategori` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD CONSTRAINT `fk_fasilitas_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `fasilitas_kategori` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `galeri_album`
--
ALTER TABLE `galeri_album`
  ADD CONSTRAINT `galeri_album_ibfk_1` FOREIGN KEY (`dusun_id`) REFERENCES `dusun` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `galeri_foto`
--
ALTER TABLE `galeri_foto`
  ADD CONSTRAINT `galeri_foto_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `galeri_album` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
