#!/bin/bash

test=google.com
while true
	do
if nc -zw1 $test 443 && echo |openssl s_client -connect $test:443 2>&1 |awk '
	handshake && $1 == "verification" { if ($2=="OK") exit; exit 1 }
	$1 $2 == "SSLhandshake"  { handshake = 1 }'
then
	say "internet is up, time to game"
	#This is MacOs specific, notifying via speech. This can be changed to anything.
else
	echo "Internet connection still down.. Sadge"
fi
done
