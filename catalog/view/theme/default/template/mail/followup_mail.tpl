<html>
<head>
	<title></title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body data-new-gr-c-s-loaded="8.873.0" style="font-family: 'Roboto', sans-serif;margin:0;padding: 0;background-color: #ffd8ba;padding-bottom: 25px;">
<table align="center" cellpadding="0" cellspacing="0" style="width:100%;max-width:600px;height:auto;">
	<tbody>
		<tr>
			<td>
				<table style="width:100%;max-width:600px;height:auto;padding-top: 10px;padding-bottom: 10px">
					<tr>
						<td>
							<a style="display: inline-block;text-align: center;font-size:0;width: 100%; " href="https://www.flavoursguru.com/"><img loading="lazy" decoding="async"alt="" src="https://www.flavoursguru.com/catalog/view/theme/default/image/Home/FGLogoBlack.webp" style="width: 200px;" title="" /> </a>	
						</td>
					</tr>
				</table>
				
			</td>
		</tr>
		<tr style="background-color: #fd507b;">
			<td>
				<?php echo html_entity_decode($menu, ENT_QUOTES, 'UTF-8'); ?>
			</td>
		</tr>
		<tr style="background-color: #ffffff;">
			<td>
				<table style="width: 100%;padding: 20px 15px;">
					<tr>
						<td style="text-align: center;">
							<p style="color: #01bf93;font-size: 20px;font-weight: 600;margin-top: 0;margin-bottom: 10px;">Hey <?php echo $order[0]['customer_name']; ?>,</p>
							<p style="color: #01bf93;margin-top: 0;margin-bottom: 0;">We <span style="font-size: 20px;font-weight: 600;">Love</span> Your <span style="font-size: 20px;font-weight: 600;">Choice!</span></p>
							<p style="font-size: 14px;line-height: 25px;">The Gift item in your cart is choice of many, Grab it before It's Gone and Surprise your loved one. Skip the queue and go straight to Checkout.</p>
						</td>
					</tr>
					<?php foreach ($order as $pro) { ?>					
					<tr>
						<td>
						<table align="center" border="0" cellpadding="0" cellspacing="0" style="margin:auto;max-width:600px;border-bottom: 1px solid #e2e2e2; height:auto; padding-top: 15px; padding-bottom: 25px;">
							<tbody>
								<tr>
									<td>
									<table align="left" border="0" cellpadding="0" cellspacing="0" style="width:35%;padding-right: 15px;">
										<tbody>
											<tr>
												<td><a href="#"><img loading="lazy" decoding="async"alt="" src="https://www.flavoursguru.com/image/<?php echo $pro['image']; ?>" style="max-width:100%; height:auto;" title="" /></a></td>
											</tr>
										</tbody>
									</table>
									<table align="left" border="0" cellpadding="0" cellspacing="0" style="width:65%;padding-top: 15px;">
										<tbody>
											<tr>
												<td style="width: 25%;padding-bottom: 15px;vertical-align: top;" >
													<p style="color: #ccc;margin-bottom: 0px;margin-top: 0">ITEMS <span style="display: inline-block;float: right;">:</span>
													</p>
												</td>
												<td style="padding-bottom: 15px;">
													<p style="margin-bottom: 5px;margin-top: 0;padding-left: 15px;">
													<?php echo $pro['name']; ?>
													</p>
													<p style="margin-bottom: 0;margin-top:0;padding-left: 15px;">
														<img loading="lazy" decoding="async"src="https://www.flavoursguru.com/catalog/view/theme/default/image/emailer/review-img.webp">
													</p>
												</td>
											</tr>
											<tr>
												<td style="width: 25%;padding-bottom: 15px;">
													<p style="color: #ccc;vertical-align: top;">QTY<span style="display: inline-block; float: right;">:</span></p>
												</td>
												<td style="padding-bottom: 15px;">
													<p style="padding-left: 15px;"><?php echo $pro['quantity'] ?></p>
												</td>
											</tr>
											<tr>
												<td style="width: 25%;padding-bottom: 0px;">
													<p style="color: #ccc;vertical-align: top;">PRICE <span style="display: inline-block; float: right;">:</span></p>
												</td>
												<td style="padding-bottom: 0px;">
													<p style="padding-left: 15px;">Rs <?php echo round($pro['price']) ?>.00</p>
												</td>
											</tr>
										</tbody>
									</table>
									</td>
								</tr>
							</tbody>
						</table>
						</td>
					</tr>
					<?php } ?>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table style="width: 100%;background-color: #ffffff;padding: 20px 15px;padding-top: 0;">
					<tr>
						<td style="text-align: center;">
							<a href="https://www.flavoursguru.com/checkout/cart" style="text-decoration: none;color: #ffffff;padding: 7px 20px;background-color: #01bf93;">Checkout Now</a>
							<p style="margin-bottom: 15px;font-size: 13px;margin-top: 20px;">*Please ignore this Mail if Order already placed.</p>
							<h4 style="font-size: 24px; font-weight: 500;color: #7a7a7a;margin-top: 0;">What Our Customer Say</h4>
							<p style="margin-top: 0;">
								<img loading="lazy" decoding="async"src="https://www.flavoursguru.com/catalog/view/theme/default/image/emailer/google-rating-img.webp" alt="">
							</p>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table style="width: 100%;background-color: none;padding: 15px;">
					<tr>
						<td style="text-align: center;">
							Can we help you ?
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table style="width: 100%;background-color: #ffffff;padding: 20px 0px;">
					<tr>
						<td style="border-right: 2px solid #e2e2e2;width: 50%;">
							<a href="tel:+918130961414" style="color: #000000;text-decoration: none;display: flex;align-items: center;">
								<img loading="lazy" decoding="async"style="width: 35px;margin-right: 10px;" src="https://www.flavoursguru.com/catalog/view/theme/default/image/emailer/phone-img.webp" alt=""> 
								<span style="font-size: 14px;">+91 8130961414</span>
							</a>
						</td>
						<td style="width: 50%;padding-left: 15px;">
							<a href="https://api.whatsapp.com/send?phone=+918130961414" style="color: #000000;text-decoration: none;display: inline-block;padding: 7px 0 7px 10px;border-radius: 5px;border: 1px solid #e2e2e2;font-size: 14px;">
								<span style="margin-right: 10px;width: calc(100% - 45px);">Hello! Tap here if you need any help</span>
								<img loading="lazy" decoding="async"style="width: 35px;" src="https://www.flavoursguru.com/catalog/view/theme/default/image/emailer/whatsapp-img.webp" alt="">
							</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</tbody>
</table>
</body>
</html>
