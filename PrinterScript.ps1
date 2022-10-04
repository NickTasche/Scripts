$servers =  Get-Content "server-list.txt" 
 
$allprinters = @() 
foreach( $server in $servers ){ 
Write-Host "checking $server ..." 
$printer = $null 
$printers = $null 
$printers = Get-WmiObject -class Win32_Printer -computername $server 
$printer = $printers 
#| select-object sharename, DriverName, PortName, SystemName, Location | Export-CSV .\process.csv  
$allprinters += $printer 
 } 
 Write-Host "exporting to printers.csv" 
$allprinters | select-object sharename, DriverName, PortName, SystemName, Location | Export-CSV .\printers.csv -NoTypeInformation 
Write-Host "Done!"