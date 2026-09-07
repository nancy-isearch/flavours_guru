<?php echo $header; ?>

<link rel="stylesheet" href="/catalog/view/theme/default/stylesheet/city_scoped.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600;700;800&display=swap" rel="stylesheet">

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
    <g id="ic-facebook"><path d="M14 8h2V5h-2.2C11.7 5 11 6.4 11 8v2H9v3h2v6h3v-6h2.2l.6-3H14V8.6c0-.4.2-.6.6-.6z"/></g>
    <g id="ic-youtube"><rect x="3" y="6" width="18" height="12" rx="3.5"/><path d="M10.5 9.5l4.5 2.5-4.5 2.5z"/></g>
    <g id="ic-whatsapp"><path d="M4 20l1.3-4A8 8 0 1 1 8 18.7zM9 8.5c-.3 0-.6.1-.8.4-.3.3-.9.9-.9 2.1s.9 2.4 1 2.6c.1.2 1.7 2.7 4.2 3.6 2 .7 2.5.6 2.9.5.5-.1 1.4-.6 1.6-1.2.2-.6.2-1 .1-1.2l-1.8-.8c-.2-.1-.5-.2-.7.1l-.6.8c-.1.2-.3.2-.5.1-.7-.3-1.4-.7-2.2-1.8-.2-.3 0-.4.1-.6l.4-.6c.1-.2 0-.4 0-.5l-.7-1.7c-.2-.5-.4-.4-.6-.4z"/></g>
  </defs>
</svg>

<main class="fg-city-page">
<noscript>
  <style>
    .fg-city-page .seo__body {
      max-height: none !important;
      overflow: visible !important;
    }
    .fg-city-page .seo__body::after {
      display: none !important;
    }
    .fg-city-page .seo__toggle {
      display: none !important;
    }
    .fg-city-page .fg-more-faqs {
      display: block !important;
    }
    .fg-city-page .fg-faq-btn {
      display: none !important;
    }
  </style>
</noscript>

