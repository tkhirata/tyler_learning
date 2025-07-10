new-item -path C:\users\$Env:USERNAME\desktop\choco.txt -itemtype file 
Start-Transcript -path C:\users\$Env:USERNAME\desktop\choco.txt


$teamviewer = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | select-object displayname, displayversion | Where-Object displayname -eq "TeamViewer" 
$javaversion64 = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | select-object displayname, displayversion | Where-Object displayname -eq "Java 8 Update 161 (64-bit)"
$skypeversion = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName | where-object displayname -Clike "Skype*"
$firefoxversion = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | select-object DisplayName | where displayname -Clike "Mozilla Firefox*"
$chromeversion = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | select-object DisplayName,DisplayVersion | where displayname -eq "Google Chrome" | Get-ItemPropertyValue {$_.displayversion}
#Enter these values in manually.  It should be the most up to date versin of that program.
$updatedprograms = @{
"TeamViewer" = $teamviewer
"Java" = $javaversion
"Skype" = $skypeversion
"FireFox" = $firefoxversion
"Chrome" = $chromeversion
}
$localprogramversion = @{
"TeamViewer" = $teamviewer
"Java" = $javaversion
"Skype" = $skypeversion
"FireFox" = $firefoxversion
"Chrome" = $chromeversion }



if ($updatedprograms.TeamViewer -eq $localprogramversion.TeamViewer) {
$updatedprograms.TeamViewer
$localprogramversion.TeamViewer
write-host "Matches `n"}
    
else {
write-host "Version out of date.  Installing new version `n"
choco upgrade teamviewer -y
}

if ($updatedprograms.Java -eq $localprogramversion.Java) {
$updatedprograms.Java
$localprogramversion.Java
write-host "Matches `n"}
    
else {
write-host "Version out of date.  Installing new version `n"
choco upgrade javaruntime -y
}

if ($updatedprograms.Skype -eq $localprogramversion.Skype) {
$updatedprograms.Skype
$localprogramversion.Skype
write-host "Matches `n"}
    
else {
write-host "Version out of date.  Installing new version `n"
choco upgrade skype -y
}

if ($updatedprograms.Firefox -eq $localprogramversion.Firefox) {
$updatedprograms.Firefox
$localprogramversion.Firefox
write-host "Matches `n"}
    
else {
write-host "Version out of date.  Installing new version `n"
choco upgrade firefox -y
}

if ($updatedprograms.Chrome -eq $localprogramversion.Chrome) {
$updatedprograms.Chrome
$localprogramversion.Chrome
write-host "Matches `n"}
    
else {
write-host "Version out of date.  Installing new version `n"
choco upgrade googlechrome -y
}

Stop-Transcript
