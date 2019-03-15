#!/bin/bash

i3status | while :
do
  read line

  monitor_connected=`xrandr -q | grep 'HDMI1 connected'`

  if [ -f '/tmp/monitor_mode.dat' ]; then
    monitor_mode=`cat /tmp/monitor_mode.dat`
  else
    if [ "x$monitor_connected" != "x" ]; then
      monitor_mode="EXTENDED"
    else
      monitor_mode='INTERNAL'
    fi
  fi

  if [ $monitor_mode = "EXTENDED" ]; then
    monitor_out="🖵 "
  elif [ $monitor_mode = "CLONES" ]; then
    monitor_out="🗗 "
  elif [ $monitor_mode = "INTERNAL" ]; then
    monitor_out="🔲"
  elif [ $monitor_mode = "EXTERNAL" ]; then
    monitor_out="🔳"
  fi

  sedline="s/volume/display\", \"full_text\":\"$monitor_out\"},{\"name\":\"volume/"
  line=`echo $line | sed -e "$sedline" | sed -e "s/% \"/%\"/"`

  zodiac_sign=`zodiac_today.sh`
  sedline="s/🇹🇼/🇹🇼 $zodiac_sign/"
  line=`echo $line | sed -e "$sedline" | sed -e "s/% \"/%\"/"`

  echo $line || exit 1

done
