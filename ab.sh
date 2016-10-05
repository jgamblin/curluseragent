#!/bin/bash
target="http://jgamblin.com/"
clear
echo
echo -e "Testing WAF/BruteForce/Crawling Detection"
echo 
while true
do 
UserAgent=`gshuf -n 1 ua.txt`
	STARTTIME=$(date +%s)
	for run in {1}
	do 
	ab -n 1000 -c 50 -H "User-Agent: %$UserAgent" -q $target > results.txt
	clear
	echo
	echo 'Complete requests:'
	cat results.txt | grep 'Complete requests' | awk '{print $3}'
	echo 'Failed requests:'
	cat results.txt | grep 'Failed requests' | awk '{print $3}'
	echo 'Requests per second:'
	cat results.txt | grep 'Requests per second' | awk '{print $4}'
	done
	ENDTIME=$(date +%s)
	echo -e "Time:"
	echo -e "$(($ENDTIME - $STARTTIME)) seconds"
	echo -e "User Agent:"
	echo -e "$UserAgent"
	echo	
sleep 2

done
