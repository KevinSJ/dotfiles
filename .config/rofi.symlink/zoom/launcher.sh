#xdg-open $( cat ~/.zoom_meetings.conf | rofi -dmenu -p 'Select Zoom meeting' | awk '{print $2}' - ) & disown
xdg-open $( cat ~/.zoom_meetings.conf | rofi -dmenu -p 'Select Zoom meeting' | cut --fields=2 --delimiter=" ") & disown
