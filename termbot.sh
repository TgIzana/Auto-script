#!/bin/bash

install() {
# [ Repository Bot Telegram ]
link="https://raw.githubusercontent.com/DindaPutriFN/FN-API/main/bot.zip"

# [ Membersihkan layar ]
clear

# [ File lokasi API Key dan Chat ID ]
api_file="/etc/funny/.keybot"
id_file="/etc/funny/.chatid"

# [ Memeriksa apakah file API Key dan Chat ID ada ]
if [[ -f "$api_file" && -f "$id_file" ]]; then
    api=$(cat "$api_file")
    itd=$(cat "$id_file")
else
    echo -e "
===================
[ 设置机器人通知 ]
===================
"
    read -p "API Key Bot: " api
    read -p "Your Chat ID: " itd
    
    # [ Menyimpan API Key dan Chat ID ke file ]
    echo "$api" > "$api_file"
    echo "$itd" > "$id_file"
fi

clear

# [ Menginstall Bot ]
cd /usr/bin
wget -O bot.zip "${link}"
yes A | unzip bot.zip
rm -fr bot.zip
cd /usr/bin/bot
npm install

# [ Membuat Konfigurasi API Bot ]
cat > /usr/bin/bot/config.json << EOF
{
    "authToken": "$api",
    "owner": $itd
}
EOF

# [ Menginstall Service ]
cat > /etc/systemd/system/bot.service << END
[Unit]
Description=Service for bot terminal
After=network.target

[Service]
ExecStart=/usr/bin/node /usr/bin/bot/server.js
WorkingDirectory=/usr/bin/bot
Restart=always
User=root

[Install]
WantedBy=multi-user.target
END

# [ Menjalankan Service ]
systemctl daemon-reload
systemctl enable bot
systemctl start bot
systemctl restart bot

# [ Membersihkan Layar ]
clear

# [ Menampilkan Output ]
echo -e "
Success Install Bot Terminal
============================

Your Database
Chat ID : $itd
Api Bot : $api

Just Check Your Bot Terminal
============================
"
}

hapus() {
systemctl stop bot
systemctl disable bot
rm -fr /etc/systemd/system/bot.service
rm -fr /usr/bin/bot
clear
echo "
Success Deleted Bot Terminal"
}

restart() {
systemctl daemon-reload
systemctl restart bot
clear
echo "
Success Reboot Bot Terminal"
}

menubot() {
clear
edussh_service=$(systemctl status bot | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $edussh_service == "running" ]]; then
ws="\e[1;32m[ ON ]\033[0m"
else
ws="\e[1;31m[ OFF ]\033[0m"
fi
clear
echo -e "
<= Menu Bot Terminal =>
=======================
Bot: $ws

1. Install Bot Terminal
2. Uninstall Bot Terminal
3. Restart Service Bot Terminal
0. Back To Default Menu Panel
=======================
Press CTRL + C to Exit
"
read -p "Input Option: " opw
case $opw in
1) clear ; install ;;
2) clear ; hapus ;;
3) restart ;;
0) menu ;;
*) menubot ;;
esac
}

menubot
