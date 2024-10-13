<?php if ($modules) { ?>
<h2 class="hFilter">Filter</h2>
<aside id="column-left" class="col-sm-8 filterBox">
<!-- <aside id="column-left" class="col-sm-3 hidden-xs"> -->
  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
</aside> 
<?php } ?>
