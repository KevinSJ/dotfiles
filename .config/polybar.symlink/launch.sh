#!/usr/bin/env bash

killall -q polybar

export BAT=$(ls -A1 /sys/class/power_supply|grep -E 'BAT')
export AC=$(ls -A1 /sys/class/power_supply|grep -v 'BAT')
export ETH_INTERFACE=$(ip -4 -o link show | awk -F': ' '{print $2}'|grep en)
export WLAN_INTERFACE=$(ip -4 -o link show | awk -F': ' '{print $2}'|grep wl)

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload top &
  done
else
  polybar --reload top &
fi


echo "Bar launched..."
