# Windows 10 STIG
Written by Jason Mercede - CCDC 2020


> Unneeded services that are kept running can lead to exploitable backdoors waiting to get hacked, and Cortana/Windows Search are no exception.  Shut the service/s down to prevent them from being used as an entryway to the system.
---

#### Disable Cortana Service

1. Start Menu > Services > Windows Search
2. Disable service
3. Stop Service
4. Apply

#### Disable Cortana Registry

1. Start Menu > Regedit.exe
2. `KEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search`
3. Create DWORD Value "AllowCortana" = 0

#### Block Search/Cortana at F/W

1. Start Menu > Windows Defender Firewall with Advanced Security > Inbound Rules
2. Block Cortana and Windows Shell Experience
