This script allows you to use Proton from your Steam installation as a
system-wide Wine replacement.

By default it creates a wineprefix in ~/.proton/pfx To move it, change
STEAM_COMPAT_DATA_PATH instead of WINEPREFIX. STEAM_COMPAT_DATA_PATH is
used by Proton internally and WINEPREFIX will automatically be set to
STEAM_COMPAT_DATA_PATH/pfx by the script.

Installation
------------
Place wine somewhere in your PATH. Edit STEAM_PATH, STEAM_LIBRARY and
PROTON_VERSION near the beginning of the script to reflect your system. You
can also give them as environment variables.

Running
-------
Simply run it like you would run regular Wine.

    $ wine path/to/some.exe

However when using winetricks, you HAVE TO run winetricks through this script!

    $ wine winetricks
    
This ensures that winetricks can find the right wine binaries from Proton's
installation directories.

Known issues
------------
A new fontconfig directory is always created inside the current working
directory. This can be avoided by installing all vanilla Wine's dependencies
and commenting out the line "export LD_LIBRARY_PATH=..."
