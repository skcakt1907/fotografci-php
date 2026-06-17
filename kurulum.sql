-- ============================================
-- FOTOĞRAFÇI / FOTO STÜDYO TEMASI — Kurulum SQL
-- Tema Master (Kurumsal/Hizmet arketipi) tabanlı.
-- Kullanım: phpMyAdmin > fotografci_db > Import  (veya: mysql -u root < kurulum.sql)
-- ============================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `fotografci_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `fotografci_db`;

-- ============ AYARLAR ============
DROP TABLE IF EXISTS `ayarlar`;
CREATE TABLE `ayarlar` (
  `anahtar` VARCHAR(80) NOT NULL PRIMARY KEY,
  `deger` TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ayarlar` (`anahtar`,`deger`) VALUES
('site_adi','Foto Stüdyo Adınız'),
('site_baslik','Foto Stüdyo Adınız — Profesyonel Fotoğraf & Video'),
('site_aciklama','Düğün, nişan, portre, yeni doğan ve ürün çekimlerinde anılarınızı sanatsal bir bakışla ölümsüzleştiren profesyonel fotoğraf stüdyosu.'),
('telefon','+90 555 000 00 00'),
('telefon2','+90 532 000 00 00'),
('mail','info@fotostudyonuz.com'),
('adres','Merkez Mah. Sanat Cad. No:1, İlçe / İl'),
('calisma_saati','Pzt - Cmt: 10:00 - 19:00'),
('hakkimizda_kisa','Anların hikâyesini ışıkla yazıyoruz. Düğününüzden yeni doğan bebeğinize, portreden ürün çekimine kadar her kareyi titizlikle, sanatsal bir bakışla ölümsüzleştiriyoruz.'),
('hakkimizda_uzun','Stüdyomuz, 12 yılı aşkın deneyimiyle fotoğrafı bir meslek değil tutku olarak görüyor. Düğün ve nişan çekimlerinde gününüzün her duygusunu; portre ve aile çekimlerinde içtenliği; yeni doğan çekimlerinde o eşsiz ilk günleri; ürün ve ticari çekimlerde ise markanızı en iyi şekilde yansıtacak kareleri yakalıyoruz. Modern ekipman, profesyonel ışık altyapısı ve sinematik kurgu anlayışımızla, çektiğimiz her fotoğrafın yıllar sonra bile aynı duyguyu hissettirmesini hedefliyoruz. Çekim öncesi planlama, çekim günü yönlendirme ve çekim sonrası profesyonel retouch sürecinin tamamını sizin için yönetiyoruz.'),
('misyon','Her müşterimizin hikâyesini özgün, duygusal ve sanatsal karelerle anlatmak; teknolojiyi ve estetiği birleştirerek kalıcı anılar üretmek.'),
('vizyon','Bölgemizin en çok tercih edilen, işini tutkuyla yapan ve kalitesiyle fark yaratan fotoğraf stüdyosu olmak.'),
('yil','12'),
('proje_sayi','1500'),
('musteri_sayi','900'),
('personel_sayi','6'),
('facebook','#'),('instagram','#'),('twitter','#'),('linkedin','#'),('youtube','#');

-- ============ HİZMETLER (Çekim Türleri) ============
DROP TABLE IF EXISTS `hizmetler`;
CREATE TABLE `hizmetler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `ikon` VARCHAR(60) DEFAULT 'bi-camera',
  `gorsel` VARCHAR(255),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hizmetler` (`baslik`,`slug`,`ozet`,`icerik`,`ikon`,`gorsel`,`sira`) VALUES
