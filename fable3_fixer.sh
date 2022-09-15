#!/usr/bin/bash

# Argument Checks
if [[ $1 == "--help" || $1 == "-h" ]]; then
	echo "Script usage: $0 \"[PATH_TO_PREFIX]\" \"[PATH_TO_GAME_DIRECTORY]\""
	echo "Please refer to the 'help.txt' document, if you need more information."
	exit 0
fi

if [[ -z "$1" || -z "$2" ]]; then
	echo "Not enough aguments passed"
	exit 0
fi

# Directory Checks
if [ "$(ls -A $1)" ]; then
	echo "\"$1\" is not empty. Please create a new folder and point the script to that."
	exit 0
fi

if ! [[ $(ls "$2" -1 | grep FableLauncher.exe) ]]; then
	echo "Cannot find 'FableLauncher.exe' in \"$2\""
	echo "Are you sure this is your Fable 3 game directory?"
	exit 0
fi
	
### START OF THE ACTUAL SCRIPT ###

PREFIX_PATH=$1
GAME_DIRECTORY_PATH=$2

# Create Wine Bottle
WINEARCH=win32 WINEPREFIX="$PREFIX_PATH" winepath

# Download Vulkan
mkdir $(pwd)/Downloads/
cd Downloads/
wget https://github.com/doitsujin/dxvk/releases/download/v1.10.3/dxvk-1.10.3.tar.gz -O $(pwd)/dxvk-1.10.3.tar.gz
tar -xvzf dxvk-1.10.3.tar.gz
rm "dxvk-1.10.3.tar.gz"

# Download GFWL Bypass
mkdir GFWLRemover/ 
cd GFWLRemover/
wget "https://www.dropbox.com/sh/l1yugur7zvzvwvz/AACZ-HjSYJibUS0GDW9eJZA0a/GFWL%20Disabler.zip" -O $(pwd)/GFWL_Remover.zip
unzip GFWL_Remover.zip
rm *.zip

# Install Vulkan
cd ../dxvk-1.10.3/
echo "Running DXVK Vulkan Install Script..."
WINEPREFIX="$PREFIX_PATH" ./setup_dxvk.sh install
mv --force d3d9.dll dxgi.dll "$GAME_DIRECTORY_PATH"

# Install GWFL Bypass
cd ../GFWLRemover/
mv --force xlive.dll xlive.ini "$GAME_DIRECTORY_PATH"

# Finished 
clear
echo "Script is complete, please open the game using the following command. Also please read 'help.txt' to see any additional fixes you may need."
echo "Also after copying the following command, you will have to give your CD Key. This can be found in Steam."
echo "Copy the following command to start the game: "
echo ""
echo "cd \"$GAME_DIRECTORY_PATH\" \&\& WINEPREFIX=\"$PREFIX_PATH\" DXVK_HUD=1 wine FableLauncher.exe"
