<?php echo $header; ?>
<div class="container top_positionn">
  <ul class="breadcrumb">
    <?php 
        $i=1; 
        $Totlbrdcum = count($breadcrumbs); 
        foreach($breadcrumbs as $breadcrumb) {  
         if($Totlbrdcum==$i){  
      ?> 
          <li><span class="" style="color: #35a8d4;"><?php echo $breadcrumb['text']; ?> </span></li>
      <?php  } else { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?> </a></li> 
      <?php } $i++; }   ?>
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
      <?php echo $description; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
<?php if (strpos($_SERVER['REQUEST_URI'], '/locate') !== false) { ?>
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "Bakery",
      "@id": "https://www.flavoursguru.com/locate#delhi",
      "name": "Flavours Guru - Bakery & Cake Shop, Malviya Nagar",
      "url": "https://www.flavoursguru.com/locate",
      "image": "https://www.flavoursguru.com/image/catalog/Flavours%20Guru/logo.webp",
      "telephone": "+91-8130961414",
      "email": "cs@flavoursguru.com",
      "parentOrganization": { "@id": "https://www.flavoursguru.com/#organization" },
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "R-59, Opposite Select City Walk, Near Sai Baba Temple, Malviya Nagar",
        "addressLocality": "New Delhi",
        "addressRegion": "Delhi",
        "postalCode": "110017",
        "addressCountry": "IN"
      },
      "geo": { "@type": "GeoCoordinates", "latitude": 28.533812295294346, "longitude": 77.21476301446387 },
      "hasMap": "https://www.google.com/maps/place/?q=place_id:0x390ce21dcdd28a89"
    },
    {
      "@type": "Bakery",
      "@id": "https://www.flavoursguru.com/locate#gurgaon",
      "name": "Flavours Guru - Bakery & Cake Shop, Gurgaon",
      "url": "https://www.flavoursguru.com/locate",
      "image": "https://www.flavoursguru.com/image/catalog/Flavours%20Guru/logo.webp",
      "telephone": "+91-8130961414",
      "email": "cs@flavoursguru.com",
      "parentOrganization": { "@id": "https://www.flavoursguru.com/#organization" },
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "414/3 A, Prem Nagar, Sector-12, Near Mamta Hospital",
        "addressLocality": "Gurugram",
        "addressRegion": "Haryana",
        "postalCode": "122002",
        "addressCountry": "IN"
      },
      "geo": { "@type": "GeoCoordinates", "latitude": 28.493878882472632, "longitude": 77.09131051424453 }
    },
    {
      "@type": "Bakery",
      "@id": "https://www.flavoursguru.com/locate#noida",
      "name": "Flavours Guru - Online Cake Shop, Noida",
      "url": "https://www.flavoursguru.com/locate",
      "image": "https://www.flavoursguru.com/image/catalog/Flavours%20Guru/logo.webp",
      "telephone": "+91-8130961414",
      "email": "cs@flavoursguru.com",
      "parentOrganization": { "@id": "https://www.flavoursguru.com/#organization" },
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "Chauhan Complex, Basement, Gali Number 1, Near Chauhan Market, Sector 44",
        "addressLocality": "Noida",
        "addressRegion": "Uttar Pradesh",
        "postalCode": "201303",
        "addressCountry": "IN"
      },
      "geo": { "@type": "GeoCoordinates", "latitude": 28.561100894062537, "longitude": 77.33719721446452 }
    },
    {
      "@type": "Bakery",
      "@id": "https://www.flavoursguru.com/locate#chandigarh",
      "name": "Flavours Guru - Bakery & Cake Shop, Chandigarh",
      "url": "https://www.flavoursguru.com/locate",
      "image": "https://www.flavoursguru.com/image/catalog/Flavours%20Guru/logo.webp",
      "telephone": "+91-8130961414",
      "email": "cs@flavoursguru.com",
      "parentOrganization": { "@id": "https://www.flavoursguru.com/#organization" },
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "Quite Office Number 1, Sector 35A, Opposite Kukhrain Bhawan",
        "addressLocality": "Chandigarh",
        "postalCode": "160022",
        "addressCountry": "IN"
      },
      "geo": { "@type": "GeoCoordinates", "latitude": 30.729103781638347, "longitude": 76.75567621497542 }
    },
    {
      "@type": "Bakery",
      "@id": "https://www.flavoursguru.com/locate#sohna",
      "name": "Flavours Guru - Bakery & Cake Shop, Sohna",
      "url": "https://www.flavoursguru.com/locate",
      "image": "https://www.flavoursguru.com/image/catalog/Flavours%20Guru/logo.webp",
      "telephone": "+91-8130961414",
      "email": "cs@flavoursguru.com",
      "parentOrganization": { "@id": "https://www.flavoursguru.com/#organization" },
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "Delhi Alwar Road, Opposite Sohna Bus Stand, Near Kotak Mahindra Bank",
        "addressLocality": "Sohna",
        "addressRegion": "Haryana",
        "postalCode": "122103",
        "addressCountry": "IN"
      },
      "geo": { "@type": "GeoCoordinates", "latitude": 28.350361703547794, "longitude": 77.06320141445947 }
    },
    {
      "@type": "Bakery",
      "@id": "https://www.flavoursguru.com/locate#hyderabad",
      "name": "Flavours Guru - Online Cake Shop, Hyderabad",
      "url": "https://www.flavoursguru.com/locate",
      "image": "https://www.flavoursguru.com/image/catalog/Flavours%20Guru/logo.webp",
      "telephone": "+91-8130961414",
      "email": "cs@flavoursguru.com",
      "parentOrganization": { "@id": "https://www.flavoursguru.com/#organization" },
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "Besides Ahoy Restaurant, 1-7-98/5, Shop 7, Kompally, Kompally Rd, Gundlapochampalli",
        "addressLocality": "Hyderabad",
        "addressRegion": "Telangana",
        "postalCode": "500014",
        "addressCountry": "IN"
      },
      "geo": { "@type": "GeoCoordinates", "latitude": 17.55373079551337, "longitude": 78.49173859882167 }
    },
    {
      "@type": "Bakery",
      "@id": "https://www.flavoursguru.com/locate#varanasi",
      "name": "Flavours Guru - Bakery & Cake Shop, Varanasi",
      "url": "https://www.flavoursguru.com/locate",
      "image": "https://www.flavoursguru.com/image/catalog/Flavours%20Guru/logo.webp",
      "telephone": "+91-8130961414",
      "email": "cs@flavoursguru.com",
      "parentOrganization": { "@id": "https://www.flavoursguru.com/#organization" },
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "N-15, 176, Bari Gaibi, Near Bari, VDA Colony, Gaibi Akhara",
        "addressLocality": "Varanasi",
        "addressRegion": "Uttar Pradesh",
        "postalCode": "221010",
        "addressCountry": "IN"
      },
      "geo": { "@type": "GeoCoordinates", "latitude": 25.298977833771396, "longitude": 82.98155131527552 }
    },
    {
      "@type": "Bakery",
      "@id": "https://www.flavoursguru.com/locate#lucknow",
      "name": "Flavours Guru - Online Cake Shop, Lucknow",
      "url": "https://www.flavoursguru.com/locate",
      "image": "https://www.flavoursguru.com/image/catalog/Flavours%20Guru/logo.webp",
      "telephone": "+91-8130961414",
      "email": "cs@flavoursguru.com",
      "parentOrganization": { "@id": "https://www.flavoursguru.com/#organization" },
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "Vineet Khand, Gomti Nagar",
        "addressLocality": "Lucknow",
        "addressRegion": "Uttar Pradesh",
        "postalCode": "226010",
        "addressCountry": "IN"
      },
      "geo": { "@type": "GeoCoordinates", "latitude": 26.848692, "longitude": 80.9425127 }
    },
    {
      "@type": "Bakery",
      "@id": "https://www.flavoursguru.com/locate#patna",
      "name": "Flavours Guru - Bakery & Customized Cake Shop, Patna",
      "url": "https://www.flavoursguru.com/locate",
      "image": "https://www.flavoursguru.com/image/catalog/Flavours%20Guru/logo.webp",
      "telephone": "+91-8130961414",
      "email": "cs@flavoursguru.com",
      "parentOrganization": { "@id": "https://www.flavoursguru.com/#organization" },
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "Shop # 11,12,13, B P Complex, Rajendra Path, SalimpurAhra, Kadamkuan",
        "addressLocality": "Patna",
        "addressRegion": "Bihar",
        "postalCode": "800003",
        "addressCountry": "IN"
      },
      "geo": { "@type": "GeoCoordinates", "latitude": 25.60989551486068, "longitude": 85.14622127571279 }
    }
  ]
}
</script>
<?php } ?>