<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?>
    
    <h1 class="maintitle">Innovative products for every occasion</h1>
    
    <div class="col-sm-12 giftBlocks">
        <div class="col-sm-2"><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/gifts.png" alt="Under - Rs 499" /> <span><a href="<?php echo $category_content['under'] ; ?>">Under - Rs499</a></span></div>
    	<div class="col-sm-2"><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/giftshamper.png" alt="gift-hamper" /><span><a href="<?php echo $category_content['gifthamper'] ; ?>">Gift Hamper</a></span></div>
    	<div class="col-sm-2"><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/female.png" alt="gift-for-her" /><span><a href="<?php echo $category_content['giftforher'] ; ?>">Gift for her</a></span></div>
    	<div class="col-sm-2"><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/male.png" alt="gift-for-him" /><span><a href="<?php echo $category_content['giftforhim'] ; ?>">Gift for him</a></span></div>
    	<div class="col-sm-2"><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/sameday.png" alt="sameday-delivery" /><span><a href="<?php echo $category_content['samedaydelivery'] ; ?>">Same day<br />Delivery</a></span></div>
    	<div class="col-sm-2"><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/worldwide.png" alt="world-wide-delivery" /><span><a href="<?php echo $category_content['worldwidedelivery'] ; ?>">Worldwide<br />Delivery</a></span></div>                                        
    </div>
    
    <div class="col-sm-12 homeCategoryBlocks">
   
   <div class="homeHeading"><h2><?php echo $category_content['first_cat_data'][0]['catname']; ?></h2> <a href="<?php echo $category_content['first_cat_data'][0]['category_id']; ?>">View All</a></div>
        <?php foreach($category_content['first_cat_data'] as $catproductContent){ ?>
            <div class="col-sm-3">
            <a href="<?php echo $catproductContent['href']; ?>"><img loading="lazy" decoding="async"src="<?php echo 'image/'.$catproductContent['image'];?>" alt="<?php echo $catproductContent['name'];?>" /></a>
            <a href="<?php echo $catproductContent['href']; ?>"><div class="productName"><?php echo $catproductContent['name'];?></div></a>
            <div class="price"><?php echo $catproductContent['price'];?></div>
            <a href="<?php echo $catproductContent['href']; ?>" class="buynow">Buy Now</a>
        </div>
      <?php   } ?>
        
      </div>
    
    <div class="col-sm-12 homeCategoryBlocks">
        <div class="homeHeading"><h2><?php echo $category_content['second_cat_data'][0]['catname']; ?></h2> <a href="<?php echo $category_content['second_cat_data'][0]['category_id']; ?>">View All</a></div>
        <?php foreach($category_content['second_cat_data'] as $catproductContent){ ?>
            <div class="col-sm-3">
            <a href="<?php echo $catproductContent['href']; ?>"><img loading="lazy" decoding="async"src="<?php echo 'image/'.$catproductContent['image'];?>" alt="<?php echo $catproductContent['name'];?>" /></a>
            <a href="<?php echo $catproductContent['href']; ?>"><div class="productName"><?php echo $catproductContent['name'];?></div></a>
            <div class="price"><?php echo $catproductContent['price'];?></div>
            <a href="<?php echo $catproductContent['href']; ?>" class="buynow">Buy Now</a>
        </div>
      <?php   } ?>
   </div>
    
    <div class="col-sm-12 homeCategoryBlocks">
        <div class="homeHeading"><h2><?php echo $category_content['third_cat_data'][0]['catname']; ?></h2> <a href="<?php echo $category_content['third_cat_data'][0]['category_id']; ?>">View All</a></div>
        
        <?php foreach($category_content['third_cat_data'] as $catproductContent){ ?>
            <div class="col-sm-3">
            <a href="<?php echo $catproductContent['href']; ?>"><img loading="lazy" decoding="async"src="<?php echo 'image/'.$catproductContent['image'];?>" alt="<?php echo $catproductContent['name'];?>" /></a>
            <a href="<?php echo $catproductContent['href']; ?>"><div class="productName"><?php echo $catproductContent['name'];?></div></a>
            <div class="price"><?php echo $catproductContent['price'];?></div>
            <a href="<?php echo $catproductContent['href']; ?>" class="buynow">Buy Now</a>
        </div>
      <?php   } ?>
    </div>
    
    <div class="col-sm-12 homeCategoryBlocks">
        <div class="homeHeading"><h2><?php echo $category_content['fourth_cat_data'][0]['catname']; ?></h2> <a href="<?php echo $category_content['fourth_cat_data'][0]['category_id']; ?>">View All</a></div>
        
        <?php foreach($category_content['fourth_cat_data'] as $catproductContent){ ?>
            <div class="col-sm-3">
            <a href="<?php echo $catproductContent['href']; ?>"><img loading="lazy" decoding="async"src="<?php echo 'image/'.$catproductContent['image'];?>" alt="<?php echo $catproductContent['name'];?>" /></a>
            <a href="<?php echo $catproductContent['href']; ?>"><div class="productName"><?php echo $catproductContent['name'];?></div></a>
            <div class="price"><?php echo $catproductContent['price'];?></div>
            <a href="<?php echo $catproductContent['href']; ?>" class="buynow">Buy Now</a>
        </div>
      <?php   } ?>
    </div>
    
    <div class="col-sm-12 homeCategoryBlocks">
        <div class="homeHeading"><h2><?php echo $category_content['fifth_cat_data'][0]['catname']; ?></h2> <a href="<?php echo $category_content['fifth_cat_data'][0]['category_id']; ?>">View All</a></div>
        
    <?php foreach($category_content['fifth_cat_data'] as $catproductContent){ ?>
            <div class="col-sm-3">
            <a href="<?php echo $catproductContent['href']; ?>"><img loading="lazy" decoding="async"src="<?php echo 'image/'.$catproductContent['image'];?>" alt="<?php echo $catproductContent['name'];?>" /></a>
            <a href="<?php echo $catproductContent['href']; ?>"><div class="productName"><?php echo $catproductContent['name'];?></div></a>
            <div class="price"><?php echo $catproductContent['price'];?></div>
            <a href="<?php echo $catproductContent['href']; ?>" class="buynow">Buy Now</a>
        </div>
      <?php   } ?>
    </div>
        
    <div class="col-sm-12 mainInfo">
    <div class="col-sm-3">
        <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/cities-covered.png" alt="More Than 250+ Cities Covered" />
        <span>
            More Than<br /> <strong>250+</strong><br /> Cities Covered
        </span>
    </div>
    <div class="col-sm-3">
        <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/choose-products.png" alt="Choose From 50,000+ Products" />
        <span>
            Choose From<br /> <strong>50,000+</strong><br /> Products
        </span>
    </div>
    <div class="col-sm-3">
                <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/delivery-countries.png" alt="Delivery in 100+ Countries" />
                <span>
                    Delivery in<br /> <strong>100+</strong><br /> Countries
                </span>
            </div>
    <div class="col-sm-3">
                <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/happy-customers.png" alt="More Than 2,00000+ Happy Customers" />
                <span>
                    More Than<br /> <strong>2,00000+</strong><br /> Happy Customers
                </span>
            </div>
                        
    </div>
    
    <div class="col-sm-12 homeFootContent">
    	<div class="hFcontent">
        	<h2>Send Flowers Online with Flower Delivery by 1-800-Flowers.com, the World's Favorite Florist!</h2>
            <p>There's no better place to order flowers online than 1-800-Flowers.com. <span class="text">Whether you're looking for roses, orchids, gift baskets, bonsai trees, flowering plants or wedding bouquets, we have the highest quality blooms and the most talented florists who can create exactly what you order. Dazzle and delight your loved ones wherever they may be with truly original flowers and gifts from 1-800-Flowers.com.</span>
