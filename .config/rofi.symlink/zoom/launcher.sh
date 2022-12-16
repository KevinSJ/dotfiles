xdg-open $( cat ~/.zoom_meetings.conf | rofi -dmenu -p 'Select Zoom meeting' | cut --fields=2 --delimiter=" ") & disown
