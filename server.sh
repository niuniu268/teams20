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


welcome() {
    echo "Welcome to Teams 2.0 - Trademarked worst in the world"
    echo "Logged in as $username"
}

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


if [ $(ncinstance) -lt 1 ]
then
    echo "Starting Teams 2.0 - Worst Chat in history - again"
    netcat -p 9999 -l
else
    echo $(ncinstance) "instances of nc running. Please close your open connections."; exit
fi

####chat directories and usernames


#preferably we will change this to a WWW dir in the future, for php/html support
#smart thing to do here would probably to move this to a seperate file, every new file creates a new html page or something like that.

#i think we should have rooms in the server part, or maybe in a rooms.sh, and usernames should be in a seperate one too. maybe.

#folderstructure
home=/tmp/teams20
rooms=/tmp/teams20/rooms
users=/tmp/teams20/users