</p>
<span class="readmore">Read More</span>
        </div>
        
        <div class="hFcontent">
        	<h2>Quick Flower Delivery and Great Customer Service</h2>
            <p>Same-day flower delivery is available every day, for all seasons: spring, winter, summer and fall. <span class="text">To send flowers for same-day delivery, all you have to do is place your order by the following times in the gift receiver's time zone: 2:30 p.m. weekdays, 1 p.m. Saturdays, and 11:30 a.m. Sundays. Our customer service team is standing by to help you with any gift or flower order. Whether you're sending red roses to your sweetie, spring flowers and gifts to celebrate the season, or a get well gift to someone feeling under the weather, if you have questions, our team has answers! Just call 1-800-356-9377 or place an order for flower delivery online. We will help you find and deliver the perfect flowers, plants, or gift to celebrate life's most meaningful moments - from birthday gift recommendations, to anniversary floral arrangements she is sure to love.</span>
            </p>
            <p><span class="text">For sympathy gifts and funeral flowers, our team of experienced Sympathy Advisors are ready to assist you at 1-866-538-2259.</span></p>
<span class="readmore">Read More</span>
        </div>
        
        <div class="hFcontent">
        	<h2>Order Flowers Online for All Occasions and Holidays</h2>
            <p>We're the best choice when shopping online for gifts and flowers just because, or for special occasions like Mother's Day or Valentine's Day. <span class="text">Choose the perfect gift from the best selection of roses, mixed bouquets, fruit arrangements, gourmet baskets, and other gifts. With a wide variety of colors, sizes and seasonal themes, we have flowers and gifts for everyone. With same-day gift delivery, we're also your source for last-minute gifts, too!</span></p>
            <p><span class="text">Deliver smiles all year long with Free Shipping/No Service Charge on all your flowers & gifts when you join the Celebrations Passport program.</span></p>
