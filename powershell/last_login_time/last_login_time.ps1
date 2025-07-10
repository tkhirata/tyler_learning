$dc01 = get-aduser -server dc01.local -filter * -property lastlogon | select name, @{n='LastLogon'; E={[DateTime]::FromFileTime($_.LastLogon).ToString()}}, enabled |sort-object Name
$dc02 = get-aduser -server dc01.local -filter * -property lastlogon | select name, @{n='LastLogon'; E={[DateTime]::FromFileTime($_.LastLogon).ToString()}}, enabled | sort-object Name

$sortedlastlogon =@()

$i = 0

DO{

if ((get-date $dc01.lastlogon[$i]) -gt (get-date $dc02.lastlogon[$i])){$sortedlastlogon += $dc01.lastlogon[$i]}else{$sortedlastlogon += $dc02.lastlogon[$i]}

$i++

} While ($i -lt $dc01.count)

$listcsv = @()
$i = 0
DO{

$listcsv += $dc01.name[$i] + "," + $sortedlastlogon[$i] + "," + $dc01.enabled[$i]
$i++


} While ($i -lt $dc01.count)


Add-Content -Path C:\users\thirata\desktop\users.csv -Value '"Username" ,"Last Login","Account Status"' 
$listcsv | foreach {add-content -path C:\users\thirata\desktop\users.csv -Value $_ }
