while (1){
set str =$(ping -n 3 -w 80 baidu.com)`
echo $str
$result=[regex]::matches($str,'100%')

if($result.Success)
{
echo no_internet?auto connect...

$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$session.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36"
$session.Cookies.Add((New-Object System.Net.Cookie("PHPSESSID", "ptg2qabf1sqps7gbun61pb5oj3", "/", "10.255.254.11")))
Invoke-WebRequest -UseBasicParsing -Uri "http://10.255.254.11:801/eportal/?c=Portal&a=login&callback=dr1642299994077&login_method=1&user_account=lab307&user_password=lab307307&wlan_user_ip=202.197.33.46&wlan_user_ipv6=&wlan_user_mac=000000000000&wlan_ac_ip=&wlan_ac_name=&jsVersion=3.3.1&_=1642299912058" `
-WebSession $session `
-Headers @{
"Accept"="*/*"
  "Referer"="http://10.255.254.11/"
  "Accept-Encoding"="gzip, deflate"
  "Accept-Language"="zh-CN,zh;q=0.9,en;q=0.8"
}

sleep 2`
}
else{
echo has_internet
sleep 2`
}
}
