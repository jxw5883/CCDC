echo 'SHOWING FIREWALL RULES'
sleep 2
Get-NetFirewallRule | Where { $_.Enabled -eq 'True' }
sleep 2
echo 'SHOWING ACTIVE SOCKETS/CONNECTIONS'
sleep 2
netstat -a -o -n
sleep 2
echo 'SHOWING CURRENTLY ACTIVE FIREWALL PROFILE'
sleep 2
netsh advfirewall monitor show currentprofile
sleep 2
echo 'BLOCK OUTBOUND TCP PORT 80'
sleep 2
New-NetFirewallRule -DisplayName "Block Outbound Port 80" -Direction Outbound -LocalPort 80 -Protocol TCP -Action Bloc
