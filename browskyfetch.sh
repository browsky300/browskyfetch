#!/bin/bash

source /etc/os-release

# colours
colour1="\e[1;32m"
colour2="\e[0;32m"
colour3="\e[1;31m"

# url (this is bad)
finurl=$HOME_URL
finurl=${finurl/https:\/\//}
finurl=${finurl/http:\/\//}
finurl=${finurl##www.}
finurl=${finurl%%\/}

desktop="$XDG_CURRENT_DESKTOP"
if [ "$desktop" == "" ]; then
	desktop="none"
fi

echo -e "${colour3}Welcome to $finurl, $(whoami)!\n"
echo -e "${colour1}kernel   ${colour2}$(uname -sr)"
echo -e "${colour1}arch     ${colour2}$(uname -m)"
echo -e "${colour1}shell    ${colour2}$(basename $SHELL)"
echo -e "${colour1}desktop  ${colour2}$desktop"
echo -e "${colour1}uptime  ${colour2}$(uptime -p | awk '{$1="";print $0}')"
echo -e "${colour1}host     ${colour2}$(cat /sys/class/dmi/id/product_name) $(cat /sys/class/dmi/id/product_version)\e[0m"