('Düğün & Nişan Çekimi','dugun-nisan-cekimi','Hayatınızın en özel gününü sinematik bir bakışla, en ince ayrıntısına kadar ölümsüzleştiriyoruz.','Düğün ve nişan çekimlerinde gün boyu yanınızdayız. Hazırlık anlarından tören ve davete kadar her duyguyu doğal, müdahalesiz ve sanatsal bir dille yakalıyoruz. İsteğe bağlı dış mekan (save the date) çekimi, drone görüntüleri ve sinematik düğün klibi hizmetlerimiz de mevcuttur.','bi-heart','https://images.unsplash.com/photo-1519741497674-611481863552?w=800&q=80',1),
('Portre & Aile Çekimi','portre-aile-cekimi','Bireysel portreler ve aile çekimlerinde içtenliği ve sıcaklığı kareye taşıyoruz.','Stüdyo ya da dış mekanda; bireysel portre, aile, çift ve kurumsal portre çekimleri yapıyoruz. Doğru ışık, doğru yönlendirme ve rahat bir çekim atmosferiyle en doğal halinizi yansıtan kareler üretiyoruz.','bi-people','https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=800&q=80',2),
('Yeni Doğan & Bebek Çekimi','yeni-dogan-bebek-cekimi','Bebeğinizin o eşsiz ilk günlerini güvenli ve hijyenik stüdyo ortamında ölümsüzleştiriyoruz.','Yeni doğan çekimlerinde bebeğinizin konforu ve güvenliği önceliğimizdir. Sıcak ve hijyenik stüdyo ortamı, uygun aksesuarlar ve sabırlı bir çalışma anlayışıyla o kısacık ama paha biçilmez anları kalıcı kılıyoruz.','bi-emoji-smile','https://images.unsplash.com/photo-1555252333-9f8e92e65df9?w=800&q=80',3),
('Ürün & Ticari Çekim','urun-ticari-cekim','Markanızı öne çıkaran, satışa dönüşen profesyonel ürün ve katalog çekimleri.','E-ticaret, katalog ve reklam için profesyonel ürün çekimleri yapıyoruz. Doğru ışık kurulumu, beyaz fon / yaşam tarzı (lifestyle) çekimleri ve profesyonel retouch ile ürünlerinizi en çekici haliyle sunuyoruz.','bi-bag','https://images.unsplash.com/photo-1542038784456-1ea8e935640e?w=800&q=80',4),
('Etkinlik & Organizasyon','etkinlik-organizasyon','Doğum günü, kurumsal etkinlik ve özel davetlerinizi profesyonelce belgeliyoruz.','Doğum günleri, kurumsal etkinlikler, lansmanlar ve özel davetlerde anın enerjisini yakalıyoruz. Hızlı teslim seçenekleri ve etkinlik boyunca kesintisiz çekim hizmetimizle hiçbir önemli anı kaçırmıyoruz.','bi-balloon','https://images.unsplash.com/photo-1511795409834-ef04bbd61622?w=800&q=80',5),
('Moda & Tanıtım Çekimi','moda-tanitim-cekimi','Ajanslar, modeller ve markalar için editoryal moda ve tanıtım çekimleri.','Moda editoryalleri, model portfolyoları ve marka tanıtım çekimleri gerçekleştiriyoruz. Konsept geliştirme, mekan/stüdyo planlaması ve profesyonel post-prodüksiyon ile etkileyici görseller üretiyoruz.','bi-camera-reels','https://images.unsplash.com/photo-1469334031218-e382a71b716b?w=800&q=80',6);

-- ============ PROJELER / PORTFOLYO (Galeri) ============
DROP TABLE IF EXISTS `projeler`;
CREATE TABLE `projeler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `kategori` VARCHAR(60),
  `gorsel` VARCHAR(255),
  `aciklama` TEXT,
  `tarih` VARCHAR(40),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `projeler` (`baslik`,`slug`,`kategori`,`gorsel`,`aciklama`,`tarih`,`sira`) VALUES
('Elif & Mert Düğünü','elif-mert-dugun','Düğün','https://images.unsplash.com/photo-1519225421980-715cb0215aed?w=800&q=80','Sahil kenarında gün batımında gerçekleşen, duygu dolu bir düğün hikâyesi.','2025',1),
('Dış Mekan Nişan','dis-mekan-nisan','Düğün','https://images.unsplash.com/photo-1583939003579-730e3918a45a?w=800&q=80','Doğal ışıkta, samimi anların yakalandığı dış mekan nişan çekimi.','2025',2),
('Aile Portresi','aile-portresi','Portre','https://images.unsplash.com/photo-1511895426328-dc8714191300?w=800&q=80','Üç kuşağın bir araya geldiği sıcak bir stüdyo aile çekimi.','2025',3),
('Yeni Doğan — İlk Günler','yeni-dogan-ilk-gunler','Yeni Doğan','https://images.unsplash.com/photo-1492725764893-90b379c2b6e7?w=800&q=80','Bebeğin ilk haftasında, güvenli stüdyo ortamında çekilen narin kareler.','2024',4),
('Kozmetik Ürün Serisi','kozmetik-urun-serisi','Ürün','https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=800&q=80','E-ticaret için beyaz fon ve lifestyle kombinasyonlu ürün çekimi.','2024',5),
('Moda Editoryal','moda-editoryal','Moda','https://images.unsplash.com/photo-1483985988355-763728e1935b?w=800&q=80','Bir tekstil markası için stüdyoda gerçekleştirilen editoryal moda çekimi.','2024',6);

-- ============ BLOG ============
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(200) NOT NULL,
  `slug` VARCHAR(200),
  `kategori` VARCHAR(60),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `gorsel` VARCHAR(255),
  `tarih` DATE,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blog` (`baslik`,`slug`,`kategori`,`ozet`,`icerik`,`gorsel`,`tarih`) VALUES
