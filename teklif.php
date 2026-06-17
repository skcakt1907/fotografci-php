<?php
require_once __DIR__ . '/inc/helpers.php';
$mesaj=''; $hata='';
$hizmetler = getList('hizmetler','durum=1','sira ASC');
if($_SERVER['REQUEST_METHOD']==='POST'){
    csrf_check();
    $f = [
        'ad'        => trim($_POST['ad'] ?? ''),
        'mail'      => trim($_POST['mail'] ?? ''),
        'tel'       => trim($_POST['tel'] ?? ''),
        'hizmet'    => trim($_POST['hizmet'] ?? ''),
        'il'        => trim($_POST['il'] ?? ''),
        'adres'     => trim($_POST['adres'] ?? ''),
        'alan'      => trim($_POST['alan'] ?? ''),
        'butce'     => trim($_POST['butce'] ?? ''),
        'baslangic' => trim($_POST['baslangic'] ?? ''),
        'detay'     => trim($_POST['detay'] ?? ''),
    ];
    if(!$f['ad'] || !$f['tel'] || !$f['hizmet']){
        $hata = 'Ad, telefon ve çekim türü alanları zorunludur.';
    } elseif($f['mail'] && !filter_var($f['mail'], FILTER_VALIDATE_EMAIL)){
        $hata = 'Geçerli bir e-posta adresi giriniz.';
    } else {
        $stmt = $db->prepare("INSERT INTO teklifler(ad,mail,tel,hizmet,il,adres,alan,butce,baslangic,detay) VALUES(:ad,:mail,:tel,:hizmet,:il,:adres,:alan,:butce,:baslangic,:detay)");
        $stmt->execute($f);
        $mesaj = 'Rezervasyon talebiniz alındı. En kısa sürede sizinle iletişime geçip çekim tarihinizi netleştireceğiz.';
    }
}
require_once __DIR__ . '/inc/header.php';
?>
<section class="page-head">
  <div class="container">
    <h1>Rezervasyon</h1>
    <nav><ol class="breadcrumb"><li class="breadcrumb-item"><a href="<?= SITE_URL ?>/">Anasayfa</a></li><li class="breadcrumb-item active">Rezervasyon</li></ol></nav>
  </div>
</section>

<section>
  <div class="container">
    <div class="row g-5">
      <div class="col-lg-7">
        <span class="badge-mini">Çekim Talebi</span>
        <h2>Çekiminiz İçin <span style="color:var(--primary)">Rezervasyon</span> Yapın</h2>
        <p class="text-muted mb-4">Formu doldurun; hayalinizdeki çekimi konuşalım, size en uygun paketi ve müsait tarihleri birlikte belirleyelim.</p>

        <?php if($mesaj): ?><div class="alert alert-success"><i class="bi bi-check-circle-fill me-2"></i><?= e($mesaj) ?></div><?php endif; ?>
        <?php if($hata):  ?><div class="alert alert-danger"><i class="bi bi-exclamation-triangle-fill me-2"></i><?= e($hata) ?></div><?php endif; ?>

        <form method="post" class="contact-form">
          <input type="hidden" name="csrf" value="<?= csrf_token() ?>">
          <h5 class="mb-3 mt-2" style="color:var(--primary)"><i class="bi bi-person me-2"></i>İletişim Bilgileri</h5>
          <div class="row g-3">
            <div class="col-md-6"><label class="form-label">Ad Soyad / Firma *</label><input class="form-control" name="ad" required></div>
            <div class="col-md-6"><label class="form-label">Telefon *</label><input class="form-control" name="tel" required></div>
            <div class="col-md-12"><label class="form-label">E-posta</label><input type="email" class="form-control" name="mail"></div>
          </div>

          <h5 class="mb-3 mt-4" style="color:var(--primary)"><i class="bi bi-camera me-2"></i>Çekim Detayları</h5>
          <div class="row g-3">
            <div class="col-md-6">
              <label class="form-label">Çekim Türü *</label>
              <select class="form-select" name="hizmet" required>
                <option value="">— Seçiniz —</option>
                <?php foreach($hizmetler as $h): ?>
                  <option value="<?= e($h['baslik']) ?>" <?= (isset($_GET['hizmet']) && $_GET['hizmet']===$h['slug'])?'selected':'' ?>><?= e($h['baslik']) ?></option>
                <?php endforeach; ?>
                <option value="Diğer">Diğer</option>
              </select>
            </div>
            <div class="col-md-6"><label class="form-label">İl / İlçe</label><input class="form-control" name="il" placeholder="örn. İstanbul / Beşiktaş"></div>
            <div class="col-12"><label class="form-label">Çekim Mekanı (Stüdyo / Dış Mekan / Adres)</label><input class="form-control" name="adres" placeholder="örn. Stüdyo veya dış mekan adresi / lokasyon"></div>
            <div class="col-md-4"><label class="form-label">Kişi / Katılımcı Sayısı</label><input class="form-control" name="alan" placeholder="örn. Çift, 4 kişilik aile..."></div>
            <div class="col-md-4">
              <label class="form-label">Paket Tercihi</label>
              <select class="form-select" name="butce">
                <option value="">— Seçiniz —</option>
                <option>Mini Paket (kısa seans)</option>
                <option>Standart Paket</option>
                <option>Premium Paket (albüm dahil)</option>
                <option>Tam Gün / Düğün Paketi</option>
                <option>Henüz kararsızım</option>
              </select>
            </div>
            <div class="col-md-4">
              <label class="form-label">Çekim Tarihi</label>
              <select class="form-select" name="baslangic">
                <option value="">— Seçiniz —</option>
                <option>Bu hafta</option>
                <option>Bu ay içinde</option>
                <option>1-3 ay içinde</option>
                <option>3 ay+ sonra</option>
                <option>Tarih belli değil</option>
              </select>
            </div>
            <div class="col-12"><label class="form-label">Çekim Detayı / Notlar</label><textarea class="form-control" name="detay" rows="5" placeholder="Konsept, beklentileriniz, özel istekleriniz... (örn. dış mekan gün batımı çekimi istiyoruz)"></textarea></div>
            <div class="col-12 d-flex gap-2 align-items-center flex-wrap mt-2">
              <button class="btn btn-primary-c"><i class="bi bi-send"></i> Rezervasyon Talebi Gönder</button>
              <span class="text-muted small ms-2"><i class="bi bi-shield-check me-1"></i>Bilgileriniz gizli tutulur, asla 3. kişilerle paylaşılmaz.</span>
            </div>
          </div>
        </form>
      </div>

      <div class="col-lg-5">
        <div class="quote-call">
          <div class="quote-call-icon"><i class="bi bi-telephone-fill"></i></div>
          <div>
            <small>Hemen Arayın</small>
            <a href="tel:<?= e(ayar('telefon')) ?>"><?= e(ayar('telefon')) ?></a>
          </div>
        </div>
        <ul class="quote-perks">
          <li><i class="bi bi-calendar2-check"></i><div><strong>Tarih Ayırtma</strong><span>Müsait günlerimizi birlikte planlıyoruz.</span></div></li>
          <li><i class="bi bi-clock-history"></i><div><strong>24 Saatte Dönüş</strong><span>En geç 1 iş gününde.</span></div></li>
          <li><i class="bi bi-shield-check"></i><div><strong>Gizlilik</strong><span>Bilgileriniz 3. kişilerle paylaşılmaz.</span></div></li>
        </ul>
      </div>
    </div>
  </div>
</section>
<?php require_once __DIR__ . '/inc/footer.php'; ?>
