#!/bin/bash

# Definisikan warna
TEAL='\033[38;5;30m'
ORANGE='\033[38;5;208m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Mengambil waktu dari server dengan curl
dateFromServer=$(curl --silent https://google.com/ | grep -i "date" | sed -e 's/.*Date: //I' | head -n 1)
serverDate=$(date -d "$dateFromServer" +"%Y-%m-%d")

# Fungsi untuk menampilkan pesan berwarna
red() { echo -e "\\033[32;1m${*}\\033[0m"; }

# Fungsi untuk menampilkan progress bar
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
    ) &

    tput civis  # Hide cursor
    echo -n "Loading..."
    while true; do
        echo -n "."
        sleep 1s
        if ! pgrep -x "wget" > /dev/null; then
            break
        fi
    done
    tput cnorm  # Show cursor again
    echo -e " - ${NC}${ORANGE}SUCCEED !${NC}"
}

# Fungsi untuk mengunduh dan mengekstrak file
downloadAndExtractMenu() {
    wget -q https://raw.githubusercontent.com/Panwas89/vpnscrpt/main/SKT-Command/kocak.zip || { echo "Gagal mengunduh file"; exit 1; }
    7z x -p kocak.zip || { echo "Gagal mengekstrak file"; exit 1; }
    chmod +x menu/*
    mv menu/* /usr/local/sbin
    rm -rf menu
    rm -f menu.zip
}

# Menjalankan skrip
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m             UPDATE SCRIPT               \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "\033[1;91m Selected Update Script\033[1;37m"
fun_bar 'downloadAndExtractMenu'
echo -e ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -e " ${TEAL}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " ${PURPLE}          Terimakasih Telah Menggunakan- ${NC}"
echo -e " ${PURPLE}     Script Credit By ROSI Store Project ${NC}"
echo -e " ${TEAL}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
read -n 1 -s -r -p "      Press any key to back on menu"
menu
