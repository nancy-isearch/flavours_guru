now="flavoursguru_"$(date +"%d_%m_%Y")

mysqldump -u yxqwdxrheq -pGsX4CD3pU3 yxqwdxrheq  | gzip >  $now.sql.gz

php s3u.php -u aws3 -p Upld\$321 -f $now.sql.gz -o NEW/flavoursguru

rm -rf $now.sql.gz

