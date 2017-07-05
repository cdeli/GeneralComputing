$LoggedOnUser = "$Env:USERNAME@contosokta.com" 
$Path = Test-Path -Path "$env:SystemDrive\users\$Env:USERNAME\OneDrive - Contoso"
$OneDriveProcess = (Get-Process -Name OneDrive -ErrorAction Continue)

if ($OneDriveProcess -eq $true) {
    Write-Output "Process for OneDrive is running."
} else {
    & $env:SystemDrive\Users\$ENV:USERNAME\AppData\Local\Microsoft\OneDrive\OneDrivestandaloneUpdater.exe
}

Start-Sleep -Seconds 30

if ($Path -eq $true) {
    Write-Output "OneDrive is already logged into."
} elseif ($Path -eq $false) {
    & Start-Process "odopen://sync?useremail=$LoggedOnUser" -ErrorAction Continue
}