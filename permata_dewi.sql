-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 27, 2024 at 03:25 PM
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
(37, 'ORDPEL2405140009', '27', 15, 'asdasda', '', 8000, 139000),
(38, 'ORDPEL2405270011', '24', 30, 'Test', '', 8000, 270000),
(39, 'ORDPEL2405270013', '31', 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem, vero!', '', 8000, 98000),
(40, 'ORDPEL2405270015', '31', 250, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem, vero!', '', 8000, 2036000);

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
('ORDPEL2405140009', '2024-05-14 08:03:31', 'PLG2402270001', 0, 'Pelanggan', 'Grobogan', '0898768998768', 'erby@gmail.com', 139000),
('ORDPEL2405270011', '2024-05-27 21:21:46', 'PLG2402270001', 0, 'Pelanggan', 'Bangka BelitungBangka Belitung', '0898768998768', 'erby@gmail.com', 270000),
('ORDPEL2405270013', '2024-05-27 21:30:34', 'PLG2402270001', 0, 'Pelanggan', 'Provinsi : Jawa Tengah Kota : Magelang', '0898768998768', 'erby@gmail.com', 98000),
('ORDPEL2405270015', '2024-05-27 21:41:36', 'PLG2402270001', 0, 'Pelanggan', 'Provinsi : Kepulauan Riau Kota : Karimun', '0898768998768', 'erby@gmail.com', 2036000);

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
  `produk_stok` int NOT NULL,
  `produk_deskripsi` text NOT NULL,
  `produk_status` int NOT NULL,
  `produk_tanggal_dibuat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`produkid`, `produk_kode`, `kategori_id`, `produk_nama`, `produk_harga`, `min_order`, `satuan_qty`, `produk_gambar`, `produk_berat`, `produk_stok`, `produk_deskripsi`, `produk_status`, `produk_tanggal_dibuat`) VALUES
(3, 'PRD1907080003', 6, 'Susu Saset FrisianFlag', '8000', 1, 'bungkus', '2.jpg', '50', 30, 'Susu Bendera Kental Manis Lemak Nabati Frisian Flag mengandung zat gizi makro (protein, karbohidrat dan lemak) serta mengandung 8 Vitamin (Vitamin A, D3, E, B1, B2, B3, B6 dan B12) dan mineral: Kalsium dan Fosfor yang bisa memberi sumber energi.\r\n1 Pax isi 6 Saset', 1, '0000-00-00 00:00:00'),
(4, 'PRD1907080004', 6, 'Galleto Dark', '14000', 1, 'bungkus', '3.jpg', '60', 100, 'EXP 17-04-2025\r\n\r\nCokelat compound siap pakai dengan cita rasa cokelat yang tinggi.\r\nGaletto Compound Chocolate sangat cocok digunakan untuk membuat isian roti dan produk makanan penutup lainnya dengan harga yang ekonomis.\r\n\r\nCocok sekali untuk bahan Es Kul Kul', 1, '0000-00-00 00:00:00'),
(5, 'PRD1907080005', 6, 'Nutrijel Coklat', '3000', 1, 'bungkus', '4.jpg', '20', 200, 'Nutrijell terbuat dari rumput laut dan konyaku, menghasilkan makanan jelly yang kenyal, lembut, dan menggugah selera. Mengandung vitamin D dan kalsium untuk kesehatan tulang dan gigi.\r\n\r\nNetto 30 gr ', 1, '0000-00-00 00:00:00'),
(6, 'PRD1907090006', 7, 'Pewarna Makanan Rajawali', '2000', 1, 'bungkus', '5.jpg', '50', 60, 'Pewarna Makanan Minuman Cair Rajawali R&W RW 12,5 ml :\r\nKegunaan : Memberikan tampilan lebih menarik pada produk makanan & minuman dengan hasil warna yang lebih cerah dan hemat dalam jumlah tetes pemakaian\r\n\r\nHalal MUI, BPOM RI\r\n\r\nAplikasi :\r\n1. Adonan Kue\r\n2. Seni mewarnai Puding \r\n3. Butter Cream\r\n\r\nKelebihan :\r\n1. Hemat Tetes Pemakaian (Cukup gunakan 3-5 tetes untuk menghasilkan warna soft / pastel)\r\n2. Apabila ingin warna gelap bisa ditambahkan tetesnya (Tidak ada rasa after taste pahit)', 1, '0000-00-00 00:00:00'),
(7, 'PRD1907080004', 1, 'Trigu Segitiga Biru', '13000', 1, 'bungkus', '6.jpg', '1000', 80, 'Segitiga Biru adalah terigu serbaguna, dengan kadar protein sedang untuk aneka makanan.\r\n\r\nKemasan BUNGKUS isi 1000 gram\r\n', 1, '0000-00-00 00:00:00'),
(8, 'PRD1907090007', 6, 'Keju Procis', '13000', 1, 'bungkus', '7.jpg', '67', 87, 'Keju Block PROchess GOLD 170 Gram merupakan produk keju cheddar olahan dengan kualitas GOLD yang dikemas dalam kemasan 170 Gram dapat digunakan sebagai bahan baku dalam pengolahan makanan.\r\n\r\nKomposisi : Air, Keju Cheddar, Pati termodifikasi, Minyak nabati, Susu skim bubuk, Susu Bubuk,pengemulsi (Dinatrium Fosfat), Garam, Pengatur keasaman (Trinatrium Sitrat, Asam laktat), Pengawet (Kalium Sorbat, Nissin).', 1, '0000-00-00 00:00:00'),
(9, 'PRD1907090008', 1, 'Maizena', '4500', 1, 'bungkus', '8.jpg', '10', 60, 'Tepung Maizena / Maizenaku Jagung 1000 gr gram g / 1000gr / 1 kg / 1kg\r\nExp :  Februari 2026\r\nBarang yang kami kirim barang yang masuk lebih dahulu', 1, '0000-00-00 00:00:00'),
(10, 'PRD1907090009', 1, 'Trigu Cakra', '14000', 1, 'bungkus', '9.jpg', '63', 20, 'Tepung Terigu CAKRA\r\nprotein tinggi cocok untuk untuk berbagai macam kue \r\nkemasan 1 KG', 1, '0000-00-00 00:00:00'),
(11, 'PRD1907090010', 6, 'Mesis Warna', '8000', 1, 'bungkus', '10.jpg', '70', 30, 'Meises Warna tabur 250 gram\r\n\r\nMEISES terbuat dari cokelat murni dan gula, serta untuk variasi rasa, ditambahkan susu untuk membuatnya lebih manis.\r\n\r\nMeses dapat dimasukkan ke beragam:\r\n- Jenis kue (baik untuk dekorasi / tekstur)\r\n- Seperti untuk donat\r\n- Roti\r\n- Ice cream\r\n- Cup cake\r\n\r\nNetto: 1/4 kg\r\n\r\nKami jamin barang selalu baru dari pabrik, jaminan harga, dan higienis :)', 1, '0000-00-00 00:00:00'),
(12, 'PRD1907090011', 6, 'Mesis Coklat', '8000', 1, 'bungkus', '11.jpg', '70', 100, 'Meises Cokelat JETSTAR Dekor / Cokelat tabur 1/4 Kg \r\n\r\nMEISES terbuat dari cokelat murni dan gula, serta untuk variasi rasa, ditambahkan susu untuk membuatnya lebih manis.\r\n\r\nMeses dapat dimasukkan ke beragam:\r\n- Jenis kue (baik untuk dekorasi / tekstur)\r\n- Seperti untuk donat\r\n- Roti\r\n- Ice cream\r\n- Cup cake\r\n\r\nNetto: 1/4 kg\r\n\r\nKami jamin barang selalu baru dari pabrik, jaminan harga, dan higienis :)', 1, '0000-00-00 00:00:00'),
(13, 'PRD1907090012', 5, 'Soda kue saset 30gr ', '3000', 1, 'bungkus', '12.jpg', '80', 200, 'Soda kue saset 30gr cocok di gunakan untuk adonan kue kering dan kue basah sangat di rekomendasikan para pedagang roti di indonesia', 1, '0000-00-00 00:00:00'),
(14, 'PRD1907090013', 5, 'Baking powder Hercules', '3000', 1, 'bungkus', '13.jpg', '110', 60, 'Hercules Baking Powder merupakan baking powder berdaya ganda, memiliki karakter bubble atau gelembung halus dan rapat sehingga kematangan kue merata dan tidak mudah kempes.\r\n\r\nBerat bersih : 110 gram', 1, '0000-00-00 00:00:00'),
(15, 'PRD1907090014', 1, 'Tapioka Rose Brand', '9000', 1, 'bungkus', '14.jpg', '80', 80, 'Tepung Tapioka Rose Brand dari Rose Brand terbuat dari tepung pati yang diekstrak dari umbi singkong. Tepung tapioka juga mempunyai beberapa sebutan lain, seperti tepung singkong atau tepung kanji, sangat cocok digunakan untuk bahan kerupuk, pempek, tekwan, bakso, siomay, pacar cina, kolak biji salak, dan berbagai macam kue kue tradisional dan jajan pasar lainnya.\r\n\r\nMaterial : Singkong\r\nWarna : Putih\r\nBerat Kotor : 500 Gram', 1, '0000-00-00 00:00:00'),
(16, 'PRD1907090015', 5, 'Glazee', '250000', 1, 'bungkus', '15.jpg', '67', 87, 'Collins Dip Glaze kemasan 1/2 kg.\r\n\r\nDip Glaze : Selai mengkilat dan encer yang untuk topping donat. Seperti donat Ala Jco, permukaan donatnya basah, tidak keras/ retak.\r\nTersedia Varian Rasa:\r\n- Cokelat\r\n- Cokelat choco crunchy malt krispi\r\n- Strawberry\r\n- Teh Hijau / Matcha / Green Tea\r\n- Cheese / Keju Manis\r\n- Cokelat Tiramisu\r\n- Talas / Taro\r\n- Milk / Susu\r\n- Kapucino / Cappucino', 1, '0000-00-00 00:00:00'),
(19, 'PRD1907090018', 7, 'Pewarna Makanan', '2000', 1, 'bungkus', '5.jpg', '300', 30, 'Pewarna Makanan', 1, '0000-00-00 00:00:00'),
(24, 'PRD1907090023', 6, 'Mesis Coklat', '8000', 1, 'bungkus', '11.jpg', '63', 87, 'Meises Cokelat JETSTAR Dekor / Cokelat tabur 1/4 Kg \r\n\r\nMEISES terbuat dari cokelat murni dan gula, serta untuk variasi rasa, ditambahkan susu untuk membuatnya lebih manis.\r\n\r\nMeses dapat dimasukkan ke beragam:\r\n- Jenis kue (baik untuk dekorasi / tekstur)\r\n- Seperti untuk donat\r\n- Roti\r\n- Ice cream\r\n- Cup cake\r\n\r\nNetto: 1/4 kg\r\n\r\nKami jamin barang selalu baru dari pabrik, jaminan harga, dan higienis :)', 1, '0000-00-00 00:00:00'),
(26, 'PRD1907090025', 5, 'RedBell ', '6000', 1, 'bungkus', '1.jpg', '9', 20, '✓ Ready Stok sesuai etalase\r\n✓  Rata² Expired akhir 2026, dan awal 2027, dan terupdate expired tiap bulan saat pengisian etalase (cek varian deskripsi)\r\n(deskripsi expired terakhir diperbaharui pada 9 Mei 2024) \r\n\r\nREDBELL Pasta \r\nPerasa dan Pewarna Makanan\r\nKemasan botol\r\nBerat 55 m', 1, '0000-00-00 00:00:00'),
(27, 'PRD1907090026', 6, 'Susu Saset', '8000', 1, 'bungkus', '2.jpg', '50', 30, 'Susu Bendera Sachet 40 gr\r\nHarga 1 Pack @ 6 Pcs\r\nTersedia Varian : \r\n- Krimer\r\n- Coklat\r\n\r\nIsi Kemasan bisa berubah sewaktu - waktu\r\n\r\nHappy Shopping ^-^', 1, '0000-00-00 00:00:00'),
(28, 'PRD1907090027', 6, 'Coklat Batang', '14000', 1, 'bungkus', '3.jpg', '20', 100, 'Cokelat compound siap pakai dengan cita rasa cokelat yang tinggi.\r\nGaletto Compound Chocolate sangat cocok digunakan untuk membuat isian roti dan produk makanan penutup lainnya dengan harga yang ekonomis.\r\n\r\nCocok sekali untuk bahan Es Kul Kul', 0, '0000-00-00 00:00:00'),
(31, 'PRD1907090028', 6, 'Mesis', '8000', 1, 'bungkus', '10.jpg', '10', 200, 'Meises Warna-warni JETSTAR Dekor 250 Gram \r\n\r\nMEISES terbuat dari cokelat murni dan gula, serta untuk variasi rasa, ditambahkan susu untuk membuatnya lebih manis.\r\n\r\nMeses dapat dimasukkan ke beragam:\r\n- Jenis kue (baik untuk dekorasi / tekstur)\r\n- Seperti untuk donat\r\n- Roti\r\n- Ice cream\r\n- Cup cake\r\n\r\nNetto: 12kg\r\n\r\nKami jamin barang selalu baru dari pabrik, jaminan harga, dan higienis :)\r\n\r\nTerima kasih.\r\nSelamat Berbelanja', 1, '0000-00-00 00:00:00');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `bayar_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `produkid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

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
