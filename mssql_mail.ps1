#--------------------------------------------------------------------------------
# Name:  mssql_mail.ps1
# Creator: elizabeth welvang
# Purpose: email output file 
#--------------------------------------------------------------------------------
# History: 20170425 (ewelvang) created
#--------------------------------------------------------------------------------
$today = (get-date).tostring("dd-MMM-yyyy")
$file = "mssql_bak.log"
#$smtpServer = "outlook.office365.com"
$smtpServer = "hulk.metabolon.com"
$msg = new-object Net.Mail.MailMessage
$att = new-object Net.Mail.Attachment($file)
$smtp = new-object Net.Mail.SmtpClient($smtpServer)
$msg.From = "GreatPlains@metabolon.com"
$msg.To.Add("ewelvang@metabolon.onmicrosoft.com")
$msg.Subject = "Great Plains Production Backup Log... ($today)"
$msg.Body = "Please see attachment for results of MSSQL Production backup.

Thanks!,
Rtpprosql001"
$msg.Attachments.Add($att)
$smtp.Send($msg)
$att.Dispose()