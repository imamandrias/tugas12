/*
 Navicat MySQL Data Transfer

 Source Server         : laptop
 Source Server Type    : MySQL
 Source Server Version : 100137
 Source Host           : 127.0.0.1:3306
 Source Schema         : db_movie

 Target Server Type    : MySQL
 Target Server Version : 100137
 File Encoding         : 65001

 Date: 21/10/2020 00:59:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_katagori
-- ----------------------------
DROP TABLE IF EXISTS `tb_katagori`;
CREATE TABLE `tb_katagori`  (
  `id_katagori` int NOT NULL AUTO_INCREMENT,
  `nama_katagori` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_katagori`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_katagori
-- ----------------------------
INSERT INTO `tb_katagori` VALUES (1, 'Adventure');
INSERT INTO `tb_katagori` VALUES (2, 'Action');
INSERT INTO `tb_katagori` VALUES (3, 'Sport');
INSERT INTO `tb_katagori` VALUES (4, 'Live Action');

-- ----------------------------
-- Table structure for tb_movie
-- ----------------------------
DROP TABLE IF EXISTS `tb_movie`;
CREATE TABLE `tb_movie`  (
  `id_movie` int NOT NULL AUTO_INCREMENT,
  `nama_movie` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_katagori` int NULL DEFAULT NULL,
  `gambar_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `movie_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tgl_release` date NULL DEFAULT NULL,
  `rating` int NULL DEFAULT NULL COMMENT '1 s/d 5',
  `durasi` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `negara` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_movie`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_movie
-- ----------------------------
INSERT INTO `tb_movie` VALUES (1, 'Kuroko no Basket Movie 1: kage to hikari', 3, 'https://i0.wp.com/bakadame.com/wp-content/uploads/2019/02/c6b9ff9b6c6dcdeacf906075831bffbd95145f72_00.jpg', 'https://drive.google.com/file/d/1HFQ7Rm0zYGY5FTMQB7BdZd_WWjpWhoW3/view', 'Movie pertama dari Seri Kuroko no Basket.\r\n\r\nPertandingan perdana antara Seirin vs Touou Gakuen di kejuaraan Musim Dingin. Seirin berjanji kalau mereka akan membalaskan dendam dari Inter-High, akan tetapi bakat dari Aomine jauh lebih hebat dan kini, keputusan baru Kuroko terlihat lebih jelas.', '2016-09-03', 8, '87 Menit', 'Jepang');
INSERT INTO `tb_movie` VALUES (2, 'Kuroko no Basket Movie 2: Namida no Saki', 3, 'https://i0.wp.com/bakadame.com/wp-content/uploads/2019/02/kurobas.jpg', 'https://www.mp4upload.com/embed-sv9rvvigmck3.html', 'Movie kedua dari seri kuroko no basket.\r\n\r\nSeirin akan melawan dengan Yosen pada perempat final kejuaraan Musim Dingin. Berhadapan dengan pertahanan Yosen yang tak tertembus dengan Murasakibara di tengahnya, Kuroko berhasil meluncurkan poin pertamanya. Sementara itu, pertarungan kartu as antara Kagami dan Himuro juga semakin memanas.', '2016-10-08', 8, '87 Menit', 'Jepang');
INSERT INTO `tb_movie` VALUES (3, 'Kuroko no Basket Movie 3: Tobira no Mukou', 3, 'https://i0.wp.com/bakadame.com/wp-content/uploads/2019/02/c6fc0ee724cf4685b8cbcaad60f1624a_th.jpeg', 'https://id-id.facebook.com/226978667898292/videos/362629314425430/', 'Movie ketiga dari seri kuroko no basket.\r\n\r\nRakuzan dan Shutoku akan bertanding pada semi final Winter Cup. Meski telah berjuang keras bersama Akashi’s Emperor Eye yang mampu melihat segalanya, Midorima dan Takao melakukan serangan balik dengan permainan berturut-turut mereka, dan keseluruhan tim Shutoku membalas di Rakuzan.', '2016-12-03', 8, '88 Menit', 'Jepang');
INSERT INTO `tb_movie` VALUES (4, 'Kuroko no Basket Movie 4: Last Game', 3, 'https://i0.wp.com/bakadame.com/wp-content/uploads/2019/02/Kuroko-no-Basket-Last-Game-Subtitle-indonesia.jpg', 'https://drive.google.com/file/d/1YsJ5_U0WjsK6S9ZK9HsGT0kB80zqvd-Z/view', 'Tim basket asal amerika, Jabberwock — tim bola basket jalanan dengan keahlian yang nyaris sebanding dengan NBA, datang ke Jepang untuk memainkan pertandingan eksibisi melawan tim Strky, tim mantan siswa tahun ketiga yang pernah bermain di Piala Interhigh, karena perbedaan besar dalam hal skill, tim Jabberwock menang dengan mudah, kapten mereka, Nash Gold Jr., menghina pemain basket jepang dengan perbandingan monyet.', '2017-03-18', 8, '90 Menit', 'Jepang');
INSERT INTO `tb_movie` VALUES (5, 'One Piece Movie 14: Stampede', 1, 'https://i0.wp.com/bakadame.com/wp-content/uploads/2020/01/One-Piece-Movie-14-Stampede-x265-Subtitle-Indonesia.jpg', 'https://drive.google.com/file/d/13tHuw88aDUhFYgweLCGTTVJvy8de04Tp/view', 'Festival Bajak Laut, sebuah perayaan bajak laut yang paling ramai oleh dan untuk bajak laut dunia akan dilaksanakan. Luffy dan tim Topi Jerami yang lain akan menerima undangan dari tuan rumah Buena Festa atau biasa dikenal sebagai Master Festival.\r\n\r\nMereka pun sampai di tempat perayaan itu yang sangat megah dan dipenuhi oleh para bajak laut, termasuk dari Generasi Terburuk.', '2019-08-09', 8, '100 Menit', 'Jepang');
INSERT INTO `tb_movie` VALUES (6, 'Boruto: Naruto the Movie', 2, 'https://static.duniaku.net/2015/08/Boruto-Naruto-the-Movie-1.jpg', 'https://www.youtube.com/watch?v=mj-KFL318pI', 'Naruto the Movie membuka pintu bagi generasi baru shinobi untuk menguji kemampuan mereka, karena mereka menghadapi musuh misterius dan berharap bisa memulihkan kedamaian Konoha. Hokage ke-7 tentu memiliki sejarah pertempuran yang mengesankan di belakangnya, namun pada kesempatan ini, dia memerlukan kerja sama tim yang kuat dari teman lama dan talenta baru untuk bisa menang.', '2015-09-27', 8, '95 Menit', 'Jepang');
INSERT INTO `tb_movie` VALUES (7, 'The Legend Of The Great Gold Pirate Woonan', 1, 'https://cdn.myanimelist.net/images/anime/5/20925.jpg', 'https://ia801903.us.archive.org/11/items/opmovie-10.480/OPMovie%2001.480.MP4', 'Ketika mereka masih muda, Ganzo dan Woonan memiliki argumen tentang betapa pentingnya emas sebenarnya. Woonan pahit tentang betapa sedikit penghasilan ayahnya dalam hidupnya dan bertekad untuk membuat gunung emas. Selama pertarungan, mereka jatuh di atas tebing tempat mereka berada, tergantung pada bendera bajak laut Woonan . Ganzo melepaskan bendera agar tidak hancur dan Woonan bisa memanjat. Untungnya, Ganzo diselamatkan oleh kapal yang lewat dan terbangun beberapa hari setelah kecelakaan untuk mengetahui bahwa Woonan telah pergi untuk menjadi bajak laut. Mereka tidak pernah bertemu lagi. Selama bertahun-tahun, dikatakan dia mencuri hingga sepertiga dari emas dunia yang dia timbunkan setinggi gunung di Gold Island rahasianya, dan dia telah mendapatkan hadiah dariBeli60.000.000, yang merupakan salah satu yang tertinggi di dalam East Blue . Namun, akhirnya, Woonan tumbuh untuk meratapi mencuri semua kekayaan emasnya, karena itu menjadi tidak berarti baginya. Putus asa, dia memutuskan untuk mengembalikan semua itu. Setelah menjalani kehidupan yang penuh penyesalan dan mendapatkan keburukan sebagai bajak laut, sudah terlambat baginya untuk kembali ke kehidupan yang damai. Dia hanya kembali ke ruang penyimpanannya, menyegel dirinya di dalam, duduk sendirian, dan rupanya menunggu kematiannya. Pada saat dia meninggal, harta karunnya diduga disembunyikan, dan Eldoraggo mengejarnya, bersama dengan Bajak Laut Topi Jerami , Ganzo dan Tobio . Namun, ketika Topi Jerami, Ganzo, dan Tobio mencapai lokasi emas yang tersembunyi, mereka tidak menemukan apa pun selain jenazah Woonan dan sebuah catatan yang memberi tahu mereka bahwa ia menyadari bahwa emas yang ia persembahkan untuk hidupnya bukanlah yang penting, tetapi petualangan yang ia miliki mengejarnya dan persahabatannya dengan Ganzo.', '2000-03-04', 8, '51 Menit', 'Jepang');
INSERT INTO `tb_movie` VALUES (8, 'Kingdom', 4, 'https://otakuusamagazine.com/wp-content/uploads/2019/04/kingdom.jpg', 'https://www.mp4upload.com/embed-98w4jbbm8zc8.html', 'Periode Negara-Negara Berperang Tiongkok, naga yang mengamuk yang akan meruntuhkan tanah itu selama 500 tahun, melihat banyak kerajaan bangkit dan jatuh, memberi jalan bagi generasi raja dan jenderal berikutnya untuk memperjuangkan supremasi. Akhirnya, tujuh negara kuat muncul dari lingkaran peperangan yang tak berkesudahan. Di kerajaan Qin, Li Xin, seorang budak yatim piatu, berlatih dengan penuh semangat bersama sesama budak dan sahabat, Piao, yang berbagi impiannya yang bangga bahwa suatu hari akan menjadi Jenderal Agung Surga. Namun, keduanya tiba-tiba terpaksa berpisah ketika Piao direkrut untuk bekerja di istana kerajaan oleh seorang punggawa Raja. Setelah kudeta yang sengit terungkap, Piao kembali ke Xin, setengah mati, dengan misi yang akan membawanya ke pertemuan dengan Raja muda Cina, Ying Zheng, yang memiliki kemiripan yang mencolok dengan Piao. Kerajaan mengikuti Xin saat ia mengambil langkah pertamanya ke halaman sejarah Tiongkok yang penuh darah. Dia harus mengukir jalannya sendiri untuk memuliakan usahanya yang panjang untuk menjadi Jenderal Besar dari Tujuh Negara yang Berperang yang bersejarah.', '2019-08-16', 7, '134 Menit', 'Jepang');
INSERT INTO `tb_movie` VALUES (9, 'Gintama Movie 2: Kanketsu-Hen', 2, 'https://i0.wp.com/bakadame.com/wp-content/uploads/2019/01/gintama-movie-2-sub-indo-bakadame.com_.jpg', 'https://drive.google.com/file/d/1xUsbO4rQWbmbsvq1WwO-aD2XrFvF3J23/view', 'Ceritanya tentang si Gintoki yang terdampar ke masa depan, tepatnya lima tahun mulai sekarang. Kagura jadi cewek cantik, Shinpachi jadi samurai tampan, dan di sana, si Gintoki malah udah mati (Ngenes). Karena itulah ia berusaha untuk menyelidiki apa yang terjadi dengan dirinya di masa depan.', '0000-00-00', 9, '110 Menit', 'Jepang');

SET FOREIGN_KEY_CHECKS = 1;
