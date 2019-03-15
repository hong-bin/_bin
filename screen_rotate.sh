#!/bin/bash
EXTERNAL_OUTPUT="HDMI1"
INTERNAL_OUTPUT="eDP1"

# if we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
    monitor_mode="INTERNAL"
# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

# internal -> extended -> clone -> external -> internal

if [ $monitor_mode = "EXTENDED" ]; then
        monitor_mode="CLONES"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT
elif [ $monitor_mode = "EXTERNAL" ]; then
        monitor_mode="INTERNAL"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
elif [ $monitor_mode = "INTERNAL" ]; then
        monitor_mode="EXTENDED"
        xrandr --output $INTERNAL_OUTPUT --primary --auto --output $EXTERNAL_OUTPUT --auto --right-of $INTERNAL_OUTPUT
else
        monitor_mode="EXTERNAL"
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto
fi

echo "${monitor_mode}" > /tmp/monitor_mode.dat

