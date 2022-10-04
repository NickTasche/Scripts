
$ips = GC C:\Users\cus17474\Desktop\user-devices.txt 

$allNames = @() 
 
Foreach ($ip in $ips) 
 
 { 

$expObj = "" | Select "Ip", "Ping"

 
$ping = ping $ip 2> $null | select-string -pattern "Received" 

$ping = $ping.trim()

$expObj.Ip = $ip
$expObj.ping = $ping

$allNames += $expObj

$expObj = $null

 
if ( ! $ping ) 
 { $ping = "" } 
 

$ping = $ping.ToString()
  

if ($ping.StartsWith("    Packets")) 
 
{ $ping = (($ping -Split "=")[1]).Trim() } 
 
 else 
 
{ $ping = "NOT FOUND" } 

 
Echo "$ip `t $ping"

 
}


$allNames | Export-Csv -Path .\Ping-Results.csv -NoTypeInformation

Read-Host -Prompt "Press Enter to exit"