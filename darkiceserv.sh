#!/bin/bash
cd /usr/local/etc/darkice
name=darkiceca
#. params.sh

start () {
    screen -wipe
    if [ "$(screen -ls | grep `cat pid`.$name)" ]; then
        echo "darkice is already running"
        exit
    fi
    echo 1 > runlock
    screen -mdS $name bash startserver.sh
    echo "darkice instance started"
}

stop () {
    if [ -z "$(screen -ls | grep `cat pid`.$name)" ]; then
        echo "darkice is already stopped"
        exit
    fi
    echo "gracefully exiting..."
    echo 0 > runlock
    #send redundant just in case something is in the buffer already
    screen -S `cat pid`.$name -p 0 -X stuff "exit$(printf \\r)exit$(printf \\r)"
    sleep 2
    echo "guaranteed exit"
    if [ -z "$(kill -9 `cat pid`)" ]; then
        echo "just kidding, darkice stopped all by itself"
    else
        echo "darkice is very stopped"
    fi
}

status () {
    if [ "$(screen -ls | grep `cat pid`.$name)" ]; then
        echo "darkice instance is running"
    else
        echo "darkice instance is not running"
    fi
}

sendcmd () {
    echo idk...
}

case $1 in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        stop
        sleep 3
        start
        ;;
    status)
        status
        ;;
    *)
        echo "usage: {start|stop|restart|status}"
        ;;
esac
