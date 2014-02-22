param($installPath, $toolsPath, $package, $project)

. (Join-Path $toolsPath common.ps1)

# Update the _references.js file
#Write-Host "Remove old References"
Remove-Reference $scriptsFolderProjectItem $officeBetaRegEx

#Write-Host "Updating References"
AddOrUpdate-Reference $scriptsFolderProjectItem $officeCDNRegEx $newOfficeCDNPath "True"
AddOrUpdate-Reference $scriptsFolderProjectItem $outlookCDNRegEx $newOutlookCDNPath "True"
AddOrUpdate-Reference $scriptsFolderProjectItem $officeLocalRegEx $newOfficeLocalPath "False"
AddOrUpdate-Reference $scriptsFolderProjectItem $officeintellisensefile $officeintellisensefile "False"
# SIG # Begin signature block
# MIIaUAYJKoZIhvcNAQcCoIIaQTCCGj0CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUKYmU2F9zeL/Jcn2+jtH42ErP
# eZugghU2MIIEqTCCA5GgAwIBAgITMwAAAIhZDjxRH+JqZwABAAAAiDANBgkqhkiG
# 9w0BAQUFADB5MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
# A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSMw
# IQYDVQQDExpNaWNyb3NvZnQgQ29kZSBTaWduaW5nIFBDQTAeFw0xMjA3MjYyMDUw
# NDFaFw0xMzEwMjYyMDUwNDFaMIGDMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMR4wHAYDVQQDExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCzdHTQgjyH
# p5rUjrIEQoCXJS7kQc6TYzZfE/K0eJiAxih+zIoT7z03jDsJoNgUxVxe2KkdfwHB
# s5gbUHfs/up8Rc9/4SEOxYTKnw9rswk4t3TEVx6+8EioeVrfDpscmqi8yFK1DGmP
# hM5xVXv/CSC/QHc3ITB0W5Xfd8ug5cFyEgY98shVbK/B+2oWJ8j1s2Hj2c4bDx70
# 5M1MNGw+RxHnAitfFHoEB/XXPYvbZ31XPjXrbY0BQI0ah5biD3dMibo4nPuOApHb
# Ig/l0DapuDdF0Cr8lo3BYHEzpYix9sIEMIdbw9cvsnkR2ItlYqKKEWZdfn8FenOK
# H3qF5c0oENE9AgMBAAGjggEdMIIBGTATBgNVHSUEDDAKBggrBgEFBQcDAzAdBgNV
# HQ4EFgQUJls+W12WX+L3d4h/XkVTWKguW7gwDgYDVR0PAQH/BAQDAgeAMB8GA1Ud
# IwQYMBaAFMsR6MrStBZYAck3LjMWFrlMmgofMFYGA1UdHwRPME0wS6BJoEeGRWh0
# dHA6Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY0NvZFNp
# Z1BDQV8wOC0zMS0yMDEwLmNybDBaBggrBgEFBQcBAQROMEwwSgYIKwYBBQUHMAKG
# Pmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2kvY2VydHMvTWljQ29kU2lnUENB
# XzA4LTMxLTIwMTAuY3J0MA0GCSqGSIb3DQEBBQUAA4IBAQAP3kBJiJHRMTejRDhp
# smor1JH7aIWuWLseDI9W+pnXypcnTOiFjnlpLOS9lj/lcGaXlTBlKa3Gyqz1D3mo
# Z79p9A+X4woPv+6WdimyItAzxv+LSa2usv2/JervJ1DA6xn4GmRqoOEXWa/xz+yB
# qInosdIUBuNqbXRSZNqWlCpcaWsf7QWZGtzoZaqIGxWVGtOkUZb9VZX4Y42fFAyx
# nn9KBP/DZq0Kr66k3mP68OrDs7Lrh9vFOK22c9J4ZOrsIVtrO9ZEIvSBUqUrQymL
# DKEqcYJCy6sbftSlp6333vdGms5DOegqU+3PQOR3iEK/RxbgpTZq76cajTo9MwT2
# JSAjMIIEujCCA6KgAwIBAgIKYQKOQgAAAAAAHzANBgkqhkiG9w0BAQUFADB3MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSEwHwYDVQQDExhNaWNy
# b3NvZnQgVGltZS1TdGFtcCBQQ0EwHhcNMTIwMTA5MjIyNTU4WhcNMTMwNDA5MjIy
# NTU4WjCBszELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjENMAsG
# A1UECxMETU9QUjEnMCUGA1UECxMebkNpcGhlciBEU0UgRVNOOkY1MjgtMzc3Ny04
# QTc2MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIIBIjAN
# BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAluyOR01UwlyVgNdOCz2/l0PDS+Ng
# ZxEvAU0M2NFGLxBA3gukUFISiAtDei0/7khuZseR5gPKbux5qWojm81ins1qpD/n
# o0P/YkehtLpE+t9AwYVUfuigpyxDI5tSHzI19P6aVp+NY3d7MJ4KM4VyG8pKyMwl
# zdtdES7HsIzxj0NIRwW1eiAL5fPvwbr0s9jNOI/7Iao9Cm2FF9DK54YDwDODtSXE
# zFqcxMPaYiVNUyUUYY/7G+Ds90fGgEXmNVMjNnfKsN2YKznAdTUP3YFMIT12MMWy
# sGVzKUgn2MLSsIRHu3i61XQD3tdLGfdT3njahvdhiCYztEfGoFSIFSssdQIDAQAB
# o4IBCTCCAQUwHQYDVR0OBBYEFC/oRsho025PsiDQ3olO8UfuSMHyMB8GA1UdIwQY
# MBaAFCM0+NlSRnAK7UD7dvuzK7DDNbMPMFQGA1UdHwRNMEswSaBHoEWGQ2h0dHA6
# Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY3Jvc29mdFRp
# bWVTdGFtcFBDQS5jcmwwWAYIKwYBBQUHAQEETDBKMEgGCCsGAQUFBzAChjxodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY3Jvc29mdFRpbWVTdGFt
# cFBDQS5jcnQwEwYDVR0lBAwwCgYIKwYBBQUHAwgwDQYJKoZIhvcNAQEFBQADggEB
# AHP/fS6dzY2IK3x9414VceloYvAItkNWxFxKLWjY+UgRkfMRnIXsEtRUoHWpOKFZ
# f3XuxvU02FSk4tDMfJerk3UwlwcdBFMsNn9/8UAeDJuA4hIKIDoxwAd1Z+D6NJzs
# iPtXHOVYYiCQRS9dRanIjrN8cm0QJ8VL2G+iqBKzbTUjZ/os2yUtuV2xHgXnQyg+
# nAV2d/El3gVHGW3eSYWh2kpLCEYhNah1Nky3swiq37cr2b4qav3fNRfMPwzH3QbP
# TpQkYyALLiSuX0NEEnpc3TfbpEWzkToSV33jR8Zm08+cRlb0TAex4Ayq1fbVPKLg
# tdT4HH4EVRBrGPSRzVGnlWUwggW8MIIDpKADAgECAgphMyYaAAAAAAAxMA0GCSqG
# SIb3DQEBBQUAMF8xEzARBgoJkiaJk/IsZAEZFgNjb20xGTAXBgoJkiaJk/IsZAEZ
# FgltaWNyb3NvZnQxLTArBgNVBAMTJE1pY3Jvc29mdCBSb290IENlcnRpZmljYXRl
# IEF1dGhvcml0eTAeFw0xMDA4MzEyMjE5MzJaFw0yMDA4MzEyMjI5MzJaMHkxCzAJ
# BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25k
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xIzAhBgNVBAMTGk1pY3Jv
# c29mdCBDb2RlIFNpZ25pbmcgUENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
# CgKCAQEAsnJZXBkwZL8dmmAgIEKZdlNsPhvWb8zL8epr/pcWEODfOnSDGrcvoDLs
# /97CQk4j1XIA2zVXConKriBJ9PBorE1LjaW9eUtxm0cH2v0l3511iM+qc0R/14Hb
# 873yNqTJXEXcr6094CholxqnpXJzVvEXlOT9NZRyoNZ2Xx53RYOFOBbQc1sFumdS
# jaWyaS/aGQv+knQp4nYvVN0UMFn40o1i/cvJX0YxULknE+RAMM9yKRAoIsc3Tj2g
# Mj2QzaE4BoVcTlaCKCoFMrdL109j59ItYvFFPeesCAD2RqGe0VuMJlPoeqpK8kbP
# Nzw4nrR3XKUXno3LEY9WPMGsCV8D0wIDAQABo4IBXjCCAVowDwYDVR0TAQH/BAUw
# AwEB/zAdBgNVHQ4EFgQUyxHoytK0FlgByTcuMxYWuUyaCh8wCwYDVR0PBAQDAgGG
# MBIGCSsGAQQBgjcVAQQFAgMBAAEwIwYJKwYBBAGCNxUCBBYEFP3RMU7TJoqV4Zhg
# O6gxb6Y8vNgtMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMB8GA1UdIwQYMBaA
# FA6sgmBAVieX5SUT/CrhClOVWeSkMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9j
# cmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL21pY3Jvc29mdHJvb3Rj
# ZXJ0LmNybDBUBggrBgEFBQcBAQRIMEYwRAYIKwYBBQUHMAKGOGh0dHA6Ly93d3cu
# bWljcm9zb2Z0LmNvbS9wa2kvY2VydHMvTWljcm9zb2Z0Um9vdENlcnQuY3J0MA0G
# CSqGSIb3DQEBBQUAA4ICAQBZOT5/Jkav629AsTK1ausOL26oSffrX3XtTDst10Ot
# C/7L6S0xoyPMfFCYgCFdrD0vTLqiqFac43C7uLT4ebVJcvc+6kF/yuEMF2nLpZwg
# LfoLUMRWzS3jStK8cOeoDaIDpVbguIpLV/KVQpzx8+/u44YfNDy4VprwUyOFKqSC
# HJPilAcd8uJO+IyhyugTpZFOyBvSj3KVKnFtmxr4HPBT1mfMIv9cHc2ijL0nsnlj
# VkSiUc356aNYVt2bAkVEL1/02q7UgjJu/KSVE+Traeepoiy+yCsQDmWOmdv1ovoS
# JgllOJTxeh9Ku9HhVujQeJYYXMk1Fl/dkx1Jji2+rTREHO4QFRoAXd01WyHOmMcJ
# 7oUOjE9tDhNOPXwpSJxy0fNsysHscKNXkld9lI2gG0gDWvfPo2cKdKU27S0vF8jm
# cjcS9G+xPGeC+VKyjTMWZR4Oit0Q3mT0b85G1NMX6XnEBLTT+yzfH4qerAr7EydA
# reT54al/RrsHYEdlYEBOsELsTu2zdnnYCjQJbRyAMR/iDlTd5aH75UcQrWSY/1AW
# Lny/BSF64pVBJ2nDk4+VyY3YmyGuDVyc8KKuhmiDDGotu3ZrAB2WrfIWe/YWgyS5
# iM9qqEcxL5rc43E91wB+YkfRzojJuBj6DnKNwaM9rwJAav9pm5biEKgQtDdQCNbD
# PTCCBgcwggPvoAMCAQICCmEWaDQAAAAAABwwDQYJKoZIhvcNAQEFBQAwXzETMBEG
# CgmSJomT8ixkARkWA2NvbTEZMBcGCgmSJomT8ixkARkWCW1pY3Jvc29mdDEtMCsG
# A1UEAxMkTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5MB4XDTA3
# MDQwMzEyNTMwOVoXDTIxMDQwMzEzMDMwOVowdzELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEhMB8GA1UEAxMYTWljcm9zb2Z0IFRpbWUtU3RhbXAg
# UENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn6Fssd/bSJIqfGsu
# GeG94uPFmVEjUK3O3RhOJA/u0afRTK10MCAR6wfVVJUVSZQbQpKumFwwJtoAa+h7
# veyJBw/3DgSY8InMH8szJIed8vRnHCz8e+eIHernTqOhwSNTyo36Rc8J0F6v0LBC
# BKL5pmyTZ9co3EZTsIbQ5ShGLieshk9VUgzkAyz7apCQMG6H81kwnfp+1pez6CGX
# fvjSE/MIt1NtUrRFkJ9IAEpHZhEnKWaol+TTBoFKovmEpxFHFAmCn4TtVXj+AZod
# UAiFABAwRu233iNGu8QtVJ+vHnhBMXfMm987g5OhYQK1HQ2x/PebsgHOIktU//kF
# w8IgCwIDAQABo4IBqzCCAacwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUIzT4
# 2VJGcArtQPt2+7MrsMM1sw8wCwYDVR0PBAQDAgGGMBAGCSsGAQQBgjcVAQQDAgEA
# MIGYBgNVHSMEgZAwgY2AFA6sgmBAVieX5SUT/CrhClOVWeSkoWOkYTBfMRMwEQYK
# CZImiZPyLGQBGRYDY29tMRkwFwYKCZImiZPyLGQBGRYJbWljcm9zb2Z0MS0wKwYD
# VQQDEyRNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHmCEHmtFqFK
# oKWtTHNY9AcTLmUwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC5taWNyb3Nv
# ZnQuY29tL3BraS9jcmwvcHJvZHVjdHMvbWljcm9zb2Z0cm9vdGNlcnQuY3JsMFQG
# CCsGAQUFBwEBBEgwRjBEBggrBgEFBQcwAoY4aHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraS9jZXJ0cy9NaWNyb3NvZnRSb290Q2VydC5jcnQwEwYDVR0lBAwwCgYI
# KwYBBQUHAwgwDQYJKoZIhvcNAQEFBQADggIBABCXisNcA0Q23em0rXfbznlRTQGx
# LnRxW20ME6vOvnuPuC7UEqKMbWK4VwLLTiATUJndekDiV7uvWJoc4R0Bhqy7ePKL
# 0Ow7Ae7ivo8KBciNSOLwUxXdT6uS5OeNatWAweaU8gYvhQPpkSokInD79vzkeJku
# DfcH4nC8GE6djmsKcpW4oTmcZy3FUQ7qYlw/FpiLID/iBxoy+cwxSnYxPStyC8jq
# cD3/hQoT38IKYY7w17gX606Lf8U1K16jv+u8fQtCe9RTciHuMMq7eGVcWwEXChQO
# 0toUmPU8uWZYsy0v5/mFhsxRVuidcJRsrDlM1PZ5v6oYemIp76KbKTQGdxpiyT0e
# bR+C8AvHLLvPQ7Pl+ex9teOkqHQ1uE7FcSMSJnYLPFKMcVpGQxS8s7OwTWfIn0L/
# gHkhgJ4VMGboQhJeGsieIiHQQ+kr6bv0SMws1NgygEwmKkgkX1rqVu+m3pmdyjpv
# vYEndAYR7nYhv5uCwSdUtrFqPYmhdmG0bqETpr+qR/ASb/2KMmyy/t9RyIwjyWa9
# nR2HEmQCPS2vWY+45CHltbDKY7R4VAXUQS5QrJSwpXirs6CWdRrZkocTdSIvMqgI
# bqBbjCW/oO+EyiHW6x5PyZruSeD3AWVviQt9yGnI5m7qp5fOMSn/DsVbXNhNG6HY
# +i+ePy5VFmvJE6P9MYIEhDCCBIACAQEwgZAweTELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEjMCEGA1UEAxMaTWljcm9zb2Z0IENvZGUgU2lnbmlu
# ZyBQQ0ECEzMAAACIWQ48UR/iamcAAQAAAIgwCQYFKw4DAhoFAKCBpjAZBgkqhkiG
# 9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIB
# FTAjBgkqhkiG9w0BCQQxFgQUxIGmRtl2pwj+yNQe0FcgHaoksfAwRgYKKwYBBAGC
# NwIBDDE4MDagGIAWAEkAbgBzAHQAYQBsAGwAIABQAFMAMaEagBhodHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEAlFJlwXYCZ6mValCUhfoT
# QwXjdpWlhJRxnh0HWvYL/qTnVeP/WDDZPOA/Oe2JXlMGiRonZfhpT5wM1ZmZ4831
# r7nVZ8rYzrFLfZu9U7i5re7vRi2BTfQ+SlcJuaAJkLCFWW9tkgELeNkCj4OjEAEJ
# 6fEtAQrkD5Kj9Jtv+hKPp0Oot63pe35tzk5n6BDAthTVWnu75/LBKWhk0wJyKlgb
# z1m/nCx/E/4XSNhoyK6UNLhWjTI5CKugaUDr9MRJH9jiuo3FtlPh2j9ys1ee77/v
# 40sLttC7GqDiAdWhZy6K0ydfuYxVbT8bJfaVvqDGEYt3iGNeTIcyVXkiInwfQT2R
# I6GCAh8wggIbBgkqhkiG9w0BCQYxggIMMIICCAIBATCBhTB3MQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSEwHwYDVQQDExhNaWNyb3NvZnQgVGlt
# ZS1TdGFtcCBQQ0ECCmECjkIAAAAAAB8wCQYFKw4DAhoFAKBdMBgGCSqGSIb3DQEJ
# AzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTEyMTAwNTE5MzQ1MFowIwYJ
# KoZIhvcNAQkEMRYEFKQLpiLcQYB4vbGByNhUYqVNo57zMA0GCSqGSIb3DQEBBQUA
# BIIBAGN6qomj1YP7dgxmO0Nzu7/f5rrKBprLxNeA/PXqVid0j6pYaBpyhvC1oTB7
# Wdow62wmxxLsxy1LFDH7gtcOlRm6GqPgspU1Q5DTJZ91SjxOx2cbbHMSvLf4+VbF
# oT4T1jdGaXpqJOQifEGVcZvixhc5vrvJyFwmEbYyOl0SInBW0coEJvtJNe4pOJKq
# ZF34SrNy2OlXNY3Lap4AyQOmVgYizGzXFWa48GVJCa7BnW6jd1FjNjTRcbfL0m13
# vby68FdiHGsATTvd8tMVc9YflmeZ3NUqRYqD1Ie9wQwzFw5AECgT6Du0F5iQoJsL
# g+bZQyItBEra1IATKshn/AUQ9C8=
# SIG # End signature block
