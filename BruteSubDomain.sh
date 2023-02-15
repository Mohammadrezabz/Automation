#!/usr/bin/bash

domain=$1
wordlist=$2
codes=(200 301 302 403)
while read words
do
	status=curl -L -I -X "GET" -H "User-Agent: Mozilla/5.0 (Windows NT
    10.0;Win64; x64;rv:104.0) Gecko/20100101 Firefox/104.0" $words.$domain &> /dev/null | head -n 1 | cut -d$' ' -f2
    for code in $codes;
    do
        if [[ $status -eq $code ]]

        then
            echo $words.$domain
            break
        else
            continue
        fi
    done
done < $wordlist
