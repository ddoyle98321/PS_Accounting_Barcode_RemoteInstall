
# This is the file that contains the list of computers you want 
# to copy the folder and files to. Change this path IAW your folder structure.
$computers = gc "C:\Temp\computers.txt"
 
# This is the directory you want to copy to the computer (IE. c:\folder_to_be_copied)
$source = "c:\Temp\Font Install\Add-Font2.ps1"
 
# On the desination computer, where do you want the folder to be copied?
$dest = "C:\Temp\Font Install"
$s = New-PSSession -ComputerName $computer
$sb = "C:\Temp\Font Install\Add-Font2.ps1 -path C:\Temp\Font Install"

foreach ($computer in $computers) {
    if (test-Connection -Cn $computer -quiet) {
        Invoke-Command -ComputerName $computer -ScriptBlock { & 'C:\Temp\Font Install\Add-Font2.ps1' -path "C:\Temp\Font Install" }
        "Font installation on $computer complete"
      } else {
        "$computer is not online"
    }
 
}