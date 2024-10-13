<?php echo $header; ?>
<!-- Font Awesome Icon Library -->
<div class="container top_positionn">
  <style>
  .checked {
    color: orange;
  }
  </style>
  <ul class="breadcrumb">
    <li><a href="https://www.flavoursguru.com/index.php?route=common/home"><i class="fa fa-home"></i> </a></li>
    <li><span class="" style="color: #35a8d4;">Customer Reviews </span></li>
  </ul>
  <div id="content" class="">
  <div>
    <h1>Customer Reviews</h1>
  </div>

  <h2>User Rating</h2>
  <span class="fa fa-star checked"></span>
  <span class="fa fa-star checked"></span>
  <span class="fa fa-star checked"></span>
  <span class="fa fa-star checked"></span>
  <span class="fa fa-star-half checked"></span>
  <p><font size="+2">4.8 average based on <?php echo $total; ?> reviews.</font></p>
  
  <?php foreach ($testis as $value) { ?>
  <div class="ext_test">
    <div class="" style="width: 60px;height: 60px;background-color: #f195b2;border-radius: 50%;display: flex;align-items: center;justify-content: center;float: left;margin-right: 25px;">
      <?php
        $fchar_name = $value['author'];
        $cus_name = substr($fchar_name, 0,1);
       ?>
       <div>
          <p style="color: #ffffff;font-size: 28px;font-weight: 600;margin-bottom: 0;text-transform: uppercase;"><?php echo $cus_name; ?></p>
       </div>
      
    </div>
    <p><span><?php echo ucwords($value['author']); ?></span></p>

    <?php for ($i = 1; $i <= 5; $i++) { ?>
        <?php if ($value['rating'] < $i) { ?>
        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
        <?php } else { ?>
        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
        <?php } ?>
        <?php } ?>
      <div>
        <p><?php echo ucfirst($value['text']); ?></p>
        <p><?php echo date('d/m/Y', strtotime($value['date_added'])); ?></p>
      </div>
  </div>
  <?php } ?>




  <div class="row desk-pagination hidden-xs">
    <div class="col-sm-6 text-left"><?php echo $results; ?></div>
   <div class="col-sm-6 text-right"><?php echo $pagination; ?></div>
  </div>

  <div class="row visible-xs">
   <div class="col-xs-12 mob-pagination"><?php echo $paginationMobile; ?></div>
  </div>
</div>
</div>

<?php echo $footer; ?>