-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 17, 2024 at 08:55 AM
-- Server version: 8.0.30
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `permata_dewi`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminid` int NOT NULL,
  `admin_kode` varchar(50) NOT NULL,
  `admin_nama` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_gambar` varchar(255) NOT NULL,
  `admin_tanggal_dibuat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminid`, `admin_kode`, `admin_nama`, `admin_password`, `admin_gambar`, `admin_tanggal_dibuat`) VALUES
(2, 'ADM0002', 'Erby', '202cb962ac59075b964b07152d234b70', 'admin1562504847.png', '2019-07-07 17:32:09');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `id` int NOT NULL,
  `no_pesanan` varchar(255) NOT NULL,
  `produkid` varchar(255) NOT NULL,
  `jumlah` int NOT NULL,
  `isi_pesan` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `harga` int NOT NULL,
  `sub_total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id`, `no_pesanan`, `produkid`, `jumlah`, `isi_pesan`, `gambar`, `harga`, `sub_total`) VALUES
(31, 'ORDPEL2403050001', '27', 5, 'adawd', '', 8000, 40000),
(32, 'ORDPEL2403050001', '31', 5, 'adawd', '', 8000, 40000),
(33, 'ORDPEL2403050003', '31', 4, 'jkjk', '', 8000, 32000),
(34, 'ORDPEL2403180005', '31', 100, 'adaw', '', 8000, 800000),
(35, 'ORDPEL2404280007', '27', 10, 'asdadw', '', 8000, 80000),
(36, 'ORDPEL2404280007', '31', 5, 'hjkhj', '', 8000, 40000),
(37, 'ORDPEL2405140009', '27', 15, 'asdasda', '', 8000, 139000);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int NOT NULL,
  `kategori_nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_nama`) VALUES
(1, 'Tepung'),
(2, 'Buah'),
(3, 'Kemasan'),
(5, 'Perasa'),
(6, 'pemanis'),
(7, 'pewarna');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id` int NOT NULL,
  `produkid` int NOT NULL,
  `jumlah` int NOT NULL,
  `isi_pesan` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `sub_total` int NOT NULL,
  `plg_id` varchar(50) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `keranjang`
--

INSERT INTO `keranjang` (`id`, `produkid`, `jumlah`, `isi_pesan`, `gambar`, `sub_total`, `plg_id`, `provinsi`, `kota`) VALUES
(53, 27, 100, 'Icikiwirr', '', 819000, 'PLG2402270001', 'DI Yogyakarta', 'Gunung Kidul');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `plg_id` varchar(50) NOT NULL,
  `plg_nama` varchar(150) NOT NULL,
  `plg_email` varchar(100) NOT NULL,
  `plg_username` varchar(100) NOT NULL,
  `plg_password` varchar(255) NOT NULL,
  `plg_kelamin` varchar(50) NOT NULL,
  `plg_alamat` text NOT NULL,
  `plg_telepon` varchar(100) NOT NULL,
  `plg_foto` varchar(255) NOT NULL,
  `plg_tanggal_dibuat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`plg_id`, `plg_nama`, `plg_email`, `plg_username`, `plg_password`, `plg_kelamin`, `plg_alamat`, `plg_telepon`, `plg_foto`, `plg_tanggal_dibuat`) VALUES
