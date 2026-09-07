/* =========================================================
   FLAVOURS GURU — interactions
   ========================================================= */
(function () {
  "use strict";

  /* ---------- Product data (bestsellers) ---------- */
  var PRODUCTS = [
    { name: "Pearled Expressions Cake",   price: 949,  mrp: 1499, rate: "4.9", tint: "t-coral", badge: "Bestseller", img: "/catalog/view/theme/default/image/city_page/FGCCAKE562.webp" },
    { name: "Dreamy Delights Cake",       price: 1749, mrp: 2299, rate: "4.7", tint: "t-lilac", badge: "New",        img: "/catalog/view/theme/default/image/city_page/FGCCAKE722-1000x1000.webp" },
    { name: "Husband Crossword Cake",     price: 799,  mrp: 899,  rate: "4.8", tint: "t-rose",  badge: "Trending",   img: "/catalog/view/theme/default/image/city_page/FGCCAKE792.webp" },
    { name: "Candlelit Wishes Cake",      price: 1749, mrp: 2049, rate: "4.9", tint: "t-gold",  badge: "Premium",    img: "/catalog/view/theme/default/image/city_page/FGCCAKE726.webp" },
    { name: "Aww Little Baby Cake",       price: 1699, mrp: 1999, rate: "4.7", tint: "t-lilac", badge: "Bestseller", img: "/catalog/view/theme/default/image/city_page/FGCCAKE735-1000x1000.webp" }
  ];

  function rupee(n) { return "₹" + n.toLocaleString("en-IN"); }

  function renderProducts() {
    var grid = document.getElementById("productGrid");
    if (!grid) return;
    grid.innerHTML = PRODUCTS.map(function (p) {
      return (
        '<article class="pcard">' +
          '<div class="pcard__media">' +
            '<span class="pcard__badge">' + p.badge + '</span>' +
            '<button class="pcard__wish" aria-label="Add to wishlist"><svg class="ic"><use href="#ic-heart"/></svg></button>' +
            '<img src="' + p.img + '" alt="' + p.name + '" loading="lazy">' +
          '</div>' +
          '<div class="pcard__body">' +
            '<h3 class="pcard__name">' + p.name + '</h3>' +
            '<div class="pcard__foot">' +
              '<span class="pcard__price">' + rupee(p.price) + '<s>' + rupee(p.mrp) + '</s></span>' +
              '<button class="pcard__add" type="button"><svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M12 4V20M20 12H4"></path></svg></button>' +
            '</div>' +
          '</div>' +
        '</article>'
      );
    }).join("");
  }

  /* ---------- Cart ---------- */
  var cartCount = 0;
  var countEl = document.getElementById("cartCount");
  var cartBtn = document.getElementById("cartBtn");
  var flyDot = document.getElementById("flyDot");

  function flyToCart(fromEl) {
    if (!flyDot || !cartBtn) return;
    var a = fromEl.getBoundingClientRect();
    var b = cartBtn.getBoundingClientRect();
    var startX = a.left + a.width / 2, startY = a.top + a.height / 2;
    var endX = b.left + b.width / 2, endY = b.top + b.height / 2;
    flyDot.style.transition = "none";
    flyDot.style.opacity = "1";
    flyDot.style.left = startX + "px";
    flyDot.style.top = startY + "px";
    flyDot.style.transform = "translate(-50%,-50%) scale(1)";
    // force reflow
    void flyDot.offsetWidth;
    flyDot.style.transition = "left .7s cubic-bezier(.5,-0.3,.5,1), top .7s cubic-bezier(.5,-0.3,.5,1), transform .7s ease, opacity .7s ease";
    flyDot.style.left = endX + "px";
    flyDot.style.top = endY + "px";
    flyDot.style.transform = "translate(-50%,-50%) scale(.3)";
    flyDot.style.opacity = "0";
  }

  function bumpCart() {
    cartCount++;
    countEl.textContent = cartCount;
    countEl.classList.add("show");
    cartBtn.classList.remove("bump");
    void cartBtn.offsetWidth;
    cartBtn.classList.add("bump");
  }

  /* delegate clicks */
  document.addEventListener("click", function (e) {
    var add = e.target.closest(".pcard__add");
    if (add && !add.classList.contains("added")) {
      var card = add.closest(".pcard");
      var media = card ? card.querySelector(".pcard__media") : add;
      flyToCart(media);
      bumpCart();
      var original = add.innerHTML;
      add.classList.add("added");
      add.innerHTML = '<svg class="ic"><use href="#ic-check"/></svg>Added';
      setTimeout(function () {
        add.classList.remove("added");
        add.innerHTML = original;
      }, 1400);
      return;
    }

    var wish = e.target.closest(".pcard__wish");
    if (wish) { wish.classList.toggle("active"); return; }

    var code = e.target.closest(".coupon__code");
    if (code) {
      var val = code.getAttribute("data-code");
      var done = function () {
        var label = code.querySelector("small");
        code.classList.add("copied");
        if (label) label.textContent = "copied!";
        setTimeout(function () {
          code.classList.remove("copied");
          if (label) label.textContent = "tap to copy";
        }, 1500);
      };
      if (navigator.clipboard && navigator.clipboard.writeText) {
        navigator.clipboard.writeText(val).then(done, done);
      } else { done(); }
      return;
    }
  });

  /* ---------- Hero slider ---------- */
  function initSlider() {
    var track = document.getElementById("heroTrack");
    var dotsWrap = document.getElementById("heroDots");
    if (!track) return;
    var slides = track.children;
    var total = slides.length;
    var index = 0;
    var timer;

    for (var i = 0; i < total; i++) {
      var b = document.createElement("button");
      b.setAttribute("role", "tab");
      b.setAttribute("aria-label", "Go to slide " + (i + 1));
      (function (n) { b.addEventListener("click", function () { go(n); reset(); }); })(i);
      dotsWrap.appendChild(b);
    }
    var dots = dotsWrap.children;

    function go(n) {
      index = (n + total) % total;
      track.style.transform = "translateX(" + (-index * 100) + "%)";
      track.style.transition = "transform .55s cubic-bezier(.5,.1,.3,1)";
      for (var i = 0; i < dots.length; i++) dots[i].classList.toggle("active", i === index);
    }
    function next() { go(index + 1); }
    function prev() { go(index - 1); }
    function reset() { clearInterval(timer); timer = setInterval(next, 5000); }

    document.getElementById("heroNext").addEventListener("click", function () { next(); reset(); });
    document.getElementById("heroPrev").addEventListener("click", function () { prev(); reset(); });

    // swipe
    var sx = 0;
    track.addEventListener("touchstart", function (e) { sx = e.touches[0].clientX; }, { passive: true });
    track.addEventListener("touchend", function (e) {
      var dx = e.changedTouches[0].clientX - sx;
      if (Math.abs(dx) > 40) { dx < 0 ? next() : prev(); reset(); }
    });

    go(0);
    reset();
  }

  /* ---------- Mobile drawer ---------- */
  function initDrawer() {
    var drawer = document.getElementById("drawer");
    var open = document.getElementById("burgerBtn");
    var close = document.getElementById("drawerClose");
    var scrim = document.getElementById("drawerScrim");
    if (!drawer) return;
    function set(state) {
      drawer.classList.toggle("open", state);
      drawer.setAttribute("aria-hidden", state ? "false" : "true");
      document.body.style.overflow = state ? "hidden" : "";
    }
    open && open.addEventListener("click", function () { set(true); });
    close && close.addEventListener("click", function () { set(false); });
    scrim && scrim.addEventListener("click", function () { set(false); });
    drawer.querySelectorAll(".drawer__nav a").forEach(function (a) {
      a.addEventListener("click", function () { set(false); });
    });
  }

  /* ---------- SEO read-more ---------- */
  function initSeo() {
    var btn = document.getElementById("seoToggle");
    var body = document.getElementById("seoBody");
    if (!btn || !body) return;
    btn.addEventListener("click", function () {
      var open = body.classList.toggle("open");
      btn.setAttribute("aria-expanded", open ? "true" : "false");
      btn.childNodes[0].nodeValue = open ? "Read less " : "Read more ";
    });
  }

  /* ---------- init ---------- */
  document.addEventListener("DOMContentLoaded", function () {
    renderProducts();
    initSlider();
    initDrawer();
    initSeo();
  });
})();
