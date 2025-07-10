#Define variables
$noredirection = @()
$foldersizechk = @()
$norestartshortcut = @()
$users = Get-ADUser -Filter * -SearchBase "OU=CS,OU=Users,OU=US-LGB3,OU=Location,DC=ad,DC=int" | select SamAccountName -ExpandProperty SamAccountName 

foreach ($user in $users){
    $desktopchck = test-path \\fs01\users$\$user\desktop
    $documentschck = test-path \\fs01\users$\$user\documents
    $restartshortcutchck = test-path \\fs01\users$\$user\desktop\./"Restart Computer".lnk
    $desktopfoldersize = Get-ChildItem \\fs01\users$\$user\desktop -recurse | Measure-Object -property Length -sum | select sum -ExpandProperty sum
    $documentsfoldersize = Get-ChildItem \\fs01\users$\$user\documents -recurse | Measure-Object -property Length -sum | select sum -ExpandProperty sum


    if ($desktopchck -eq $false -and $documentschck -eq $false){
        $noredirection += $user+"'s desktop and documents are not redirected"
    }

    if ($desktopchck -eq $false -and $documentschck -eq $true){
        $noredirection += $user+"'s desktop are not redirected"
    }

    if ($documentschck -eq $false -and $desktopchck -eq $true){
        $noredirection += $user+"'s documents are not redirected"
    }

    if ($restartshortcutchck -eq $false){
        $norestartshortcut += $user
        
    }

    if ($desktopfoldersize/1GB -gt 3 -or $documentsfoldersize/1GB -gt 3){
        $foldersizechk += $user + "|" + " " + "Desktop:" + [math]::round($desktopfoldersize/1GB,2) + "|" + " "+ "Documents:" + [math]::round($documentsfoldersize/1GB,2)
    }
}

if ($noredirection.count -eq 0){

write-host "==================================="
write-host "Folder Redirection Check: No issues" -ForegroundColor Green
write-host "==================================="

}else{

write-host "======================================"
write-host "Folder Redirection Check: Issues found" -ForegroundColor Red 
write-host "======================================"
$noredirection
}

if ($foldersizechk.count -eq 0){
write-host "============================"
write-host "Folder Size Check: No issues" -ForegroundColor Green
write-host "============================"
    
}else{

write-host "==============================="
write-host "Folder Size Check: Issues found" -ForegroundColor Red
write-host "==============================="
write-host "Desktop and Documents need to be less than 3GB" -ForegroundColor Red
$foldersizechk
}

if ($norestartshortcut.count -eq 0){
write-host "==============================="
write-host "All users have restart shortcut" -ForegroundColor Green
write-host "==============================="

}else{

write-host "====================================================="
write-host "The following users are missing the restart shortcut:" -ForegroundColor Red
$norestartshortcut
write-host "====================================================="

}
