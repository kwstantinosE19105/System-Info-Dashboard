#!/bin/bash

GREEN="\e[32m"
BLUE="\e[34m"
YELLOW="\e[33m"
CYAN="\e[36m"     
RESET="\e[0m"    


echo -e "${CYAN}==============================="
echo -e "     SYSTEM INFO DASHBOARD      "
echo -e "===============================${RESET}"

echo -e "${GREEN}Hostname:${RESET} $(hostname)"
echo -e "${GREEN}Kernel Version:${RESET} $(uname -r)"

echo -e "${GREEN}Uptime:${RESET} $(uptime -p)"

echo -e "${BLUE}CPU:${RESET} $(lscpu | grep 'Model name:' | awk -F ':' '{print $2}' | sed 's/^ //')"
echo -e "${BLUE}CPU Cores:${RESET} $(nproc)"

TOTAL_RAM=$(free -h | awk '/^Mem:/ {print $2}')
USED_RAM=$(free -h | awk '/^Mem:/ {print $3}')
echo -e "${YELLOW}RAM Usage:${RESET} $USED_RAM / $TOTAL_RAM"

echo -e "${YELLOW}Disk Usage:${RESET}"
df -h --total | grep 'total' | awk '{print "Used: "$3", Available: "$4", Total: "$2}'

echo -e "${CYAN}IP Address(es):${RESET} $(hostname -I | awk '{print $1}')"

echo -e "${CYAN}===============================${RESET}"
