
$ips = GC C:\Users\ecopyscn\Desktop\hostlist.txt 

$allNames = @() 
 
Foreach ($ip in $ips) 
 
 { 
 
$name = nslookup $ip 2> $null | select-string -pattern "Name:" 
 
if ( ! $name ) { $name = "" } 
 
$name = $name.ToString() 
 
if ($name.StartsWith("Name:")) 
 
{ $name = (($name -Split ":")[1]).Trim() } 
 
 else 
 
{ $name = "NOT FOUND" } 
 
Echo "$ip `t $name"

$allNames += $name 
 
}

$allNames | Export-Csv -Path .\HostName.csv -NoTypeInformation

Read-Host -Prompt "Press Enter to exit"