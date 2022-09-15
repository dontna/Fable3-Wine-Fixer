#!/usr/bin/bash

PREFIX_PATH=$1
GAME_DIRECTORY_PATH=$2

# Create Wine Bottle
WINEARCH=win32 WINEPREFIX="$PREFIX_PATH" winepath

# Download Vulkan
mkdir $(pwd)/TempDownloads && cd "$_"
wget https://github.com/doitsujin/dxvk/releases/download/v1.10.3/dxvk-1.10.3.tar.gz
tar -xvzf dxvk-1.10.3.tar.gz
rm "dxvk-1.10.3.tar.gz"

# Download GFWL Bypass
mkdir $(pwd)/GFWLRemover && cd "$_"
wget "https://www.dropbox.com/sh/l1yugur7zvzvwvz/AACZ-HjSYJibUS0GDW9eJZA0a/GFWL%20Disabler.zip" --output-document 'GFWL_Remover.zip'
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

# Pre Game Open Message
clear
echo "Script is complete, please open the game using the following command. Also please read 'help.txt' to see any additional fixes you may need."
echo "Also after copying the following command, you will have to give your CD Key. This can be found in Steam."
echo "Copy the following command to start the game: "
echo ""
echo cd \"$GAME_DIRECTORY_PATH\" \&\& WINEPREFIX=\"$PREFIX_PATH\" DXVK_HUD=1 wine FableLauncher.exe
