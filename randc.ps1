#Declare Variables
$DateStamp= get-date -uformat "%Y%m%d_%H%M%S"
$locationPath="C:\IT\"
$fileName="mssql_bak"  
$extension=".log"
$archivePath="\\vnx2dm\public\informatics\.secure\"

$old=$locationPath + $fileName + $extension
#$new=$archivePath + $fileName + "_" + $DateStamp + $extension
$new=$locationPath + $fileName + "_rtpprosql001_" + $DateStamp + $extension

copy-item mssql_bak.log $new
Move-Item $new $archivePath