-- ============================================
-- TEMA MASTER (Kurumsal/Hizmet Arketipi) — Kurulum SQL
-- Markasız ana şablon. Yeni tema için: DB adını + içerikleri değiştir.
-- Kullanım: phpMyAdmin > tema_master DB > Import
-- ============================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `tema_master` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `tema_master`;

-- ============ AYARLAR ============
DROP TABLE IF EXISTS `ayarlar`;
CREATE TABLE `ayarlar` (
  `anahtar` VARCHAR(80) NOT NULL PRIMARY KEY,
  `deger` TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ayarlar` (`anahtar`,`deger`) VALUES
('site_adi','Firma Adınız'),
('site_baslik','Firma Adınız — Profesyonel Çözüm Ortağınız'),
('site_aciklama','Sektöründe uzman ekibiyle kaliteli, güvenilir ve müşteri odaklı hizmet sunan firmanızın kurumsal tanıtım sitesi.'),
('telefon','+90 555 000 00 00'),
('telefon2','+90 532 000 00 00'),
('mail','info@firmaadiniz.com'),
('adres','Merkez Mah. Örnek Cad. No:1, İlçe / İl'),
('calisma_saati','Pzt - Cmt: 09:00 - 18:00'),
('hakkimizda_kisa','Firmanız hakkında kısa bir tanıtım yazısı. Bu metni admin panelinden düzenleyebilirsiniz. Uzmanlık alanlarınızı ve değerlerinizi burada özetleyin.'),
('hakkimizda_uzun','Firmanız hakkında detaylı tanıtım metni buraya gelir. Kuruluş hikayeniz, vizyonunuz, hizmet anlayışınız ve sizi rakiplerinizden ayıran özellikleriniz bu alanda anlatılır. Admin panelindeki Ayarlar bölümünden bu metni dilediğiniz gibi güncelleyebilirsiniz. Modern altyapı, uzman kadro ve müşteri memnuniyeti odaklı çalışma prensibimizle her ölçekte işi zamanında ve kaliteyle teslim ediyoruz.'),
('misyon','Müşterilerimize sektör standartlarının üzerinde, güvenilir ve sürdürülebilir çözümler sunmak; her projede kalite ve memnuniyeti önceliklendirmek.'),
('vizyon','Faaliyet gösterdiğimiz alanda öncü, tercih edilen ve güvenilir marka olmak; yenilikçi yaklaşımlarla sektöre değer katmak.'),
('yil','10'),
('proje_sayi','250'),
('musteri_sayi','500'),
('personel_sayi','25'),
('facebook','#'),('instagram','#'),('twitter','#'),('linkedin','#'),('youtube','#');

-- ============ HİZMETLER ============
DROP TABLE IF EXISTS `hizmetler`;
CREATE TABLE `hizmetler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `ikon` VARCHAR(60) DEFAULT 'bi-building',
  `gorsel` VARCHAR(255),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hizmetler` (`baslik`,`slug`,`ozet`,`icerik`,`ikon`,`gorsel`,`sira`) VALUES
('Profesyonel Danışmanlık','profesyonel-danismanlik','İhtiyaçlarınıza özel, uzman ekibimizle profesyonel danışmanlık hizmeti.','Bu hizmetin detaylı açıklamasını admin panelinden düzenleyebilirsiniz. Deneyimli kadromuzla size en uygun çözümleri sunuyor, sürecin her aşamasında yanınızda oluyoruz.','bi-lightbulb','https://images.unsplash.com/photo-1521737604893-d14cc237f11d?w=800&q=80',1),
('Proje Yönetimi','proje-yonetimi','Planlamadan teslime, projelerinizi uçtan uca profesyonelce yönetiyoruz.','Bu hizmetin detaylı açıklamasını admin panelinden düzenleyebilirsiniz. Zamanında teslim, bütçe kontrolü ve kalite yönetimi ilkelerimizle projelerinizi güvenle yürütüyoruz.','bi-diagram-3','https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=800&q=80',2),
('Teknik Servis & Destek','teknik-servis-destek','Hızlı, güvenilir ve kesintisiz teknik servis ve destek hizmeti.','Bu hizmetin detaylı açıklamasını admin panelinden düzenleyebilirsiniz. Uzman teknik ekibimizle sorunlarınıza hızlı çözüm üretiyor, kesintisiz destek sağlıyoruz.','bi-tools','https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?w=800&q=80',3),
('Kurumsal Çözümler','kurumsal-cozumler','İşletmenize özel, ölçeklenebilir ve verimli kurumsal çözümler.','Bu hizmetin detaylı açıklamasını admin panelinden düzenleyebilirsiniz. Firmanızın ihtiyaçlarına göre tasarlanmış kurumsal çözümlerle verimliliğinizi artırıyoruz.','bi-building-gear','https://images.unsplash.com/photo-1497366216548-37526070297c?w=800&q=80',4),
('Bakım & Onarım','bakim-onarim','Düzenli bakım ve hızlı onarım hizmetleriyle sürekliliği garanti ediyoruz.','Bu hizmetin detaylı açıklamasını admin panelinden düzenleyebilirsiniz. Periyodik bakım planları ve hızlı onarım hizmetimizle işlerinizin aksamasını önlüyoruz.','bi-wrench-adjustable','https://images.unsplash.com/photo-1530124566582-a618bc2615dc?w=800&q=80',5),
('Anahtar Teslim Hizmet','anahtar-teslim-hizmet','Baştan sona tüm süreci üstlenip işinizi anahtar teslim tamamlıyoruz.','Bu hizmetin detaylı açıklamasını admin panelinden düzenleyebilirsiniz. Tek muhatap, eksiksiz koordinasyon ve garantili teslim ile sürecin tamamını sizin için yönetiyoruz.','bi-key','https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=800&q=80',6);

-- ============ PROJELER / GALERİ ============
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
('Örnek Proje 1','ornek-proje-1','Kategori A','https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=800&q=80','Bu projenin açıklamasını admin panelinden düzenleyebilirsiniz.','2025',1),
('Örnek Proje 2','ornek-proje-2','Kategori A','https://images.unsplash.com/photo-1497366811353-6870744d04b2?w=800&q=80','Bu projenin açıklamasını admin panelinden düzenleyebilirsiniz.','2025',2),
('Örnek Proje 3','ornek-proje-3','Kategori B','https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=800&q=80','Bu projenin açıklamasını admin panelinden düzenleyebilirsiniz.','2025',3),
('Örnek Proje 4','ornek-proje-4','Kategori B','https://images.unsplash.com/photo-1486325212027-8081e485255e?w=800&q=80','Bu projenin açıklamasını admin panelinden düzenleyebilirsiniz.','2024',4),
('Örnek Proje 5','ornek-proje-5','Kategori C','https://images.unsplash.com/photo-1431540015161-0bf868a2d407?w=800&q=80','Bu projenin açıklamasını admin panelinden düzenleyebilirsiniz.','2024',5),
('Örnek Proje 6','ornek-proje-6','Kategori C','https://images.unsplash.com/photo-1460472178825-e5240623afd5?w=800&q=80','Bu projenin açıklamasını admin panelinden düzenleyebilirsiniz.','2024',6);

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
('Örnek Blog Yazısı Başlığı 1','ornek-blog-1','Genel','Blog yazınızın kısa özeti buraya gelir. Admin panelinden düzenleyebilirsiniz.','Blog yazınızın tam içeriği buraya gelir. Admin panelindeki Blog bölümünden yeni yazı ekleyebilir, mevcut yazıları düzenleyebilir veya silebilirsiniz.','https://images.unsplash.com/photo-1499750310107-5fef28a66643?w=800&q=80','2026-05-01'),
('Örnek Blog Yazısı Başlığı 2','ornek-blog-2','Genel','Blog yazınızın kısa özeti buraya gelir. Admin panelinden düzenleyebilirsiniz.','Blog yazınızın tam içeriği buraya gelir. Admin panelindeki Blog bölümünden yeni yazı ekleyebilir, mevcut yazıları düzenleyebilir veya silebilirsiniz.','https://images.unsplash.com/photo-1506784983877-45594efa4cbe?w=800&q=80','2026-04-15'),
('Örnek Blog Yazısı Başlığı 3','ornek-blog-3','Genel','Blog yazınızın kısa özeti buraya gelir. Admin panelinden düzenleyebilirsiniz.','Blog yazınızın tam içeriği buraya gelir. Admin panelindeki Blog bölümünden yeni yazı ekleyebilir, mevcut yazıları düzenleyebilir veya silebilirsiniz.','https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?w=800&q=80','2026-03-20');

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
('Müşteri Adı 1','Ünvan / Firma','Müşteri yorumu buraya gelir. Admin panelinden düzenleyebilirsiniz. Memnuniyet ifadeleri güven oluşturur.','https://i.pravatar.cc/100?img=12',5),
('Müşteri Adı 2','Ünvan / Firma','Müşteri yorumu buraya gelir. Admin panelinden düzenleyebilirsiniz. Memnuniyet ifadeleri güven oluşturur.','https://i.pravatar.cc/100?img=32',5),
('Müşteri Adı 3','Ünvan / Firma','Müşteri yorumu buraya gelir. Admin panelinden düzenleyebilirsiniz. Memnuniyet ifadeleri güven oluşturur.','https://i.pravatar.cc/100?img=15',5);

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

-- ============ TEKLİFLER ============
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
