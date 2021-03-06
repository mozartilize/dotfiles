#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
MONITOR=LVDS-1 polybar example &
MONITOR=HDMI-1 polybar example &
MONITOR=VGA-1 polybar example &


echo "Bars launched..."
