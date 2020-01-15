Function write_log ($Inhalt)
{
  $FileExists = Test-Path $LogFile
  # Ermittelt das aktuelle Datum mit diesem Syntax 01.10.2013 10:00
  $DateNow = Get-Date -Format "dd.MM.yyyy HH:mm"
  # Setzt die Zeile für unser Logfile zusammen
  $FileInp = $DateNow + ' | ' + $Inhalt
  # Test ob die Datei existiert
  If ($FileExists -eq $False)
  {
    # Wenn die Datei nicht existiert erst mail die Datei anlegen
    New-Item $LogFile -ItemType File
  }
  Add-Content $LogFile -value $FileInp # dann den Inhalt reinschreiben reinschreiben
}
# SIG # Begin signature block
# MIIFXQYJKoZIhvcNAQcCoIIFTjCCBUoCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUg0q8HkdWc/Wz7DrMssSPfnYw
# tnegggMDMIIC/zCCAeegAwIBAgIQcXZ+3KnjgrBMPRHwIF7IuTANBgkqhkiG9w0B
# AQsFADAPMQ0wCwYDVQQDDAR4bm9yMB4XDTE5MTEyMjIwMzQxMFoXDTIwMTEyMjIw
# NTQxMFowDzENMAsGA1UEAwwEeG5vcjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
# AQoCggEBALq8+WtOdlZ4ezOI7Q2mLFXHB0oID04PNTWQzF4bknP63oEOUkG1A4Mg
# BcNaZyLeeMaNsU3Q/hvPS9v2CNKN8VbIpTT11Q3aOfbQWhWiyogURKI47TZjXR4g
# 2oQ/EFniUfmY907tVsYE9viVKhs0DonnmdAq4xSki7eRODMYSNe0fgEf0iW+zkxi
# UQhr/UVITh2UirfDYuKjeLKRHYzIMFupfynDCMD34/A0ZT93+DxpLA85RTv4pzE9
# mW/OQNuN/yGpG2wWslMgGQvDWwABM5eOAUXgG/p0loMeRoUudoMKBzCn3LVhJX5m
# wM3jiqibo5tOw67Jds8JTcMgNIECEeECAwEAAaNXMFUwDgYDVR0PAQH/BAQDAgeA
# MBMGA1UdJQQMMAoGCCsGAQUFBwMDMA8GA1UdEQQIMAaCBHhub3IwHQYDVR0OBBYE
# FJvm2P/4pf5gGydSNrvfujW+9sdZMA0GCSqGSIb3DQEBCwUAA4IBAQCVqHfl7WQv
# qSXhcz1Qg28IWTY+nzmEjblNlgLePI8xDEr6+0uEw8M4X0gnLeI3k8XEejpHm14W
# VAUC8z3iH53rsT9NaYmVfi8LE7B0nYj7gfLS/3Ev8oiN6ftDEiboJRawsxMHXPAa
# XMimwoaD3W1w95fDRUbyb08EHt/WPnW6AjWBbLWzut63+699e9ZxJN1o/epfQKfC
# b2XNhGT8XYMU22RTZ+yeXfKDmLA3+ZYiTj5rFudJk9eF+Tq0XkETsW6BhiH/M4sK
# YTBCtiluQnm6EcNDbXoO0f0GUCuul251W841iwUdS2g3TxtxokcVQOtMBMv9gj5w
# 0l4/5cxP4NEeMYIBxDCCAcACAQEwIzAPMQ0wCwYDVQQDDAR4bm9yAhBxdn7cqeOC
# sEw9EfAgXsi5MAkGBSsOAwIaBQCgeDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAA
# MBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgor
# BgEEAYI3AgEVMCMGCSqGSIb3DQEJBDEWBBSVdotK3flRzj4jyhbvDnK2Vi2DsTAN
# BgkqhkiG9w0BAQEFAASCAQBdQb+cJ55jEYBFD8O9Nv2wyx7haTR4YhooqEatt41c
# P8xaRd+BjcnSGame72Eep6FBEYLthiYX1DZXTEm7fBnk/k8NzOpQlxVLyPgw54aT
# 0huCF5Pc7lTkAnMetrgR16U6m7GFOKeDi3vQ8+/bs5p4zH5BSJLHo8m1JhViGkRE
# EY1Mxq1gwzKqPc78UMuKAtEiMb0JOQWOsmbKuEFs+raIQppUT7ceA0JALctaXgVg
# dzd17yusSfBtT6bD7234czy5Wj9atYq+uaYi4vpTYXkkLOrLUPCDEBjGtmd99Zto
# JIrOxJPpXWsa4sEAOFyUCbhDW8yoP+SVtOz6l1WE/ChA
# SIG # End signature block
