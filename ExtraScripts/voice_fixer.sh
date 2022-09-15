#!/usr/bin/bash

PREFIX_PATH=$1

WINEPREFIX="$PREFIX_PATH" winetricks --force xact

clear
echo "Voices should now work correctly. See the 'NEED HELP / REPORTING BUGS' section of the 'help.txt' file to find out how to report this fix as not working."
