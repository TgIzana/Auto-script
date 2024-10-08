#!/bin/bash
#
#  |══════════════════════════════=══════════════════════════════════════════════════|
#  • Autoscript AIO Lite Menu By Izana                                        |
#  • IZANA AUTO-SCRIPT
#  |═════════════════════════════════════════════════════════════════════════════════|
#

clear

openeuler() {
clear
echo -e "
======================
<= OpenEuler Linux =>
======================

1. OpenEuler 20.03
2. OpenEuler 22.03
3. OpenEuler 24.03
======================
"
read -p "Input Option: " opn
case $opn in
1) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh openeuler 20.03 && reboot  ;;
2) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh openeuler 22.03 && reboot  ;;
3) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh openeuler 24.04 && reboot  ;;
*) openeuler
esac
}

opensuse() {
clear
echo -e "
====================
<= OpenSuse Linux =>
====================

1. OpenSuse 15.5
2. OpenSuse 16.6
3. OpenSuse tumbleweed
====================
"
read -p "Input Option: " osu
case $osu in
1) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh opensuse 15.5 && reboot  ;;
2) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh opensuse 15.6 && reboot  ;;
3) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh opensuse tumbleweed && reboot  ;;
*) opensuse ;;
esac
}

debian() {
clear
echo -e "
==================
<= Debian Linux =>
==================

1. Debian 9
2. Debian 10
3. Debian 11
4. Debian 12
==================
"
read -p "Input Option: " db
case $db in
1) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh debian 9 && reboot  ;;
2) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh debian 10 && reboot  ;;
3) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh debian 11 && reboot  ;;
4) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh debian 12 && reboot  ;;
*) debian ;;
esac
}

ubuntu() {
clear
echo -e "
==================
<= Ubuntu Linux =>
==================

1. Ubuntu 16.04
2. Ubuntu 18.04
3. Ubuntu 20.04
4. Ubuntu 22.04
5. Ubuntu 24.04
==================
"
read -p "Input Option: " wq
case $wq in
1) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh ubuntu 16.04 && reboot ;;
2) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh ubuntu 18.04 && reboot ;;
3) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh ubuntu 20.04 && reboot ;;
4) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh ubuntu 22.04 && reboot ;;
5) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh ubuntu 24.04 && reboot ;;
*) ubuntu ;;
esac
}

alpine() {
clear
echo -e "
==================
<= Alpine Linux =>
==================

1. Alpine 3.17
2. Alpine 3.18
3. Alpine 3.19
4. Alpine 3.20
==================
"
read -p "Input Option: " ap
case $ap in
1) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh alpine 3.17 && reboot ;;
2) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh alpine 3.18 && reboot ;;
3) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh alpine 3.19 && reboot ;;
4) cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh alpine 3.20 && reboot ;;
*) clear ; alpine ;;
esac
}

rocky() {
echo -e "
=================
<= Rocky Linux =>
=================

1. Rocky Linux 8
2. Rocky Linux 9
=================
"
read -p "Input Options: " opw
case $opw in
1) clear : cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh rocky 8 && reboot ;;
2) clear ; cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh rocky 9 && reboot ;;
*) rocky ;;
esac
}

information() {
uuid="123@@@"
clear
echo -e "
[ New Data Your VPS ]
=====================
Username: root
Password: $uuid
=====================
Please Save Your Data
"
read -p "Continue (y/n): " osw
if [[ $osw == "y" ]]; then
os
elif [[ $ip_version == "n" ]]; then
exit
fi
}

os() {
    clear
    echo -e "
< = [ Select New OS ] = >
=========================

01. Rocky
02. Alpine
03. Anolis
04. Debian
05. Ubuntu
06. RedHat
07. CentOS
08. AlmaLinux
09. OpenEuler
10. OpenSUSE
11. Arch Linux
12. NixOS Linux
13. Oracle Linux
14. Fedora Linux
15. Gentoo Linux
16. Open Cloud OS
17. Kali Linux / Kali Rolling

=========================
Press CTRL + C to Exit
"
    read -p "Input Options: " os
    case $os in
        01|1) clear ; rocky ;;
        02|2) clear ; alpine ;;
        03|3) clear ; cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh anolis 8 && reboot ;;
        04|4) clear ; debian ;;
        05|5) clear ; ubuntu ;;
        06|6) clear ; echo -e "Coming Soon" ;; #redhat;;
        07|7) clear ; cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh centos 9 && reboot ;;
        08|8) clear ; cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh alma 9 && reboot ;;
        09|9) clear ; openeuler ;;
        10) clear ; opensuse ;;
        11) clear ; cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh arch && reboot  ;;
        12) clear ; cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh nixos 24.05 && reboot ;;
        13) clear ; cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh oracle 8 && reboot ;;
        14) clear ; cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh fedora 40 && reboot ;;
        15) clear ; cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh gento && reboot  ;;
        16) clear ; cd /root ;curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh opencloudos 8 && reboot ;;
        17) clear ; cd /root ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh kali && reboot  ;;
        *) clear ; echo "Invalid option. Please select a valid number.";;
    esac
}

tampilan() {
clear
echo -e "
==========================
< = [ Menu Uninstall ] = >
==========================

1. Uninstall Script
2. Back To Default Menu
==========================
[ Press CTRL + C To Exit ]
==========================
  Autoscript FN Project
"
read -p "Input Option: " ws
case $ws in
1) clear ; information ;; #os ;;
2) menu ;;
*) tampilan ;;
esac
}

tampilan