<span class="readmore">Read More</span>
        </div>
        
        <div class="hFcontent">
        	<h2>Send Flowers Internationally</h2>
            <p>We deliver flowers across the United States and around the world. <span class="text">If you want to send flowers internationally, trust us to deliver your most heartfelt messages. Because of our partnerships with local florists and flower growers, we are able to ensure that bouquets are delivered fresh from the field and on time. Our flower arrangements are artfully created and delivered perfectly arranged by professional florists.</span></p>
<span class="readmore">Read More</span>
        </div>
        
        <div class="hFcontent">
        	<h2>Trusted Florists Guaranteed</h2>
            <p>In 1976, Jim McCann, founder and CEO of 1-800-Flowers.com, opened his first retail florist shop and forever changed the way flowers are bought for birthdays, anniversaries and special occasions. <span class="text">For more than 30 years, our passion has been to help you connect and express yourself to the important people in your life by providing the finest selection of beautiful flowers and arrangements available for same day or next day delivery, from roses and orchids to tulips, carnations, and daisies. With quality supported by our 100% Satisfaction Guarantee, you can also find plants, gift baskets, gourmet foods, and stuffed animals that are perfect for every occasion.</span> </p>
        
        <p><span class="text">A Forbes Magazine Best of the Web pick, and named as Internet Retailer's Best of the Web Top 50 Retail Sites list for seven consecutive years, 1-800-Flowers.com is proud to offer solutions for every gifting need, whether you're looking for flower delivery across town or across the country.</span></p>
<span class="readmore">Read More</span>        
        </div>
        
        <div class="hFcontent">
        	<h2>Trending Flowers News & Articles from Our Flower Blog, Petal Talk:</h2>
            <a href="#">DIY Carrot Decorations for Easter by Julie Mulligan</a>
<a href="#">The History of the Easter Lily</a>
<a href="#">How & When You Should Plant Tulip Bulbs</a>
<a href="#">The Meaning Behind Each Tulip Color</a>
<a href="#">The Best Places to See Spring Flowers</a>
<a href="#">All About Lavender</a>
        </div>
        
        
    </div>
    
    </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>