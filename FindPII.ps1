$SSN = "^(?!(000|666|9))\d{3}-(?!00)\d{2}-(?!0000)\d{4}$"
$Amex = " ^3[47][0-9]{13}$"
$MC = "^(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}$"
$Visa = "^4[0-9]{12}(?:[0-9]{3})?$"
$Din = "^3(?:0[0-5]|[68][0-9])[0-9]{11}$"
$Disc = "^6(?:011|5[0-9]{2})[0-9]{12}$"
$JCB = "^(?:2131|1800|35\d{3})\d{11}$"

$pattern = "$Amex|$Din|$Disc|$JCB|$MC|$SSN|$Visa"

$Folder = "C:\PII"

$smtp = "mail.contoso.com"
$port = "<enter port number>"
$to = "MyEmail@contoso.com"
$from = "contosoreporting@contoso.com"
$subject = "PII Report"
$attach = "$Folder\$env:COMPUTERNAME.csv"

New-Item -Path $Folder -ItemType Directory

Get-ChildItem -Path 'C:\Users\' -Recurse | Where-Object {$_ -match $pattern} | Select-Object $env:COMPUTERNAME,path | Export-Csv $Folder\$env:COMPUTERNAME.csv

Send-MailMessage -SmtpServer $smtp -Port $port -To $to -From $from -Subject $subject -Attachments $attach

Remove-Item -Path $Folder -Recurse -Force