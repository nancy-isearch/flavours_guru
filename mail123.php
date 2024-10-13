<?php /*
$to      = 'abhitesh@yngmedia.com';
$subject = 'the subject';
$message = 'hello';
$headers = 'From: sharique@flavoursguru.com'
mail($to, $subject, $message, $headers); */
?>
<?php
$sender = 'sharique@flavoursguru.com';
$recipient = 'abhitesh@yngmedia.com';

$subject = "mail test";
$message = "php test message";
$headers = 'From:' . $sender;

if (mail($recipient, $subject, $message, $headers))
{
    echo "Message accepted";
}
else
{
    echo "Error: Message not accepted";
}
?>