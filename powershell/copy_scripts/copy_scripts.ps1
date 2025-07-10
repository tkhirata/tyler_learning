function tmpcheck{
    $rootdir = "\\$args\c$\"
    $LocalAdminTmpCheck= test-path $rootdir'\users\Admin\TMP'
    $tmp_c_check = test-path $rootdir'\TMP'

    write-host $args ' TMP folder in C: '$tmp_c_check
    write-host $args ' TMP folder in FCC Admin: '$LocalAdminTmpCheck
    

    <#if ( $tmp_c_check -eq $True){
       
        Move-Item -Path $rootdir'TMP\Scripts\Restart Computer.lnk' -Destination $rootdir'TMP'
        Move-Item -Path $rootdir'TMP\Scripts\Restartcomputer.cmd' -Destination $rootdir'TMP'
        Remove-Item -path $rootdir'TMP\Scripts' -recurse
        Remove-Item -path $rootdir'TMP\Ninite' -recurse 
    } 
    
    Elseif($tmp_c_check -eq $false){
        #echo 'TMP folder is missing on' + $env:COMPUTERNAME + 'C:\TMP' > C:\users\'Admin'\TMP\Logs\+(Get-Date).ToString("MM_dd_yyyy") + '.log'
        new-item -Path $rootdir'TMP' -ItemType directory
        Copy-Item -Path \\FS01\DeploymentShare$\Scripts\scripts\restartcomputer -Destination $rootdir'TMP' -recurse -Force
        }

    if ($LocalAdminTmpCheck -eq $false){
        #Echo 'Local Admin TMP folder is missing on' + $env:COMPUTERNAME + 'C:\users\Admin\TMP but has been created now' > C:\users\'Admin'\TMP\Logs\+(Get-Date).ToString("MM_dd_yyyy") + '.log'
        new-item -Path $rootdir'\users\Admin\TMP\Scripts' -ItemType directory
        Copy-Item -Path \\FS01\DeploymentShare$\Scripts\scripts\* -Destination $rootdir'\users\Admin\TMP\Scripts' -recurse -Force -Exclude *restartcomputer*
        }#>
}

$cscomputers = @()
$cscomputers += get-adcomputer -filter * -searchbase 'OU=CS,OU=Computers,OU=US,OU=Location,DC=int' | select Name -ExpandProperty Name

foreach ($computer in $cscomputers){
    tmpcheck $computer 
}
     
#Important!  If computer can't be reached on network, test-path returns false.  Need to impliment a ping test first.
