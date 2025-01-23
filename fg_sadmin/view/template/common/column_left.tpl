<nav id="column-left">
  <div id="profile">
    <div>
      <?php if ($image) { ?>
      <img src="<?php echo $image; ?>" alt="<?php echo $firstname; ?> <?php echo $lastname; ?>" title="<?php echo $username; ?>" class="img-circle" />
      <?php } else { ?>
      <i class="fa fa-opencart"></i>
      <?php } ?>
    </div>
    <div>
      <h4><?php echo $firstname; ?> <?php echo $lastname; ?></h4>
      <small><?php echo $user_group; ?></small></div>
  </div>
  <ul id="menu">  
    <?php foreach ($menus as $menu) { ?>
    <li id="<?php echo $menu['id']; ?>">
      <?php if ($menu['href']) { ?>
      <a href="<?php echo $menu['href']; ?>"><i class="fa <?php echo $menu['icon']; ?> fw"></i> <span><?php echo $menu['name']; ?></span></a>
      <?php } else { ?>
      <a class="parent"><i class="fa <?php echo $menu['icon']; ?> fw"></i> <span><?php echo $menu['name']; ?></span></a>
      <?php } ?>
      <?php if ($menu['children']) { ?>
      <ul>
        <?php foreach ($menu['children'] as $children_1) { ?>
        <?php if ($children_1['name']!='Shipping Holidays') { ?>
        <li>
          <?php if ($children_1['href'] && $children_1['name']!='Shipping Holidays') { ?>
            <a href="<?php echo $children_1['href']; ?>"><?php echo $children_1['name']; ?></a>
          <?php } else { ?>
          <a class="parent"><?php echo $children_1['name']; ?></a>
          <?php } ?>
          <?php if ($children_1['children']) { ?>
          <ul>
            <?php foreach ($children_1['children'] as $children_2) { ?>
            <li>
              <?php if ($children_2['href']) { ?>
              <a href="<?php echo $children_2['href']; ?>"><?php echo $children_2['name']; ?></a>
              <?php } else { ?>
              <a class="parent"><?php echo $children_2['name']; ?></a>
              <?php } ?>
              <?php if ($children_2['children']) { ?>
              <ul>
                <?php foreach ($children_2['children'] as $children_3) { ?>
                <li><a href="<?php echo $children_3['href']; ?>"><?php echo $children_3['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
        <?php } ?>
      </ul>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
  <?php if(isset($statsshow) && !$statsshow){ ?>
    <ul id="menu">
      <li id="menu-dashboard">
        <a href="<?php echo $vendorsale ?>"><i class="fa fa-shopping-cart fw"></i> <span>Sales</span></a>
      </li>
      <li id="menu-dashboard">
        <a href="<?php echo $ticket ?>"><i class="fa fa-shopping-cart fw"></i> <span>Order Tickets</span></a>
      </li>
      <li id="menu-dashboard">
        <a href="<?php echo $vendorsalereport ?>"><i class="fa fa-bar-chart-o fw"></i> <span>Sales Report</span></a>
      </li>
    </ul>
  <?php } ?>
  <?php if(isset($statsshow15) && !$statsshow15){ ?>
    <ul id="menu">
      <li id="menu-dashboard">
        <a href="<?php echo $boysale ?>"><i class="fa fa-shopping-cart fw"></i> <span>Sales</span></a>
      </li>
    </ul>
  <?php } ?>
  <?php if(isset($statsshow17) && !$statsshow17){ ?>
    <ul id="menu">
      <li id="menu-dashboard">
        <a href="<?php echo $followup ?>"><i class="fa fa-shopping-cart fw"></i> <span>Follow Up</span></a>
      </li>
    </ul>
  <?php } ?>
  <?php if(isset($statsshow16) && !$statsshow16){ ?>
    <ul id="menu">
      <li id="menu-dashboard">
        <a href="<?php echo $pnc ?>"><i class="fa fa-shopping-cart fw"></i> <span>PNC</span></a>
      </li>
    </ul>
  <?php } ?>

  <?php if(isset($addOrderAdmin) && !empty($addOrderAdmin)){ ?>
    <ul id="menu">
      <li id="menu-dashboard">
        <a href="<?php echo $order ?>"><i class="fa fa-shopping-cart fw"></i> <span>Order</span></a>
      </li>
      <li id="menu-dashboard">
        <a href="<?php echo $addOrderAdmin ?>"><i class="fa fa-shopping-cart fw"></i> <span>Add Order</span></a>
      </li>
    </ul>
  <?php } ?>

  <?php if(isset($statshide) && $statshide){ ?>
  <div id="stats">
    <ul>
      <li>
        <div><?php echo $text_complete_status; ?> <span class="pull-right"><?php echo $complete_status; ?>%</span></div>
        <div class="progress">
          <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<?php echo $complete_status; ?>" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $complete_status; ?>%"> <span class="sr-only"><?php echo $complete_status; ?>%</span></div>
        </div>
      </li>
      <li>
        <div><?php echo $text_processing_status; ?> <span class="pull-right"><?php echo $processing_status; ?>%</span></div>
        <div class="progress">
          <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="<?php echo $processing_status; ?>" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $processing_status; ?>%"> <span class="sr-only"><?php echo $processing_status; ?>%</span></div>
        </div>
      </li>
      <li>
        <div><?php echo $text_other_status; ?> <span class="pull-right"><?php echo $other_status; ?>%</span></div>
        <div class="progress">
          <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="<?php echo $other_status; ?>" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $other_status; ?>%"> <span class="sr-only"><?php echo $other_status; ?>%</span></div>
        </div>
      </li>
    </ul>
  </div>
<?php } ?>
</nav>
