<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>

  <div class="review-col slide">
                            <div class="review_2_section">
                              <div class="home-google-review">
                                <div class="text-center border-btm-1 border-color-primary">
                                  <div class="mb-30 xs-mb-15 text-left">
                                    <p style="color: #BABFC3;" class="mb-0"><span><?php echo $review['date_added']; ?> </span></p>
                                  </div>
                                  <div class="mb-30 xs-mb-15 text-left">
                                    <p><?php echo $review['text']; ?></p>
                                  </div>
                                </div>
                              </div>
                              <div class="">
                                <div class="display-flex item-center m-b-20 review_inner_2">
                                  <div class="m-r-15">
                                    <div class="google-testimonial-name">
                                    <span><?php echo strtoupper(substr($review['author'], 0, 1)); ?> </span>
                                    </div>
                                  </div>
                                  <div>
                                    <p class="review_name"><?php echo $review['author']; ?></p>
                                    <div id="">
                                      <span class="review_name"><?php echo $review['rating'] ?>/5</span>
                                      <?php for ($i = 1; $i <= 5; $i++) { ?>
                                      <?php if ($review['rating'] < $i) { ?>
                                      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                      <?php } else { ?>
                                      <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                                      <?php } ?>
                                      <?php } ?>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>


<?php } ?>

<?php } ?>
