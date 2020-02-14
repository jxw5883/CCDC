TODO: Expand more on the nitty-gritty details

To check:

#### Running tasks against baseline (to be established)

#### Windows firewall enabled?
* `firewall.cpl` is the shortcut

#### Startup registry items

Registry paths:
* HKEY_LOCAL_MACHINE/Software/Microsoft/Windows/CurrentVersion/Run
* HKEY_LOCAL_MACHINE/Software/Microsoft/Windows/CurrentVersion/RunOnce
* HKEY_CURRENT_USER/Software/Microsoft/Windows/CurrentVersion/Run
* HKEY_CURRENT_USER/Software/Microsoft/Windows/CurrentVersion/RunOnce

#### Scheduled tasks
* Use `taskschd.msc`. Check for tasks that should not be there

#### Local users, groups, and privileges
* Use `lusrmgr.msc`. Double check group inheritance!

#### Shared drives
* `net share` command reveals a lot