('PLG2402270001', 'Pelanggan', 'erby@gmail.com', 'pelanggan', '202cb962ac59075b964b07152d234b70', 'Laki - Laki', 'Grobogan', '0898768998768', '', '2024-02-27 21:18:31');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `bayar_id` int NOT NULL,
  `no_pesanan` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `bayar_nominal` int NOT NULL,
  `bayar_gambar` varchar(255) NOT NULL,
  `bayar_tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`bayar_id`, `no_pesanan`, `keterangan`, `bayar_nominal`, `bayar_gambar`, `bayar_tanggal`) VALUES
(20, 'ORDPEL2403050001', 'ok', 80000, 'konfirmasi1709571708.jpg', '2024-03-05 00:01:48');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `no_pesanan` varchar(255) NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `plg_id` varchar(100) NOT NULL,
  `status_pesanan` int NOT NULL,
  `nama_penerima` varchar(200) NOT NULL,
  `alamat` text NOT NULL,
  `notelp` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `grandtotal` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`no_pesanan`, `tgl_transaksi`, `plg_id`, `status_pesanan`, `nama_penerima`, `alamat`, `notelp`, `email`, `grandtotal`) VALUES
('ORDPEL2403050001', '2024-03-05 00:01:12', 'PLG2402270001', 2, 'Pelanggan', 'Grobogan', '0898768998768', 'erby@gmail.com', 80000),
('ORDPEL2403050003', '2024-03-05 21:11:22', 'PLG2402270001', 0, 'Pelanggan', 'Grobogan', '0898768998768', 'erby@gmail.com', 32000),
('ORDPEL2403180005', '2024-03-18 23:02:09', 'PLG2402270001', 0, 'Pelanggan', 'Grobogan', '0898768998768', 'erby@gmail.com', 800000),
('ORDPEL2404280007', '2024-04-28 08:01:55', 'PLG2402270001', 0, 'Pelanggan', 'Kudus', '0898768998768', 'erby@gmail.com', 120000),
('ORDPEL2405140009', '2024-05-14 08:03:31', 'PLG2402270001', 0, 'Pelanggan', 'Grobogan', '0898768998768', 'erby@gmail.com', 139000);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `produkid` int NOT NULL,
  `produk_kode` varchar(255) NOT NULL,
  `kategori_id` int NOT NULL,
  `produk_nama` varchar(255) NOT NULL,
  `produk_harga` varchar(255) NOT NULL,
  `min_order` int NOT NULL,
  `satuan_qty` varchar(50) NOT NULL,
  `produk_gambar` varchar(255) NOT NULL,
  `produk_berat` varchar(255) NOT NULL,
  `produk_deskripsi` text NOT NULL,
  `produk_status` int NOT NULL,
  `produk_tanggal_dibuat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`produkid`, `produk_kode`, `kategori_id`, `produk_nama`, `produk_harga`, `min_order`, `satuan_qty`, `produk_gambar`, `produk_berat`, `produk_deskripsi`, `produk_status`, `produk_tanggal_dibuat`) VALUES
