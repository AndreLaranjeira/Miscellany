#!/bin/bash
# Description: Script to run update commands easily.
# IMPORTANT: The default commands presented are configured for Manjaro Linux.
# If you are on other variants of Linux, you might need to change them!

case "$1" in
	all)
		$0 mirrors
		$0 system
		# $0 [NEW COMMAND NAME]
		;;
	mirrors)
		echo $'\n>> Updating system mirrors...'
		sudo pacman-mirrors -f 0
		;;
	system)
		echo $'\n>> Updating system packages...'
		pamac update
		;;
	# [NEW COMMAND NAME])
	# echo $'\n>> Updating something...'
	# [INSERT NEW UPDATE COMMAND HERE]
	# ;;
	*)
		echo -n $'\n>> Error: invalid argument. '
		echo "Usage: $(basename -- $0) {all|mirrors|system}"	# Update accordingly.
		exit 1
esac

exit 0
