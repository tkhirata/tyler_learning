$username = read-host 'Input Username '
$info = get-aduser -Identity $username -properties givenname, PasswordLastSet, msDS-UserPasswordExpiryTimeComputed | select Name, PasswordLastSet, msDS-UserPasswordExpiryTimeComputed
$pwexpirationdate = [datetime]::FromFileTime($info.'msDS-UserPasswordExpiryTimeComputed')
$todaysdate = Get-Date
$daysleft = (new-timespan -start $todaysdate -end $pwexpirationdate).Days


write-host '=========================================='
write-host 'Name: ' $info.Name
write-host 'Password Last Set: ' $info.PasswordLastSet
write-host 'Password Expires: ' $pwexpirationdate
write-host 'Days left until expiration: ' $daysleft
