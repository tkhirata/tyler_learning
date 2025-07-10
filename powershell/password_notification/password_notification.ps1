function userlookup {

$username = $args[0]
$info = get-aduser -Identity $username -properties givenname, PasswordLastSet, msDS-UserPasswordExpiryTimeComputed | select Name, PasswordLastSet, msDS-UserPasswordExpiryTimeComputed
$pwexpirationdate = [datetime]::FromFileTime($info.'msDS-UserPasswordExpiryTimeComputed')
$todaysdate = Get-Date
$daysleft = (new-timespan -start $todaysdate -end $pwexpirationdate).Days


Add-Content -path $path -value ('=====================================================' + '<br>')
Add-Content -path $path -value ('Name: ' + $info.Name + '<br>')
#Add-Content -path $path -value ('Password Last Set:' + $info.PasswordLastSet + '<br>')
Add-Content -path $path -value ('Password Expires: ' + $pwexpirationdate + '<br>')
Add-Content -path $path -value ('Days left until expiration: ' + $daysleft + '<br>')
Add-Content -path $path -value ('Password Notification Email Sent: ' + $todaysdate + '<br>')
}
#Change path when on the server to save output logs for passwords reset reminders sent out.
$path = "c:\users\thirata\documents\scripts\logs\" + (Get-Date).ToString("MM_dd_yyyy") + ".log"
$logname = (Get-Date).ToString("MM_dd_yyyy") + ".log"
$logtime = (Get-Date).ToString("[h:m]")
$users = get-aduser -filter {Enabled -eq $true -and PassWordNeverExpires -eq $false} -properties samaccountname, givenname, mail, PasswordLastSet, msDS-UserPasswordExpiryTimeComputed | Select Name, givenname, samaccountname, mail, PasswordLastSet, msDS-UserPasswordExpiryTimeComputed | sort givenname
$nullemails = @()

$i = 0
DO{
$name = $users[$i] | select -ExpandProperty Name
$givenname = $users[$i] | select -ExpandProperty givenname
$email = $users[$i] | select -ExpandProperty mail
$username = $users[$i] | select -ExpandProperty samaccountname
$lastpschange = $users[$i] | select -ExpandProperty PasswordLastSet
$pwexpirationdate = $users[$i] | select -ExpandProperty msDS-UserPasswordExpiryTimeComputed
$pwexpirationdate = [datetime]::FromFileTime($pwexpirationdate)
$todaysdate = get-date
$daysleft = (new-timespan -start $todaysdate -end $pwexpirationdate).Days


$expiringsoonmessage = "
<font face=""Arial"">
Dear $givenname,
<p>Your active directory password will expire in $daysleft days.</p>
<p>This password is used to login to some program, some monitoring application, and other internal resources. Please use <a href=""http://resetpassword.int"">resetpassword</a> to update your password.  
If you are using a Windows PC you can also update your password by pressing CTRL+ALT+DELETE and then selecting “"change a password"".  If you do not remember your password please open a ticket at <a href=http://ticket.int>ticket.int</a></p>
<p>Here is your “"User Principal Name"" that is needed when filling out the form on helpdesk.int: $username@domain.int</p>

<p>Thanks, <br>
IT Team" 


$expiredmessage ="

<font face=""Arial"">
Dear $givenname,

<p>Your active directory password has expired.</p>

<p>This password is used to login to some program, some monitoring application, and other internal resources.  Please use <a href=""http://resetpassword.int"">resetpassword</a> to update your password.  
If you are using a Windows PC you can also update your password by pressing CTRL+ALT+DELETE and then selecting “"change a password"".  If you do not remember your password please open a ticket at <a href=http://ticket.int>ticket.int</a></p>

<p>Here is your “"User Principal Name"" that is needed when filling out the form on helpdesk.int: $username@domain.int</p>


<p>Thanks, <br>
IT Team"


if ($email -eq $null){
$i++
$nullemails += $name + '<br>'
continue}

if ([int]$daysleft -eq 7){
#Send-MailMessage -To $email -From helpdesk@companyname.com -Subject "Your password will expire in $daysleft days" -body $expiringsoonmessage -BodyAsHtml -SmtpServer relay.companyname.com
userlookup $username
}

if ([int]$daysleft -eq 3){
#Send-MailMessage -To $email -From helpdesk@companyname.com -Subject "Your password will expire in $daysleft days" -body $expiringsoonmessage -BodyAsHtml -SmtpServer relay.companyname.com
userlookup $username
}

if ([int]$daysleft -eq 1){
#Send-MailMessage -To $email -From helpdesk@companyname.com -Subject "Your password will expire tomorrow" -body $expiringsoonmessage -BodyAsHtml -SmtpServer relay.companyname.com
userlookup $username
}

if ([int]$daysleft -le 0 -and (get-date).DayOfWeek -eq "Monday"){
#Send-MailMessage -To $email -From helpdesk@companyname.com -Subject "Your password has expired" -body $expiredmessage -BodyAsHtml -SmtpServer relay.companyname.com
userlookup $username
}

                           
$i++                            
} While ($i -lt $users.count)

$logs = Get-Content $logname

$itteam="

<font face=""Arial"">
Hello Admin team,

<p>The following users Active Directory password will expire within 7 days:</p>

$logs

<p>The following users have null emails in AD: </p>

$nullemails

<p>Thanks, <br>
Support"

if ((get-date).DayOfWeek -eq "Friday"){
Add-Content -path $path -value ($nullemails)
Send-MailMessage -To it@companyname.com -from helpdesk@companyname.com -Subject 'AD Password Notifications' -body $itteam -BodyAsHtml -SmtpServer relay.companyname.com
}
