#!/bin/bash

case $1 in
        start)
                nohup ./gardens 2>&1 >> info.log 2>&1 /dev/null &
                echo "service start..."
                sleep 1
                echo "start is ok."
        ;;
        stop)
                killall gardens
                echo "service stop..."
                sleep 1
                echo "stop!!!"
        ;;
        restart)
                killall gardens
                sleep 1
                nohup ./gardens 2>&1 >> info.log 2>&1 /dev/null &
                echo "service restart..."
                sleep 1
        ;;
        *)
                echo "$0 {start|stop|restart}"
                exit 4
        ;;
esac