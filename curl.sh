#!/bin/bash
target="http://jgamblin.com"

echo
echo -e "Curling $target to test WAF detection"
echo 

while true
do 
UserAgent=`gshuf -n 1 ua.txt`
	STARTTIME=$(date +%s)
	for run in {1..10}
	do 
	curl --compressed -A "$UserAgent" -sL -w "%{http_code} %{url_effective}\\n" $target -o /dev/null
	done
	ENDTIME=$(date +%s)
	echo 
	echo -e "It took $(($ENDTIME - $STARTTIME)) seconds to complete 10 curls using:"
	echo -e "$UserAgent"
	echo
done
