#!/bin/bash

##############################################
#                                            #
# "Chatty" dd script, by Ed Locard (@L0C4RD) #
#                                            #
##############################################

#acquire number of seconds to refresh. (Can be a float)
REFRESH_PERIOD=$1
shift

#initial pause
#(means that if sleep's gonna error, it'll do it BEFORE your dd operation)
sleep $REFRESH_PERIOD

#Get your OS (different oses have different implementations of dd)
if [[ "$OSTYPE" == "linux-gnu" ]]; then		#Linux
	WAKEY_WAKEY_SIG="SIGUSR1"
elif [[ "$OSTYPE" == "darwin"* ]]; then		#Mac OS
	WAKEY_WAKEY_SIG="SIGINFO"
elif [[ "$OSTYPE" == "cygwin" ]]; then		#Cygwin - I haven't tested this, but it sure as fuck isn't SIGINFO.
	WAKEY_WAKEY_SIG="SIGUSR1"
elif [[ "$OSTYPE" == "freebsd"* ]]; then	#BSD
	WAKEY_WAKEY_SIG="SIGINFO"
else
	echo "I don't know anything about $OSTYPE operating systems, soz."
	exit 1
fi

#Commence dd operation
dd "$@" &

#Acquire pid
DD_PID=$!

#initial pause
sleep $REFRESH_PERIOD

#keep checking the status of your copy operation
ps -p $DD_PID > /dev/null
while [ $? -ne 1 ]
do
	#Make the copy operation print its status to stderr.
	kill -s $WAKEY_WAKEY_SIG $DD_PID

	sleep $REFRESH_PERIOD

	ps -p $DD_PID > /dev/null

done

