New-NetFirewallRule -DisplayName "_Block 146.185.220.0/23" -Direction Outbound –LocalPort Any -Protocol TCP -Action Block -RemoteAddress 146.185.220.0/23
