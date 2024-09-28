#!/bin/bash
#  |════════════════════════════════════════════════════════════════════════════════════|
#  • Autoscript AIO Lite Menu By Izana                                     |
#  • IZANA AUTO-SCRIPT          |
#  |════════════════════════════════════════════════════════════════════════════════════|
#
izp=$(cat /root/.isp)
region=$(cat /root/.region)
city=$(cat /root/.city)
dmas=$(cat /etc/xray/domain)
domain=$(cat /etc/xray/domain)
if [ -f /etc/xray/domssh ]; then
    domargo=$(cat /etc/xray/domssh)
    domain=$domssh
fi
clear
echo -e "\e[33m═══════════════════════════════════\033[0m"
echo -e "\E[40;1;37m            SSH Account            \E[0m"
echo -e "\e[33m═══════════════════════════════════\033[0m"
read -p "Username       : " Login
read -p "Password       : " Pass
read -p "Limit IP       : " iplimit
read -p "Expired (Days) : " masaaktif
clear
#limitip
if [[ $iplimit -gt 2 ]]; then
echo -e "$iplimit" > /etc/xray/limit/ip/ssh/$Login
else
echo > /dev/null
fi
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo "$Login:$Pass" | sudo chpasswd
clear
TEKS="
═══════════════════════════
<=      SSH ACCOUNT      =>
═══════════════════════════

Username     : $Login
Password     : $Pass
Host/IP      : $domain
Limit IP     : $iplimit
Port ssl/tls : 443
Port non tls : 80, 2082
Port openssh : 22, 3303, 53
Port dropbear: 109, 69, 143
Udp Custom   : 1-65535, 56-7789
Http Proxy   : 8888
OHP All      : 8181, 8282, 8383
BadVpn       : 7300
════════════════════════════
<=   Detail Information   =>

ISP           : $izp
CITY          : $city
REGION        : $region
════════════════════════════
<=   DNSTT  Information   =>

Port         : 5300
Publik Key   : $(cat /etc/slowdns/server.pub)
Nameserver   : $(cat /etc/slowdns/nsdomain)
═══════════════════════════
<=  Chisel  Information  =>

Port TLS     : 9443
Port HTTP    : 8000
TLS Usage    : chisel client wss://$domain:9443 R:5000:localhost:22 / chisel client https://$Login:$Pass@$domain:9443 R:5000:localhost:22
HTTP Usage   : chisel client ws://$domain:8000 R:5000:localhost:22 / chisel client http://$Login:$Pass@$domain:8000 R:5000:localhost:22
═══════════════════════════
Port OVPN    : 1194 TCP / 2200 UDP
OVPN TCP     : http://$domain:8081/tcp.ovpn
OVPN UDP     : http://$domain:8081/udp.ovpn
═══════════════════════════
Payload Ws   => GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
═══════════════════════════
Payload Ovpn => GET /ovpn HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
═══════════════════════════
Expired => $expi
═══════════════════════════
"
clear
CHATID=$(cat /etc/funny/.chatid)
KEY=$(cat /etc/funny/.keybot)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
curl -s --max-time $TIME --data-urlencode "chat_id=$CHATID" --data-urlencode "text=$TEKS" $URL
clear
echo -e "$TEKS"
