$url = "http://fs01/_General/signatures/companyname/employees/"

#need to figure out a different way to get name.  Can't run ad-user as standard user.  Also needs AD module to work.
$user = Get-ADUser -Identity $env:username | select Name -ExpandProperty Name

$user = $user.replace(' ','')+'-companyname.html'

$url += $user

curl $url | select content -ExpandProperty content > C:\Users\"$env:username"\AppData\Roaming\Microsoft\Signatures\companyname.htm
