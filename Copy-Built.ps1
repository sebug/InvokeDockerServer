function Copy-Built {
    param (
        $targetIP
    )

    winrm s winrm/config/client "@{TrustedHosts=""$targetIP""}"
    $cs = New-PSSession -ComputerName $targetIP -Name KubeDev
    $tp = Invoke-Command -Session $cs -ScriptBlock { if (!(Test-Path C:\Dockerbuilds)) { mkdir C:\Dockerbuilds } }
    Copy-Item -Recurse -Force C:\Sources\TalkNotesBack -Destination C:\Dockerbuilds\TalkNotesBack -ToSession $cs
    Copy-Item -Recurse -Force C:\Sources\TalkNotesFront -Destination C:\Dockerbuilds\TalkNotesFront -ToSession $cs
}