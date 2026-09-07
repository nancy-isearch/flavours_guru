<?php echo $header; ?>

<link rel="stylesheet" href="/catalog/view/theme/default/stylesheet/city_scoped.css" />
<link rel="stylesheet" href="/catalog/view/theme/default/stylesheet/locality_css/local-area.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>
  /* ── Locality page: reset global dark styles ── */
  body,
  #content,
  .page-content,
  #wrapper,
  .wrapper,
  .main-content {
    background-color: #ffffff !important;
    background-image: none !important;
  }

  /* ── Override Bootstrap .container when used as grid wrapper ── */
  .la-hero__grid {
    display: grid !important;
    grid-template-columns: 1.08fr 0.92fr !important;
    gap: 46px !important;
    align-items: center !important;
    max-width: 1600px !important;
    margin-inline: auto !important;
    padding-inline: 50px !important;
    width: 100% !important;
  }

  /* ── Ensure the hero text and media are visible ── */
  .la-hero__text,
  .la-hero__media {
    display: block !important;
    min-width: 0 !important;
  }

  /* ── Hero image fills its container ── */
  .la-hero__img {
    aspect-ratio: 4/3;
    border-radius: 32px;
    overflow: hidden;
  }
  .la-hero__img img {
    width: 100% !important;
    height: 100% !important;
    object-fit: cover !important;
    display: block !important;
  }

  /* ── Fix hero section background ── */
  .la-hero {
    background: #ffffff !important;
    padding: 60px 0 !important;
  }

  /* ── Hero title color fix ── */
  .la-hero__title {
    color: #031f43 !important;
    font-size: clamp(2rem, 4.4vw, 3.3rem) !important;
    font-weight: 800 !important;
    line-height: 1.08 !important;
    margin: 18px 0 16px !important;
  }
  .la-hero__title em {
    font-style: italic !important;
    color: #FF5A6E !important;
  }

  .la-hero__trust li {
    font-size: 15px !important;
  }
  .la-hero__badge strong {
    font-size: 16px !important;
  }
  .la-hero__badge small {
    font-size: 13px !important;
  }

  /* ── Wedding / Baby Shower cake section grid ── */
  .wedding-cake-section {
    display: grid !important;
    grid-template-columns: repeat(4, 1fr) !important;
    gap: 20px !important;
  }

  /* ── Occasion cards (occ-card) height & image fix ── */
  .occ-card {
    position: relative !important;
    height: 280px !important;
    border-radius: 24px !important;
    overflow: hidden !important;
    display: flex !important;
    align-items: flex-end !important;
    box-shadow: 0 2px 10px rgba(90,120,255,.06) !important;
    transition: transform .25s, box-shadow .25s !important;
  }
  .occ-card:hover {
    transform: translateY(-5px) !important;
    box-shadow: 0 12px 30px rgba(90,120,255,.15) !important;
  }
  .occ-card img {
    width: 100% !important;
    height: 100% !important;
    object-fit: cover !important;
    position: absolute !important;
    inset: 0 !important;
  }
  .occ-card__cap {
    position: relative !important;
    z-index: 2 !important;
    width: 100% !important;
    padding: 18px 20px !important;
    display: flex !important;
    flex-direction: column !important;
    gap: 3px !important;
    background: linear-gradient(to top, rgba(40,18,22,.75), transparent) !important;
    color: #fff !important;
  }
  .occ-card__cap strong { font-weight: 600 !important; font-size: 1.1rem !important; }
  .occ-card__cap span  { font-size: .84rem !important; font-weight: 700 !important; opacity: .95 !important; }

  /* ── Quick Facts Band ── */
  .la-facts {
    position: relative;
    z-index: 3;
  }
  .la-facts__row {
    display: grid !important;
    grid-template-columns: repeat(4, 1fr) !important;
    gap: 0 !important;
    background: #ffffff !important;
    border: 1px solid #E6ECF7 !important;
    overflow: hidden !important;
    width: 100% !important;
    max-width: 1600px !important;
    margin-inline: auto !important;
    box-sizing: border-box !important;
  }
  .la-fact {
    display: flex !important;
    align-items: center !important;
    gap: 13px !important;
    padding: 20px 24px !important;
    background: #ffffff !important;
  }
  .la-fact + .la-fact {
    border-left: 1px solid #E6ECF7 !important;
  }
  .la-fact__ic {
    width: 46px !important;
    height: 46px !important;
    border-radius: 13px !important;
    flex: none !important;
    display: grid !important;
    place-items: center !important;
    color: #031f43 !important;
    background: linear-gradient(135deg, #EEF2FF, #FFF6ED) !important;
  }
  .la-fact strong {
    display: block !important;
    font-family: "Roboto", sans-serif !important;
    font-weight: 700 !important;
    font-size: 19px !important;
    color: #1F2937 !important;
  }
  .la-fact small {
    color: #4B5563 !important;
    font-size: 13px !important;
    display: block !important;
  }

  /* ── Section backgrounds ── */
  .section--soft { background: #F2F6FF !important; }
  .cream-color-bg { background-color: #F2EFEA !important; }
  .la-pop { background: #F2F6FF !important; padding: 60px 0 !important; }
  .la-occ { background: #ffffff !important; padding: 70px 0 !important; }
  .la-why { background: #F2F6FF !important; }
  .la-land { background: #F2F6FF !important; }
  .section { background: #ffffff !important; }

  /* ── Products grid ── */
  .products {
    display: grid !important;
    grid-template-columns: repeat(5, 1fr) !important;
    gap: 15px !important;
  }
  .pcard {
    background: #ffffff !important;
    border: 1px solid #E6ECF7 !important;
    border-radius: 16px !important;
    overflow: hidden !important;
    box-shadow: 0 2px 10px rgba(90,120,255,.06) !important;
    transition: transform .25s, box-shadow .25s !important;
    display: flex !important;
    flex-direction: column !important;
  }
  .pcard:hover { transform: translateY(-6px) !important; box-shadow: 0 24px 60px rgba(90,120,255,.15) !important; }
  .pcard__media { position: relative !important; aspect-ratio: 1/1 !important; overflow: hidden !important; background: #fff !important; }
  .pcard__media img { width: 100% !important; height: 100% !important; object-fit: cover !important; display: block !important; }
  .pcard__badge { position: absolute !important; top: 12px !important; left: 12px !important; background: #fff !important;
    color: #031f43 !important; font-size: .7rem !important; font-weight: 700 !important;
    padding: 5px 10px !important; border-radius: 100px !important; box-shadow: 0 2px 10px rgba(90,120,255,.06) !important; z-index: 2 !important; }
  .pcard__wish { position: absolute !important; top: 10px !important; right: 10px !important; width: 36px !important;
    height: 36px !important; border-radius: 50% !important; background: rgba(255,255,255,.92) !important;
    border: 0 !important; display: grid !important; place-items: center !important; color: #4B5563 !important;
    box-shadow: 0 2px 10px rgba(90,120,255,.06) !important; z-index: 2 !important; cursor: pointer !important; }
  .pcard__body { padding: 15px 16px 17px !important; display: flex !important; flex-direction: column !important; gap: 9px !important; flex: 1 !important; }
  .pcard__name { font-weight: 600 !important; font-size: 1rem !important; color: #1F2937 !important; line-height: 1.25 !important; }
  .pcard__foot { display: flex !important; align-items: center !important; justify-content: space-between !important; gap: 10px !important; margin-top: auto !important; }
  .pcard__price { font-weight: 800 !important; font-size: 1.1rem !important; color: #1F2937 !important; }
  .pcard__price s { font-weight: 500 !important; font-size: .82rem !important; color: #7B8794 !important; margin-left: 5px !important; }
  .pcard__add { display: inline-flex !important; align-items: center !important; justify-content: center !important;
    width: 36px !important; height: 36px !important; border-radius: 50% !important; border: 0 !important;
    background: #f0f4ff !important; cursor: pointer !important; transition: background .2s !important; flex: none !important; }
  .pcard__add:hover { background: #031f43 !important; color: #fff !important; }
  .pcard__add svg { color: #031f43 !important; }
  .pcard__add:hover svg { color: #fff !important; }

  @media (max-width: 1200px) { .products { grid-template-columns: repeat(4, 1fr) !important; } }
  @media (max-width: 900px)  { .products { grid-template-columns: repeat(2, 1fr) !important; } }
  @media (max-width: 500px)  { .products { grid-template-columns: 1fr !important; } }

  /* ── For Her / For Him split section ── */
  .split {
    display: grid !important;
    grid-template-columns: 1fr 1fr !important;
    gap: 20px !important;
    max-width: 1600px !important;
    margin-inline: auto !important;
    padding-inline: 50px !important;
    width: 100% !important;
  }
  .for-her-bg,
  .for-him-bg {
    position: relative !important;
    height: 300px !important;
    border-radius: 24px !important;
    overflow: hidden !important;
    display: flex !important;
    align-items: flex-end !important;
    min-width: 0 !important;
  }
  .for-her-bg::before {
    content: "" !important;
    position: absolute !important;
    inset: 0 !important;
    background: url('/catalog/view/theme/default/image/city_page/cake-for-her.webp') center/cover no-repeat !important;
    transition: transform .8s cubic-bezier(.25,.46,.45,.94) !important;
    transform: scale(1) !important;
    z-index: 0 !important;
  }
  .for-her-bg:hover::before { transform: scale(1.08) !important; }
  .for-him-bg::before {
    content: "" !important;
    position: absolute !important;
    inset: 0 !important;
    background: url('/catalog/view/theme/default/image/city_page/cake-for-him.webp') center/cover no-repeat !important;
    transition: transform .8s cubic-bezier(.25,.46,.45,.94) !important;
    transform: scale(1) !important;
    z-index: 0 !important;
  }
  .for-him-bg:hover::before { transform: scale(1.08) !important; }
  .for-her-bg > *,
  .for-him-bg > * { position: relative !important; z-index: 1 !important; }
  .for-her-bg h3,
  .for-him-bg h3 { color: #fff !important; }
  .split-card__inner {
    position: relative !important;
    z-index: 2 !important;
    padding: 28px 30px !important;
  }
  .split-card__inner h3 {
    font-weight: 700 !important;
    font-size: 1.7rem !important;
    color: #fff !important;
    margin: 4px 0 14px !important;
  }
  .btn--ghost-light {
    display: inline-flex !important;
    align-items: center !important;
    gap: 8px !important;
    color: #fff !important;
    background: rgba(255,255,255,.16) !important;
    border: 1.5px solid rgba(255,255,255,.55) !important;
    backdrop-filter: blur(4px) !important;
    font-weight: 700 !important;
    font-size: .95rem !important;
    padding: 11px 22px !important;
    border-radius: 100px !important;
  }
  .btn--ghost-light:hover { background: rgba(255,255,255,.28) !important; }



  /* ── Responsive: stack on mobile ── */
  @media (max-width: 1024px) {
    .wedding-cake-section {
      grid-template-columns: repeat(2, 1fr) !important;
    }
  }
  @media (max-width: 900px) {
    .la-hero__grid {
      grid-template-columns: 1fr !important;
      padding-inline: 20px !important;
    }
    .la-hero__media {
      order: -1 !important;
    }
  }
  @media (max-width: 560px) {
    .wedding-cake-section {
      grid-template-columns: 1fr !important;
    }
  }

</style>

<!-- ============ SVG ICON SPRITE (HugeIcons stroke-rounded style) ============ -->
<svg width="0" height="0" style="position:absolute" aria-hidden="true" focusable="false">
  <defs>
    <g id="ic-search"><circle cx="11" cy="11" r="7"/><path d="M20 20l-3.5-3.5"/></g>
    <g id="ic-cart"><path d="M3 4h2l2.4 12.2a1.5 1.5 0 0 0 1.5 1.2h8.6a1.5 1.5 0 0 0 1.5-1.2L21 8H6"/><circle cx="9.5" cy="20.5" r="1.4"/><circle cx="17.5" cy="20.5" r="1.4"/></g>
    <g id="ic-heart"><path d="M10.4107 19.9679C7.58942 17.8581 2 13.035 2 8.69463C2 5.82581 4.10526 3.50018 7 3.50018C8.5 3.50018 10 4.00018 12 6.00018C14 4.00018 15.5 3.50018 17 3.50018C19.8947 3.50018 22 5.82581 22 8.69463C22 13.035 16.4106 17.8581 13.5893 19.9679C12.6399 20.6778 11.3601 20.6778 10.4107 19.9679Z"></path>
</g>
    <g id="ic-user"><circle cx="12" cy="8" r="3.6"/><path d="M5 20c0-3.6 3.1-5.5 7-5.5s7 1.9 7 5.5"/></g>
    <g id="ic-pin"><path d="M12 21s7-5.5 7-11a7 7 0 1 0-14 0c0 5.5 7 11 7 11z"/><circle cx="12" cy="10" r="2.6"/></g>
    <g id="ic-menu"><path d="M3 6h18M3 12h18M3 18h18"/></g>
    <g id="ic-close"><path d="M6 6l12 12M18 6L6 18"/></g>
    <g id="ic-chev-down"><path d="M6 9l6 6 6-6"/></g>
    <g id="ic-chev-right"><path d="M9 6l6 6-6 6"/></g>
    <g id="ic-chev-left"><path d="M15 6l-6 6 6 6"/></g>
    <g id="ic-star"><path d="M12 3.5l2.6 5.3 5.9.9-4.3 4.1 1 5.8-5.2-2.7-5.2 2.7 1-5.8L3.5 9.7l5.9-.9z"/></g>
    <g id="ic-truck"><path d="M3 6h11v9H3zM14 9h4l3 3v3h-7z"/><circle cx="7" cy="18" r="1.6"/><circle cx="17.5" cy="18" r="1.6"/></g>
    <g id="ic-leaf"><path d="M5 19c0-8 6-13 14-13 0 8-5 14-13 14 0 0-1-3 1-6"/></g>
    <g id="ic-cake"><path d="M4 20h16M5 20v-7a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v7M3.5 14.5c1.2 0 1.2 1.5 2.4 1.5s1.2-1.5 2.4-1.5 1.2 1.5 2.4 1.5 1.2-1.5 2.4-1.5 1.2 1.5 2.4 1.5 1.2-1.5 2.4-1.5"/><path d="M12 7.5V4M12 4l1.2-1.2M12 4l-1.2-1.2"/></g>
    <g id="ic-gift"><rect x="4" y="9" width="16" height="11" rx="1.5"/><path d="M4 13h16M12 9v11M12 9c-1-3.5-5-3.5-5-1 0 1.5 2 1 5 1zM12 9c1-3.5 5-3.5 5-1 0 1.5-2 1-5 1z"/></g>
    <g id="ic-clock"><circle cx="12" cy="12" r="8.5"/><path d="M12 7.5V12l3 2"/></g>
    <g id="ic-phone"><path d="M5 4h3l1.5 4.5L7.5 10a11 11 0 0 0 5 5l1.5-2 4.5 1.5V18a2 2 0 0 1-2 2A14 14 0 0 1 4 6a2 2 0 0 1 1-2z"/></g>
    <g id="ic-mail"><rect x="3" y="5" width="18" height="14" rx="2"/><path d="M3.5 6.5L12 13l8.5-6.5"/></g>
    <g id="ic-percent"><circle cx="7.5" cy="7.5" r="2.5"/><circle cx="16.5" cy="16.5" r="2.5"/><path d="M19 5L5 19"/></g>
    <g id="ic-shield"><path d="M12 3l7 3v5c0 5-3.5 8-7 10-3.5-2-7-5-7-10V6z"/><path d="M9 12l2 2 4-4"/></g>
    <g id="ic-spark"><path d="M12 3v4M12 17v4M3 12h4M17 12h4M6 6l2.5 2.5M15.5 15.5L18 18M18 6l-2.5 2.5M8.5 15.5L6 18"/></g>
    <g id="ic-arrow-right"><path d="M5 12h14M13 6l6 6-6 6"/></g>
    <g id="ic-check"><path d="M5 12l4.5 4.5L19 7"/></g>
    <g id="ic-cursor"><path d="M5 4l13 6-6 2-2 6z"/></g>
    <g id="ic-box"><path d="M12 3l8 4.5v9L12 21l-8-4.5v-9z"/><path d="M4 7.5l8 4.5 8-4.5M12 12v9"/></g>
    <g id="ic-headset"><path d="M5 13v-1a7 7 0 0 1 14 0v1M5 13h2v5H6a2 2 0 0 1-2-2zM19 13h-2v5h1a2 2 0 0 0 2-2zM17 18a4 4 0 0 1-4 3"/></g>
    <g id="ic-instagram"><rect x="4" y="4" width="16" height="16" rx="4.5"/><circle cx="12" cy="12" r="3.6"/><circle cx="17" cy="7" r="0.6"/></g>
    <g id="ic-route"><circle cx="6" cy="19" r="2"/><circle cx="18" cy="5" r="2"/><path d="M6 17v-4a4 4 0 0 1 4-4h6"/></g>
    <g id="ic-wallet"><rect x="3" y="6" width="18" height="12" rx="2"/><path d="M3 10h18M7 14h3"/></g>
    <g id="ic-facebook"><path d="M14 8h2V5h-2.2C11.7 5 11 6.4 11 8v2H9v3h2v6h3v-6h2.2l.6-3H14V8.6c0-.4.2-.6.6-.6z"/></g>
    <g id="ic-youtube"><rect x="3" y="6" width="18" height="12" rx="3.5"/><path d="M10.5 9.5l4.5 2.5-4.5 2.5z"/></g>
    <g id="ic-whatsapp"><path d="M4 20l1.3-4A8 8 0 1 1 8 18.7zM9 8.5c-.3 0-.6.1-.8.4-.3.3-.9.9-.9 2.1s.9 2.4 1 2.6c.1.2 1.7 2.7 4.2 3.6 2 .7 2.5.6 2.9.5.5-.1 1.4-.6 1.6-1.2.2-.6.2-1 .1-1.2l-1.8-.8c-.2-.1-.5-.2-.7.1l-.6.8c-.1.2-.3.2-.5.1-.7-.3-1.4-.7-2.2-1.8-.2-.3 0-.4.1-.6l.4-.6c.1-.2 0-.4 0-.5l-.7-1.7c-.2-.5-.4-.4-.6-.4z"/></g>
  </defs>
</svg>

<main class="fg-city-page">
  <!-- Breadcrumbs -->
  <div class="fg-con" style="padding-top: 20px;">
    <ul class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ul>
  </div>

  <!-- ============ HERO ============ -->
  <section class="la-hero">
    <div class="la-hero__grid">
      <div class="la-hero__body">
        <div class="la-hero__loc" style="border: 1px solid rgba(255,255,255,0.2); padding: 5px 15px; border-radius: 20px; display: inline-flex; align-items: center; gap: 8px;">
          <svg class="ic"><use href="#ic-pin"/></svg> 
          <?php echo $area_name; ?>, <?php echo $city_name; ?> &bull; Pincode <?php echo !empty($pin_code) ? $pin_code : 'N/A'; ?>
        </div>
        
        <h1 class="la-hero__h1" style="color: #ff8696;">Online Cake Delivery in <br/><span style="color: #fff; font-style: italic;"><?php echo $area_name; ?>, <?php echo $city_name; ?></span></h1>
        
        <p class="la-hero__lead" style="max-width: 500px;">Fresh, 100% eggless cakes hand-delivered across <?php echo $area_name; ?> and nearby sectors - in as little as <strong>90 minutes</strong>. Same-day, fixed-time & midnight slots from your nearest Flavours Guru outlet.</p>

        <div class="la-hero__acts" style="display: flex; align-items: center; gap: 20px;">
          <a class="btn btn--solid" href="#popular" style="border-radius: 30px;">Order Cakes Now <svg class="ic"><use href="#ic-arrow-right"/></svg></a>
          <a href="tel:+918130961414" style="color: #fff; display: inline-flex; align-items: center; gap: 8px; font-weight: 600;"><svg class="ic"><use href="#ic-phone"/></svg> +91 8130 961 414</a>
        </div>

        <ul class="la-hero__trust">
          <li><svg class="ic"><use href="#ic-star"/></svg> <strong>4.8/5</strong> in <?php echo $city_name; ?></li>
          <li><svg class="ic"><use href="#ic-truck"/></svg> <strong>10,000+</strong> local deliveries</li>
          <li><svg class="ic"><use href="#ic-leaf"/></svg> <strong>100%</strong> eggless</li>
        </ul>
      </div>

      <div class="la-hero__media">
        <div class="la-hero__img" role="img" aria-label="Cake delivery in <?php echo $area_name; ?>">
          <img src="<?php echo $thumb; ?>" alt="Cake delivery in <?php echo $area_name; ?>" width="100%" height="100%" loading="eager" fetchpriority="high"/>
        </div>
        <div class="la-hero__badge">
          <div class="la-hero__badge-ic">
            <svg class="ic"><use href="#ic-clock"/></svg>
          </div>
          <span><strong>90-min express</strong><small>delivery in <?php echo $area_name; ?></small></span>
        </div>
      </div>
    </div>
  </section>

  <!-- ============ QUICK LOCAL FACTS BAND ============ -->
  <section class="la-facts" aria-label="Local delivery facts">
    <div class="la-facts__row">
      <div class="la-fact"><span class="la-fact__ic"><svg class="ic"><use href="#ic-pin"/></svg></span><div><strong><?php echo !empty($pin_code) ? $pin_code : 'N/A'; ?></strong><small>Delivery pincode</small></div></div>
      <div class="la-fact"><span class="la-fact__ic"><svg class="ic"><use href="#ic-clock"/></svg></span><div><strong>60–90 min</strong><small>Express delivery time</small></div></div>
      <div class="la-fact"><span class="la-fact__ic"><svg class="ic"><use href="#ic-route"/></svg></span><div><strong>2.3 km</strong><small>From nearest outlet</small></div></div>
      <div class="la-fact"><span class="la-fact__ic"><svg class="ic"><use href="#ic-truck"/></svg></span><div><strong>Midnight</strong><small>Delivery available</small></div></div>
    </div>
  </section>

  <!-- ============ Wedding Cakes ============ -->
  <section class="section cream-color-bg" aria-label="Wedding cakes near you">
    <div class="container">
      <div class="sec-head">
        <div><h2 class="sec-title">Wedding's Cake</h2></div>
        <a class="link-all" href="/wedding">View all <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></a>
      </div>
      <div class="wedding-cake-section">
        <?php
        $occ_colors = array('t-coral', 't-rose', 't-gold', 't-lilac');
        if ($wedding_products) {
          foreach ($wedding_products as $wi => $wp) {
            $color = isset($occ_colors[$wi]) ? $occ_colors[$wi] : 't-coral';
        ?>
        <a class="occ-card img-ph <?php echo $color; ?>" href="<?php echo $wp['href']; ?>">
          <img src="<?php echo $wp['thumb']; ?>" alt="<?php echo htmlspecialchars($wp['name'], ENT_QUOTES, 'UTF-8'); ?>" width="100%" height="100%" loading="lazy"/>
          <span class="occ-card__cap">
            <strong><?php echo htmlspecialchars($wp['name'], ENT_QUOTES, 'UTF-8'); ?></strong>
            <span>Shop Now → </span>
          </span>
        </a>
        <?php
          }
        } else {
        ?>
        <a class="occ-card img-ph t-coral" href="/wedding"><img src="/catalog/view/theme/default/image/city_page/wedding-cake-1.webp" alt="The Swirly Rosette Cake" width="100%" height="100%"/><span class="occ-card__cap"><strong>The Swirly Rosette Cake</strong><span>Shop Now → </span></span></a>
        <a class="occ-card img-ph t-rose" href="/wedding"><img src="/catalog/view/theme/default/image/city_page/wedding-cake-3.webp" alt="Raw Wedding Cake" width="100%" height="100%"/><span class="occ-card__cap"><strong>Raw Wedding Cake</strong><span>Shop Now → </span></span></a>
        <a class="occ-card img-ph t-gold" href="/wedding"><img src="/catalog/view/theme/default/image/city_page/wedding-cake-2.webp" alt="Elegenza Cake" width="100%" height="100%"/><span class="occ-card__cap"><strong>Elegenza Cake</strong><span>Shop Now → </span></span></a>
        <a class="occ-card img-ph t-lilac" href="/wedding"><img src="/catalog/view/theme/default/image/city_page/romantic-image.webp" alt="Romantic Love" width="100%" height="100%"/><span class="occ-card__cap"><strong>Romantic Love</strong><span>Shop Now → </span></span></a>
        <?php } ?>
      </div>
    </div>
  </section>

  <!-- ============ DELIVERY OPTIONS ============ -->
  <section class="la-deliver" aria-label="Delivery options in <?php echo $area_name; ?>">
    <div class="container">
      <div class="la-head">
        <span class="eyebrow">Delivery in <?php echo $area_name; ?></span>
        <h2 class="sec-title">Cake delivery options near you</h2>
        <p class="la-head__sub">Choose the slot that fits your celebration - every order is baked fresh and routed from the closest outlet to <?php echo $area_name; ?>.</p>
      </div>
      <div class="la-deliver__grid">
        <article class="la-dcard">
          <span class="la-dcard__ic t-coral"><svg class="ic"><use href="#ic-spark"/></svg></span>
          <h3>90-Minute Express</h3>
          <p>Last-minute plan? Get a fresh cake delivered to <?php echo $area_name; ?> in just 90 minutes.</p>
        </article>
        <article class="la-dcard">
          <span class="la-dcard__ic t-gold"><svg class="ic"><use href="#ic-truck"/></svg></span>
          <h3>Same-Day Delivery</h3>
          <p>Order before 6 PM and receive your cake the very same day, anywhere in <?php echo $area_name; ?>.</p>
        </article>
        <article class="la-dcard">
          <span class="la-dcard__ic t-rose"><svg class="ic"><use href="#ic-clock"/></svg></span>
          <h3>Fixed-Time Slots</h3>
          <p>Pick an exact 2-hour window so the cake arrives right on cue for the party.</p>
        </article>
        <article class="la-dcard">
          <span class="la-dcard__ic t-lilac"><svg class="ic"><use href="#ic-gift"/></svg></span>
          <h3>Midnight Surprise</h3>
          <p>Make birthdays magical with delivery between 11:00 PM and 11:59 PM.</p>
        </article>
      </div>
    </div>
  </section>

  <!-- ============ Anniversary Cakes ============ -->
  <section class="section" aria-label="Anniversary cakes">
    <div class="container">
      <div class="sec-head">
        <div><h2 class="sec-title">Anniversary Cakes</h2></div>
        <a class="link-all" href="/anniversary">View all <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></a>
      </div>
      <div class="hscroll" data-scroller>
        <?php
        $tchip_colors = array('t-coral', 't-rose', 't-gold', 't-peach', 't-lilac', 't-pink');
        if ($anniversary_products) {
          foreach ($anniversary_products as $ai => $ap) {
            $acolor = isset($tchip_colors[$ai]) ? $tchip_colors[$ai] : 't-coral';
        ?>
        <a class="tchip" href="<?php echo $ap['href']; ?>">
          <span class="tchip__img img-ph <?php echo $acolor; ?>">
            <img src="<?php echo $ap['thumb']; ?>" alt="<?php echo htmlspecialchars($ap['name'], ENT_QUOTES, 'UTF-8'); ?>" width="100%" height="100%" loading="lazy"/>
          </span>
          <span class="tchip__name"><?php echo htmlspecialchars($ap['name'], ENT_QUOTES, 'UTF-8'); ?></span>
        </a>
        <?php
          }
        } else {
        ?>
        <a class="tchip" href="/anniversary"><span class="tchip__img img-ph t-coral"><img src="/catalog/view/theme/default/image/city_page/Blossom-Flower-Cake.webp" alt="Blossom Flower Cake" width="100%" height="100%"/></span><span class="tchip__name">Blossom Flower Cake</span></a>
        <a class="tchip" href="/anniversary"><span class="tchip__img img-ph t-rose"><img src="/catalog/view/theme/default/image/city_page/Cubicle-Affair-Cake.webp" alt="Cubicle Affair Cake" width="100%" height="100%"/></span><span class="tchip__name">Cubicle Affair Cake</span></a>
        <a class="tchip" href="/anniversary"><span class="tchip__img img-ph t-gold"><img src="/catalog/view/theme/default/image/city_page/Forever-Yours-Cake.webp" alt="Forever Yours Cake" width="100%" height="100%"/></span><span class="tchip__name">Forever Yours Cake</span></a>
        <a class="tchip" href="/anniversary"><span class="tchip__img img-ph t-peach"><img src="/catalog/view/theme/default/image/city_page/Pearly-Imperial-Cake.webp" alt="Pearly Imperial Cake" width="100%" height="100%"/></span><span class="tchip__name">Pearly Imperial Cake</span></a>
        <a class="tchip" href="/anniversary"><span class="tchip__img img-ph t-lilac"><img src="/catalog/view/theme/default/image/city_page/Rose-In-The-Heart-Cake.webp" alt="Rose In The Heart Cake" width="100%" height="100%"/></span><span class="tchip__name">Rose In The Heart Cake</span></a>
        <a class="tchip" href="/anniversary"><span class="tchip__img img-ph t-pink"><img src="/catalog/view/theme/default/image/city_page/We-R-One-Cake.webp" alt="We R One Cake" width="100%" height="100%"/></span><span class="tchip__name">We R One Cake</span></a>
        <?php } ?>
      </div>
    </div>
  </section>

  <!-- ============ Baby shower Cakes ============ -->
  <section class="section section--soft" aria-label="Baby shower cakes">
    <div class="container">
      <div class="sec-head">
        <div><h2 class="sec-title">Baby shower Cakes</h2></div>
        <a class="link-all" href="/baby-shower-cakes">View all <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></a>
      </div>
      <div class="wedding-cake-section">
        <?php
        $bs_colors = array('t-coral', 't-rose', 't-gold', 't-lilac');
        if ($baby_shower_products) {
          foreach ($baby_shower_products as $bi => $bp) {
            $bcolor = isset($bs_colors[$bi]) ? $bs_colors[$bi] : 't-coral';
        ?>
        <a class="occ-card img-ph <?php echo $bcolor; ?>" href="<?php echo $bp['href']; ?>">
          <img src="<?php echo $bp['thumb']; ?>" alt="<?php echo htmlspecialchars($bp['name'], ENT_QUOTES, 'UTF-8'); ?>" width="100%" height="100%" loading="lazy"/>
          <span class="occ-card__cap">
            <strong><?php echo htmlspecialchars($bp['name'], ENT_QUOTES, 'UTF-8'); ?></strong>
            <span>Shop Now → </span>
          </span>
        </a>
        <?php
          }
        } else {
        ?>
        <a class="occ-card img-ph t-coral" href="/baby-shower-cakes"><img src="/catalog/view/theme/default/image/city_page/FGCAK37-1000x1000.webp" alt="Bundle Of Joy Cake" width="100%" height="100%"/><span class="occ-card__cap"><strong>Bundle Of Joy Cake</strong><span>Shop Now → </span></span></a>
        <a class="occ-card img-ph t-rose" href="/baby-shower-cakes"><img src="/catalog/view/theme/default/image/city_page/FGFDTCAKE945-1000x1000.webp" alt="Cute Baby Shower Cake" width="100%" height="100%"/><span class="occ-card__cap"><strong>Cute Baby Shower Cake</strong><span>Shop Now → </span></span></a>
        <a class="occ-card img-ph t-gold" href="/baby-shower-cakes"><img src="/catalog/view/theme/default/image/city_page/FGCCAKE883-1000x1000.webp" alt="Who Is Coming Home Cake" width="100%" height="100%"/><span class="occ-card__cap"><strong>Who Is Coming Home Cake</strong><span>Shop Now → </span></span></a>
        <a class="occ-card img-ph t-lilac" href="/baby-shower-cakes"><img src="/catalog/view/theme/default/image/city_page/FGFDTCAK76-1000x1000.webp" alt="Baby Welcome Cake" width="100%" height="100%"/><span class="occ-card__cap"><strong>Baby Welcome Cake</strong><span>Shop Now → </span></span></a>
        <?php } ?>
      </div>
    </div>
  </section>

  <!-- ============ CAKES BY PROFESSION ============ -->
  <section class="section section--tight" aria-label="Cakes by profession">
    <div class="container">
      <div class="sec-head">
        <div><span class="eyebrow">Made personal</span><h2 class="sec-title">Cakes by Profession</h2></div>
        <a class="link-all" href="/cakes-by-profession">View all <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></a>
      </div>
      <div class="hscroll" data-scroller>
        <?php foreach ($profession_cats as $pc) { ?>
        <a class="circle-cat" href="<?php echo $pc['href']; ?>">
          <span class="circle-cat__img img-ph <?php echo $pc['color']; ?>">
            <img src="<?php echo $pc['img']; ?>" alt="<?php echo htmlspecialchars($pc['name'], ENT_QUOTES, 'UTF-8'); ?>" width="100%" height="100%" loading="lazy"/>
          </span>
          <span><?php echo htmlspecialchars($pc['name'], ENT_QUOTES, 'UTF-8'); ?></span>
        </a>
        <?php } ?>
      </div>
    </div>
  </section>

  <!-- ============ FOR HER / FOR HIM ============ -->
  <section class="section section--tight added-space" aria-label="Gifts for her and him">
    <div class="split">
      <a class="split-card img-ph t-rose for-her-bg" href="/her" data-label="cake-for-her.webp">
        <div class="split-card__inner">
          <span class="eyebrow eyebrow--light">For Her</span>
          <h3>Cakes she'll adore</h3>
          <span class="btn btn--ghost-light">Shop For Her <svg class="ic ic--xs"><use href="#ic-arrow-right"/></svg></span>
        </div>
      </a>
      <a class="split-card img-ph t-coral for-him-bg" href="/cakes-for-him" data-label="cake-for-him.webp">
        <div class="split-card__inner">
          <span class="eyebrow eyebrow--light">For Him</span>
          <h3>Cakes he'll love</h3>
          <span class="btn btn--ghost-light">Shop For Him <svg class="ic ic--xs"><use href="#ic-arrow-right"/></svg></span>
        </div>
      </a>
    </div>
  </section>

  <!-- ============ POPULAR CAKES IN THIS AREA ============ -->
  <section class="la-pop" id="popular" aria-label="Popular cakes in <?php echo $area_name; ?>">
    <div class="container">
      <div class="la-head">
        <span class="eyebrow">Loved in <?php echo $area_name; ?></span>
        <h2 class="sec-title">Most-ordered cakes in your neighbourhood</h2>
        <p class="la-head__sub">These are the bestsellers customers in <?php echo $area_name; ?> and nearby sectors order most often.</p>
      </div>
      <!-- <div class="la-pop__grid">

        <article class="la-prod">
          <div class="la-prod__media img-ph t-coral" data-label="choco-truffle.jpg">
            <span class="la-prod__tag">Bestseller in <?php echo !empty($pin_code) ? $pin_code : $area_name; ?></span>
            <svg class="ph-ico"><use href="#ic-cake"/></svg>
          </div>
          <div class="la-prod__body">
            <span class="la-prod__rate"><svg class="ic ic--xs"><use href="#ic-star"/></svg> 4.9</span>
            <h3 class="la-prod__name">Choco Truffle Indulgence</h3>
            <div class="la-prod__foot"><span class="la-prod__price">₹899 <s>₹1,099</s></span><a class="la-prod__btn" href="#">Order</a></div>
          </div>
        </article>

        <article class="la-prod">
          <div class="la-prod__media img-ph t-rose" data-label="red-velvet.jpg">
            <span class="la-prod__tag">Trending</span>
            <svg class="ph-ico"><use href="#ic-heart"/></svg>
          </div>
          <div class="la-prod__body">
            <span class="la-prod__rate"><svg class="ic ic--xs"><use href="#ic-star"/></svg> 4.8</span>
            <h3 class="la-prod__name">Berry Bliss Red Velvet</h3>
            <div class="la-prod__foot"><span class="la-prod__price">₹1,049 <s>₹1,249</s></span><a class="la-prod__btn" href="#">Order</a></div>
          </div>
        </article>

        <article class="la-prod">
          <div class="la-prod__media img-ph t-gold" data-label="black-forest.jpg">
            <span class="la-prod__tag">Same-day</span>
            <svg class="ph-ico"><use href="#ic-cake"/></svg>
          </div>
          <div class="la-prod__body">
            <span class="la-prod__rate"><svg class="ic ic--xs"><use href="#ic-star"/></svg> 4.9</span>
            <h3 class="la-prod__name">Exotic Black Forest</h3>
            <div class="la-prod__foot"><span class="la-prod__price">₹749 <s>₹899</s></span><a class="la-prod__btn" href="#">Order</a></div>
          </div>
        </article>

        <article class="la-prod">
          <div class="la-prod__media img-ph t-peach" data-label="butterscotch.jpg">
            <span class="la-prod__tag">Midnight pick</span>
            <svg class="ph-ico"><use href="#ic-gift"/></svg>
          </div>
          <div class="la-prod__body">
            <span class="la-prod__rate"><svg class="ic ic--xs"><use href="#ic-star"/></svg> 4.7</span>
            <h3 class="la-prod__name">Golden Butterscotch Cake</h3>
            <div class="la-prod__foot"><span class="la-prod__price">₹799 <s>₹949</s></span><a class="la-prod__btn" href="#">Order</a></div>
          </div>
        </article>

      <!-- ============ POPULAR CAKES IN THIS AREA ============ -->
      <div class="la-pop__grid" id="dynamicProductGrid">
        <?php foreach ($products as $index => $product) { 
          if ($index >= 4) break; // Display only exactly 4 cakes
        ?>
        <article class="pcard">
          <a href="<?php echo $product['href']; ?>" style="display:block; text-decoration:none; color:inherit;">
            <div class="pcard__media">
              <?php if(isset($product['purchased']) && $product['purchased'] > 5){ ?>
                <span class="pcard__badge">Bestseller</span>
              <?php } ?>
              <button class="pcard__wish" aria-label="Add to wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>'); event.preventDefault();"><svg class="ic"><use href="#ic-heart"/></svg></button>
              <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" loading="lazy">
            </div>
            <div class="pcard__body">
              <h3 class="pcard__name"><?php echo $product['name']; ?></h3>
              <div class="pcard__foot">
                <span class="pcard__price">
                  <?php if (!$product['special']) { ?>
                    <?php echo $product['price']; ?>
                  <?php } else { ?>
                    <?php echo $product['special']; ?> <s><?php echo $product['price']; ?></s>
                  <?php } ?>
                </span>
                <button class="pcard__add" type="button" onclick="window.location='<?php echo $product['href']; ?>'; event.preventDefault();"><svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M12 4V20M20 12H4"></path></svg></button>
              </div>
            </div>
          </a>
        </article>
        <?php } ?>
      </div>
    </div>
  </section>

  <!-- ============ NEAREST OUTLET ============ -->
  <!-- <section class="la-outlet" aria-label="Nearest outlet for Sector 44">
    <div class="container la-outlet__grid">
      <div class="la-outlet__info">
        <span class="eyebrow">Your nearest outlet</span>
        <h2 class="sec-title">Flavours Guru - Sector 41 Outlet</h2>
        <p class="la-outlet__lead">The closest kitchen serving Sector 44, baking every cake fresh to order and dispatching within minutes.</p>

        <ul class="la-outlet__list">
          <li><span class="la-outlet__ic"><svg class="ic"><use href="#ic-building"/></svg></span><div><strong>Address</strong><span>Shop 12, Main Market, Sector 41, Noida, Uttar Pradesh 201303</span></div></li>
          <li><span class="la-outlet__ic"><svg class="ic"><use href="#ic-route"/></svg></span><div><strong>Distance to Sector 44</strong><span>Approx. 2.3 km · 60–90 minute delivery</span></div></li>
          <li><span class="la-outlet__ic"><svg class="ic"><use href="#ic-clock"/></svg></span><div><strong>Open hours</strong><span>Mon–Sun · 9:00 AM – 11:30 PM (midnight slots available)</span></div></li>
          <li><span class="la-outlet__ic"><svg class="ic"><use href="#ic-phone"/></svg></span><div><strong>Call to order</strong><span><a href="tel:+918130961414">+91 8130 961 414</a></span></div></li>
        </ul>

        <div class="la-outlet__serves">
          <strong>Also serves:</strong>
          <a href="/cakes-in-sector-45-noida">Sector 45</a>
          <a href="/cakes-in-sector-46-noida">Sector 46</a>
          <a href="/cakes-in-sector-47-noida">Sector 47</a>
          <a href="/cakes-in-sector-50-noida">Sector 50</a>
          <a href="/cakes-in-sector-51-noida">Sector 51</a>
        </div>
      </div>

      <div class="la-outlet__map img-ph t-mint" data-label="map-sector-41-outlet.jpg" role="img" aria-label="Map showing the Sector 41 outlet serving Sector 44">
        <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d14016.873072244272!2d77.35331955141174!3d28.563207757422546!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sShop%2012%2C%20Main%20Market%2C%20Sector%2041%2C%20Noida%2C%20Uttar%20Pradesh%20201303!5e0!3m2!1sen!2sin!4v1782733779167!5m2!1sen!2sin" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="strict-origin-when-cross-origin"></iframe>
        <div class="la-outlet__mappin"><svg class="ic"><use href="#ic-pin"/></svg>
          
        </div>
        <span class="la-outlet__maplabel"><svg class="ic ic--xs"><use href="#ic-map"/></svg> Outlet → Sector 44 · 2.3 km</span>
      </div>
    </div>
  </section> -->

  <!-- ============ LOCAL LANDMARKS & DELIVERY TIMES ============ -->
  <section class="la-land" aria-label="Local landmarks and delivery times">
    <div class="container">
      <div class="la-head">
        <span class="eyebrow">Hyperlocal coverage</span>
        <h2 class="sec-title">Landmarks we deliver to near <?php echo $area_name; ?></h2>
        <p class="la-head__sub">Estimated delivery times to popular spots and residential pockets around <?php echo $area_name; ?>, <?php echo $city_name; ?>.</p>
      </div>
      <div class="la-land__grid">
        <?php if (!empty($landmarks)) { ?>
          <?php foreach ($landmarks as $landmark) { ?>
          <div class="la-lcard">
            <span class="la-lcard__ic"><svg class="ic"><use href="#ic-pin"/></svg></span>
            <div><strong><?php echo $landmark['name']; ?></strong><small><?php echo $landmark['vicinity']; ?></small></div>
            <span class="la-lcard__time"><?php echo $landmark['time']; ?></span>
          </div>
          <?php } ?>
        <?php } else { ?>
          <div class="la-lcard"><span class="la-lcard__ic"><svg class="ic"><use href="#ic-pin"/></svg></span><div><strong>Worlds of Wonder</strong><small>Sector 38A</small></div><span class="la-lcard__time">25 min</span></div>
          <div class="la-lcard"><span class="la-lcard__ic"><svg class="ic"><use href="#ic-pin"/></svg></span><div><strong>The Great India Place</strong><small>Sector 18 Mall</small></div><span class="la-lcard__time">30 min</span></div>
          <div class="la-lcard"><span class="la-lcard__ic"><svg class="ic"><use href="#ic-pin"/></svg></span><div><strong>Botanical Garden Metro</strong><small>Sector 38</small></div><span class="la-lcard__time">22 min</span></div>
          <div class="la-lcard"><span class="la-lcard__ic"><svg class="ic"><use href="#ic-pin"/></svg></span><div><strong>DLF Mall of India</strong><small>Sector 18</small></div><span class="la-lcard__time">28 min</span></div>
          <div class="la-lcard"><span class="la-lcard__ic"><svg class="ic"><use href="#ic-pin"/></svg></span><div><strong>Kailash Hospital</strong><small>Sector 27</small></div><span class="la-lcard__time">26 min</span></div>
          <div class="la-lcard"><span class="la-lcard__ic"><svg class="ic"><use href="#ic-pin"/></svg></span><div><strong>Sector 50 Market</strong><small>Residential hub</small></div><span class="la-lcard__time">18 min</span></div>
          <div class="la-lcard"><span class="la-lcard__ic"><svg class="ic"><use href="#ic-pin"/></svg></span><div><strong>Logix City Centre</strong><small>Sector 32</small></div><span class="la-lcard__time">20 min</span></div>
          <div class="la-lcard"><span class="la-lcard__ic"><svg class="ic"><use href="#ic-pin"/></svg></span><div><strong>Amity University</strong><small>Sector 125</small></div><span class="la-lcard__time">35 min</span></div>
        <?php } ?>
      </div>
    </div>
  </section>

  <!-- ============ OCCASIONS SERVED ============ -->
  <section class="la-occ" aria-label="Occasions served in <?php echo $area_name; ?>">
    <div class="container">
      <div class="la-head">
        <span class="eyebrow">Every celebration</span>
        <h2 class="sec-title">Cakes for every occasion in <?php echo $area_name; ?></h2>
      </div>
      <div class="occ-grid">
        <a class="occ-card img-ph t-coral" href="/birthday" data-label="birthday.webp"><img src="/catalog/view/theme/default/image/city_page/birthday-image.webp" alt="Birthday Cakes" width="100%" height="100%"/><span class="occ-card__cap"><strong>Birthday Cakes</strong><span>View more <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></span></span></a>
        <a class="occ-card img-ph t-rose" href="/anniversary" data-label="anniversary.webp"><img src="/catalog/view/theme/default/image/city_page/anniversary-cake.webp" alt="Anniversary Cakes" width="100%" height="100%"/><span class="occ-card__cap"><strong>Anniversary Cakes</strong><span>View more <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></span></span></a>
        <a class="occ-card img-ph t-gold" href="/bachelorette-cake" data-label="bachelorette.webp"><img src="/catalog/view/theme/default/image/city_page/bachelorette-image.webp" alt="Bachelorette Party" width="100%" height="100%"/><span class="occ-card__cap"><strong>Bachelorette Party</strong><span>View more <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></span></span></a>
        <a class="occ-card img-ph t-lilac" href="/anniversary/love-anniversary" data-label="romantic.webp"><img src="/catalog/view/theme/default/image/city_page/romantic-image.webp" alt="Romantic Love" width="100%" height="100%"/><span class="occ-card__cap"><strong>Romantic Love</strong><span>View more <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></span></span></a>
        <a class="occ-card img-ph t-peach" href="/wedding" data-label="wedding.webp"><img src="/catalog/view/theme/default/image/city_page/wedding-image.webp" alt="Wedding Cakes" width="100%" height="100%"/><span class="occ-card__cap"><strong>Wedding Cakes</strong><span>View more <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></span></span></a>
        <a class="occ-card img-ph t-pink" href="/baby-shower-cakes" data-label="baby-shower.webp"><img src="/catalog/view/theme/default/image/city_page/baby-shower-image.webp" alt="Baby Shower" width="100%" height="100%"/><span class="occ-card__cap"><strong>Baby Shower</strong><span>View more <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></span></span></a>
      </div>
    </div>
  </section>

  <!-- ============ WHY ORDER LOCALLY ============ -->
  <section class="la-why" aria-label="Why order from Flavours Guru in Sector 44">
    <div class="container">
      <div class="la-head la-head--center">
        <span class="eyebrow">Why locals choose us</span>
        <h2 class="sec-title">The freshest cakes in <?php echo $area_name; ?>, <?php echo $city_name; ?></h2>
      </div>
      <div class="la-why__grid">
        <div class="la-wcard"><span class="la-wcard__ic"><svg class="ic"><use href="#ic-leaf"/></svg></span><h3>Baked fresh, never frozen</h3><p>Every cake for <?php echo $area_name; ?> is prepared after you order - soft, moist and pure-veg eggless.</p></div>
        <div class="la-wcard"><span class="la-wcard__ic"><svg class="ic"><use href="#ic-route"/></svg></span><h3>Closest outlet routing</h3><p>Orders are auto-assigned to the nearest kitchen for the fastest possible delivery.</p></div>
        <div class="la-wcard"><span class="la-wcard__ic"><svg class="ic"><use href="#ic-wallet"/></svg></span><h3>Cash on delivery</h3><p>Pay online or with cash at your doorstep - whatever is convenient for you.</p></div>
        <div class="la-wcard"><span class="la-wcard__ic"><svg class="ic"><use href="#ic-shield"/></svg></span><h3>On-time guarantee</h3><p>Live order tracking and a promise to deliver within your chosen slot, every time.</p></div>
      </div>
    </div>
  </section>

<?php if (!empty($faqs)) { ?>
<!-- FAQs -->
 <section class="fg-faq-section">
  <div class="fg-faq-container">

    <div class="fg-faq-left">
      <h2 class="sec-title">Frequently Asked Questions</h2>
      <p>
        Find answers about eggless cakes, same-day delivery, midnight delivery, custom cakes and online ordering at Flavours Guru.
      </p>
      <div class="">
        <img src="/catalog/view/theme/default/image/city_page/Avengers.webp" alt="Avengers" width="350" height="100%">
      </div>
    </div>

    <div class="fg-faq-right">
      <input type="checkbox" id="fg-faq-toggle">

      <div class="fg-faq-list">
          <?php $faq_count = 0; ?>
          <?php foreach ($faqs as $faq_item) { ?>
            <?php if ($faq_count == 5) { ?>
              <div class="fg-more-faqs">
            <?php } ?>

            <details <?php echo ($faq_count == 0) ? 'open' : ''; ?>>
              <summary><?php echo $faq_item['question']; ?></summary>
              <div><?php echo $faq_item['answer']; ?></div>
            </details>

            <?php $faq_count++; ?>
          <?php } ?>
          
          <?php if ($faq_count > 5) { ?>
            </div>
          <?php } ?>
      </div>

      <?php if ($faq_count > 5) { ?>
      <label for="fg-faq-toggle" class="fg-faq-btn">
        <span class="fg-read-more">Read More FAQs</span>
        <span class="fg-read-less">Show Less</span>
      </label>
      <?php } ?>
    </div>

  </div>
</section>
<!-- FAQs -->
<?php } ?>

  <!-- ============ TESTIMONIALS ============ -->
  <section class="section section--tight" aria-label="Customer reviews">
    <div class="container">
      <div class="sec-head sec-head--center">
        <div><span class="eyebrow">Real celebrations</span><h2 class="sec-title">What our customers say</h2>
        <p class="sec-sub"><strong>4.8/5</strong> average rating · 5000+ Google reviews</p></div>
      </div>
      <div class="hscroll hscroll--reviews" data-scroller>
        <figure class="review">
          <div class="review__stars">★★★★★</div>
          <blockquote>Cake was soo pretty and the flavours were too good &amp; fresh. I loved this cake — thank you Flavours Guru!</blockquote>
          <figcaption><span class="review__av t-coral">R</span><span><strong>Rani</strong><small>Verified · Google</small></span></figcaption>
        </figure>
        <figure class="review">
          <div class="review__stars">★★★★★</div>
          <blockquote>The taste was delicious, the decoration beautiful &amp; neatly done, and delivery was right on time. 10/10 service!</blockquote>
          <figcaption><span class="review__av t-rose">N</span><span><strong>Nidhi</strong><small>Verified · Google</small></span></figcaption>
        </figure>
        <figure class="review">
          <div class="review__stars">★★★★★</div>
          <blockquote>Design was exactly like the picture. Sweetness was just right. For all my future celebrations, only Flavours Guru!</blockquote>
          <figcaption><span class="review__av t-gold">S</span><span><strong>Sandy</strong><small>Verified · Google</small></span></figcaption>
        </figure>
        <figure class="review">
          <div class="review__stars">★★★★★</div>
          <blockquote>The cake looked very attractive, elegant and perfectly moist with a rich, delicious flavour.</blockquote>
          <figcaption><span class="review__av t-lilac">M</span><span><strong>Mintu</strong><small>Verified · Google</small></span></figcaption>
        </figure>
      </div>
    </div>
  </section>

<?php if (!empty($description)) { ?>
  <!-- ============ SEO CONTENT ============ -->
  <section class="seo" aria-label="About online cake delivery">
    <div class="container">
      <h1 class="seo__h1">Cake Delivery Online</h1>
      <div class="seo__body" id="seoBody">
          <?php echo $description; ?>
      </div>
      <button class="seo__toggle" id="seoToggle" aria-expanded="false">Read more <svg class="ic ic--xs"><use href="#ic-chev-down"/></svg></button>
    </div>
  </section>
<?php } ?>
  

</main>



<!-- flying-to-cart element -->
<span class="fly-dot" id="flyDot" aria-hidden="true"></span>


  <script src="/catalog/view/theme/default/stylesheet/js/app.js"></script>
  <script>
    $(document).ready(function(){      if($.fn.slick) {
        $('.review-slider-city').not('.slick-initialized').slick({
          infinite: true,
          slidesToShow: 3,
          slidesToScroll: 1,
          arrows: true,
          dots: false,
          responsive: [
            { breakpoint: 991, settings: { slidesToShow: 2 } },
            { breakpoint: 768, settings: { slidesToShow: 1 } }
          ]
        });
      }

      if($.fn.slick) {
        $('.treanding-slide').not('.slick-initialized').slick({
          infinite: false,
          slidesToShow: 4,
          slidesToScroll: 1,
          responsive: [
            { breakpoint: 1200, settings: { slidesToShow: 3, slidesToScroll: 1 } },
            { breakpoint: 991, settings: { slidesToShow: 3, slidesToScroll: 1 } },
            { breakpoint: 768, settings: { slidesToShow: 2, slidesToScroll: 1 } },
            { breakpoint: 480, settings: { slidesToShow: 2, slidesToScroll: 1 } }
          ]
        });
      }
    });
  </script>
</div>
<?php echo $footer; ?>

