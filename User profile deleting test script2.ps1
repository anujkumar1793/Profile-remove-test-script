$computerName = "Yourcomputername"
$profilePath = "C:\Users"

$profilesToExclude = @("defaultuser0", "Publicuser0", "YourID", "administrator","admin")

$allProfiles = Get-WmiObject Win32_UserProfile -ComputerName $computerName | Where-Object { $_.Special -eq $false }

foreach ($profile in $allProfiles) {
    $userName = $profile.LocalPath.Split('\')[-1]

        if ($profilesToExclude -notcontains $userName) { 
        Write-Host "Deleting profile for $userName"
        Remove-Item -Path "$profilePath\$userName" -Force -Recurse
    } else {
        Write-Host -BackgroundColor Green "Excluding profile for $userName from deletion"
    }
}
