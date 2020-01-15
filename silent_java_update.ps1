. .\Function-Write-Log.ps1
$LogFile = "update.log"

write_log "Checking for Java updates"

try {
  $javaVersionOutput = & java.exe -version 2>&1
  # java version "1.8.0_171"
  $firstLine = $javaVersionOutput[0].ToString()
  # 8
  $minorVersion = [int]$firstLine.Split(".")[1]
  # 171
  $buildVersion = [int]$firstLine.Split("_")[1].trim('"')
}
catch {
  $minorVersion = "8"
  $buildVersion = "1"
  write_log "Auf dem System ist kein Java installiert. Setze default version $minorVersion $buildVersion" -Foregroundcolor Red
}

#Download-Pfad für die Dateien
$targetPathJava64 = $env:TEMP + "\java64bit.exe"

#Webseite mit WebClient passendem Encoding und 64-Bit User-Agent herunterladen
$net = New-Object System.Net.WebClient
$net.Encoding = [System.Text.Encoding]::UTF8
$net.Headers.Add("User-Agent","WOW64")
$net.Headers.Add("Accept-Language","de-de")
$content = $net.DownloadString("http://www.java.com/de/download/manual.jsp")

# Webversion extrahieren
$webversion = ([regex]'Empfohlen Version (\d+) Update (\d+)').Match($content)
$strWebMinor = [int]$webversion.Groups[1].Value
$strWebBuild = [int]$webversion.Groups[2].Value

Function Get-Matches($Pattern,$groupNumber = 0) {begin { $regex = New-Object Regex($pattern) };process { foreach ($match in ($regex.Matches($_))) { ([Object[]]$match.Groups)[$groupNumber].Value }}}
write_log "Installierte Java-Version: $minorVersion $buildVersion - Aktuellste Version: $strWebMinor $strWebBuild"

if ($minorVersion -lt $strWebMinor -or $buildVersion -lt $strWebBuild){
    write_log "Es ist ein Java-Update verfügbar" -ForegroundColor Green -NoNewline
    # Downloadlinks aus dem Quelltext extrahieren
    $link64bit = $content | Get-Matches '<a title="Download der Java-Software für Windows \(64-Bit\)" href="([^>\"]+)">' 1 | select -First 1
    if ($link64bit -ne ""){
	    write_log "Beginne Download des Updates. Bitte warten ... " -ForegroundColor Green -NoNewline
        # Download Update
        $net.DownloadFile($link64bit,$targetPathJava64)
	    write_log "Download abgeschlossen" -ForegroundColor Green
        write_log "Installiere Update ..." -ForeGroundColor Yellow
        # Installiere Update silent
        Start-Process -FilePath $targetPathJava64 -ArgumentList "/s REBOOT=Suppress" -wait
        if ($LASTEXITCODE -eq 0){
	        write_log "Java $strWebMinor Update $strWebBuild wurde erfolgreich installiert"
        }else{
	        write_log "Bei der Installation ist ein Fehler aufgetreten. Fehlercode: $LASTEXITCODE"
        }
    }else{
        write_log "Download-Link konnte nicht extrahiert werden!" -ForegroundColor Red
    }
}else{
    write_log "Kein Update verfügbar. Script beendet." -ForegroundColor Green -NoNewline
}
# SIG # Begin signature block
# MIIFXQYJKoZIhvcNAQcCoIIFTjCCBUoCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUZC1l0uUHyeJp0UTKL0a5aXxM
# L0CgggMDMIIC/zCCAeegAwIBAgIQcXZ+3KnjgrBMPRHwIF7IuTANBgkqhkiG9w0B
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
# BgEEAYI3AgEVMCMGCSqGSIb3DQEJBDEWBBT0t7Fp8iD05J4bMMBeCZYX0ZJtdzAN
# BgkqhkiG9w0BAQEFAASCAQAUL0SBquot1vR7bHZs+y7fo0r2nnfhg1fwnHVW/BEU
# 14CFW+q+4YZfa8enjn7BmnIOfFRymBskb0g3AB2xtes5MgClPmeRtrcHq59xTD1+
# MytmeaBT+WRA+rUJAJP0gRUB8u6+SaTL+mBg0zlVpU9bNyOS7Q2DJeZsBIeQBib2
# GmdzJbs57+pZliVDQy85G6u0mkLNdFBnN1UF4qb2YM6OwaVbIkX6Ccf8TtVg2Svi
# 53eXfOx2x1zrrWBoB0k+bIDLXVRZZSdxIp+XU4I9+eEdbN65EKikxRw5dheSDrkM
# 9HzE+ONmEmnuz8HPgFaUBPEp2BVE0qymUeMNlOZaAIEg
# SIG # End signature block
