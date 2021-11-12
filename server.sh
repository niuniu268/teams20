#/bin/bash
#
######################################
# server.sh
# Author: Mattias Skarec             #
# 2021                               #
#                                    #
#                                    #
# The serverpart of the chat client  #
#                                    #
######################################

###Welcomes & inputs first, or source for rooms & users. something like that


#variables


welcome() {
    echo "Welcome to Teams 2.0 - Trademarked worst in the world"
    echo "Logged in as $username"
}

read -p "enter port:" port
read -p "Username:" username

welcome

#lets see if netcat is installed
if ! command -v netcat &> /dev/null
    then
        echo "Netcat not installed"
        exit
    else
        echo "Netcat installed. You are all good."
    fi

#lets see how many netcat instances are running, if less than 1, go ahead

ncinstance() {
    ps -ef | grep -v grep | grep -c netcat
}

server() {

    netcat -p $port -l 
}

server






