ACTIVE_MACHINES="$(virsh --connect=qemu:///system list --state-running --name)"
NON_ACTIVE_MACHINES="$(virsh --connect=qemu:///system list --state-shutoff --name)"
ALL_MACHINES="$(virsh --connect qemu:///system list --all|sed '/^[[:space:]]*$/d')"

selected="$(echo "$ALL_MACHINES"|sed 1,2d| rofi -dmenu -p 'Available VMs' | awk -F ' ' '{print $2}')"

#if echo "$NON_ACTIVE_MACHINES" | grep -Fxq "$selected"; then
  #virsh --connect=qemu:///system start "$selected"
  #dunstify "$selected is starting"
#elif echo "$ACTIVE_MACHINES" | grep -Fxq "$selected"; then
  #virsh --connect=qemu:///system shutdown "$selected"
  #dunstify "$selected is shutting down"
#fi

if [[ -z $selected ]]; then
  exit 0
fi


if [[ $NON_ACTIVE_MACHINES = *"$selected"* ]]; then
  virsh --connect=qemu:///system start "$selected"
  dunstify "$selected is starting"
elif [[ $ACTIVE_MACHINES = *"$selected"* ]]; then
  virsh --connect=qemu:///system shutdown "$selected"
  dunstify "$selected is shutting down"
fi
#virsh --connect qemu:///system start \
  #"$(virsh --connect qemu:///system list --all|sed 1,2d| rofi -dmenu -p 'Select vm to action' | awk -F ' ' '{print $2}')"
#virsh --connect qemu:///system start $(virsh --connect qemu:///system list --all|sed 1,2d| rofi -dmenu -p 'Select vm to launch' | awk -F ' ' '{print $2}')
