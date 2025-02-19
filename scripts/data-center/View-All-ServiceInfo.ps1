$ipPrefix = "192.168.50"
for ($i = 130; $i -lt 254; $i = $i + 2) {
    $ip = "$ipPrefix.$i"
    $response = Invoke-WebRequest "http://$($ip):8443/serverinfo"
    Write-Host "Response on $ip"
    Write-Host "$($response.Content)"
}