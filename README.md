# SilentJavaUpdate
Silently update java to the latest version under Windows 10.

It is best to add this to the Task Scheduler but you could also run it manually. A logfile "update.log" is created.

If java is not installed, it will be installed.

# Usage

Depending on your "Execution Policy" for PowerShell Scripts you may need to sign the scripts:

* Add Signature
  ~~~~~~~~
  Set-AuthenticodeSignature .\Function-Write-Log.ps1 @(Get-ChildItem cert:\CurrentUser\My -codesigning)[0]
  Set-AuthenticodeSignature .\silent_java_update.ps1 @(Get-ChildItem cert:\CurrentUser\My -codesigning)[0]
  ~~~~~~~~

* Run
  ~~~~~~~~
  .\silent_java_update.ps1
  ~~~~~~~~

# Run the script via Task Scheduler
* Add a new task
* Set "Action" to "Run Program"
* Set "Program/Script" to "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
* Set "Arguments" to "-command PATH_TO_SCRIPT\silent_java_update.ps1"
* Set "Start In" to "PATH_TO_SCRIPT"
