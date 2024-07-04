<#  
.SYNOPSIS  
    Generate welcome message at first logon, and opens RAS Console
.NOTES  
    File Name  : RAS_Azure_MP_AIO_Login.ps1
    Author     : Freek Berson
    Version    : v0.0.1
    Date       : Jul 3 2024
.EXAMPLE
    .\RAS_Azure_MP_AIO_Login.ps1
#>

# show welcome message to guide admin
$wshell = New-Object -ComObject Wscript.Shell
$Output = $wshell.Popup("Welcome to Parallels Remote Application Server (RAS) all-in-one virtual machine (VM).`n`nOnce the Parallels RAS Console is loaded automatically, please use the below details to get started:
Farm: localhost or VM hostname `nUser/Password: Admin user who is a member of the group you provided during the deployment.", 0,"Welcome to Parallels® Remote Application Server",0+64) 

#Launch RAS Console if user is a local admin
if ((New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    Start-Process -FilePath "C:\Program Files (x86)\Parallels\ApplicationServer\2xConsole.exe"
}
