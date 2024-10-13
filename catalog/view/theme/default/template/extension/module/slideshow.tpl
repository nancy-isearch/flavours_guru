<div class="col-sm-12 homeBlocks">
<div class="col-sm-12"><div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div></div>

<?php /*?><div class="col-sm-3" id="homeSideBanner">
	<!-- <div class="col-sm-12"><img src="catalog/view/theme/default/image/sidebanner1.jpg" alt="banner" /></div>
	<div class="col-sm-12"><img src="catalog/view/theme/default/image/sidebanner2.jpg" alt="banner" /></div>
	<div class="col-sm-12"><img src="catalog/view/theme/default/image/sidebanner3.jpg" alt="banner" /></div> -->
	<?php foreach ($sidebanners as $banner) { ?>
		<?php if ($banner['link']) { ?>
			<div class="col-sm-12"><a href="<?php echo $banner['link'] ?>"><img src="<?php echo $banner['image'] ?>" alt="banner" /></a></div>
		<?php } else { ?>
			<div class="col-sm-12"><img src="<?php echo $banner['image'] ?>" alt="banner" /></div>
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