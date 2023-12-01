#!/bin/bash

# color
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[1;34m'
RESET='\033[0m' # replace color


# Version and Info
version="1.0.0"
author="TazmiDev"
whoami="https://github.com/TazmiDev/DevEnv"
host=$(hostname -I | awk '{print $1}')

# Show Wordart
wordart(){
	figlet DevEnv
}
show_help() {
	wordart
    	echo "Usage method:"
    	echo ""
    	echo "Options："
    	echo -e "${GREEN}   -h     --help          ${RESET}Show help information"
	echo -e "${GREEN}   -v     --version       ${RESET} Display version number"
}
show_version() {
       	echo -e "Version：${GREEN}${version}${RESET}"
       	echo -e "Host   ：${GREEN}${host}${RESET}"
}

# Command line parameter
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -h|--help)
            show_help
            exit 0
            ;;
        -v|--version)
            show_version
            exit 0
            ;;
        *)
            echo "Invalid parameter：$key"
            show_help
            exit 1
            ;;
    esac
    shift
done


# Start Text
start(){
    echo -e "Version: ${BLUE}$version${RESET}               Author : ${BLUE}$author${RESET}"  
    echo -e "Host   : ${BLUE}$host${RESET}        Whoami : ${BLUE}$whoami${RESET}"
    echo ""
    command_list
    echo ""
}

# Command List
command_list(){
	echo -e "${BLUE}========================================${RESET}"
	echo -e "${BLUE}|| [000]  Node.js 		      ||${RESET}"		
	echo -e "${BLUE}|| [001]  Python3		      ||${RESET}"
	echo -e "${BLUE}|| [002]  C		       	      ||${RESET}"			
	echo -e "${BLUE}|| [003]  Ruby                        ||${RESET}"
	echo -e "${BLUE}|| [004]  Java			      ||${RESET}"	
	echo -e "${BLUE}========================================${RESET}"
}

loading(){
	wordart
	chars="/-\|"
	text="Loading"
	start_time=$(date +%s)
       	while true; do
       		current_time=$(date +"%T")
       		current_date=$(date +"%Y-%m-%d")
       		for (( i=0; i<${#chars}; i++ )); do
           		echo -en "\r$text @ $current_date /$current_time/ ... ${chars:$i:1}"
           		sleep 0.1
    	   		current_time=$(date +"%T")
           		elapsed_time=$(( $(date +%s) - start_time ))
           	if [[ $elapsed_time -ge 2 ]]; then
               		break 2
           	fi
       		done
   	done
   	echo ""
	echo ""
   	start
}
loading

read -p "Enter the code to install(exit or CTRL+C):  " choice
# Node.js
if [ "$choice" == "0" ] || [ "$choice" == "000" ]; then
	if command -v node >/dev/null 2>&1; then
    		node_version=$(node -v)
    		if [ $? -eq 0 ]; then
      			sudo npm install -g n
      			sudo n latest
      			echo -e "Node.js updated to the latest version ${GREEN}$(node -v)${RESET}"
    		fi
    	else
    		sudo apt install nodejs npm -y
    		echo -e "Node.js is installed,version ${GREEN}$(node -v)${RESET}"
    	fi
# Python3
elif [ "$choice" == "1" ] || [ "$choice" == "001" ]; then
	if command -v python3 >/dev/null 2>&1; then
		python_version=$(python3 -V 2>&1)
		if [ $? -eq 0 ]; then
			sudo apt upgrade -y python3
			echo -e "Python3 is installed,version ${GREEN}$python_version${RESET}"
		fi
	else
		sudo apt-get install -y python3
		echo -e "Python3 is installed,version ${GREEN}$(python3 -V 2>&1)${RESET}"
	fi
# C
elif [ "$choice" == "2" ] || [ "$choice" == "002" ]; then
	if command -v gcc >/dev/null 2>&1; then
		gcc_version=$(gcc --version 2>&1)
		if [ $? -eq 0 ]; then
    			apt-get upgrade -y build-essential
			echo -e "C is installed,version ${GREEN}$gcc_version${RESET}"
		fi
	else
		sudo apt-get install -y build-essential
		echo -e "C is installed,version ${GREEN}$(gcc --version 2>&1)${RESET}"
	fi
# Ruby
elif [ "$choice" == "3" ] || [ "$choice" == "003" ]; then
	if command -v ruby >/dev/null 2>&1; then
		ruby_version=$(ruby -v 2>&1)
		if [ $? -eq 0 ]; then
    			apt-get upgrade -y ruby-full
			echo -e "Ruby is installed,version ${GREEN}$ruby_version${RESET}"
		fi
	else
		sudo apt-get install -y ruby-full
		echo -e "Ruby is installed,version ${GREEN}$(ruby --v 2>&1)${RESET}"
	fi
# Java
elif [ "$choice" == "4" ] || [ "$choice" == "004" ]; then
    if command -v java >/dev/null 2>&1; then
        java_version=$(java -version 2>&1)
        if [ $? -eq 0 ]; then
            latest_version=$(curl -s https://adoptopenjdk.net/releases.html | grep -oP '(?<=Latest Release<\/td><td>)(.*)(?=<\/td>)')
            if [ "$java_version" != "$latest_version" ]; then
		sudo apt install -y default-jdk default-jre
		echo -e "Java is installed, version ${GREEN}$latest_version${RESET}"
            fi
        else
	    sudo apt-get install -y default-jdk default-jre
            echo -e "Java is installed, version ${GREEN}$(java -version 2>&1)${RESET}"
        fi
    fi
elif [ "$choice" == "exit" ]; then
    exit 0
fi
