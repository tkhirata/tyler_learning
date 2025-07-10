#Create Directory for PowerShell Modules if it doesn't exist
$testpath = Test-Path "C:\users\Administrator\TMP\PSModules"

if ($testpath -eq $false){
    New-Item "C:\users\Administrator\TMP\PSModules\PSWindowsUpdate" -ItemType Directory
}

#Import Modules
$links = @()
$links += (curl http://fs01.int/thirata/PSModules/PSWindowsUpdate/PSWindowsUpdate/).links.href

for ($i=1; $i -lt $links.count; $i++){
    $uri = "http://fs01.int/thirata/PSModules/PSWindowsUpdate/PSWindowsUpdate/"+$links[$i]
    $outfile = "C:\users\Administrator\TMP\PSModules\PSWindowsUpdate\"+$links[$i]

    Invoke-WebRequest -URI $uri -OutFile $outfile
}


#copy module
Copy-Item -Path C:\users\Administrator\TMP\PSModules\PSWindowsUpdate -Destination C:\Windows\System32\WindowsPowerShell\v1.0\Modules -Recurse
Import-Module PSWindowsUpdate