('Düğün Çekimi Öncesi 7 Altın İpucu','dugun-cekimi-oncesi-ipuclari','İpuçları','Düğün gününüzde fotoğraflarınızın kusursuz olması için çekim öncesi bilmeniz gereken pratik öneriler.','Düğün fotoğraflarınızın hayalinizdeki gibi olması büyük ölçüde iyi bir planlamaya bağlıdır. Çekim listesi hazırlamak, dış mekan için altın saati (gün batımından önceki bir saat) tercih etmek, fotoğrafçınızla önceden mekanı gezmek ve ailelerle çekim akışını paylaşmak en sık verdiğimiz tavsiyelerin başında geliyor. Bu yazıda düğün gününüzü hem keyifli hem de fotojenik kılacak 7 pratik ipucunu derledik.','https://images.unsplash.com/photo-1606800052052-a08af7148866?w=800&q=80','2026-05-10'),
('Yeni Doğan Çekiminde Nelere Dikkat Edilmeli?','yeni-dogan-cekimi-dikkat','Rehber','Bebeğinizin ilk fotoğraf çekimi için en doğru zamanlama, güvenlik ve hazırlık önerileri.','Yeni doğan çekimleri için ideal zaman, bebeğin doğumundan sonraki ilk 5-12 gündür; bu dönemde bebekler daha çok uyur ve istenen pozlar daha kolay verilir. Stüdyo sıcaklığı, hijyen, sabır ve bebeğin beslenme/uyku düzenine uyum bu çekimin olmazsa olmazlarıdır. Bu rehberde ailelerin en çok merak ettiği soruları yanıtladık.','https://images.unsplash.com/photo-1519689680058-324335c77eba?w=800&q=80','2026-04-18'),
('Ürün Fotoğrafçılığında Işığın Önemi','urun-fotografciligi-isik','İpuçları','E-ticaret satışlarınızı artıran profesyonel ürün fotoğraflarının ardındaki ışık sırları.','Ürün fotoğrafçılığında ışık, ürünü olduğundan daha çekici ya da sönük gösterebilen en kritik unsurdur. Yumuşak ışık (softbox) ile sert gölgeleri kırmak, beyaz fonun gerçekten beyaz çıkması için doğru pozlama ve renk doğruluğu için profesyonel retouch süreci, dönüşüm oranı yüksek görseller üretmenin temelidir. Bu yazıda temel stüdyo ışık kurulumlarını anlattık.','https://images.unsplash.com/photo-1606983340126-99ab4feaa64a?w=800&q=80','2026-03-22');

-- ============ REFERANSLAR ============
DROP TABLE IF EXISTS `referanslar`;
CREATE TABLE `referanslar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100) NOT NULL,
  `unvan` VARCHAR(120),
  `yorum` TEXT,
  `foto` VARCHAR(255),
  `yildiz` TINYINT DEFAULT 5,
  `durum` TINYINT DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `referanslar` (`ad`,`unvan`,`yorum`,`foto`,`yildiz`) VALUES
('Elif & Mert','Düğün Çekimi','Düğün fotoğraflarımız hayalimizin çok ötesinde oldu. Gün boyu hiç yorulmadan, en doğal anlarımızı yakaladılar. Albümümüze her baktığımızda o günü yeniden yaşıyoruz.','https://i.pravatar.cc/100?img=45',5),
('Zeynep K.','Yeni Doğan Çekimi','Bebeğimizin ilk fotoğraf çekimiydi, çok endişeliydik. Ama o kadar sabırlı ve özenliydiler ki, çıkan kareler muhteşem oldu. Gönül rahatlığıyla tavsiye ediyorum.','https://i.pravatar.cc/100?img=20',5),
('Kava Kozmetik','Ürün Çekimi','E-ticaret sitemiz için yaptıkları ürün çekimleri satışlarımıza gözle görülür katkı sağladı. Profesyonel, hızlı ve titiz bir ekip.','https://i.pravatar.cc/100?img=68',5);

-- ============ MESAJLAR ============
DROP TABLE IF EXISTS `mesajlar`;
CREATE TABLE `mesajlar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `konu` VARCHAR(200),
  `mesaj` TEXT,
  `okundu` TINYINT DEFAULT 0,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ TEKLİFLER (Çekim / Rezervasyon Talepleri) ============
DROP TABLE IF EXISTS `teklifler`;
CREATE TABLE `teklifler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `hizmet` VARCHAR(120),
  `il` VARCHAR(60),
  `adres` VARCHAR(255),
  `alan` VARCHAR(60),
  `butce` VARCHAR(60),
  `baslangic` VARCHAR(60),
  `detay` TEXT,
  `durum` ENUM('yeni','degerlendiriliyor','teklif_verildi','kazanildi','kaybedildi') DEFAULT 'yeni',
  `notlar` TEXT,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ ADMIN ============
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `kullanici` VARCHAR(60) NOT NULL UNIQUE,
  `sifre_hash` VARCHAR(255) NOT NULL,
  `ad_soyad` VARCHAR(120),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Şifre: admin123  (password_hash bcrypt) — CANLIDA MUTLAKA DEĞİŞTİR
INSERT INTO `admin` (`kullanici`,`sifre_hash`,`ad_soyad`) VALUES
('admin','$2y$10$6gNrpOXRLof.Toy.Ugy.yu4DrKP23OcnJa7UBhKOH1iMxbtH8GK0.','Yönetici');

SET FOREIGN_KEY_CHECKS = 1;
