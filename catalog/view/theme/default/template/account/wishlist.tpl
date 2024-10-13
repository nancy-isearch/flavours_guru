<?php echo $header; ?>
<div class="container top_positionn">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php /* <h2><?php echo $heading_title; ?></h2> */ ?>
      <?php if ($products) { ?>
      <div class="">
        <?php /*<table class="table table-bordered table-hover wishlist" style="display: none;">
          <thead>
            <tr>
              <td class="text-center"><?php echo $column_image; ?></td>
              <td class="text-left"><?php echo $column_name; ?></td>
              <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-right"><?php echo $column_stock; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>
              <td class="text-right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td class="text-center"><?php if ($product['thumb']) { ?>
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                <?php } ?></td>
              <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-right"><?php echo $product['stock']; ?></td>
              <td class="text-right"><?php if ($product['price']) { ?>
                <div class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <b><?php echo $product['special']; ?></b> <s><?php echo $product['price']; ?></s>
                  <?php } ?>
                </div>
                <?php } ?></td>
              <td class="text-right"><button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" data-toggle="tooltip" title="<?php echo $button_cart; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i></button>
                <a href="<?php echo $product['remove']; ?>" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-times"></i></a></td>
            </tr>
            <?php } ?>
          </tbody>
        </table> */ ?>
        <div class="page-hd-title">
          <div class="display-flex align-items-center justify-content-between">
            <h3 class="mb-0 mt-0">My Wishlist</h3>
            <h3 class="mb-0 mt-0"><?php echo count($products); ?> Items</h3>
          </div>
        </div>
        <div class="wishlist-table">
          <?php foreach ($products as $product) { ?>
          <div class="wishlist-row">
            <div class="col-md-5 col-sm-5 wishlo-col-1 col-xs-12">
              <div class="display-flex">
                <div class="wistlist-img m-r-10">
                  <?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                  <?php } ?>
                </div>
                <div class="wishlist-pdp-info-cols">
                  <p class="font-size-12 font-weight-500 mb-0 text-green">
                    <?php echo $product['stock']; ?>
                  </p>
                  <a class="wishlist-pd-name" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  <div class="visible-xs">
                    <div class="display-flex align-items-center mb-10 ">
                      <div class="review-card" style="margin: 0;margin-right: 10px;font-size: 12px">
                        <span><?php echo $product['rating']; ?> </span><span>&nbsp; <i class="fa fa-star"></i></span>
                      </div>
                      <div>
                      <?php if(isset($product['reviews']) && $product['reviews'] > 0){ ?>
                      <p class="mb-0" style="color: #22303D;font-size: 12px;"><?php echo $product['reviews']; ?> Reviews</p>
                      <?php } ?>
                      </div>
                    </div>
                  </div>
                  <div class="display-flex align-items-center">
                    <div class="col-xs-6 pl-0">
                      <?php if ($product['price']) { ?>
                        <div class="price wishlist-pd-price">
                          <?php if (!$product['special']) { ?>
                          <?php echo $product['price']; ?>
                          <?php } else { ?>
                          <b><?php echo $product['special']; ?></b> <s><?php echo $product['price']; ?></s>
                          <?php } ?>
                        </div>
                      <?php } ?>
                    </div>
                    <div class="col-xs-6 visible-xs pl-0 pr-0">
                      <div class="display-flex align-items-center justify-content-end">
                        <div class="mr-10 egg-less-icon xs-mr-5">
                          <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
                            <rect x="0.5" y="0.5" width="17" height="17" rx="1.5" stroke="#4BB543" stroke-linejoin="round"/>
                            <circle cx="9" cy="9" r="6" fill="#4BB543"/>
                          </svg>
                        </div>
                        <div>
                          <p class="mb-0 xs-fs-10" style="color: #22303D;font-size: 10px;">100% Eggless</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-3 col-sm-3 wishlo-col-2 hidden-xs">
              <div class="display-flex align-items-center mb-10">
                <div class="review-card" style="margin: 0;margin-right: 10px;font-size: 12px">
                  <span><?php echo $product['rating']; ?> </span><span>&nbsp; <i class="fa fa-star"></i></span>
                </div>
                
                <div>
                <?php if(isset($product['reviews']) && $product['reviews'] > 0){ ?>
                <p class="mb-0" style="color: #22303D;font-size: 12px;"><?php echo $product['reviews']; ?> Reviews</p>
                <?php } ?>
                </div>
              </div>
              <div class="display-flex align-items-center">
                <div class="mr-10 egg-less-icon xs-mr-5">
                  <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
                    <rect x="0.5" y="0.5" width="17" height="17" rx="1.5" stroke="#4BB543" stroke-linejoin="round"/>
                    <circle cx="9" cy="9" r="6" fill="#4BB543"/>
                  </svg>
                </div>
                <div>
                  <p class="mb-0 xs-fs-10" style="color: #22303D;font-size: 10px;">100% Eggless</p>
                </div>
              </div>
            </div>
            <div class="col-md-4 col-sm-4 wishlo-col-3 col-xs-12">
              <div class="row display-flex align-items-center">
                <div class="col-md-9 col-sm-9 col-xs-6 pl-0 xs-pr-7">
                  <a href="javascript:void(0)" class="wishlist-btn home-primary-btn display-flex align-items-center justify-content-center full-width" onclick="cart.add('<?php echo $product['product_id']; ?>');">
                    <svg class="mr-5" xmlns="http://www.w3.org/2000/svg" width="22" height="20" viewBox="0 0 22 20" fill="none">
                    <path d="M1.25 0.25C1.05109 0.25 0.860322 0.329018 0.71967 0.46967C0.579018 0.610322 0.5 0.801088 0.5 1C0.5 1.19891 0.579018 1.38968 0.71967 1.53033C0.860322 1.67098 1.05109 1.75 1.25 1.75H2.636C2.806 1.75 2.954 1.864 2.998 2.028L5.556 11.62C4.75257 11.8293 4.04126 12.2992 3.53349 12.9561C3.02572 13.613 2.75017 14.4197 2.75 15.25C2.75 15.664 3.086 16 3.5 16H19.25C19.4489 16 19.6397 15.921 19.7803 15.7803C19.921 15.6397 20 15.4489 20 15.25C20 15.0511 19.921 14.8603 19.7803 14.7197C19.6397 14.579 19.4489 14.5 19.25 14.5H4.378C4.53313 14.0612 4.82052 13.6813 5.20056 13.4127C5.5806 13.144 6.0346 12.9999 6.5 13H17.718C17.8585 13 17.9962 12.9605 18.1153 12.8861C18.2345 12.8117 18.3304 12.7053 18.392 12.579C19.5337 10.2361 20.5224 7.82171 21.352 5.351C21.3848 5.25326 21.397 5.14981 21.3881 5.04712C21.3791 4.94442 21.349 4.84468 21.2997 4.75413C21.2505 4.66357 21.1831 4.58415 21.1017 4.52081C21.0204 4.45747 20.9269 4.41158 20.827 4.386C15.5528 3.04115 10.122 2.40985 4.68 2.509L4.448 1.642C4.34156 1.24274 4.10621 0.889824 3.77853 0.638098C3.45086 0.386373 3.0492 0.249939 2.636 0.25H1.25ZM2.75 18.25C2.75 17.8522 2.90804 17.4706 3.18934 17.1893C3.47064 16.908 3.85218 16.75 4.25 16.75C4.64782 16.75 5.02936 16.908 5.31066 17.1893C5.59196 17.4706 5.75 17.8522 5.75 18.25C5.75 18.6478 5.59196 19.0294 5.31066 19.3107C5.02936 19.592 4.64782 19.75 4.25 19.75C3.85218 19.75 3.47064 19.592 3.18934 19.3107C2.90804 19.0294 2.75 18.6478 2.75 18.25ZM15.5 18.25C15.5 17.8522 15.658 17.4706 15.9393 17.1893C16.2206 16.908 16.6022 16.75 17 16.75C17.3978 16.75 17.7794 16.908 18.0607 17.1893C18.342 17.4706 18.5 17.8522 18.5 18.25C18.5 18.6478 18.342 19.0294 18.0607 19.3107C17.7794 19.592 17.3978 19.75 17 19.75C16.6022 19.75 16.2206 19.592 15.9393 19.3107C15.658 19.0294 15.5 18.6478 15.5 18.25Z" fill="white"/>
                    </svg>
                    <span>Add to Cart</span>
                  </a>
                </div>
                <div class="col-md-3 col-sm-3 text-right pr-0 col-xs-6 xs-pl-7">
                  <a href="<?php echo $product['remove']; ?>" class="wishlist-item-remove-btn">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M16.5 4.47795V4.70495C17.799 4.82373 19.0927 4.99454 20.378 5.21695C20.4751 5.23376 20.5678 5.26952 20.6511 5.32219C20.7343 5.37485 20.8063 5.4434 20.8631 5.52391C20.9198 5.60441 20.9601 5.69531 20.9817 5.7914C21.0033 5.88749 21.0058 5.9869 20.989 6.08395C20.9722 6.181 20.9364 6.27378 20.8838 6.35701C20.8311 6.44024 20.7626 6.51227 20.682 6.56901C20.6015 6.62575 20.5106 6.66607 20.4146 6.68768C20.3185 6.70929 20.2191 6.71176 20.122 6.69495L19.913 6.65995L18.908 19.7299C18.8501 20.4835 18.5098 21.1875 17.9553 21.701C17.4008 22.2146 16.6728 22.4999 15.917 22.5H8.08401C7.3282 22.4999 6.60026 22.2146 6.04573 21.701C5.4912 21.1875 5.15095 20.4835 5.09301 19.7299L4.08701 6.65995L3.87801 6.69495C3.78096 6.71176 3.68155 6.70929 3.58546 6.68768C3.48937 6.66607 3.39847 6.62575 3.31796 6.56901C3.15537 6.45443 3.04495 6.27994 3.01101 6.08395C2.97706 5.88795 3.02236 5.6865 3.13694 5.52391C3.25153 5.36131 3.42601 5.2509 3.62201 5.21695C4.90727 4.99427 6.20099 4.82347 7.50001 4.70495V4.47795C7.50001 2.91395 8.71301 1.57795 10.316 1.52695C11.4387 1.49102 12.5623 1.49102 13.685 1.52695C15.288 1.57795 16.5 2.91395 16.5 4.47795ZM10.364 3.02595C11.4547 2.99107 12.5463 2.99107 13.637 3.02595C14.39 3.04995 15 3.68395 15 4.47795V4.59095C13.0018 4.4696 10.9982 4.4696 9.00001 4.59095V4.47795C9.00001 3.68395 9.60901 3.04995 10.364 3.02595ZM10.009 8.97095C10.0052 8.87246 9.98203 8.77568 9.94082 8.68614C9.89961 8.59661 9.84117 8.51606 9.76883 8.44911C9.69649 8.38216 9.61168 8.33011 9.51923 8.29594C9.42678 8.26177 9.3285 8.24614 9.23001 8.24995C9.13152 8.25376 9.03474 8.27693 8.9452 8.31814C8.85567 8.35935 8.77512 8.41779 8.70817 8.49013C8.64122 8.56246 8.58917 8.64728 8.555 8.73973C8.52083 8.83218 8.5052 8.93046 8.50901 9.02895L8.85601 18.0289C8.8637 18.2277 8.95004 18.4153 9.09604 18.5504C9.16833 18.6173 9.25309 18.6693 9.34548 18.7035C9.43787 18.7376 9.53608 18.7533 9.63451 18.7495C9.73293 18.7456 9.82964 18.7225 9.91912 18.6813C10.0086 18.6401 10.0891 18.5817 10.156 18.5094C10.2229 18.4371 10.2749 18.3524 10.3091 18.26C10.3432 18.1676 10.3588 18.0694 10.355 17.971L10.009 8.97095ZM15.489 9.02895C15.4963 8.92857 15.4834 8.82773 15.4509 8.73246C15.4185 8.63719 15.3672 8.54942 15.3001 8.47439C15.233 8.39936 15.1515 8.3386 15.0604 8.29574C14.9694 8.25287 14.8706 8.22877 14.77 8.22488C14.6694 8.22098 14.5691 8.23737 14.475 8.27307C14.3809 8.30877 14.2949 8.36304 14.2222 8.43266C14.1496 8.50228 14.0916 8.58581 14.0519 8.67829C14.0122 8.77077 13.9915 8.8703 13.991 8.97095L13.644 17.971C13.6363 18.1699 13.708 18.3637 13.8432 18.5098C13.9784 18.6559 14.1661 18.7423 14.365 18.75C14.5639 18.7576 14.7577 18.686 14.9038 18.5508C15.0499 18.4156 15.1363 18.2279 15.144 18.0289L15.489 9.02895Z" fill="#BABFC3"/>
                    </svg>
                    <span class="ml-5 visible-xs">Delete</span>
                  </a>
                </div>
              </div>
            </div>
         </div>
          <?php } ?>
        </div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class=""><a href="<?php //echo $continue; ?>https://www.flavoursguru.com/" class="btn btn-primary"><?php //echo $button_continue; ?>Continue Shopping</a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>