<section class="hero" aria-label="Featured promotions">
      <div class="hero__slider" id="heroSlider">
        <div class="hero__track" id="heroTrack">
          <article class="slide t-coral">
            <img src="catalog/view/theme/default/image/city_page/side-1.webp" alt="professional" class="slide__media" data-label="hero-birthday.webp" width="100%"/>
          </article>

          <!-- ============<article class="slide t-coral"> ============ -->
            <!-- ============<img src="catalog/view/theme/default/image/city_page/anniversary-cake-banner.webp" alt="Anniversary Cake" class="slide__media" data-label="hero-birthday.webp" width="100%"/> ============ -->
          <!-- ============</article> ============ -->

          <article class="slide t-coral">
            <img src="catalog/view/theme/default/image/city_page/side-2.webp" alt="Birthday" class="slide__media" data-label="hero-birthday.webp" width="100%"/>
          </article>
        </div>
        <button class="hero__nav hero__nav--prev" id="heroPrev" aria-label="Previous slide"><svg class="ic"><use href="#ic-chev-left"/></svg></button>
        <button class="hero__nav hero__nav--next" id="heroNext" aria-label="Next slide"><svg class="ic"><use href="#ic-chev-right"/></svg></button>
        <div class="hero__dots" id="heroDots" role="tablist" aria-label="Slide selector"></div>
      </div>
  </section>

  <!-- Breadcrumbs -->
  <div class="fg-con" style="padding-top: 15px; padding-bottom: 10px;">
    <h1 class="sec-title" style="margin: 0 0 5px 0; text-align: left; font-size: 28px;"><?php echo $heading_title; ?></h1>
    <ul class="breadcrumb" style="margin-bottom: 0;">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <!-- ============ QUICK CATEGORY CIRCLES ============ -->
  <section class="quickcats" aria-label="Shop by category">
    <div class="fg-con quickcats__row">
      <?php if (!empty($home_quickcats)) { ?>
        <?php 
          $static_imgs = array('customise-cake.webp', 'combos.webp', 'birthday-cake.webp', 'anniversary.webp', 'fresh-arrivals.webp', 'heart-shape.webp', 'gifts.webp', 'under-600.webp');
          $colors = array('t-coral', 't-pink', 't-gold', 't-rose', 't-peach', 't-lilac', 't-mint'); 
          $i = 0; 
        ?>
        <?php foreach ($home_quickcats as $cat) { ?>
          <?php $img = $static_imgs[$i % count($static_imgs)]; ?>
          <a class="qcat" href="<?php echo $cat['href']; ?>">
            <span class="qcat__img <?php echo $colors[$i % count($colors)]; ?>">
              <img src="catalog/view/theme/default/image/city_page/<?php echo $img; ?>" alt="<?php echo $cat['title']; ?>" width="100%" height="100%" />
            </span>
            <span><?php echo $cat['title']; ?></span>
          </a>
          <?php $i++; ?>
        <?php } ?>
      <?php } ?>
    </div>
  </section>

  
  <!-- ============ USP STRIP ============ -->
  <section class="usp" aria-label="Why Flavours Guru">
    <div class="fg-con usp__row">
      <div class="usp__item"><span class="usp__ic"><svg class="ic"><use href="#ic-cake"/></svg></span><div><strong>5000+ Cakes</strong><small>For every occasion &amp; theme</small></div></div>
      <div class="usp__item"><span class="usp__ic"><svg class="ic"><use href="#ic-star"/></svg></span><div><strong>Rated 4.8 / 5</strong><small>Based on 5000+ reviews</small></div></div>
      <div class="usp__item"><span class="usp__ic"><svg class="ic"><use href="#ic-leaf"/></svg></span><div><strong>100% Eggless</strong><small>Fresh &amp; pure ingredients</small></div></div>
      <div class="usp__item"><span class="usp__ic"><svg class="ic"><use href="#ic-truck"/></svg></span><div><strong>Fast Delivery</strong><small>Same-day &amp; midnight slots</small></div></div>
    </div>
  </section>

  <!-- ============ TRENDING NOW ============ -->
  <section class="section" aria-label="Trending cakes">
    <div class="fg-con">
      <div class="sec-head">
        <div><h2 class="sec-title">Trending Now</h2></div>
        <a class="link-all" href="/trending-cakes">View all <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></a>
      </div>
      <div class="hscroll" data-scroller>
        <?php if (!empty($home_trending)) { ?>
          <?php 
            $static_imgs = array('surprices-cake.webp', 'floral.webp', 'designer.webp', 'fault-line.webp', 'balloon.webp', 'isomalt.webp');
            $colors = array('t-coral', 't-rose', 't-gold', 't-peach', 't-lilac', 't-pink'); 
            $i=0; 
          ?>
          <?php foreach ($home_trending as $item) { ?>
            <?php $img = $static_imgs[$i % count($static_imgs)]; ?>
            <a class="tchip" href="<?php echo $item['href']; ?>">
              <span class="tchip__img img-ph <?php echo $colors[$i % count($colors)]; ?>">
                <img src="catalog/view/theme/default/image/city_page/<?php echo $img; ?>" alt="<?php echo $item['title']; ?>" width="100%" height="100%" />
              </span>
              <span class="tchip__name"><?php echo $item['title']; ?></span>
            </a>
            <?php $i++; ?>
          <?php } ?>
        <?php } ?>
      </div>
    </div>
  </section>

  <!-- ============ OFFERS / COUPONS ROW (new) ============ -->
  <!-- <section class="section section--tight" aria-label="Offers and coupons">
    <div class="fg-con">
      <div class="sec-head">
        <div><span class="eyebrow">Save more</span><h2 class="sec-title">Today's Sweet Offers</h2></div>
      </div>
      <div class="coupons">
        <div class="coupon t-coral">
          <div class="coupon__ic"><svg class="ic"><use href="#ic-percent"/></svg></div>
          <div class="coupon__body"><strong>12% OFF</strong><span>On your first cake order</span><code class="coupon__code" data-code="CAKE12">CAKE12 <small>tap to copy</small></code></div>
        </div>
        <div class="coupon t-rose">
          <div class="coupon__ic"><svg class="ic"><use href="#ic-clock"/></svg></div>
          <div class="coupon__body"><strong>FREE Midnight Delivery</strong><span>On orders above ₹999</span><code class="coupon__code" data-code="MIDNIGHT">MIDNIGHT <small>tap to copy</small></code></div>
        </div>
        <div class="coupon t-gold">
          <div class="coupon__ic"><svg class="ic"><use href="#ic-gift"/></svg></div>
          <div class="coupon__body"><strong>₹150 OFF Combos</strong><span>Cake + flowers &amp; more</span><code class="coupon__code" data-code="COMBO150">COMBO150 <small>tap to copy</small></code></div>
        </div>
      </div>
    </div>
  </section> -->
  

  <!-- ============ BESTSELLING CAKES ============ -->
  <section class="section section--soft" aria-label="Bestselling cakes">
    <div class="fg-con">
      <div class="sec-head">
        <div><span class="eyebrow">Loved by thousands</span><h2 class="sec-title">Bestselling Cakes</h2></div>
      </div>
      <div class="treanding-slide" style="margin: 0 -10px; padding-bottom: 20px;">
        <?php if (!empty($home_bestselling)) { ?>
          <?php 
            $static_imgs = array('FGCCAKE562.webp', 'FGCCAKE722-1000x1000.webp', 'FGCCAKE792.webp', 'FGCCAKE726.webp', 'FGCCAKE735-1000x1000.webp');
            $badges = array('Bestseller', 'New', 'Trending', 'Premium'); 
            $i=0; 
          ?>
          <?php foreach ($home_bestselling as $item) { ?>
          <?php $img = $static_imgs[$i % count($static_imgs)]; ?>
          <div class="slide" style="padding: 0 10px;">
            <article class="pcard" style="height: 100%;">
              <div class="pcard__media">
                <span class="pcard__badge"><?php echo $badges[$i % count($badges)]; ?></span>
                <a href="<?php echo $item['href']; ?>">
                  <img src="catalog/view/theme/default/image/city_page/<?php echo $img; ?>" alt="<?php echo $item['name']; ?>" loading="lazy" />
                </a>
              </div>
              <div class="pcard__body">
                <a href="<?php echo $item['href']; ?>"><h3 class="pcard__name"><?php echo $item['name']; ?></h3></a>
                <div class="pcard__foot">
                  <span class="pcard__price">
                    <?php if (!$item['special']) { ?>
                    <?php echo $item['price']; ?>
                    <?php } else { ?>
                    <?php echo $item['special']; ?> <s><?php echo $item['price']; ?></s>
                    <?php } ?>
                  </span>
                  <button class="pcard__add" type="button" onclick="cart.add('<?php echo $item['product_id']; ?>', '1');"><svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M12 4V20M20 12H4"></path></svg></button>
                </div>
              </div>
            </article>
          </div>
          <?php $i++; } ?>
        <?php } else { ?>
          <p style="padding-left:10px;">No products found.</p>
        <?php } ?>
      </div>
    </div>
  </section>


  <!-- ============ CAKES BY PROFESSION ============ -->
  <section class="section section--tight" aria-label="Cakes by profession">
    <div class="fg-con">
      <div class="sec-head">
        <div><span class="eyebrow">Made personal</span><h2 class="sec-title">Cakes by Profession</h2></div>
        <a class="link-all" href="/cakes-by-profession">View all <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></a>
      </div>
      <div class="hscroll" data-scroller>
        <?php if (!empty($home_profession)) { ?>
          <?php 
            $static_imgs = array('doctor.webp', 'blogger.webp', 'engineer.webp', 'teacher.webp', 'entrepreneur.webp', 'makeup.webp', 'soldier.webp', 'traveler.webp');
            $colors = array('t-coral', 't-peach', 't-gold', 't-lilac', 't-rose', 't-pink', 't-mint'); 
            $i=0; 
          ?>
          <?php foreach ($home_profession as $item) { ?>
            <?php $img = $static_imgs[$i % count($static_imgs)]; ?>
            <a class="circle-cat" href="<?php echo $item['href']; ?>">
              <span class="circle-cat__img img-ph <?php echo $colors[$i % count($colors)]; ?>">
                <img src="catalog/view/theme/default/image/city_page/<?php echo $img; ?>" alt="<?php echo $item['title']; ?>" width="100%" height="100%" />
              </span>
              <span><?php echo $item['title']; ?></span>
            </a>
            <?php $i++; ?>
          <?php } ?>
        <?php } ?>
      </div>
    </div>
  </section>
  <!-- ============ FOR HER / FOR HIM ============ -->
  <section class="section section--tight added-space" aria-label="Gifts for her and him">
    <div class="fg-con split">
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

  <!-- ============ SHOP BY OCCASIONS ============ -->
  <section class="section section--soft" aria-label="Shop by occasion">
    <div class="fg-con">
      <div class="sec-head">
        <div><span class="eyebrow">Every celebration</span><h2 class="sec-title">Shop by Occasion</h2></div>
      </div>
      <div class="occ-grid">
        <?php if (!empty($home_occasions)) { ?>
          <?php 
            $static_imgs = array('birthday-image.webp', 'anniversary-cake.webp', 'bachelorette-image.webp', 'romantic-image.webp', 'wedding-image.webp', 'baby-shower-image.webp');
            $colors = array('t-coral', 't-rose', 't-gold', 't-peach'); 
            $i=0; 
          ?>
          <?php foreach ($home_occasions as $item) { ?>
            <?php $img = $static_imgs[$i % count($static_imgs)]; ?>
            <a class="occ-card img-ph <?php echo $colors[$i % count($colors)]; ?>" href="<?php echo $item['href']; ?>">
              <img src="catalog/view/theme/default/image/city_page/<?php echo $img; ?>" alt="<?php echo $item['title']; ?>" width="100%" height="100%"/>
              <span class="occ-card__cap">
                <strong><?php echo $item['title']; ?></strong>
                <span>View more <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></span>
              </span>
            </a>
            <?php $i++; ?>
          <?php } ?>
        <?php } ?>
      </div>
    </div>
  </section>

  <!-- ============ CAKES FOR KIDS ============ -->
  <section class="section" aria-label="Cakes for kids">
    <div class="fg-con"> 
      <div class="sec-head">
        <div><span class="eyebrow">Little ones</span><h2 class="sec-title">Cakes for Kids</h2></div>
      </div>
      <div class="kids-grid">
        <?php if (!empty($home_kids)) { ?>
          <?php 
            $static_imgs = array('boy-cake.webp', 'girl-cake.webp', 'first-birthday.webp', 'half-month-cake.webp');
            $i=0; 
          ?>
          <?php foreach ($home_kids as $item) { ?>
            <?php $img = $static_imgs[$i % count($static_imgs)]; ?>
            <a class="kid-card" href="<?php echo $item['href']; ?>">
              <span class="kid-card__img"><img src="catalog/view/theme/default/image/city_page/<?php echo $img; ?>" alt="<?php echo $item['title']; ?>" width="100%" height="100%" loading="lazy"/></span>
              <span class="kid-card__cap"><?php echo $item['title']; ?></span>
              <span class="kid-card__btn">View All</span>
            </a>
            <?php $i++; ?>
          <?php } ?>
        <?php } ?>
      </div>
    </div>
  </section>

  <!-- ============ CARTOON CAKES ============ -->
  <section class="section section--soft" aria-label="Cartoon cakes">
    <div class="fg-con">
      <div class="sec-head">
        <div><span class="eyebrow">For the kids at heart</span><h2 class="sec-title">Cartoon Cakes</h2></div>
        <a class="btn--solid-red" href="/cartoon-cakes">View All</a>
      </div>
      <div class="hscroll" data-scroller>
        <?php if (!empty($home_cartoon)) { ?>
          <?php 
            $static_imgs = array('unicorn.webp', 'Peppa-Pig.webp', 'Avengers.webp', 'Masha-Bear.webp', 'Dinosaur.webp', 'Shin-Chan.webp', 'panda.webp', 'Barbie.webp');
            $colors = array('t-lilac', 't-pink', 't-gold', 't-coral', 't-mint', 't-peach', 't-rose'); 
            $i=0; 
          ?>
          <?php foreach ($home_cartoon as $item) { ?>
            <?php $img = $static_imgs[$i % count($static_imgs)]; ?>
            <a class="circle-cat" href="<?php echo $item['href']; ?>">
              <span class="circle-cat__img img-ph <?php echo $colors[$i % count($colors)]; ?>">
                <img src="catalog/view/theme/default/image/city_page/<?php echo $img; ?>" alt="<?php echo $item['title']; ?>" width="100%" height="100%" />
              </span>
              <span><?php echo $item['title']; ?></span>
            </a>
            <?php $i++; ?>
          <?php } ?>
        <?php } ?>
      </div>
    </div>
  </section>

  <!-- ============ PROMO BANNER (eggless) ============ -->                      
  <section class="section section--tight promossion-banner" aria-label="Eggless promise">
    <div class="fg-con">
      <div class="promo" data-label="eggless-promo.webp">
        <div class="promo__inner">
          <span class="eyebrow">100% Pure Veg</span>
          <h2 class="promo__title">Every Cake is Freshly Baked & Eggless</h2>
          <p>Premium ingredients, no compromise on taste — a perfect treat for everyone.</p>
          <a class="btn btn--solid" href="/">Order Now <svg class="ic ic--xs"><use href="#ic-arrow-right"/></svg></a>
        </div>
      </div>
    </div>
  </section>

  <!-- ============ CAKES BY TRAITS ============ -->
  <section class="section" aria-label="Cakes by traits">
    <div class="fg-con">
      <div class="sec-head">
        <div><span class="eyebrow">Their personality</span><h2 class="sec-title">Cakes by Traits</h2></div>
        <a class="btn--solid-red" href="/cake-by-traits">View All</a>
      </div>     

      <div class="hscroll" data-scroller>
        <?php if (!empty($home_traits)) { ?>
          <?php 
            $static_imgs = array('lazy.webp', 'gamer.webp', 'shopping.webp', 'gym.webp', 'car.webp', 'football.webp', 'foodie.webp', 'Workholic.webp');
            $colors = array('t-gold', 't-lilac', 't-pink', 't-coral', 't-peach', 't-mint', 't-rose'); 
            $i=0; 
          ?>
          <?php foreach ($home_traits as $item) { ?>
            <?php $img = $static_imgs[$i % count($static_imgs)]; ?>
            <a class="circle-cat" href="<?php echo $item['href']; ?>">
              <span class="circle-cat__img img-ph <?php echo $colors[$i % count($colors)]; ?>">
                <img src="catalog/view/theme/default/image/city_page/<?php echo $img; ?>" alt="<?php echo $item['title']; ?>" width="100%" height="100%" />
              </span>
              <span><?php echo $item['title']; ?></span>
            </a>
            <?php $i++; ?>
          <?php } ?>
        <?php } ?>
      </div>
    </div>
  </section>

  <!-- ============ SHOP BY FLAVOUR ============ -->
  <section class="section section--soft" aria-label="Shop by flavour">
    <div class="fg-con">
      <div class="sec-head">
        <div><span class="eyebrow">Taste first</span><h2 class="sec-title">Shop by Flavour</h2></div>
      </div>

      <div class="flav-grid">
        <?php if (!empty($home_flavours)) { ?>
          <?php 
            $static_imgs = array('Rich-Chocolate.webp', 'Premium-Red-Velvet.webp', 'Exotic-Black-Forest.webp', 'Sweet-Pineapple.webp', 'Cravy-Fruit-Cake.webp', 'Fab-Blueberry.webp', 'Yummy-Vanilla.webp', 'Yay-Butterscotch.webp');
            $colors = array('t-gold', 't-peach', 't-lilac', 't-pink', 't-mint', 't-gold'); 
            $i=0; 
          ?>
          <?php foreach ($home_flavours as $item) { ?>
            <?php $img = $static_imgs[$i % count($static_imgs)]; ?>
            <a class="flav-card img-ph <?php echo $colors[$i % count($colors)]; ?>" href="<?php echo $item['href']; ?>">
              <img src="catalog/view/theme/default/image/city_page/<?php echo $img; ?>" alt="<?php echo $item['title']; ?>" width="100%" height="100%"/>
              <span class="flav-card__cap"><?php echo $item['title']; ?></span>
            </a>
            <?php $i++; ?>
          <?php } ?>
        <?php } ?>
      </div>
    </div>
  </section>

  <!-- ============ CUSTOMISATION CTA ============ -->
  <section class="section section--tight" aria-label="Customise your cake">
    <div class="fg-con">
      <div class="custom-cta">
        <div class="custom-cta__media img-ph t-rose" data-label="customise.webp" role="img" aria-label="Customised cake"><img src="/catalog/view/theme/default/image/city_page/bachelorette-image2.webp" alt="Customised cake" width="100%" height="100%"/></div>
        <div class="custom-cta__text">
          <span class="eyebrow">Make it yours</span>
          <h2 class="sec-title">Design your dream cake with our customisation studio</h2>
          <p>Upload a photo, pick a theme, choose the flavour &amp; size — our master bakers turn your idea into an edible masterpiece.</p>
          <a class="btn btn--solid" href="/customize">Start Customising <svg class="ic ic--xs"><use href="#ic-arrow-right"/></svg></a>
        </div>
      </div>
    </div>
  </section>

  <!-- ============ CORPORATE & BULK (new) ============ -->
  <!-- <section class="section section--dark" aria-label="Corporate and bulk orders">
    <div class="fg-con corp">
      <div class="corp__text">
        <span class="eyebrow eyebrow--light">For businesses</span>
        <h2 class="sec-title sec-title--light">Corporate & bulk cake orders, made effortless</h2>
        <p>Celebrate employee birthdays, work anniversaries, festivals &amp; client gifting at scale — with dedicated account support, GST invoicing &amp; pan-NCR delivery.</p>
        <ul class="corp__list">
          <li><svg class="ic ic--xs"><use href="#ic-check"/></svg> Volume pricing &amp; custom branding</li>
          <li><svg class="ic ic--xs"><use href="#ic-check"/></svg> Scheduled &amp; recurring deliveries</li>
          <li><svg class="ic ic--xs"><use href="#ic-check"/></svg> Dedicated relationship manager</li>
        </ul>
        <div class="corp__actions">
          <a class="btn btn--solid" href="#">Enquire Now <svg class="ic ic--xs"><use href="#ic-arrow-right"/></svg></a>
          <a class="btn btn--ghost-light" href="tel:+918130961414"><svg class="ic ic--xs"><use href="#ic-headset"/></svg> Talk to us</a>
        </div>
      </div>
      <div class="corp__media img-ph t-gold" data-label="corporate.webp" role="img" aria-label="Corporate cakes"><svg class="ph-ico"><use href="#ic-box"/></svg></div>
    </div>
  </section> -->

  <!-- Localities Of Delhi Where We Deliver -->
