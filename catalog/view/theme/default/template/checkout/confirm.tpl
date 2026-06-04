<?php if (!isset($redirect)) { ?>
<div class="table-responsive">
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <td class="text-left">Image</td>
        <td class="text-left"><?php echo 'Name'; ?></td>
        <?php /*<td class="text-left"><?php echo $column_model; ?></td>*/ ?>
        <td class="text-right"><?php echo 'Quantity'; ?></td>
        <td class="text-right"><?php echo 'Shipping Info'; ?></td>
        <td class="text-right"><?php echo 'Shipping Price'; ?></td>
        <td class="text-right"><?php echo 'Price'; ?></td>
        <td class="text-right"><?php echo 'Total'; ?></td>
        
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td class="text-center"><?php if ($product['thumb']) { ?>
          <a href="<?php echo $product['href']; ?>"><img loading="lazy" decoding="async"src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
          <?php } ?></td>
        <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <?php foreach ($product['option'] as $option) { ?>
             <br />
              &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
           <?php } ?>
           <?php if($product['recurring']) { ?>
            <br />
            <span class="label label-info"> <?php echo $text_recurring_item; ?></span> 
            <small><?php echo $product['recurring']; ?> </small>
          <?php } ?> </td>
        <?php /* <td class="text-left"><?php echo $product['model']; ?></td> */ ?>
        <td class="text-right"><?php echo $product['quantity']; ?></td>
        <td class="text-left"><?php $shipInfo = json_decode($product['shipping_info']); foreach ($shipInfo as $key => $value) {
                  echo "<span>".$key."</span>"." - ".str_replace('u20b9','',$value)."<br>";
                }  ?></td>
        <td class="text-right"><?php echo $product['shipping_price']; ?></td>
        <td class="text-right"><?php echo $product['price']; ?></td>
        <td class="text-right"><?php echo $product['total']; ?></td>
          
      </tr> 
      <?php } ?> 
      <?php foreach ($vouchers as $voucher) { ?>  
      <tr>
        <td class="text-left"><?php echo $voucher['description']; ?> </td>
        <td class="text-left"></td>
        <td class="text-right">1</td>
        <td class="text-right"><?php echo $voucher['amount']; ?></td>
        <td class="text-right"><?php echo $voucher['amount']; ?></td>
        
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
      <?php foreach ($totals as $total) { ?>
      <tr>

        <td colspan="5" class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
        <td colspan="5"  class="text-right"><?php echo $total['text']; ?></td>
        
      </tr>
      <?php } ?>
    </tfoot>
  </table>
</div>
<?php echo $payment; ?>
<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } ?>
