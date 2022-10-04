
##Variables
$baDNS1 = "10.58.3.247"
$baDNS2 = "10.8.4.247"
##$baDNS3 = "153.32.14.247"
$seaDNS = "153.32.250.247"
$utDNS = "10.10.0.150"
$ottDNS = "10.36.4.247"
$vaDNS = "10.60.32.247"
$bosDNS = "10.60.32.247"
$sjDNS = "153.32.14.247"
#nyDNS???
#orDNS???


$sfServer = "\\printsf.corp.adobe.com\AdobeSecurePrint"
$seaServer = "\\printsea.corp.adobe.com\AdobeSecurePrint"
$utServer = "\\printut.corp.adobe.com\AdobeSecurePrint"
$ottServer = "\\printeast.corp.adobe.com\AdobeSecurePrint"
$vaServer = "\\printeast.corp.adobe.com\AdobeSecurePrint"
$bosServer = "\\printeast.corp.adobe.com\AdobeSecurePrint"
$sjServer = "\\printsj.corp.adobe.com\AdobeSecurePrint"

$printServer = "null"

##Pull DNS Address for host
$regex = ‘\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b’
$server = nslookup server | select-string -Pattern $regex -AllMatches | % { $_.Matches } | % { $_.Value } | select-object -First 1
echo "Your DNS: $server"

##Use DNS to identify print server
if ($sever -eq $baDNS1 -OR  $server -eq $baDNS2)
    {$printServer = $sfServer
    echo "Your Print Server: $printServer"
    }

elseif ($server -eq $seaDNS)
    {$printServer = $seaServer
    echo "Your Print Server: $printServer"
    }

elseif ($server -eq $sjDNS)
    {$printServer = $sjServer
    echo "Your Print Server: $printServer"
    }

elseif ($server -eq $utDNS)
    {$printServer = $utServer
    echo "Your Print Server: $printServer"
    }

elseif ($server -eq $ottDNS)
    {$printServer = $ottServer
    echo "Your Print Server: $printServer"
    }

elseif ($server -eq $vaDNS)
    {$printServer = $vaServer
    echo "Your Print Server: $printServer"
    }

elseif ($server -eq $bosDNS)
    {$printServer = $bosServer
     echo "Your Print Server: $printServer" 
    }

else 
{Echo "We cannot where you are :P"}

##Connect to print server
Add-Printer -ConnectionName $printServer

Echo "Please check to make sure your printer has been installed"

