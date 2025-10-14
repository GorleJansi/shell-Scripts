#!/bin/bash
case $1 in
  start)
    echo "Starting service..."
    systemctl start myapp
    ;;
  stop)
    echo "Stopping service..."
    systemctl stop myapp
    ;;
  restart)
    echo "Restarting service..."
    systemctl restart myapp
    ;;
  status)
    systemctl status myapp
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|status}"
    exit 1
    ;;
esac
