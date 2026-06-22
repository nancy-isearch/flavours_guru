<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <ul class="box-filter">

<?php if ($filter_groups) { ?>
      <?php foreach ($filter_groups as $filter_group) { ?>
      <li><span id="filter-group<?php echo $filter_group['filter_group_id']; ?>"><?php echo $filter_group['name']; ?></span>
        <ul>
          <?php foreach ($filter_group['filter'] as $filter) { ?>
          <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
          <li>
            <input type="checkbox" value="<?php echo $filter['filter_id']; ?>" id="filter<?php echo $filter['filter_id']; ?>" checked="checked" />
            <label for="filter<?php echo $filter['filter_id']; ?>"><?php echo $filter['name']; ?></label>
          </li>
          <?php } else { ?>
          <li>
            <input type="checkbox" value="<?php echo $filter['filter_id']; ?>" id="filter<?php echo $filter['filter_id']; ?>" />
            <label for="filter<?php echo $filter['filter_id']; ?>"><?php echo $filter['name']; ?></label>
          </li>
          <?php } ?>
          <?php } ?>
        </ul>
      </li>
<?php } ?>

    <a id="button-filter" class="button"><?php echo $button_filter; ?></a><br/><br/>
<?php } ?>

<?php if(isset($minmax['minimum']) AND ($minmax['minimum'] != $minmax['maximum'])) { ?>
 <li><span id="price-filter"><?php echo $price_title; ?></span>
<ul>
<li>


<p>
   <?php echo $price_range; ?>
    <input type="text" id="amount" name="price" readonly style="border: 1; color: #f6931f; font-weight: bold; width: 80px;" />

<div id="slider-range"></div>
<br/>

<a onclick="dosadCenu();" class="button"><?php echo $button_price; ?></a>
<a onclick="location = this.name;" name="<?php echo $cenaodkazy['cena_hrefx']; ?>" class="button"><?php echo $button_price_cancel; ?></a>


<script type="text/javascript">
function dosadCenu() {
var url = "<?php echo $cenaodkazy['cena_href']; ?>";
var hodnota = document.getElementById("amount").value;
url = url.replace('xxcenaxx', hodnota);
location = url;
}
</script>

</p>

</li>
</ul>
</li>
<?php } ?>
    </ul>
  </div>
</div>

<script type="text/javascript"><!--
$('#button-filter').bind('click', function() {
	filter = [];
	
	$('.box-filter input[type=\'checkbox\']:checked').each(function(element) {
		filter.push(this.value);
	});
	
	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script> 
<?php if(isset($minmax['minimum']) AND ($minmax['minimum'] != $minmax['maximum'])) { ?>
<?php if($cena != '') {
$cast_ceny = explode("-", $cena);
} else {
$cena = $minmax['minimum'] . '-' . $minmax['maximum'];
$cast_ceny = explode("-", $cena);
}
?>

<script type="text/javascript"><!--
$(function() {
$( "#slider-range" ).slider({
range: true,
min: <?php echo $minmax['minimum']; ?>,
max: <?php echo $minmax['maximum']; ?>,
            values: [ <?php echo $cast_ceny[0]; ?>, <?php echo $cast_ceny[1]; ?> ],
slide: function( event, ui ) {
$( "#amount" ).val( ui.values[ 0 ] + "-" + ui.values[ 1 ] );
}
});
$( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) +
"-" + $( "#slider-range" ).slider( "values", 1 ) );
});
//--></script>
<?php } ?>