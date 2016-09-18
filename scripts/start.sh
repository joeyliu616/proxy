#!/bin/sh

check_network()
{
#只要3次请求中有一次能访问成功, 就认为网络正常
    for i in seq 1 3
    do
        curl --connect-timeout 2 --proxy http://127.0.0.1:8118 https://www.google.com
        if [ $? -eq 0 ]
        then
            return 0; 
        fi
    done
    return 1;
}

gosu privoxy privoxy /etc/privoxy/config
while [ "1"="1" ]
do
    check_network;
    if [ $? -eq 0 ]
    then
        echo "proxy networking is working"
        sleep 5;
    else
        echo "proxy networking is down, restarting"
        killall -INT plink;
        sh socket5.sh &
        sleep 5;
    fi
done