<?php if (!empty($category_localities)) { ?>
  <section class="fg-localities" aria-labelledby="fg-localities-title">
    <div class="fg-localities__wrap">
      <?php 
        $extracted_city = trim(preg_replace('/^(Online Cake Delivery in|Cakes Online in|Cake Delivery in|Cakes Shop in|Cakes in)\s+/i', '', $heading_title)); 
      ?>
      <div class="fg-localities__head">
        <span class="fg-eyebrow">Fast Cake Delivery Across <?php echo $extracted_city; ?></span>
        <h2 class="sec-title" id="fg-localities-title">
          Localities Of <?php echo $extracted_city; ?> Where Flavours Guru Provides Cake Delivery In <?php echo $extracted_city; ?>
        </h2>
        <p>
          Order fresh eggless cakes online and enjoy quick doorstep delivery across popular <?php echo $extracted_city; ?> localities.
        </p>
      </div>

      <div class="fg-location-grid">
        <?php foreach ($category_localities as $region_name => $localities) { ?>
        <div class="fg-location-card">
          <ul>
            <?php foreach ($localities as $locality) { ?>
            <li><a href="<?php echo $locality['href']; ?>"><?php echo $locality['area_name']; ?></a><span><?php echo $locality['pin_code']; ?></span></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>

      <p class="fg-localities__note">
        And many more areas are served with same-day and midnight cake delivery.
      </p>
    </div>
  </section>
<?php } ?>
  <!-- Localities Of Delhi Where We Deliver -->

<!-- FAQs -->
<?php if (!empty($category_faqs)) { ?>
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
          <?php foreach ($category_faqs as $faq) { ?>
            <?php if ($faq_count == 5) { ?>
              <div class="fg-more-faqs">
            <?php } ?>
            <details open>
              <summary><?php echo $faq['question']; ?></summary>
              <p><?php echo nl2br($faq['answer']); ?></p>
            </details>
            <?php $faq_count++; ?>
          <?php } ?>
          <?php if ($faq_count > 5) { ?>
              </div>
          <?php } ?>
      </div>

      <script>
        // If JS is enabled, close all FAQs except the first one.
        document.addEventListener('DOMContentLoaded', function() {
          var details = document.querySelectorAll('.fg-faq-list details');
          for (var i = 1; i < details.length; i++) {
            details[i].removeAttribute('open');
          }
        });
      </script>

      <?php if (!empty($category_faqs) && count($category_faqs) > 5) { ?>
      <label for="fg-faq-toggle" class="fg-faq-btn">
        <span class="fg-read-more">Read More FAQs</span>
        <span class="fg-read-less">Show Less</span>
      </label>
      <?php } ?>
    </div>

  </div>
</section>
<?php } ?>
<!-- FAQs -->

  <!-- ============ TESTIMONIALS ============ -->
  <section class="section" aria-label="Customer reviews" style="background:#fff;">
    <div class="fg-con">
      <div class="sec-head sec-head--center mb-40">
        <h2 class="sec-title" style="color:#111; text-align:center;">What our customers say about us!</h2>
      </div>
      
      <div class="review-slider-city" style="padding: 0 40px;">
        <?php if(isset($allreviews) && $allreviews['cnt'] > 0){ ?>
          <?php $x = 0; foreach ($allreviews['all'] as $value) { if($x == 5) { break; } ?>
          <div class="slide" style="padding:10px;">
            <div style="background:#fff; border:1px solid #eaeaea; box-shadow:0 4px 12px rgba(0,0,0,0.05); border-radius:12px; padding:30px 20px; color:#333; text-align:center; height:100%; display:flex; flex-direction:column; justify-content:space-between;">
              <div>
                <img src="catalog/view/theme/default/image/Home/new-images/google-img.webp" alt="Google" style="margin:0 auto 20px auto; width:80px;" loading="lazy">
                <p style="font-size:14px; line-height:1.6; margin-bottom:15px; color:#444; font-weight:400;"><?php echo ucfirst($value['text']); ?></p>
                <p style="font-size:12px; color:#888; margin-bottom:20px;"><?php echo date('d-M-Y h.i A', strtotime($value['date_added'])); ?></p>
              </div>
              <div style="display:flex; align-items:center; justify-content:center; border-top:1px solid #eaeaea; padding-top:20px; text-align:left;">
                <?php 
                  $cus_first_char = $value['author'];
                  $first = substr($cus_first_char, 0, 1);
                  $colors = ['#FC5B62', '#F59E0B', '#10B981', '#3B82F6', '#8B5CF6'];
                  $bgColor = $colors[$x % count($colors)];
                ?>
                <div style="width:40px; height:40px; border-radius:50%; background:<?php echo $bgColor; ?>; color:#fff; display:flex; align-items:center; justify-content:center; font-weight:bold; font-size:18px; margin-right:15px; flex-shrink:0;">
                  <?php echo strtoupper($first); ?>
                </div>
                <div>
                  <h4 style="margin:0 0 5px 0; color:#111; font-size:16px; font-weight:600;"><?php echo ucwords($value['author']); ?></h4>
                  <div style="color:#FBBF24; font-size:14px;">
                    <span style="color:#333; font-weight:bold; margin-right:5px;"><?php echo round($value['rating']); ?>/5</span>
                    <?php for($i=1; $i<=5; $i++) { ?>
                      <?php if($i <= round($value['rating'])) { ?>★<?php } else { ?>☆<?php } ?>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <?php $x++; } ?>
        <?php } ?>
      </div>
    </div>
  </section>
  <!-- ============ SEO CONTENT ============ -->
  <section class="seo" aria-label="About online cake delivery">
    <div class="fg-con">
      <?php 
        $extracted_city_seo = trim(preg_replace('/^(Online Cake Delivery in|Cakes Online in|Cake Delivery in|Cakes Shop in|Cakes in)\s+/i', '', $heading_title)); 
      ?>
      <h2 class="seo__h1">Order Delightful Cakes Online in <?php echo $extracted_city_seo; ?> via FlavoursGuru</h2>
      <input type="checkbox" id="seoToggleCheck" />
      <div class="seo__body" id="seoBody">
        <?php if(!empty($description)) { echo html_entity_decode($description, ENT_QUOTES, 'UTF-8'); } ?>
      </div>
      <label for="seoToggleCheck" class="seo__toggle">
        <span class="seo-more">Read more <svg class="ic ic--xs"><use href="#ic-chev-down"/></svg></span>
        <span class="seo-less">Read less <svg class="ic ic--xs" style="transform: rotate(180deg);"><use href="#ic-chev-down"/></svg></span>
      </label>
    </div>
  </section>
  

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

