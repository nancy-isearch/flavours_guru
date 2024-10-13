<?php echo $header; ?>
<div class="container top_positionn">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <div class="row">
        <div class="col-sm-12 xs-p-l-0 xs-p-r-0">
          <div class="sitemap-container" style="display: none;">
            <div class='sitemap-inner-container test'>
              <?php foreach($sitemap as $section_name=>$type){ ?>
                <div class='sitemap-item plus-icon'><?php echo $section_name ?></div>
                <div class='site-map-item-data'>
                  <div id="sitemap-tabs-container">
                    <ul class="sitemap-tabs-menu">
                      <?php $i=1; $section_var=str_replace("&","-",str_replace(" ", "-", strtolower($section_name))); foreach($type as $type_name=>$category){ ?>
                        <li class="<?php echo $i==1?'current':''?>"><a href="#<?php echo $section_var ?>-<?php echo $i++; ?>"><?php echo $type_name ?></a></li>
                      <?php } ?>
                    </ul>
                    <div class="sitemap-tab">
                      <?php $i=1; foreach($type as $type_name=>$category){ ?>
                        <div id="<?php echo $section_var ?>-<?php echo $i++; ?>" class="tab-content">
                          <div class='left-menu'>
                            <ul>
                              <?php foreach($category as $category_name=>$category_url){ ?>
                                <li><a href='<?php echo $category_url ?>'><?php echo $category_name ?></a></li>
                              <?php } ?>
                            </ul>
                          </div>        
                        </div>
                      <?php } ?>
                    </div>
                  </div>  
                </div>
              <?php } ?>

            </div>
          </div>

          <div class="sitemap-container">
            <div class='sitemap-inner-container test'>
                <div class='sitemap-item plus-icon'>Information pages</div>
                <div class="site-map-item-data">
                  <div id="sitemap-tabs-container">
                    <div class="sitemap-tab">
                      <div id="trending_cakes" class="tab-content inner_tab_cat_col">
                        <ul>
                          <li><a href="/blogs">Blog</a></li>
                          <li><a href="/about-us">About Us</a></li>
                          <li><a href="/testimonial">Testimonial</a></li>
                          <li><a href="/faq">FAQ</a></li>
                          <li><a href="/locate">Locate Us</a></li>
                          <li><a href="/contact">Contact Us</a></li>
                          <li><a href="/cake-care-instructions">Cake Care instructions</a></li>
                          <li><a href="/shipping-disclaimer">Shipping Disclaimer</a></li>
                          <li><a href="/baking-institute">Baking Institute</a></li>
                          <li><a href="/terms-conditions">Terms &amp; Conditions</a></li>
                          <li><a href="/privacy-policy">Privacy Policy</a></li> 
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                <div class='sitemap-item plus-icon'>Cakes</div>
                <div class='site-map-item-data'>
                  <div id="sitemap-tabs-container">
                    <ul class="sitemap-tabs-menu">
                      <li class="current">
                        <a href="#cakes_by_type">By Type</a>
                      </li>
                      <li class="">
                        <a href="#cakes_by_flavours">By Flavours</a>
                      </li>
                      <li class="">
                        <a href="#cakes_by_best_sellers">Best Sellers</a>
                      </li>
                    </ul>
                    <div class="sitemap-tab">
                        <div id="cakes_by_type" class="tab-content inner_tab_cat_col">
                          <ul>
                            <li>
                              <a href="/regular-cakes">Regular Cakes</a>
                            </li>
                            <li>
                              <a href="/photo-cakes">Photo Cakes</a>
                            </li>
                            <li>
                              <a href="/custom-theme-cakes">Theme Cakes</a>
                            </li>
                            <li>
                              <a href="/cartoon-cakes">Cartoon Cakes</a>
                            </li>
                            <li>
                              <a href="/pull-me-up-cake">Pulll Me Up Cakes</a>
                            </li>
                            <li>
                              <a href="/number-cakes">Number Cakes</a>
                            </li>
                            <li>
                              <a href="/multi-tier-cakes">Multi Tier Cakes</a>
                            </li>
                            <li>
                              <a href="/dry-cakes">Dry Cakes</a>
                            </li>
                            <li>
                              <a href="/cup-cakes">Cup Cakes</a>
                            </li>
                            <li>
                              <a href="/pinata-cakes">Pinata Cakes</a>
                            </li>
                          </ul>
                        </div>
                        <div id="cakes_by_flavours" class="tab-content inner_tab_cat_col">
                          <ul>
                                              <li>
                          <a href="/regular-cakes/chocolate-cakes">Chocolate Cakes</a>
                        </li>
                                              <li>
                          <a href="/classic-cakes">Classic Cakes</a>
                        </li>
                                              <li>
                          <a href="/regular-cakes/black-forest-cakes">Black Forest Cakes</a>
                        </li>
                                              <li>
                          <a href="/regular-cakes/butterscotch-cakes">Butterscotch Cakes</a>
                        </li>
                                              <li>
                          <a href="/regular-cakes/vanilla-cakes">Vanilla Cakes</a>
                        </li>
                                              <li>
                          <a href="/regular-cakes/pineapple-cakes">Pineaapple Cakes</a>
                        </li>
                                              <li>
                          <a href="/chocolate-truffle">Chocolate Truffle</a>
                        </li>
                                              <li>
                          <a href="/regular-cakes/strawberry-cakes">Strawberry Cakes</a>
                        </li>
                                              <li>
                          <a href="/regular-cakes/fruit-cakes">Fruit Cakes</a>
                        </li>
                                              <li>
                          <a href="/regular-cakes/red-velvet">Red Velvet Cake</a>
                        </li>
                                              <li>
                          <a href="/regular-cakes/mango-cakes">Mango Cake</a>
                        </li>
                                              <li>
                          <a href="/ferrero-rocher-cakes">Ferrero Rocher Cakes</a>
                        </li>
                                              <li>
                          <a href="/regular-cakes/white-forest-cakes">White Forest Cakes</a>
                        </li>
                                              <li>
                          <a href="/dark-chocolate-cakes">Dark Chocolate Cakes</a>
                        </li>
                                              <li>
                          <a href="/regular-cakes/coffee-cakes">Coffee Cakes</a>
                        </li>
                                              <li>
                          <a href="/regular-cakes/kiwi-cakes">Kiwi Cakes</a>
                        </li>
                                              <li>
                          <a href="/regular-cakes/blueberry-cakes">Blueberry Cakes</a>
                        </li>
                                              <li>
                          <a href="/regular-cakes/cheese-cakes">Cheese Cakes</a>
                        </li>
                                          </ul>
                        </div>

                        <div id="cakes_by_best_sellers" class="tab-content inner_tab_cat_col">
                          <ul>
                                              <li>
                          <a href="/custom-theme-cakes">Theme Cakes</a>
                        </li>
                                              <li>
                          <a href="/cartoon-cakes">Cartoon Cakes</a>
                        </li>
                                              <li>
                          <a href="/pull-me-up-cake">Pulll Me Up Cakes</a>
                        </li>
                                              <li>
                          <a href="/number-cakes">Number Cakes</a>
                        </li>
                                              <li>
                          <a href="/multi-tier-cakes">Multi Tier Cakes</a>
                        </li>
                                          </ul>
                        </div>
                    </div>
                  </div>  
                </div>
                <div class='sitemap-item plus-icon'>Designer Cakes</div>
                <div class="site-map-item-data">
                  <div id="sitemap-tabs-container">
                    <ul class="sitemap-tabs-menu">
                      <li class="current">
                        <a href="#kids_cakes">Kids Cakes</a>
                      </li>
                      <li class="">
                        <a href="#cakes_by_prodession">Cakes By Profession/Hobbies</a>
                      </li>
                      <li class="">
                        <a href="#customize_theme_cakes">Customize Theme Cakes</a>
                      </li>
                    </ul>
                    <div class="sitemap-tab">
                      <div id="kids_cakes" class="tab-content inner_tab_cat_col">
                        <ul>
                                              <li>
                          <a href="/kids">Cakes for Kids</a>
                        </li>
                                              <li>
                          <a href="/kids/boys">Cakes for Boy</a>
                        </li>
                                              <li>
                          <a href="/new-born">New Born Cakes</a>
                        </li>
                                              <li>
                          <a href="/cartoon-cakes/peppa-pig">Peppa Pig Cakes</a>
                        </li>
                                              <li>
                          <a href="/cartoon-cakes/frozen">Frozen Theme Cakes</a>
                        </li>
                                              <li>
                          <a href="/cartoon-cakes/avengers">Avengers Cake</a>
                        </li>
                                              <li>
                          <a href="/cartoon-cakes/masha-and-the-bear-cake">Masha &amp; Bear</a>
                        </li>
                                              <li>
                          <a href="/cartoon-cakes/coco-melon-cakes">Coco Melon</a>
                        </li>
                                              <li>
                          <a href="/cartoon-cakes/minion">Minion Cakes</a>
                        </li>
                                              <li>
                          <a href="/cartoon-cakes/jungle-book">Jungle Theme Cakes</a>
                        </li>
                                              <li>
                          <a href="/cartoon-cakes/jurassic-park">Jurrasic Park Cakes</a>
                        </li>
                                              <li>
                          <a href="/cartoon-cakes/barbie">Disney Princess Cakes</a>
                        </li>
                                              <li>
                          <a href="/cartoon-cakes">All Cartoon Cakes</a>
                        </li>
                          </ul>
                      </div>
                      <div id="cakes_by_prodession" class="tab-content inner_tab_cat_col">
                          <ul>
                                              <li>
                          <a href="/cakes-by-profession/doctor">Doctor</a>
                        </li>
                                              <li>
                          <a href="/cakes-by-profession/traveller">Traveller</a>
                        </li>
                                              <li>
                          <a href="/cakes-by-profession/engineers">Engineer</a>
                        </li>
                                              <li>
                          <a href="/cakes-by-profession/soldier">Soldier</a>
                        </li>
                                              <li>
                          <a href="/cakes-by-profession/cabin-crew">Cabin Crew</a>
                        </li>
                                              <li>
                          <a href="/cakes-by-profession/lawyer-cakes">Advocate</a>
                        </li>
                                              <li>
                          <a href="/cakes-by-profession/dj">DJ</a>
                        </li>
                                              <li>
                          <a href="/custom-theme-cakes/bikers">Biker</a>
                        </li>
                                              <li>
                          <a href="/custom-theme-cakes/car">Car Lover</a>
                        </li>
                                              <li>
                          <a href="/cake-by-traits/gamer">Gamers</a>
                        </li>
                                              <li>
                          <a href="/cake-by-traits/workaholic">Workaholic</a>
                        </li>
                                              <li>
                          <a href="/cake-by-traits/lazy-man">Lazy Dude</a>
                        </li>
                                              <li>
                          <a href="/cake-by-traits/tv-lover">TV Lovers</a>
                        </li>
                                              <li>
                          <a href="/cake-by-traits/foodie">Foodie</a>
                        </li>
                                              <li>
                          <a href="/cakes-by-profession">All Cakes By Profession</a>
                        </li>
                                              <li>
                          <a href="/cake-by-traits">All Cakes By Trait</a>
                        </li>
                          </ul>
                      </div>
                      <div id="customize_theme_cakes" class="tab-content inner_tab_cat_col">
                          <ul>
                          <li>
                          <a href="/custom-theme-cakes/bts-cakes">BTS Theme Cakes</a>
                        </li>
                                              <li>
                          <a href="/custom-theme-cakes/cricket-cakes">Cricket Theme Cakes</a>
                        </li>
                                              <li>
                          <a href="/custom-theme-cakes/sports-theme-cakes">Sports Theme Cakes</a>
                        </li>
                                              <li>
                          <a href="/custom-theme-cakes/carnival-theme-cakes">Carnival Theme Cakes</a>
                        </li>
                                              <li>
                          <a href="/custom-theme-cakes/golf-cakes">Cake for Golfers</a>
                        </li>
                                              <li>
                          <a href="/cakes-by-profession/makeup-artist">Cakes for Makeup Artist</a>
                        </li>
                                              <li>
                          <a href="/cakes-by-profession/footballer">Cakes for Footballer</a>
                        </li>
                                              <li>
                          <a href="/cakes-by-profession/photographer">Cakes For Photographer</a>
                        </li>
                                              <li>
                          <a href="/cakes-by-profession/fashion-designer">For Fashion Designer</a>
                        </li>
                                              <li>
                          <a href="/naughty-cakes">Quirky Cakes</a>
                        </li>
                                              <li>
                          <a href="/custom-theme-cakes/gym-cakes">Gym Theme Cakes</a>
                        </li>
                                              <li>
                          <a href="/custom-theme-cakes/makeup-cakes">Makeup Theme Cakes</a>
                        </li>
                                              <li>
                          <a href="/custom-theme-cakes/unicorn-cakes">Unicorn Cakes</a>
                        </li>
                                              <li>
                          <a href="/custom-theme-cakes/bottle-shape-cakes">Bottle Shape Cakes</a>
                        </li>
                                              <li>
                          <a href="/custom-theme-cakes/roblox-cakes">Roblox Theme Cakes</a>
                        </li>
                                              <li>
                          <a href="/custom-theme-cakes/shopping-cakes">Shopping Theme Cakes</a>
                        </li>
                                              <li>
                          <a href="/custom-theme-cakes/pubg-theme-cakes">Cake For Pubg Lovers</a>
                        </li>
                                              <li>
                          <a href="/custom-theme-cakes/football-cakes">Football Cakes</a>
                        </li>
                                              <li>
                          <a href="/custom-theme-cakes/game-of-thrones">Game Of Thrones</a>
                        </li>
                                              <li>
                          <a href="/custom-theme-cakes">All Theme Cakes</a>
                        </li>
                          </ul>
                      </div>
                    </div>
                  </div>
                </div>
                <div class='sitemap-item plus-icon'>Birthday Cakes</div>
                <div class="site-map-item-data">
                  <div id="sitemap-tabs-container">
                    <ul class="sitemap-tabs-menu">
                      <li class="current">
                        <a href="#birthday_by_type">By Type</a>
                      </li>
                      <li class="">
                        <a href="#birthday_for_him">For Him</a>
                      </li>
                      <li class="">
                        <a href="#birthday_for_her">For Her</a>
                      </li>
                      <li class="">
                        <a href="#birthday_kids">Kids</a>
                      </li>
                    </ul>
                    <div class="sitemap-tab">
                      <div id="birthday_by_type" class="tab-content inner_tab_cat_col">
                        <ul>
                                              <li>
                          <a href="/birthday">All Birthday Cakes</a>
                        </li>
                                              <li>
                          <a href="/birthday/1st-birthday">1st Birthday</a>
                        </li>
                                              <li>
                          <a href="/birthday/half-birthday">Half Birthday</a>
                        </li>
                                              <li>
                          <a href="/kids">Kids Birthday</a>
                        </li>
                                          </ul>
                      </div>
                      <div id="birthday_for_him" class="tab-content inner_tab_cat_col">
                          <ul>
                                              <li>
                          <a href="/birthday/boyfriend">Boyfriend</a>
                        </li>
                                              <li>
                          <a href="/birthday/husband">Husband</a>
                        </li>
                                              <li>
                          <a href="/birthday/father">Father</a>
                        </li>
                                              <li>
                          <a href="/birthday/brother">Brother</a>
                        </li>
                                              <li>
                          <a href="/birthday/son">Son</a>
                        </li>
                                              <li>
                          <a href="/birthday/male-friend">Male Friend</a>
                        </li>
                                              <li>
                          <a href="/fiance">Fiance</a>
                        </li>
                                          </ul>
                      </div>
                      <div id="birthday_for_her" class="tab-content inner_tab_cat_col">
                          <ul>
                                              <li>
                          <a href="/birthday/girlfriend">Girlfriend</a>
                        </li>
                                              <li>
                          <a href="/her">Her</a>
                        </li>
                                              <li>
                          <a href="/birthday/wife">Wife</a>
                        </li>
                                              <li>
                          <a href="/birthday/sister">Sister</a>
                        </li>
                                              <li>
                          <a href="/birthday/mother">Mother</a>
                        </li>
                                              <li>
                          <a href="/birthday/daughter">Daughter</a>
                        </li>
                                              <li>
                          <a href="/birthday/female-friend">Female Friend</a>
                        </li>
                                              <li>
                          <a href="/fiancee">Fiancee</a>
                        </li>
                                          </ul>
                      </div>
                      <div id="birthday_kids" class="tab-content inner_tab_cat_col">
                          <ul>
                                              <li>
                          <a href="/kids">Kids</a>
                        </li>
                                              <li>
                          <a href="/kids/boys">Boys</a>
                        </li>
                                              <li>
                          <a href="/kids/girls">Girl</a>
                        </li>
                                              <li>
                          <a href="/new-born">New Born</a>
                        </li>
                          </ul>
                      </div>
                    </div>
                  </div>
                </div>
                <div class='sitemap-item plus-icon'>Anniversary Cakes</div>
                <div class="site-map-item-data">
                  <div id="sitemap-tabs-container">
                    <ul class="sitemap-tabs-menu">
                      <li class="current">
                        <a href="#anniversary_cakes">Anniversary</a>
                      </li>
                    </ul>
                    <div class="sitemap-tab">
                      <div id="anniversary_cakes" class="tab-content inner_tab_cat_col">
                        <ul>
                                              <li>
                          <a href="/anniversary">All Anniversary Cakes</a>
                        </li>
                                              <li>
                          <a href="/anniversary/husband">Husband</a>
                        </li>
                                              <li>
                          <a href="/anniversary/wife">Wife</a>
                        </li>
                                              <li>
                          <a href="/anniversary/parents">Parents</a>
                        </li>
                                              <li>
                          <a href="/anniversary/friend">Friend</a>
                        </li>
                                              <li>
                          <a href="/anniversary/1st-anniversary">1st Anniversary</a>
                        </li>
                                              <li>
                          <a href="/anniversary/25th-anniversary">25th Anniversary</a>
                        </li>
                                              <li>
                          <a href="/anniversary/50th-anniversary">50th Anniversary</a>
                        </li>
                                              <li>
                          <a href="/anniversary/love-anniversary">Love Anniversary</a>
                        </li>
                                          </ul>
                      </div>
                    </div>
                  </div>
                </div>
                <div class='sitemap-item plus-icon'>Cakes By Cities</div>
                <div class="site-map-item-data">
                  <div id="sitemap-tabs-container">
                    <ul class="sitemap-tabs-menu">
                      <li class="current">
                        <a href="#all_cities">All Cities</a>
                      </li>
                    </ul>
                    <div class="sitemap-tab">
                      <div id="all_cities" class="tab-content inner_tab_cat_col">
                        <ul>
                                              <li>
                          <a href="/cakes/delhi">Cakes in Delhi</a>
                        </li>
                                              <li>
                          <a href="/cakes/faridabad">Cakes in Faridabad</a>
                        </li>
                                              <li>
                          <a href="/cakes/ghaziabad">Cakes in Ghaziabad</a>
                        </li>
                                              <li>
                          <a href="/cakes/noida">Cakes in Noida</a>
                        </li>
                                              <li>
                          <a href="/cakes/greater-noida">Cakes in Greater Noida</a>
                        </li>
                                              <li>
                          <a href="/cakes/gurgaon">Cakes in Gurgaon</a>
                        </li>
                                              <li>
                          <a href="/cakes/hyderabad">Cakes in Hyderabad</a>
                        </li>
                                          </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

                <div class='sitemap-item plus-icon'>Cakes By Occasions</div>
                <div class="site-map-item-data">
                  <div id="sitemap-tabs-container">
                    <ul class="sitemap-tabs-menu">
                      <li class="current">
                        <a href="#public_occasions">Public Occasions</a>
                      </li>
                      <li class="">
                        <a href="#personal_occasions">Personal Occasions</a>
                      </li>
                    </ul>
                    <div class="sitemap-tab">
                      <div id="public_occasions" class="tab-content inner_tab_cat_col">
                        <ul>
                                              <li>
                          <a href="https://www.flavoursguru.com/valentines-day">Valentine's Day</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/womens-day">Womens Day-8th March</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/mothers-day">Mother's Day</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/fathers-day">Father's Day</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/friendship-day">Friendship Day - 7th August</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/rakhi">Rakhi - 11th August</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/independence-day">Independence Day - 15th August</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/janmashtami-cakes">Janmashtmi - 18th August</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/teachers-day-cakes">Teacher's Day</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/grand-parents-day">Grand Parents Day</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/bosss-day-16th-oct">Boss's Day</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/halloween-cakes">Halloween Cakes</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/diwali">Diwali - 24th October</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/christmas">Christmas Cakes</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/new-year-1st-jan">New Year</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/lohri-cakes">Lohri - 13th January</a>
                        </li>
                                          </ul>
                      </div>
                      <div id="personal_occasions" class="tab-content inner_tab_cat_col">
                          <ul>
                                              <li>
                          <a href="https://www.flavoursguru.com/bachelorette-cake">Bachelor Party</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/wedding">Wedding Cakes</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/engagement-cakes">Engagement Cakes</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/bride-to-be">Bride To Be</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/baby-shower-cakes">Baby Shower</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/mom-to-be-cakes">Mom To Be</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/party">Party Cakes</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/just-like-that">Just Like That</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/i-love-you">Romance Cakes</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/congratulations">Congratulations</a>
                        </li>
                                              <li>
                          <a href="https://www.flavoursguru.com/thank-you">Thank You</a>
                        </li>
                                          </ul>
                      </div>
                    </div>
                  </div>
                </div>

                <div class='sitemap-item plus-icon'>Premium Cakes</div>
                <div class="site-map-item-data">
                  <div id="sitemap-tabs-container">
                    <ul class="sitemap-tabs-menu">
                      <li class="current">
                        <a href="#trending_cakes">Trending Cakes</a>
                      </li>
                    </ul>
                    <div class="sitemap-tab">
                      <div id="trending_cakes" class="tab-content inner_tab_cat_col">
                        <ul>
                                              <li>
                          <a href="/index.php?route=product/category&amp;path=251">Balloon Cakes</a>
                        </li>
                                              <li>
                          <a href="/fault-line-cake">Fault Line Cakes</a>
                        </li>
                                              <li>
                          <a href="/isomalt-cakes">Isomalt Cakes</a>
                        </li>
                                              <li>
                          <a href="/surprise-cake-box">Surprise Box</a>
                        </li>
                                              <li>
                          <a href="/bomb-cake">Bomb Cakes</a>
                        </li>
                                              <li>
                          <a href="/pull-me-up-cake">Pulll Me Up Cakes</a>
                        </li>
                                          </ul>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
          </div> 

                  <script type="text/javascript">
          jQuery(document).ready(function(e){
            
            jQuery('.sitemap-item').click(function (e){
              jQuery(".sitemap-item").addClass('plus-icon').removeClass('minus-icon');
              jQuery(this).next('.site-map-item-data').find('.sitemap-tab .tab-content').css("display", "none");
              jQuery(this).next('.site-map-item-data').find('.sitemap-tabs-menu li').removeClass("current");
              if(jQuery(this).next('.site-map-item-data').css('display') != 'block'){
                jQuery(this).addClass('minus-icon').removeClass('plus-icon');
                jQuery(this).next('.site-map-item-data').find('.sitemap-tabs-menu li:first-child').addClass("current");
                jQuery(this).next('.site-map-item-data').find('.sitemap-tab .tab-content:first-child').css("display", "block");
                jQuery('.active-step').slideUp('fast').removeClass('active-step');
                jQuery(this).next('.site-map-item-data').addClass('active-step').slideDown('slow');
              } else {
                jQuery('.active-step').slideUp('fast').removeClass('active-step');
                jQuery(this).addClass('plus-icon').removeClass('minus-icon');
              }
            });
            
            /*************** Tab code start *************/
            
            jQuery(".sitemap-tabs-menu a").click(function(event) {
                  event.preventDefault();
                  jQuery(this).parent().addClass("current");
                  jQuery(this).parent().siblings().removeClass("current");
                  var tab = jQuery(this).attr("href");
                  jQuery(".tab-content").not(tab).css("display", "none");
                  jQuery(tab).fadeIn();
              });

            jQuery('.sitemap-item:first').trigger('click');
            
            /****************End tab code ***************/
          });

          </script>

        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>