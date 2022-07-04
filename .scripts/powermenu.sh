#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Lock\nLog out" | rofi -dmenu)

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Lock") betterlockscreen -l ;;
	"Log out") bspc quit ;;
	*) exit 1 ;;
esac
