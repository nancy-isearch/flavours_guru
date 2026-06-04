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
							<a style="display: inline-block;text-align: center;font-size:0;width: 100%; " href="https://www.flavoursguru.com/"><img loading="lazy" decoding="async"alt="" src="https://www.flavoursguru.com/catalog/view/theme/default/image/Home/FGLogoBlack.png" style="width: 200px;" title="" /> </a>	
						</td>
					</tr>
				</table>
				
			</td>
		</tr>
		<tr style="background-color: #ffffff;">
			<td>
				<table style="width: 100%;padding: 20px 15px;">
					<tr>
						<td>
							<p style="color: #01bf93;font-size: 20px;font-weight: 600;margin-top: 0;margin-bottom: 10px;text-align: center;">Oops! Payment not confirmed!</p>
							<p>Hi <?php echo ucwords($order['payment_firstname']); ?>!</p>
							<p>Something went wrong with the payment you made on <?php echo date('d-F-Y', strtotime($order['date_added'])); ?> against order <?php echo $order['order_id']; ?>.</p>
							<p>Nothing to worry about! You can place your order again. Simply click on the link below.</p>
							<p style="padding: 15px 0;"><a href="https://www.flavoursguru.com/index.php?route=checkout/checkout" style="text-decoration: none;color: #ffffff;padding: 9px 20px;background-color: #01bf93;">Make Payment Now</a></p>
						</td>
					</tr>
					<tr>
						<td style="padding-top: 15px;">
						<table align="center" border="0" cellpadding="0" cellspacing="0" style="margin:auto;max-width:600px;border: 1px solid #e2e2e2; height:auto; padding-top: 15px; padding-bottom: 15px;border-radius: 8px;">
							<tbody>
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td style="padding-left: 15px;">
														<h3>Product Details:</h3>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<?php $shipInfo = ""; $allSubTotal = 0; $allShipTotal = 0; ?>
								<?php foreach ($order['products'] as $pro) { ?>
									<?php if(empty($shipInfo) && isset($pro['shipping_info']) && !empty($pro['shipping_info'])){
										$shipInfo = json_decode($pro['shipping_info']);
									} ?>
									<?php 
										$allShipTotal = $pro['shipping_price'] + $allShipTotal;
										$allSubTotal = $pro['price'] + $allSubTotal;
									?>
								<tr>
									<td style="padding-bottom: 15px;border-bottom: 1px solid #e2e2e2;">
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
														<?php echo $pro['model']; ?>
													</p>
												</td>
											</tr>
											<tr>
												<td style="width: 25%;padding-bottom: 15px;">
													<p style="color: #ccc;vertical-align: top;">QTY<span style="display: inline-block; float: right;">:</span></p>
												</td>
												<td style="padding-bottom: 15px;">
													<p style="padding-left: 15px;"><?php echo $pro['qun'] ?></p>
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
								<?php } ?>
							</tbody>
						</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr style="width: 100%;background-color: #ffffff;">
			<td>
				<table style="width: 100%;padding-left: 15px;padding-right: 15px;">
					<tbody>
						<tr>
							<td>
								<table style="border:1px solid #e2e2e2;border-radius: 8px;width: 100%;padding: 15px;margin-bottom: 15px;">
									<tr>
										<th><h3 style="text-align: left;margin-top: 0;">Delivery Details:</h3></th>
									</tr>
									<tr>
										<td style="text-align: left;padding: 5px 0;">Delivery Date</td>
										<td style="text-align: right;padding: 5px 0;"><?php echo date('d-F-Y', strtotime($shipInfo->{'Shipping Date'})) ?></td>
									</tr>
									<tr>
										<td style="text-align: left;padding: 5px 0;">Time</td>
										<td style="text-align: right;padding: 5px 0;"><?php echo $shipInfo->{'Shipping Time'} ?></td>
									</tr>
									<tr>
										<td style="text-align: left;padding: 5px 0;">Delivery Mode	</td>
										<td style="text-align: right;padding: 5px 0;"><?php echo $shipInfo->{'Shipping Type'} ?></td>
									</tr>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr style="width: 100%;background-color: #ffffff;">
			<td>
				<table style="width: 100%;padding-left: 15px;padding-right: 15px;">
					<tbody>
						<tr>
							<td>
								<table style="border:1px solid #e2e2e2;border-radius: 8px;width: 100%;padding: 15px;margin-bottom: 15px;">
									<tr>
										<th><h3 style="text-align: left;margin-top: 0;">Recipient Details:</h3></th>
									</tr>
									<tr>
										<td style="text-align: left;padding: 5px 0;"><?php echo $order['payment_firstname'] ?></td>
									</tr>
									<tr>
										<td style="text-align: left;padding: 5px 0;"><?php echo $order['shipping_address_1'] .', '.$order['shipping_city'] .', '.$order['shipping_postcode'] ?></td>
									</tr>
									<tr>
										<td style="text-align: left;padding: 5px 0;">Mob:- <?php echo $order['payment_mobile'] ?></td>
									</tr>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr style="width: 100%;background-color: #ffffff;">
			<td>
				<table style="width: 100%;padding-left: 15px;padding-right: 15px;">
					<tbody>
						<tr>
							<td>
								<table style="border:1px solid #e2e2e2;border-radius: 8px;width: 100%;padding: 15px;margin-bottom: 15px;">
									<tr>
										<th><h3 style="text-align: left;margin-top: 0;">Price Details:</h3></th>
									</tr>
									<tr>
										<td style="text-align: left;padding: 5px 0;">Sub Total</td>
										<td style="text-align: right;padding: 5px 0;">Rs.<?php echo $allSubTotal; ?>.00</td>
									</tr>
									<tr>
										<td style="text-align: left;padding: 5px 0;">Shipping Charges</td>
										<td style="text-align: right;padding: 5px 0;">Rs.<?php echo $allShipTotal; ?>.00</td>
									</tr>
									<tr>
										<td style="text-align: left;padding: 5px 0;">Discount</td>
										<td style="text-align: right;padding: 5px 0;">Rs.<?php echo isset($order['totalData']['coupon']) ? round($order['totalData']['coupon']) : 0; ?>.00</td>
									</tr>
									<tr>
										<td style="text-align: left;padding: 5px 0;">GST</td>
										<td style="text-align: right;padding: 5px 0;">Rs.<?php echo isset($order['totalData']['tax']) ? round($order['totalData']['tax']) : 0; ?>.00</td>
									</tr>
									<tr>
										<td style="text-align: left;padding: 5px 0;font-weight: 600;">Grand Total</td>
										<td style="text-align: right;padding: 5px 0;font-weight: 600;">Rs. <?php echo round($order['totalData']['total']); ?>.00</td>
									</tr>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr style="background-color: #ffffff;">
			<td>
				<table style="width: 100%;padding: 25px 15px;">
					<tr>
						<td>
							<p>Have a question in mind? Check these <a style="color: #01bf93;text-decoration: none;" href="https://www.flavoursguru.com/faq">FAQs</a> or just <a style="color: #01bf93;text-decoration: none;" href="https://www.flavoursguru.com/contact">Contact Us</a>.</p>
							<div style="padding-top: 15px;">
								<p style="margin: 0;margin-bottom: 5px;">Flowerly yours,</p>
								<p style="margin: 0;margin-bottom: 5px;">Flavours Guru</p>
								<p style="margin: 0;"><a style="color: #01bf93;text-decoration: none;" href="https://www.flavoursguru.com">https://www.flavoursguru.com</a></p>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table style="width: 100%;background-color: #ffffff;padding: 20px 15px;padding-top: 15px;">
					<tr>
						<td style="text-align: center;">
							<h4 style="font-size: 24px; font-weight: 500;color: #7a7a7a;margin-top: 0;">What Our Customer Say</h4>
							<p style="margin-top: 0;">
								<img loading="lazy" decoding="async"src="https://www.flavoursguru.com/catalog/view/theme/default/image/emailer/google-rating-img.jpg" alt="">
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
								<img loading="lazy" decoding="async"style="width: 35px;margin-right: 10px;" src="https://www.flavoursguru.com/catalog/view/theme/default/image/emailer/phone-img.png" alt=""> 
								<span style="font-size: 14px;">+91 8130961414</span>
							</a>
						</td>
						<td style="width: 50%;padding-left: 15px;">
							<a href="https://api.whatsapp.com/send?phone=+918130961414" style="color: #000000;text-decoration: none;display: inline-block;padding: 7px 0 7px 10px;border-radius: 5px;border: 1px solid #e2e2e2;font-size: 14px;">
								<span style="margin-right: 10px;width: calc(100% - 45px);">Hello! Tap here if you need any help</span>
								<img loading="lazy" decoding="async"style="width: 35px;" src="https://www.flavoursguru.com/catalog/view/theme/default/image/emailer/whatsapp-img.png" alt="">
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