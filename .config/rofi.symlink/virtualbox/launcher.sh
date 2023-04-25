vboxmanage startvm $( vboxmanage list --sorted vms | rofi -dmenu -p 'Select vm to launch' | awk -F ' ' '{print $NF}' )
