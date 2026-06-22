<?php echo $header; ?>

<link rel="stylesheet" href="/city%20page%20html/assets/css/city_scoped.css" />
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
  <!-- Breadcrumbs -->
  <div class="fg-con" style="padding-top: 20px;">
    <ul class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ul>
  </div>

<section class="hero" aria-label="Featured promotions">
      <div class="hero__slider" id="heroSlider">
        <div class="hero__track" id="heroTrack">
          <article class="slide t-coral">
            <img src="/city%20page%20html/assets/images/side-1.webp" alt="professional" class="slide__media" data-label="hero-birthday.webp" loading="lazy" width="100%"/>
          </article>

          <article class="slide t-coral">
            <img src="/city%20page%20html/assets/images/father-day-banner-1.webp" alt="Father's Day" class="slide__media" data-label="hero-birthday.webp" loading="lazy" width="100%"/>
          </article>

          <article class="slide t-coral">
            <img src="/city%20page%20html/assets/images/side-2.webp" alt="Birthday" class="slide__media" data-label="hero-birthday.webp" loading="lazy" width="100%"/>
          </article>
        </div>
        <button class="hero__nav hero__nav--prev" id="heroPrev" aria-label="Previous slide"><svg class="ic"><use href="#ic-chev-left"/></svg></button>
        <button class="hero__nav hero__nav--next" id="heroNext" aria-label="Next slide"><svg class="ic"><use href="#ic-chev-right"/></svg></button>
        <div class="hero__dots" id="heroDots" role="tablist" aria-label="Slide selector"></div>
      </div>
  </section>

  <!-- ============ QUICK CATEGORY CIRCLES ============ -->
  <section class="quickcats" aria-label="Shop by category">
    <div class="fg-con quickcats__row">
      <?php if (!empty($home_quickcats)) { ?>
        <?php $colors = array('t-coral', 't-pink', 't-gold', 't-rose', 't-peach', 't-lilac', 't-mint'); $i = 0; ?>
        <?php foreach ($home_quickcats as $cat) { ?>
          <a class="qcat" href="<?php echo $cat['href']; ?>">
            <span class="qcat__img <?php echo $colors[$i % count($colors)]; ?>">
              <img src="<?php echo $cat['img']; ?>" alt="<?php echo $cat['title']; ?>" width="100%" height="100%" style="object-fit: cover; border-radius: 50%;" />
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
        <a class="link-all" href="#">View all <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></a>
      </div>
      <div class="hscroll" data-scroller>
        <?php if (!empty($home_trending)) { ?>
          <?php $colors = array('t-coral', 't-rose', 't-gold', 't-peach', 't-lilac', 't-pink'); $i=0; ?>
          <?php foreach ($home_trending as $item) { ?>
            <a class="tchip" href="<?php echo $item['href']; ?>">
              <span class="tchip__img img-ph <?php echo $colors[$i % count($colors)]; ?>">
                <img src="<?php echo $item['img']; ?>" alt="<?php echo $item['title']; ?>" width="100%" height="100%" style="border-radius: 50%; object-fit: cover;"/>
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
        <a class="link-all" href="#">View all <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></a>
      </div>
      <div class="treanding-slide" style="margin: 0 -10px; padding-bottom: 20px;">
        <?php if (!empty($home_bestselling)) { ?>
          <?php foreach ($home_bestselling as $item) { ?>
          <div class="slide" style="padding: 0 10px;">
            <article class="pcard" style="height: 100%;">
              <div class="pcard__media">
                <button class="pcard__wish" aria-label="Add to wishlist"><svg class="ic"><use href="#ic-heart"/></svg></button>
                <a href="<?php echo $item['href']; ?>">
                  <img src="<?php echo $item['image']; ?>" alt="<?php echo $item['name']; ?>" loading="lazy" />
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
                  <button class="pcard__add" type="button"><svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M12 4V20M20 12H4"></path></svg></button>
                </div>
              </div>
            </article>
          </div>
          <?php } ?>
        <?php } else { ?>
          <p style="padding-left:10px;">No products found.</p>
        <?php } ?>
      </div>
    </div>
  </section>

  <!-- ============ HOW IT WORKS (new) ============ -->
  <!-- <section class="section" aria-label="How it works">
    <div class="fg-con">
      <div class="sec-head sec-head--center">
        <div><span class="eyebrow">Simple &amp; quick</span><h2 class="sec-title">How It Works</h2></div>
      </div>
      <ol class="steps">
        <li class="step"><span class="step__ic"><svg class="ic"><use href="#ic-search"/></svg></span><h3>Pick your cake</h3><p>Browse 5000+ designs by occasion, flavour, theme or profession.</p></li>
        <li class="step"><span class="step__ic"><svg class="ic"><use href="#ic-cursor"/></svg></span><h3>Personalise it</h3><p>Add a message, photo or fully customise the design your way.</p></li>
        <li class="step"><span class="step__ic"><svg class="ic"><use href="#ic-clock"/></svg></span><h3>Choose a slot</h3><p>Select fixed-time, same-day or midnight delivery that suits you.</p></li>
        <li class="step"><span class="step__ic"><svg class="ic"><use href="#ic-truck"/></svg></span><h3>Fresh delivery</h3><p>We bake fresh &amp; deliver right to your loved one's doorstep.</p></li>
      </ol>
    </div>
  </section> -->

  <!-- ============ CAKES BY PROFESSION ============ -->
  <section class="section section--tight" aria-label="Cakes by profession">
    <div class="fg-con">
      <div class="sec-head">
        <div><span class="eyebrow">Made personal</span><h2 class="sec-title">Cakes by Profession</h2></div>
        <a class="link-all" href="#">View all <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></a>
      </div>
      <div class="hscroll" data-scroller>
        <?php if (!empty($home_profession)) { ?>
          <?php $colors = array('t-coral', 't-peach', 't-gold', 't-lilac', 't-rose', 't-pink', 't-mint'); $i=0; ?>
          <?php foreach ($home_profession as $item) { ?>
            <a class="circle-cat" href="<?php echo $item['href']; ?>">
              <span class="circle-cat__img img-ph <?php echo $colors[$i % count($colors)]; ?>">
                <img src="<?php echo $item['img']; ?>" alt="<?php echo $item['title']; ?>" width="100%" height="100%" style="object-fit: cover; border-radius: 50%;"/>
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
      <a class="split-card img-ph t-rose for-her-bg" href="#" data-label="cake-for-her.webp">
        <div class="split-card__inner">
          <span class="eyebrow eyebrow--light">For Her</span>
          <h3>Cakes she'll adore</h3>
          <span class="btn btn--ghost-light">Shop For Her <svg class="ic ic--xs"><use href="#ic-arrow-right"/></svg></span>
        </div>
      </a>
      <a class="split-card img-ph t-coral for-him-bg" href="#" data-label="cake-for-him.webp">
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
        <a class="link-all" href="#">View all <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></a>
      </div>
      <div class="occ-grid">
        <?php if (!empty($home_occasions)) { ?>
          <?php $colors = array('t-coral', 't-rose', 't-gold', 't-peach'); $i=0; ?>
          <?php foreach ($home_occasions as $item) { ?>
            <a class="occ-card img-ph <?php echo $colors[$i % count($colors)]; ?>" href="<?php echo $item['href']; ?>">
              <img src="<?php echo $item['img']; ?>" alt="<?php echo $item['title']; ?>" width="100%" height="100%"/>
              <span class="occ-card__cap">
                <strong><?php echo $item['title']; ?></strong>
                <span>View more <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></span>
              </span>
            </a>
            <?php $i++; ?>
          <?php } ?>
        <?php } ?>
      </div>
        <a class="occ-card img-ph t-lilac" href="#" data-label="romantic.webp"><img src="/city%20page%20html/assets/images/romantic-image.webp" alt="Romantic Love" width="100%" height="100%"/><span class="occ-card__cap"><strong>Romantic Love</strong><span>View more <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></span></span></a>
        <a class="occ-card img-ph t-peach" href="#" data-label="wedding.webp"><img src="/city%20page%20html/assets/images/wedding-image.webp" alt="Wedding Cakes" width="100%" height="100%"/><span class="occ-card__cap"><strong>Wedding Cakes</strong><span>View more <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></span></span></a>
        <a class="occ-card img-ph t-pink" href="#" data-label="baby-shower.webp"><img src="/city%20page%20html/assets/images/baby-shower-image.webp" alt="Baby Shower" width="100%" height="100%"/><span class="occ-card__cap"><strong>Baby Shower</strong><span>View more <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></span></span></a>
      </div>
    </div>
  </section>

  <!-- ============ CAKES FOR KIDS ============ -->
  <section class="section" aria-label="Cakes for kids">
    <div class="fg-con"> 
      <div class="sec-head">
        <div><span class="eyebrow">Little ones</span><h2 class="sec-title">Cakes for Kids</h2></div>
        <a class="link-all" href="#">View all <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></a>
      </div>
      <div class="kids-grid">
        <a class="kid-card img-ph t-coral" href="#" data-label="boys.webp"><img src="/city%20page%20html/assets/images/boy-cake.webp" alt="Cake for Boys" width="100%" height="100%"/><span class="kid-card__cap">Cake for Boys</span></a>
        <a class="kid-card img-ph t-rose" href="#" data-label="girls.webp"><img src="/city%20page%20html/assets/images/girl-cake.webp" alt="Cake for Girls" width="100%" height="100%"/><span class="kid-card__cap">Cake for Girls</span></a>
        <a class="kid-card img-ph t-gold" href="#" data-label="first-birthday.webp"><img src="/city%20page%20html/assets/images/first-birthday.webp" alt="First Birthday" width="100%" height="100%"/><span class="kid-card__cap">First Birthday</span></a>
        <a class="kid-card img-ph t-lilac" href="#" data-label="half-birthday.webp"><img src="/city%20page%20html/assets/images/half-month-cake.webp" alt="Half Birthday" width="100%" height="100%"/><span class="kid-card__cap">Half Birthday</span></a>
      </div>
    </div>
  </section>

  <!-- ============ CARTOON CAKES ============ -->
  <section class="section section--soft" aria-label="Cartoon cakes">
    <div class="fg-con">
      <div class="sec-head">
        <div><span class="eyebrow">For the kids at heart</span><h2 class="sec-title">Cartoon Cakes</h2></div>
        <a class="link-all" href="#">View all <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></a>
      </div>
      <div class="hscroll" data-scroller>
        <?php if (!empty($home_cartoon)) { ?>
          <?php $colors = array('t-lilac', 't-pink', 't-gold', 't-coral', 't-mint', 't-peach', 't-rose'); $i=0; ?>
          <?php foreach ($home_cartoon as $item) { ?>
            <a class="circle-cat" href="<?php echo $item['href']; ?>">
              <span class="circle-cat__img img-ph <?php echo $colors[$i % count($colors)]; ?>">
                <img src="<?php echo $item['img']; ?>" alt="<?php echo $item['title']; ?>" width="100%" height="100%" style="object-fit: cover; border-radius: 50%;"/>
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
          <a class="btn btn--solid" href="#">Order Now <svg class="ic ic--xs"><use href="#ic-arrow-right"/></svg></a>
        </div>
      </div>
    </div>
  </section>

  <!-- ============ CAKES BY TRAITS ============ -->
  <section class="section" aria-label="Cakes by traits">
    <div class="fg-con">
      <div class="sec-head">
        <div><span class="eyebrow">Their personality</span><h2 class="sec-title">Cakes by Traits</h2></div>
        <a class="link-all" href="#">View all <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></a>
      </div>     

      <div class="hscroll" data-scroller>
        <?php if (!empty($home_traits)) { ?>
          <?php $colors = array('t-gold', 't-lilac', 't-pink', 't-coral', 't-peach', 't-mint', 't-rose'); $i=0; ?>
          <?php foreach ($home_traits as $item) { ?>
            <a class="circle-cat" href="<?php echo $item['href']; ?>">
              <span class="circle-cat__img img-ph <?php echo $colors[$i % count($colors)]; ?>">
                <img src="<?php echo $item['img']; ?>" alt="<?php echo $item['title']; ?>" width="100%" height="100%" style="object-fit: cover; border-radius: 50%;"/>
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
        <a class="link-all" href="#">View all <svg class="ic ic--xs"><use href="#ic-chev-right"/></svg></a>
      </div>

      <div class="flav-grid">
        <?php if (!empty($home_flavours)) { ?>
          <?php $colors = array('t-gold', 't-peach', 't-lilac', 't-pink', 't-mint', 't-gold'); $i=0; ?>
          <?php foreach ($home_flavours as $item) { ?>
            <a class="flav-card img-ph <?php echo $colors[$i % count($colors)]; ?>" href="<?php echo $item['href']; ?>">
              <img src="<?php echo $item['img']; ?>" alt="<?php echo $item['title']; ?>" width="100%" height="100%"/>
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
        <div class="custom-cta__media img-ph t-rose" data-label="customise.webp" role="img" aria-label="Customised cake"><img src="/city%20page%20html/assets/images/bachelorette-image2.webp" alt="Customised cake" width="100%" height="100%"/></div>
        <div class="custom-cta__text">
          <span class="eyebrow">Make it yours</span>
          <h2 class="sec-title">Design your dream cake with our customisation studio</h2>
          <p>Upload a photo, pick a theme, choose the flavour &amp; size — our master bakers turn your idea into an edible masterpiece.</p>
          <a class="btn btn--solid" href="#">Start Customising <svg class="ic ic--xs"><use href="#ic-arrow-right"/></svg></a>
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
  <section class="fg-localities" aria-labelledby="fg-localities-title">
    <div class="fg-localities__wrap">
      <div class="fg-localities__head">
        <span class="fg-eyebrow">Fast Cake Delivery Across Delhi</span>
        <h2 class="sec-title" id="fg-localities-title">
          Localities Of Delhi Where Flavours Guru Provides Cake Delivery In Delhi
        </h2>
        <p>
          Order fresh eggless cakes online and enjoy quick doorstep delivery across popular Delhi localities.
        </p>
      </div>

      <div class="fg-location-grid">
        <div class="fg-location-card">
          <h3>West Delhi</h3>
          <ul>
            <li><a href="#">Uttam Nagar</a><span>110059</span></li>
            <li><a href="#">Janakpuri</a><span>110058</span></li>
            <li><a href="#">Mayur Vihar</a><span>110091</span></li>
            <li><a href="#">Rajouri Garden</a><span>110027</span></li>
          </ul>
        </div>

        <div class="fg-location-card">
          <h3>Central Delhi</h3>
          <ul>
            <li><a href="#">Karol Bagh</a><span>110005</span></li>
            <li><a href="#">Connaught Place</a><span>110001</span></li>
            <li><a href="#">Laxmi Nagar</a><span>110092</span></li>
            <li><a href="#">Kalbaji</a><span>110019</span></li>
          </ul>
        </div>

        <div class="fg-location-card">
          <h3>South Delhi</h3>
          <ul>
            <li><a href="#">Vasant Kunj</a><span>110070</span></li>
            <li><a href="#">Saket</a><span>110017</span></li>
            <li><a href="#">Hauz Khas</a><span>110016</span></li>
            <li><a href="#">New Friends Colony</a><span>110018</span></li>
          </ul>
        </div>

        <div class="fg-location-card">
          <h3>North Delhi</h3>
          <ul>
            <li><a href="#">Pitampura</a><span>110034</span></li>
            <li><a href="#">Rohini</a><span>110085</span></li>
            <li><a href="#">Rithala</a><span>110023</span></li>
            <li><a href="#">Dwarka</a><span>110045</span></li>
          </ul>
        </div>
      </div>

      <p class="fg-localities__note">
        And many more areas in Delhi NCR are served with same-day and midnight cake delivery.
      </p>
    </div>
</section>
  <!-- Localities Of Delhi Where We Deliver -->

<!-- FAQs -->
 <section class="fg-faq-section">
  <div class="fg-faq-container">

    <div class="fg-faq-left">
      <h2 class="sec-title">Frequently Asked Questions</h2>
      <p>
        Find answers about eggless cakes, same-day delivery, midnight delivery, custom cakes and online ordering at Flavours Guru.
      </p>
      <div class="">
        <img src="/city%20page%20html/assets/images/Avengers.webp" alt="Avengers" width="350" height="100%">
      </div>
    </div>

    <div class="fg-faq-right">
      <input type="checkbox" id="fg-faq-toggle">

      <div class="fg-faq-list">

        <details open>
          <summary>Does Flavours Guru provide same-day cake delivery in Delhi?</summary>
          <p>Yes, Flavours Guru offers same-day cake delivery across Delhi NCR, helping you send fresh cakes quickly for birthdays, anniversaries and special occasions.</p>
        </details>

        <details>
          <summary>Are the cakes at Flavours Guru eggless?</summary>
          <p>Yes, Flavours Guru offers 100% eggless cakes made with fresh and premium ingredients.</p>
        </details>

        <details>
          <summary>Can I order midnight cake delivery?</summary>
          <p>Yes, midnight cake delivery is available so you can surprise your loved ones right at the celebration time.</p>
        </details>

        <details>
          <summary>Can I customise my cake design?</summary>
          <p>Yes, you can customise your cake by choosing the theme, flavour, size and design as per your celebration requirement.</p>
        </details>

        <details>
          <summary>Which cake flavours are available?</summary>
          <p>Popular flavours include chocolate, red velvet, black forest, pineapple, blueberry, vanilla and butterscotch.</p>
        </details>

        <div class="fg-more-faqs">
          <details>
            <summary>Does Flavours Guru deliver cakes in Delhi NCR?</summary>
            <p>Yes, cake delivery is available across Delhi NCR including Delhi, Gurgaon, Noida, Ghaziabad, Faridabad and Greater Noida.</p>
          </details>

          <details>
            <summary>Can I order birthday and anniversary cakes online?</summary>
            <p>Yes, you can order birthday cakes, anniversary cakes, designer cakes, theme cakes and cartoon cakes online.</p>
          </details>

          <details>
            <summary>Are designer and theme cakes available?</summary>
            <p>Yes, Flavours Guru offers designer cakes, theme cakes, cartoon cakes and cakes by profession for different celebrations.</p>
          </details>

          <details>
            <summary>How do I place an online cake order?</summary>
            <p>You can select your cake, choose flavour and size, add delivery details and place your order online in a few simple steps.</p>
          </details>
        </div>

      </div>

      <label for="fg-faq-toggle" class="fg-faq-btn">
        <span class="fg-read-more">Read More FAQs</span>
        <span class="fg-read-less">Show Less</span>
      </label>
    </div>

  </div>
</section>
<!-- FAQs -->

  <!-- ============ TESTIMONIALS ============ -->
  <section class="section section--tight" aria-label="Customer reviews">
    <div class="fg-con">
      <div class="sec-head sec-head--center">
        <div><span class="eyebrow">Real celebrations</span><h2 class="sec-title">What our customers say</h2>
        <p class="sec-sub"><strong>4.8/5</strong> average rating · 5000+ Google reviews</p></div>
      </div>
      <div class="hscroll hscroll--reviews" data-scroller>
        <?php if(isset($allreviews) && $allreviews['cnt'] > 0){ ?>
          <?php $x = 0; foreach ($allreviews['all'] as $value) { if($x == 5) { break; } ?>
          <figure class="review">
            <div class="review__stars">★★★★★</div>
            <blockquote><?php echo ucfirst($value['text']); ?></blockquote>
            <figcaption>
              <span class="review__av t-coral"><?php echo substr($value['author'], 0, 1); ?></span>
              <span><strong><?php echo ucwords($value['author']); ?></strong><small><?php echo date('d-M-Y', strtotime($value['date_added'])); ?></small></span>
            </figcaption>
          </figure>
          <?php $x++; } ?>
        <?php } ?>
      </div>
    </div>
  </section>

  <!-- ============ SEO CONTENT ============ -->
  <section class="seo" aria-label="About online cake delivery">
    <div class="fg-con">
      <h1 class="seo__h1"><?php echo $heading_title; ?></h1>
      <input type="checkbox" id="seoToggleCheck" />
      <div class="seo__body" id="seoBody">
        <h2>Online Cakes: Delectable Desserts for Special Occasions</h2>
        <p>Delving into a delicious, creamy extravaganza is the demand of every special occasion. Cakes uplift the mood of every celebration with their scrumptious flavours and attractive designs — the most anticipated gift expected by everyone from their dear ones. With the rising popularity of online cake shops offering home delivery at the doorstep, there is no need to rush to nearby bakeries. Orders can be placed online in just a few clicks while sitting in the comfort of your home or office, with flexible delivery time slots.</p>
        <h2>Explore a Scrumptious Variety of Eggless Cakes</h2>
        <p>Flavours Guru is a premium cake shop offering incredible online cake delivery across Delhi NCR. Our great assortment of eggless cakes is known for its delicious flavours and fresh textures. All cakes are prepared using the best quality ingredients to retain the right taste and richness without compromising on quality. Whether it is a birthday cake, an anniversary cake, or a Father's Day cake, our online cake shop has everything you are looking for.</p>
        <h2>Send Cakes Across India in a Jiffy</h2>
        <p>Wish to send love and best wishes to loved ones on their special occasion? Flavours Guru is a reliable online cake bakery boasting a magnificent range of cakes delivered swiftly through flawless online cake delivery in Delhi NCR — covering Gurgaon, Faridabad, Noida and Greater Noida. Now delicious cakes can be sent in a pocket-friendly manner, making every occasion memorable.</p>
        <h2>Why choose Flavours Guru?</h2>
        <ul>
          <li>The freshest range of cakes in all shapes &amp; sizes</li>
          <li>Midnight cake delivery available</li>
          <li>A great amount of choices for every budget</li>
          <li>Cash on delivery available</li>
          <li>100% eggless cakes — a perfect treat for vegetarians</li>
        </ul>
      </div>
      <label for="seoToggleCheck" class="seo__toggle">
        <span class="seo-more">Read more <svg class="ic ic--xs"><use href="#ic-chev-down"/></svg></span>
        <span class="seo-less">Read less <svg class="ic ic--xs" style="transform: rotate(180deg);"><use href="#ic-chev-down"/></svg></span>
      </label>
    </div>
  </section>

  <!-- ============ NEWSLETTER ============ -->
  <section class="newsletter" aria-label="Newsletter signup">
    <div class="fg-con newsletter__row">
      <div class="newsletter__head">
        <span class="newsletter__ic"><svg class="ic"><use href="#ic-mail"/></svg></span>
        <div><h2>Join our newsletter</h2><p>Get sweet updates &amp; exclusive offers straight to your inbox.</p></div>
      </div>
      <form class="newsletter__form" onsubmit="return false">
        <input type="email" placeholder="Enter your email address" aria-label="Email address" required />
        <button class="btn btn--solid" type="submit">Subscribe</button>
      </form>
    </div>
  </section>

</main>

<!-- Floating WhatsApp -->
<a class="fab" href="#" aria-label="Chat on WhatsApp"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" color="currentColor" fill="none" stroke="currentColor" stroke-width="1.5">
    <path d="M12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 13.3789 2.27907 14.6926 2.78382 15.8877C3.06278 16.5481 3.20226 16.8784 3.21953 17.128C3.2368 17.3776 3.16334 17.6521 3.01642 18.2012L2 22L5.79877 20.9836C6.34788 20.8367 6.62244 20.7632 6.87202 20.7805C7.12161 20.7977 7.45185 20.9372 8.11235 21.2162C9.30745 21.7209 10.6211 22 12 22Z" stroke-linejoin="round"></path>
    <path d="M8.58815 12.3773L9.45909 11.2956C9.82616 10.8397 10.2799 10.4153 10.3155 9.80826C10.3244 9.65494 10.2166 8.96657 10.0008 7.58986C9.91601 7.04881 9.41086 7 8.97332 7C8.40314 7 8.11805 7 7.83495 7.12931C7.47714 7.29275 7.10979 7.75231 7.02917 8.13733C6.96539 8.44196 7.01279 8.65187 7.10759 9.07169C7.51023 10.8548 8.45481 12.6158 9.91948 14.0805C11.3842 15.5452 13.1452 16.4898 14.9283 16.8924C15.3481 16.9872 15.558 17.0346 15.8627 16.9708C16.2477 16.8902 16.7072 16.5229 16.8707 16.165C17 15.8819 17 15.5969 17 15.0267C17 14.5891 16.9512 14.084 16.4101 13.9992C15.0334 13.7834 14.3451 13.6756 14.1917 13.6845C13.5847 13.7201 13.1603 14.1738 12.7044 14.5409L11.6227 15.4118"></path>
</svg></a>

<!-- flying-to-cart element -->
<span class="fly-dot" id="flyDot" aria-hidden="true"></span>


  <script src="/city%20page%20html/assets/js/app.js"></script>
  <script>
    $(document).ready(function(){
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
