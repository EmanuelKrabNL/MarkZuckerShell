# Auto admin
if (-not ([Security.Principal.WindowsPrincipal] `
[Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
[Security.Principal.WindowsBuiltInRole]::Administrator)) {

    Start-Process powershell `
    -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" `
    -Verb RunAs

    exit
}

# Paths, you can change it to another sound if you want to.
$connect = "$PSScriptRoot\mark-zuck-ConnectUSB.wav"
$disconnect = "$PSScriptRoot\mark-zuck-DisconnectUSB.wav"

# Reg. location
$base = "HKCU:\AppEvents\Schemes\Apps\.Default"

# USB connect
Set-ItemProperty `
-Path "$base\DeviceConnect\.Current" `
-Name "(default)" `
-Value $connect

# USB disconnect
Set-ItemProperty `
-Path "$base\DeviceDisconnect\.Current" `
-Name "(default)" `
-Value $disconnect

Write-Host "Done, sounds changed. If not working try to Restart or reconnect a USB if needed. 

Big thanks for using my script! (Im trying to get it to exactly 1k characters). -EmanuelKrabNL on github
"
pause