Write-Host  -ForegroundColor Cyan "Starting Kat's Custom OSDCloud ..."
Start-Sleep -Seconds 5

#Change Display Resolution for Virtual Machine
if ((Get-MyComputerModel) -match 'Virtual') {
    Write-Host  -ForegroundColor Cyan "Setting Display Resolution to 1600x"
    Set-DisRes 1600
}

#Make sure I have the latest OSD Content
Write-Host  -ForegroundColor Cyan "Updating the awesome OSD PowerShell Module"
Install-Module OSD -Force

Write-Host  -ForegroundColor Cyan "Importing the sweet OSD PowerShell Module"
Import-Module OSD -Force

#Start OSDCloud ZTI the RIGHT way
Write-Host  -ForegroundColor Cyan "Start OSDCloud with MY Parameters"
Start-OSDCloud -OSLanguage en-us -OSBuild 22H2 -imageindex 5 -ZTI

#Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot
