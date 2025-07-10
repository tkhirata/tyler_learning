$apps = Get-AppxPackage
$protectedapps = @("Microsoft.WindowsStore", "Microsoft.MicrosoftStickyNotes", "Microsoft.WindowsCalculator", "Microsoft.Windows.Photos")
$deletedapps = @()

foreach ($app in $apps){
    if ($app.SignatureKind -eq "Store" -and $protectedapps -contains $app.name){
    Remove-AppxPackage -Package $app.PackageFullName
    $deletedapps += $app.name 
    }
    
}
$deletedapps >> C:\users\$env:username\desktop\deltedapps.txt
