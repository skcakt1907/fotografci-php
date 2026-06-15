============================================================
TEMA MASTER (KURUMSAL/HİZMET) — KURUMSAL WEB SİTESİ
PHP + MySQL + Bootstrap 5
============================================================

Bu klasör MARKASIZ ana şablondur. Yeni sektör teması üretimi için
TEMA-OLUSTURMA-REHBERI.txt dosyasına bakın.

KURULUM (yerel WAMP / canlı sunucu)
------------------------------------------------------------
1. Dosyaları sunucuya yükleyin
   - Tüm klasörü web kök dizinine kopyalayın (örn: public_html/)

2. Veritabanı oluşturun
   - cPanel / phpMyAdmin'de yeni bir DB oluşturun (örn: tema_master)
   - kurulum.sql dosyasını import edin
   - 7 tablo + örnek veriler otomatik yüklenir

3. Veritabanı bağlantı bilgilerini düzenleyin
   - inc/config.php dosyasını açın
   - DB_HOST, DB_NAME, DB_USER, DB_PASS değerlerini doldurun
   - SITE_URL değerini gerçek domaininizle değiştirin
   - Canlı sunucuda DEBUG'i false yapın
   - Alt klasörde çalışıyorsa .htaccess içindeki RewriteBase'i güncelleyin

4. uploads/ klasörüne yazma izni verin
   - chmod 755 uploads/    (Linux)
   - uploads/.htaccess PHP çalıştırmayı engelliyor (güvenlik)

5. Admin paneline giriş yapın
   - URL: https://siteniz.com/admin/
   - Kullanıcı: admin
   - Şifre:    admin123
   - !!! Giriş yaptıktan sonra şifrenizi MUTLAKA değiştirin !!!

------------------------------------------------------------
DOSYA YAPISI
------------------------------------------------------------
├── index.php             Anasayfa
├── hakkimizda.php        Hakkımızda
├── hizmetler.php         Hizmet listesi
├── hizmet-detay.php      Tek hizmet sayfası (?slug=...)
├── projeler.php          Proje/galeri (filtreli)
├── proje-detay.php       Tek proje (?slug=...)
├── blog.php              Blog listesi
├── blog-detay.php        Tek yazı (?slug=...)
├── iletisim.php          İletişim formu + harita
├── teklif.php            Fiyat teklifi formu
│
├── inc/                  config, db, helpers, header, footer
├── admin/                Yönetim paneli (login, CRUD'lar, ayarlar)
├── css/style.css         Tema CSS (:root değişkenlerinden renkler)
├── js/main.js            Navbar scroll efekti
├── uploads/              Yüklenen görseller (PHP engelli)
└── kurulum.sql           DB şema + örnek veri

------------------------------------------------------------
TEKNİK DETAYLAR
------------------------------------------------------------
- PHP 7.4+ (önerilen 8.x), MySQL 5.7+ / MariaDB
- PDO prepared statements, CSRF token, password_hash (bcrypt)
- XSS koruması (e() htmlspecialchars)
- Bootstrap 5.3.2 + Bootstrap Icons 1.11 (CDN)
- Responsive (mobil uyumlu)

------------------------------------------------------------
RENK PALETİ (master varsayılanı)
------------------------------------------------------------
Birincil  : #ea7c1c    Vurgu : #f5b800
Koyu      : #0a0a0a    Açık  : #f4f4f5
- css/style.css → :root değişkenlerinden değiştirin
- Sektör paletleri için TEMA-OLUSTURMA-REHBERI.txt'ye bakın

Hazırlayan: DN Kreatif
