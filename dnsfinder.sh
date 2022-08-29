#!/usr/bin/bash
# dig and nslookup dns fetcher
com=$1
domain=$2
#recordtype="${3:-$A}"

echo $recordtype

if [[ $com == "" ]] || [[ $domain == "" ]] || [[ $com == "-h" ]];
then
    echo " dig , nslookup and host dns fetcher
    Usage ./dnsfinder COMMAND DOMAIN < RESOLVERS.TXT
"
    exit 0
fi

if [[ $com == "dig" ]];
then
    echo "Running Dig On Target"
    while read x ;
    do
        $com @$x $domain +short
    done
elif [[ $com == "nslookup" ]];
then
    echo "Running Nslookup On Target"
    while read x ;
    do
        $com $domain $x | sed '/\n/!s/[0-9.]\+/\n&\n/;/^\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\n/P;D'
    done
elif [[ $com == "host" ]];
then
    echo "Running Host On Target"
        $com $domain | sed '/\n/!s/[0-9.]\+/\n&\n/;/^\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\n/P;D'
fi
