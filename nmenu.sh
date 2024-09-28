#!/bin/bash
[[ -e $(which curl) ]] && if [[ -z $(cat /etc/resolv.conf | grep "1.1.1.1") ]]; then cat <(echo "nameserver 1.1.1.1") /etc/resolv.conf > /etc/resolv.conf.tmp && mv /etc/resolv.conf.tmp /etc/resolv.conf; fi
#
#  |=================================================================================|
#  • Autoscript AIO Lite Menu By Izana                                     |
#  • IZANA AUTO-SCRIPT
#  |=================================================================================|
#

addn() {
domain=$(cat /etc/xray/domain)
clear
echo -e "
════════════════════════════
Add Account NoobzVPN
════════════════════════════"
read -p "Username  : " user
read -p "Password  : " pass
read -p "Masa Aktif: " masaaktif
clear
noobzvpns --add-user "$user" "$pass"
noobzvpns --expired-user "$user" "$masaaktif"
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
clear
TEKS="
════════════════════════════
NoobzVPN Account
════════════════════════════
Hostname  : $domain
Username  : $user
Password  : $pass
════════════════════════════
TCP_STD/HTTP  : 8080
TCP_SSL/HTTPS : 8443
════════════════════════════
PAYLOAD   : GET / HTTP/1.1[crlf]Host: [host][crlf]Upgrade: websocket[crlf][crlf]
════════════════════════════
Expired   : $expi
════════════════════════════"
CHATID=$(cat /etc/funny/.chatid)
KEY=$(cat /etc/funny/.keybot)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
curl -s --max-time $TIME -d "chat_id=$CHATID&text=$TEKS" $URL
clear
echo "$TEKS"
}

deln() {
mna=$(noobzvpns --info-all-user)
clear
echo -e "
════════════════════════════
Delete Account
════════════════════════════
$mna
════════════════════════════
"
read -p "Input Name: " name
if [ -z $name ]; then
menu
else
noobzvpns --remove-user "$user"
clear
TEKS="
════════════════════════════
Username Delete
════════════════════════════

User: $name
════════════════════════════
"
CHATID=$(cat /etc/funny/.chatid)
KEY=$(cat /etc/funny/.keybot)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
curl -s --max-time $TIME -d "chat_id=$CHATID&text=$TEKS" $URL
clear
echo "$TEKS"
fi
}

list() {
clear
noobzvpns --info-all-user
}

tampilan() {
white='\e[037;1m'
RED='\e[31m'
GREEN='\e[32m'
NC='\033[0;37m'
domain=$(cat /etc/xray/domain)
clear
if [[ $(systemctl status noobzvpns | grep -w Active | awk '{print $2}' | sed 's/(//g' | sed 's/)//g' | sed 's/ //g') == 'active' ]]; then
    status="${GREEN}ON${NC}";
else
    status="${RED}OFF${NC}";
fi
clear
echo -e "════════════════════════════════" | lolcat
echo -e " ${white}      <== NOOBZVPNS ==>"
echo -e "════════════════════════════════" | lolcat
echo -e "Noobz: $status
${white}
Domain: $domain
${white}
1. Add Account
2. Trial Account
3. Delete Account
4. List Active Account${white}"
echo "════════════════════════════════" | lolcat
echo "Preess CTRL or X to exit"
echo "════════════════════════════════" | lolcat
read -p "Input Option: " inrere
case $inrere in
1|01) clear ; addn ;;
2|02) clear ; trial-noobz ;;
3|03) clear ; deln ;;
4|04) clear ; list ;;
x|X) exit ;;
*) echo "Wrong Number " ; tampilan ;;
esac
}
tampilan
