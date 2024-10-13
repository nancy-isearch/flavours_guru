<?php
$to      = 'abhitesh@yngmedia.com';
$subject = 'the subject';
$message = 'hello';
$headers = 'From: sharique@flavoursguru.com'
mail($to, $subject, $message, $headers);
?>