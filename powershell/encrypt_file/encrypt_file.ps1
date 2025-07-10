$path = "\\fs10\sales\logs\"+$Env:USERNAME+(Get-Date).ToString("yyyyMMdd")+".log"
$stopscript = $false
$logtime = (Get-Date).ToString("[h:m:s]")
$listpath = "c:\users\$Env:USERNAME\documents\encrypt\list.txt"
$chkdirectory = test-path "c:\users\$Env:USERNAME\documents\encrypt"
#$chkfile = test-path "c:\users\$Env:USERNAME\documents\encrypt\list.txt"

Add-Content -path $path -value ($logtime + "=====START LOGGING=====")
Add-Content -path $path -value ($logtime + "Check Directory Value: $chkdirectory")
Add-Content -path $path -value ($logtime + "Check File Value: $chkfile")

if ($chkdirectory -eq $false){
mkdir c:\users\$Env:USERNAME\documents\encrypt\ | out-null
Add-Content -path $path -value ($logtime + "Created Directory c:\users\$Env:USERNAME\documents\encrypt\")
New-Item c:\users\$Env:USERNAME\documents\encrypt\list.txt | out-null
Add-Content -path $path -value ($logtime + "Created File c:\users\$Env:USERNAME\documents\encrypt\list.txt")
}

if ($chkfile -eq $false){
New-Item c:\users\$Env:USERNAME\documents\encrypt\list.txt
Add-Content -path $path -value $logtime + "Created File list.txt"
write-host "The list.txt file was missing, but a new one was created.  Please enter the directories in the text file and run the script again."
pause
exit 
}


if ((get-content $listpath) -eq $null){
write-host "list.txt is null.  Please add directories and run the script again." -BackgroundColor red -ForegroundColor Black
Add-Content -path $path -value ($logtime + "list.txt is null")
pause
exit
}

For ($i=0; $i -lt $list.count;$i++){
$listverify = test-path $list[$i]

if ($listverify -eq $True){ 
Add-Content -path $path -value ($logtime + "Verifying " + $list[$i] + "...Good")
}

if ($listverify -eq $False){
Add-Content -path $path -value ($logtime + "Verifying "+ $list[$i] + "...Bad")
Write-Host $list[$i] "is not a valid directory" -BackgroundColor red -ForegroundColor black
$stopscript = $true
}} 

if ($stopscript -eq $true){
write-host "Please review the directores on list.txt and run the script again"
pause
exit
} 

$password = Read-Host "Enter password" -AsSecureString
$password = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($password)
$password = [Runtime.InteropServices.Marshal]::PtrToStringAuto($password)
Add-Content -path $path -value ($logtime + "Password Created")

copy-item "\\fs10\sales\7z.exe" -destination "C:\users\$Env:USERNAME\documents\encrypt\"
$7zip = Test-Path C:\users\$Env:USERNAME\documents\encrypt\7z.exe

if ($7zip -eq $true){
Add-Content -path $path -value ($logtime + "7zip Successfully Copied")
}

if ($7zip -eq $False){
Add-Content -path $path -value ($logtime + "7zip did not copy")
Write-Host "Error copying 7zip from server.  Please check connection to LGB-FS10\Sales" -BackgroundColor Red -ForegroundColor Black
pause 
exit
}

cd "C:\users\$Env:USERNAME\documents\encrypt\"
Add-Content -path $path -value ($logtime + "Change directory to C:\users\$Env:USERNAME\documents\encrypt\")

$localarchive = "C:\users\$Env:USERNAME\documents\encrypt\$Env:COMPUTERNAME-" + (get-date).ToString("yyyyMMdd") + ".7z"
$serverarchive = "\\lgb-fs10.ad.int\sales\$Env:COMPUTERNAME-" + (get-date).ToString("yyyyMMdd") + ".7z"
$fileoverwrite = test-path $serverarchive

if ($fileoverwrite -eq $true){
write-host "An archive from today is already saved on the file server.  Add files manually" -ForegroundColor red -BackgroundColor black
Add-Content -path $path -value ($logtime + "Tried adding to archive twice in one day")
pause 
exit
#$localarchive = "C:\users\$Env:USERNAME\documents\encrypt\$Env:COMPUTERNAME-" + (get-date).ToString("yyyyMMdd") + "-1"
#$serverarchive = "\\lgb-fs10.ad.int\sales\$Env:COMPUTERNAME-" + (get-date).ToString("yyyyMMdd") + ".7z" + "-1"
#write-host "Renaming archive to $localarchive" -ForegroundColor red -BackgroundColor black
}

.\7z.exe a $localarchive -p"$password" -mhe -i@"list.txt"
Add-Content -path $path -value ($logtime + "Archive Created at $localarchive")



copy-item $localarchive -destination "\\fs10\sales"

#$localarchive = "C:\users\$Env:USERNAME\documents\encrypt\$Env:COMPUTERNAME-" + (get-date).ToString("yyyyMMdd") + ".7z"
$localarchivehash = get-filehash $localarchive | select-object -ExpandProperty Hash
Add-Content -path $path -value ($logtime + "Hash value for local archive: $localarchivehash")
$serverarchivehash= get-filehash $serverarchive | select-object -ExpandProperty Hash
Add-Content -path $path -value ($logtime + "Hash value for server archive: $serverarchivehash")


if ($localarchivehash -eq $serverarchivehash){ 
$list = get-content .\list.txt
remove-item $localarchive
foreach ($r in $list -replace """"){
get-childitem $r | remove-item
Add-Content -path $path -value ($logtime + "Files in $r have been deleted")
}}


Add-Content -path $path -value ($logtime + "=====Script Finished=====")


#find way to add files to archive on the sameday
