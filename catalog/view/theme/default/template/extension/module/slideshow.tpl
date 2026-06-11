<div class="col-sm-12 homeBlocks">
<div class="col-sm-12"><div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
  <?php $banner_idx = 0; foreach ($banners as $banner) { $is_first = ($banner_idx === 0); ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>">
      <picture>
        <source media="(max-width: 767px)" srcset="<?php echo $banner['image_mobile']; ?>">
        <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" width="<?php echo $banner['width']; ?>" height="<?php echo $banner['height']; ?>"<?php if ($is_first) { ?> fetchpriority="high" loading="eager"<?php } else { ?> loading="lazy"<?php } ?> decoding="async" />
      </picture>
    </a>
    <?php } else { ?>
    <picture>
      <source media="(max-width: 767px)" srcset="<?php echo $banner['image_mobile']; ?>">
      <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" width="<?php echo $banner['width']; ?>" height="<?php echo $banner['height']; ?>"<?php if ($is_first) { ?> fetchpriority="high" loading="eager"<?php } else { ?> loading="lazy"<?php } ?> decoding="async" />
    </picture>
    <?php } ?>
  </div>
  <?php $banner_idx++; } ?>
</div></div>

<?php /*?><div class="col-sm-3" id="homeSideBanner">
	<!-- <div class="col-sm-12"><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/sidebanner1.webp" alt="banner" /></div>
	<div class="col-sm-12"><img src="catalog/view/theme/default/image/sidebanner2.webp" alt="banner" /></div>
	<div class="col-sm-12"><img src="catalog/view/theme/default/image/sidebanner3.webp" alt="banner" /></div> -->
	<?php foreach ($sidebanners as $banner) { ?>
		<?php if ($banner['link']) { ?>
			<div class="col-sm-12"><a href="<?php echo $banner['link'] ?>"><img loading="lazy" decoding="async"src="<?php echo $banner['image'] ?>" alt="banner" /></a></div>
		<?php } else { ?>
			<div class="col-sm-12"><img loading="lazy" decoding="async"src="<?php echo $banner['image'] ?>" alt="banner" /></div>
		<?php } ?>
	<?php } ?>
	
</div><?php */?>
</div><script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 6000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
});
--></script>
