if [[ -e ~/.local/bin/startde && -z $DISPLAY && $(tty) == /dev/tty1 ]]; then
   # if you want to auto start a DE, you can enable it here.
   ~/.local/bin/startde x
fi
