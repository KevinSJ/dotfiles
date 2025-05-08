ACTIVE_MACHINES="$(virsh --connect=qemu:///system list --state-running --name)"
NON_ACTIVE_MACHINES="$(virsh --connect=qemu:///system list --state-shutoff --name)"

selected="$(virsh --connect qemu:///system list --all|sed 1,2d| rofi -dmenu -p 'Select vm to action' | awk -F ' ' '{print $2}')"

if echo "$NON_ACTIVE_MACHINES" | grep -Fxq "$selected"; then
  virsh --connect=qemu:///system start "$selected"
  dunstify "$selected is starting"
elif echo "$ACTIVE_MACHINES" | grep -Fxq "$selected"; then
  virsh --connect=qemu:///system shutdown "$selected"
  dunstify "$selected is shutting down"
fi
