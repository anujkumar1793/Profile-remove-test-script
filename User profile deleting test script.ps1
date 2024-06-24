$computerName = "DINM5CD32862R9"
$profilePath = "C:\Users"

$profilesToExclude = @("defaultuser0","Public","z004zbam","administrator","admin")

$allprofiles = Get-WmiObject Win32_UserProfile -ComputerName $computerName | Where-Object { $_.special -eq $false }

foreach ($profile in $allprofiles){
    $UserName = $profile.localPath.Split('\')[-1]

    if($profilesToExclude -notcontains $UserName){
    Write-Host "Deleting profile for$UserName"
    Remove-Item -Path "$profilePath\UserName" -Force -Recurse
    }else {
    Write-Host -BackgroundColor Green "Excluding profile for $UserName from delection"
    }
}