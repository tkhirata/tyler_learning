#create directory for logs if it doesn't exist

$check = test-path C:\sslvpnlogs

if ($check -eq $false){
mkdir C:\sslvpnlogs
}

#define variables
$startlog = "=====START====="
$endlog = "=====END====="



#commands to check status and reconnect vpn if disconnected
cd "C:\Program Files (x86)\SonicWall\SSL-VPN\NetExtender\"
$logpath = "C:\sslvpnlogs\"+(get-date -format MM_dd_yyyy)+".log"

$logtime = "["+(get-date -format HH:mmtt)+"]"
$status = ./necli.exe showstatus
$startlog >> $logpath 
$logtime + $status >> $logpath

if ($status -eq "Status: Disconnected"){
    $logtime = "["+(get-date -format HH:mmtt)+"]"
    $logentry = ./necli.exe profile 12.7.192.254 -u $env:username 
    $logtime + $logentry >> $logpath
    $endlog >> $logpath
}

if ($status -ccontains "Status: Connected"){
    $logtime = "["+(get-date -format HH:mmtt)+"]"
    $logentry = "VPN is connected"
    $logtime + $logentry >> $logpath
    $endlog >> $logpath
}

elseif ($status -notcontains "Status: Connected" -and $status -ne "Status: Disconnected"){
$logtime = "["+(get-date -format HH:mmtt)+"]"
$logentry = ./necli.exe showstatus
$logtime + $logentry >> $logpath

$logentry = "Attempting to reconnect"
$logtime + $logentry >> $logpath

$logentry = ./necli.exe profile XX.X.XXX.XXX $env:username
$logtime + $logentry >> $logpath

$logentry = ./necli.exe showstatus
$logtime + $logentry >> $logpath


}
