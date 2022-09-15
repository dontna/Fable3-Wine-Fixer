#!/usr/bin/bash

PREFIX_PATH=$1
NEW_SCREEN_X=$2
NEW_SCREEN_Y=$3

cd "$PREFIX_PATH"/drive_c/users/$(whoami)/AppData/Roaming/Lionhead\ Studios/Fable\ 3/

OLD_SCREEN_X=$(cat VideoOptions.xml | grep '<ScreenResolutionX type="int">' | tr -d '<ScreenResolutionX type="int">/\n\s\t\r')
OLD_SCREEN_Y=$(cat VideoOptions.xml | grep '<ScreenResolutionY type="int">' | tr -d '<ScreenResolutionY type="int">/\n\s\t\r')

FIND_ME_X="<ScreenResolutionX type=\"int\">$OLD_SCREEN_X<"
FIND_ME_Y="<ScreenResolutionY type=\"int\">$OLD_SCREEN_Y<"

REPLACE_ME_X="<ScreenResolutionX type=\"int\">$NEW_SCREEN_X<"
REPLACE_ME_Y="<ScreenResolutionY type=\"int\">$NEW_SCREEN_Y<"

sed -i "s/$FIND_ME_X/$REPLACE_ME_X/" VideoOptions.xml
sed -i "s/$FIND_ME_Y/$REPLACE_ME_Y/" VideoOptions.xml

chmod 444 VideoOptions.xml
