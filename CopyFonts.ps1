
# This is the file that contains the list of computers you want 
# to copy the folder and files to. Change this path IAW your folder structure.
$computers = gc "C:\Temp\computers.txt"
 
# This is the directory you want to copy to the computer (IE. c:\folder_to_be_copied)
$source = "\\dta01094p07\MSS\Private\MISCELLANEOUS\Font Install"
 
# On the desination computer, where do you want the folder to be copied?
$dest = "c$\Temp"
 
foreach ($computer in $computers) {
    if (test-Connection -Cn $computer -quiet) {
        Copy-Item $source -Destination \\$computer\$dest -Recurse
    } else {
        Write-Output "$computer is not online" 
    }
 
}