(2, 'PRD1907080002', 5, 'Perasa', '6000', 1, 'bungkus', '1.jpg', '49', 'Perasa', 0, '0000-00-00 00:00:00'),
(3, 'PRD1907080003', 6, 'Susu Saset', '8000', 1, 'bungkus', '2.jpg', '50', 'Susu Saset', 1, '0000-00-00 00:00:00'),
(4, 'PRD1907080004', 6, 'Coklat Batang', '14000', 1, 'bungkus', '3.jpg', '60', 'Coklat Batang', 1, '0000-00-00 00:00:00'),
(5, 'PRD1907080005', 6, 'Nutrijel Coklat', '3000', 1, 'bungkus', '4.jpg', '20', 'Nutrijel Coklat', 1, '0000-00-00 00:00:00'),
(6, 'PRD1907090006', 7, 'Pewarna Makanan', '2000', 1, 'bungkus', '5.jpg', '50', 'Pewarna Makanan', 1, '0000-00-00 00:00:00'),
(7, 'PRD1907080004', 1, 'Trigu Segitiga Biru', '13000', 1, 'bungkus', '6.jpg', '20', 'Trigu Segitiga Biru', 1, '0000-00-00 00:00:00'),
(8, 'PRD1907090007', 6, 'Keju', '13000', 1, 'bungkus', '7.jpg', '67', 'Keju', 1, '0000-00-00 00:00:00'),
(9, 'PRD1907090008', 1, 'Maizenah', '4500', 1, 'bungkus', '8.jpg', '10', 'Maizenah', 1, '0000-00-00 00:00:00'),
(10, 'PRD1907090009', 1, 'Trigu Cakra', '14000', 1, 'bungkus', '9.jpg', '63', 'Trigu Cakra', 1, '0000-00-00 00:00:00'),
(11, 'PRD1907090010', 6, 'Mesis', '8000', 1, 'bungkus', '10.jpg', '70', 'Mesis', 1, '0000-00-00 00:00:00'),
(12, 'PRD1907090011', 6, 'Mesis Coklat', '8000', 1, 'bungkus', '11.jpg', '70', 'Mesis Coklat', 1, '0000-00-00 00:00:00'),
(13, 'PRD1907090012', 5, 'Soda kue saset 30gr', '3000', 1, 'bungkus', '12.jpg', '80', 'Soda kue saset 30gr', 1, '0000-00-00 00:00:00'),
(14, 'PRD1907090013', 5, 'Baking powder', '3000', 1, 'bungkus', '13.jpg', '90', 'Baking powder', 1, '0000-00-00 00:00:00'),
(15, 'PRD1907090014', 1, 'Tapioka', '9000', 1, 'bungkus', '14.jpg', '80', 'Tapioka', 1, '0000-00-00 00:00:00'),
(16, 'PRD1907090015', 5, 'Glazee', '250000', 1, 'bungkus', '15.jpg', '67', 'Glazee', 1, '0000-00-00 00:00:00'),
(17, 'PRD1907090016', 6, 'Coklat Batang', '14000', 1, 'bungkus', '3.jpg', '58', 'Coklat Batang', 1, '0000-00-00 00:00:00'),
(18, 'PRD1907090017', 6, 'Nutrijel Coklat', '3000', 1, 'bungkus', '4.jpg', '100', 'Nutrijel Coklat', 1, '0000-00-00 00:00:00'),
(19, 'PRD1907090018', 7, 'Pewarna Makanan', '2000', 1, 'bungkus', '5.jpg', '300', 'Pewarna Makanan', 1, '0000-00-00 00:00:00'),
(20, 'PRD1907090019', 1, 'Trigu Segitiga Biru', '13000', 1, 'bungkus', '6.jpg', '200', 'Trigu Segitiga Biru', 1, '0000-00-00 00:00:00'),
(21, 'PRD1907090020', 6, 'Keju', '13000', 1, 'bungkus', '7.jpg', '250', 'Keju', 1, '0000-00-00 00:00:00'),
(22, 'PRD1907090021', 1, 'Maizenah', '4500', 1, 'bungkus', '8.jpg', '40', 'Maizenah', 1, '0000-00-00 00:00:00'),
(23, 'PRD1907090022', 6, 'Mesis', '8000', 1, 'bungkus', '10.jpg', '35', 'Mesis', 1, '0000-00-00 00:00:00'),
(24, 'PRD1907090023', 6, 'Mesis Coklat', '8000', 1, 'bungkus', '11.jpg', '63', 'Mesis Coklat', 1, '0000-00-00 00:00:00'),
(25, 'PRD1907090024', 5, 'Soda kue saset 30gr', '3000', 1, 'bungkus', '12.jpg', '60', 'Soda kue saset 30gr', 1, '0000-00-00 00:00:00'),
(26, 'PRD1907090025', 5, 'Perasa', '6000', 1, 'bungkus', '1.jpg', '80', 'Perasa', 1, '0000-00-00 00:00:00'),
(27, 'PRD1907090026', 6, 'Susu Saset', '8000', 1, 'bungkus', '2.jpg', '50', 'Susu Saset', 1, '0000-00-00 00:00:00'),
(28, 'PRD1907090027', 6, 'Coklat Batang', '14000', 1, 'bungkus', '3.jpg', '20', 'Coklat Batang', 0, '0000-00-00 00:00:00'),
(31, 'PRD1907090028', 6, 'Mesis', '8000', 1, 'bungkus', '10.jpg', '10', 'Mesis', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tentang_kami`
--

CREATE TABLE `tentang_kami` (
  `id` int NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tentang_kami`
--

INSERT INTO `tentang_kami` (`id`, `isi`) VALUES
(3, '<div>\r\n    <p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \'open sans\', arial, sans-serif; font-size: 14px;\">\r\n        <span style=\"font-family: \'Times New Roman\';\">Sejarah singkat Berdirinya Toko Bahan Roti ini pada tanggal 22 Januari 2022 yang berlokasi di Jl raya tegowanu kulon - tanggung harjo, ruko pasar, Kec. Tegowanu, Purwodadi, Jawa Tengah 58165 Bapak yusuf Topan owner dari Toko bahan roti ini. Toko ini berawal dari sang owner ingin memjawab kebutuhan konsumen di wilayah tersebut karena untuk mendapatkan toko yang lengkap cukup jauh jarak yang ditempuh untuk mendapatkan bahan-bahan roti di Tegowanu, sehingga ini merupakan alasan owner mendirikannya.\r\n            Dengan harapan toko ini dan pelanggannya yang datang ke Toko Bahan Roti Permata Dewi tidak kesulitan lagi karena menghemat jarak tempuh untuk mendapatkan bahan pembuatan Roti dan kue.\r\n            Dengan berjalannya waktu Toko Bahan roti Permata Dewi ini Membutuhkan Sebuah website yang interaktif mampu menjawab kebutuhan pelanggan sekitar serta memudahkan apa yang pelanggan cari Toko bahan Roti ini memiliki 3 orang karyawan di antaranya sebagai Pramuniaga kasir serta karyawan serabutan untuk membantu kelancaran toko di saat toko sedang ramai Pelanggan\r\n        </span>\r\n    </p>\r\n    <p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \'open sans\', arial, sans-serif; font-size: 14px;\">\r\n        <span style=\"font-family: \'Times New Roman\';\"><b>Visi :</b></span>\r\n    </p>\r\n    <p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \'open sans\', arial, sans-serif; font-size: 14px;\">\r\n        <span style=\"font-family: \'Times New Roman\'; font-size: 12pt; text-indent: 1cm; text-align: left;\">Menjadi usaha percetakan profesional, berkarakter, inovatif, produktif yang mampu memenuhi permintaan pelanggan serta mampu membuka lapangan pekerjaan bagi orang lain.</span>\r\n    </p>\r\n    <p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \'open sans\', arial, sans-serif; font-size: 14px;\">\r\n        <span style=\"font-family: \'Times New Roman\'; font-size: 12pt;\"><b>Misi :</b></span>\r\n    </p>\r\n    <p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \'open sans\', arial, sans-serif; font-size: 14px;\">\r\n        <span style=\"font-family: \'Times New Roman\'; font-size: 12pt; text-align: left; text-indent: -21.25pt;\">1. Menghasilkan produk dan pelayanan jasa percetakan yang berkualitas dan berdaya saing tinggi.</span>\r\n    </p>\r\n    <p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \'open sans\', arial, sans-serif; font-size: 14px;\">\r\n        <span style=\"font-family: \'Times New Roman\'; font-size: 12pt; text-align: left; text-indent: -21.25pt;\">2. Responsif dalam memberikan jasa yang berkualitas.</span>\r\n    </p>\r\n    <p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \'open sans\', arial, sans-serif; font-size: 14px;\">\r\n        <span lang=\"EN-ID\" style=\"text-indent: -21.25pt; font-size: 12pt; text-align: left; line-height: 150%; font-family: \'Times New Roman\';\">3. Menjaga dan meningkatkan kepuasan pelanggan dengan memberikan kualitas yang terbaik.</span>\r\n    </p>\r\n</div>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `testimoni`
--

CREATE TABLE `testimoni` (
  `idtesti` int NOT NULL,
  `plg_id` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `isi_testi` text NOT NULL,
  `status_testi` int NOT NULL,
  `tgl_post` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`);

--
-- Indexes for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`plg_id`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`bayar_id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`no_pesanan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`produkid`);

--
-- Indexes for table `tentang_kami`
--
ALTER TABLE `tentang_kami`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimoni`
--
ALTER TABLE `testimoni`
  ADD PRIMARY KEY (`idtesti`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `bayar_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `produkid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tentang_kami`
--
ALTER TABLE `tentang_kami`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `testimoni`
--
ALTER TABLE `testimoni`
  MODIFY `idtesti` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
