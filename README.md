# Fable3-Wine-Fixer
A simple set of scripts that apply fixes to Fable 3, allowing you to play the game at a stable 60 FPS. 

# What does it do?
The Fable 3 PC port is infamously poor quality. Even today on a RTX 2080 I couldn't get a stable 60 FPS without a lot of stuttering, this script fixes the issues that cause this to be a buggy mess.

The main script, applies 2 fixes specifically:
1. Forces the game to use Vulkan, instead of DirectX9. This allows for more stable frame rates, even on Windows. (For Fable 3 specifically)
2. Installs a Games For Windows Live Bypass. This allows us to connect to the game without having to deal with the plethora of issues that comes with getting GFWL to work.

I have also created 2 extra scripts, which you can find in the folder of the same name. 

These scripts are: **resolution_fixer.sh** and **voice_fixer.sh**

* **resolution_fixer.sh** - Fixes issues with setting resolutions in game, but can also be used to force the game to render resolutions that aren't natively supported. This allows the game to be more acessible to ultra-wide monitor users.
* **voice_fixer.sh** - Fixes an issue in which NPCs voice lines will not play, even though the mouth is moving as if they are speaking.

These two scripts won't need to be used by some users, however some users will find these fixes vital to playing their game in an enjoyable manor.

# How to use?
The script is really simple, however you do need to a little setup beforehand.

1. Create a new folder, which will be the games Wine Prefix. Even if you have a prefix already, use this as your prefix.
* `mkdir my_new_bottle`
2. Find your path to the Fable 3 game directory. The easiest way to do this is to do the following steps. The path will usually be at the top in a little bar.
* `Open Steam > Library > Fable 3 > Right Click > Local Files > 'Browse...' `
3. Run the script with the path to the prefix we made earlier, followed by your game directory path.
* Example: `./fable3_fixer.sh "/home/dontna/my_new_bottle/" "/home/dontna/.steam/steam/steamapps/common/Fable 3/"`

If done correctly the script will apply all the necessary fixes.

To see how the other scripts work, or for a more detailed tutorial for the main one, please refer to the 'help.txt' document.

# Before you use
You want to use my script? Brilliant! Before you download, I will tell you that this script does download files that are needed to ensure the script does its job. 

These files are as follows:
1. DXVK - Which allows the script to force the game to use Vulkan. This is vital to ensuring a smooth game play experience.
2. GFWL Disabler - This allows us to bypass Games For Windows Live. This saves a lot of tinkering and wasted headaches.

The links to both of these files will be below, along with a VirusTotal scan for each file. If you're still worried about these links, that is understandable; but these are required to give the best experience.

* DXVK GitHub Page: https://github.com/doitsujin/dxvk
* DXVK VirusTotal Scan: https://www.virustotal.com/gui/file/8d1a3c912761b450c879f98478ae64f6f6639e40ce6848170a0f6b8596fd53c6

* GFWL Disabler DropBox: https://www.dropbox.com/sh/l1yugur7zvzvwvz/AACeYxOtOf1GA0kJImPs3s44a?dl=0 [Link to external website]
* GFWL Disabler VirusTotal Scan: https://www.virustotal.com/gui/file/62a3bf6263e121d1d142c922dd242bbaeffc647a97bff4b9246ab26d7d41a78b

# Need Help or have a bug to report?
If you need help, and you cannot find the solution in the 'help.txt' document, feel free to message me and I will be happy to help! Same goes for any bug reports.

# Fork You?
If you want to ;)

But honestly, please feel free to Fork this project or just add to it here. Feel free to change, add or remove anything you want. You don't have to credit me either, but I would appreciate it.
