#!/bin/sh
. $PWD/weath.conf

while (true)
do
	if [ -f $PAGEFILE ]; then rm $PAGEFILE; fi
	wget -t 1 -O $PAGEFILE -o wget.log http://www.pogoda.tut.by
	grep -m 1 '<span class="temp-i">' $PAGEFILE > temp
	echo "Temperature: " $(sed 's/[^\-\+0-9]//g' temp) "C"
	rm temp
	sleep $DELAY
done
