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

home=/tmp/teams20
rooms=/tmp/teams20/rooms
users=/tmp/teams20/users
