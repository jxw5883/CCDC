# Windows 10 STIG
Written by Jason Mercede - CCDC 2020

---
#### Disable Cortona Service

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
