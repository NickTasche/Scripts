$ips = GC C:\Users\cus17474\Desktop\user-devices.txt

$allNames = @() 
 
Foreach ($ip in $ips) 
 
 {
    $expObj = "" | Select "Ip", "Ping"

    if(Test-Connection -ComputerName $ip -BufferSize 16 -Count 1 -Quiet)
     {
      $ping = "Online"
      Write-Host $ping
     }
    
    else
     {
     $ping = "Off"
     Write-Host $ping 
     }

    $expObj.Ip = $ip
    $expObj.ping = $ping

    $allNames += $expObj
  }

$allNames | Export-Csv -Path .\Ping-Results.csv -NoTypeInformation

Read-Host -Prompt "Press Enter to exit"