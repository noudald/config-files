#!/bin/bash
#
# Move the current window to the next monitor.
#
# Taken from jbrock
# https://unix.stackexchange.com/questions/48456/xfce-send-window-to-other-monitor-on-keystroke
#
# Also works only on one X screen (which is the most common case).
#
# Props to
# http://icyrock.com/blog/2012/05/xubuntu-moving-windows-between-monitors/
#
# Unfortunately, both "xdotool getwindowgeometry --shell $window_id" and
# checking "-geometry" of "xwininfo -id $window_id" are not sufficient, as
# the first command does not respect panel/decoration offsets and the second
# will sometimes give a "-0-0" geometry. This is why we resort to "xwininfo".

screen_width=$(xdpyinfo | awk -F" |x" '/dimensions:/ { print $7 }')
screen_height=$(xdpyinfo | awk -F" |x" '/dimensions:/ { print $8 }')
window_id=$(xdotool getactivewindow)

case $1 in
    -l )
        display_width=$((screen_width / 3 * 2))
        ;;
    -r )
        display_width=$((screen_width / 3))
        ;;
    -a )
        display_width=$((screen_width / 2))
        ;;
esac

# Remember if it was maximized.
window_state=$(xprop -id $window_id _NET_WM_STATE | awk '{ print $3 }')

# Un-maximize current window so that we can move it
wmctrl -ir $window_id -b remove,maximized_vert,maximized_horz

# Read window position
x=$(xwininfo -id $window_id | awk '/Absolute upper-left X:/ { print $4 }')
y=$(xwininfo -id $window_id | awk '/Absolute upper-left Y:/ { print $4 }')

# Subtract any offsets caused by window decorations and panels
x_offset=$(xwininfo -id $window_id | awk '/Relative upper-left X:/ { print $4 }')
y_offset=$(xwininfo -id $window_id | awk '/Relative upper-left Y:/ { print $4 }')
x=$((x - x_offset))
y=$((y - y_offset))

# Fix Chromium app view issue of small un-maximized size
width=$(xdotool getwindowgeometry $window_id | awk -F" |x" '/Geometry:/ { print $4 }')
if [ "$width" -lt "150" ]; then
  display_width=$((display_width + 150))
fi

# Compute new X position
new_x=$((x + display_width))
# Compute new Y position
new_y=$((y + screen_height))

# If we would move off the right-most monitor, we set it to the left one.
# We also respect the window's width here: moving a window off more than half its width won't happen.
if [ $((new_x + width / 2)) -gt $screen_width ]; then
  new_x=$((new_x - screen_width))
fi

height=$(xdotool getwindowgeometry $window_id | awk -F" |x" '/Geometry:/ { print $5 }')
if [ $((new_y + height / 2)) -gt $screen_height ]; then
  new_y=$((new_y - screen_height))
fi

# Don't move off the left side.
if [ $new_x -lt 0 ]; then
  new_x=0
fi

# Don't move off the bottom
if [ $new_y -lt 0 ]; then
  new_y=0
fi

# Move the window
xdotool windowmove $window_id $new_x $new_y

# Maintain if window was maximized or not
if [[ "${window_state}" == _NET_WM_STATE_MAXIMIZED* ]]; then
    wmctrl -ir $window_id -b add,maximized_vert,maximized_horz
fi
