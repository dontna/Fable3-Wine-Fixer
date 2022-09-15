#!/usr/bin/bash

SET_READ_ONLY=1

if [[ $1 == "--help" || $1 == "-h" ]]; then
	echo "Script usage: $0 \"[PATH_TO_PREFIX]\" [WIDTH] [HEIGHT] <optional_flags>"
	echo "Please refer to the 'help.txt' document, if you need more information or a pracitcal example."
	echo ""
	echo "Optional Flags"
	echo "-r, --noreadonly		Makes it so the script won't make the edited file read-only."
	exit 0
fi

# Argument Checks

if [[ -z "$1" || -z "$2" || -z "$3" ]]; then
	echo "Not enough arguments passed."
	echo "Use '-h' for help"
	exit 0
fi

if ! [[ $(ls "$1" -1 | grep drive_c) ]]; then
	echo "Cannot find \"drive_c\" in \"$1\""
	echo "Are you sure this is your prefix?"
	exit 0
fi

if [[ "$4" == "-n" || "$4" == "--noreadonly" ]]; then
	SET_READ_ONLY=0
fi


### START OF THE ACTUAL SCRIPT ###

PREFIX_PATH=$1
NEW_SCREEN_X=$2
NEW_SCREEN_Y=$3

cd "$PREFIX_PATH"/drive_c/users/$(whoami)/AppData/Roaming/Lionhead\ Studios/Fable\ 3/

chmod 644 VideoOptions.xml

OLD_SCREEN_X=$(cat VideoOptions.xml | grep '<ScreenResolutionX type="int">' | tr -d '<ScreenResolutionX type="int">/\n\s\t\r')
OLD_SCREEN_Y=$(cat VideoOptions.xml | grep '<ScreenResolutionY type="int">' | tr -d '<ScreenResolutionY type="int">/\n\s\t\r')

FIND_ME_X="<ScreenResolutionX type=\"int\">$OLD_SCREEN_X<"
FIND_ME_Y="<ScreenResolutionY type=\"int\">$OLD_SCREEN_Y<"

REPLACE_ME_X="<ScreenResolutionX type=\"int\">$NEW_SCREEN_X<"
REPLACE_ME_Y="<ScreenResolutionY type=\"int\">$NEW_SCREEN_Y<"

sed -i "s/$FIND_ME_X/$REPLACE_ME_X/" VideoOptions.xml
sed -i "s/$FIND_ME_Y/$REPLACE_ME_Y/" VideoOptions.xml

if [[ $SET_READ_ONLY == 1 ]]; then
	chmod 444 VideoOptions.xml
fi
