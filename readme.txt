This script allows you to use Proton from your Steam installation as a Wine
substitute for any Windows program.

proton_launcher.sh is intended to be used for a single program. By default
it creates a separate wineprefix "proton/pfx" inside the directory where the
script is placed. For a more general system-wide Wine replacement, check the
"global" directory in this repo.

Installation
------------
Place proton_launcher.sh in the same directory where the program you wan to run
is installed. Edit STEAM_PATH, STEAM_LIBRARY and PROTON_VERSION near the
beginning of the script to reflect your system. Uncomment and edit EXE_NAME to
the program you want to run.

Running
-------
If you set EXE_NAME inside the script, simply execute the script from your file
manager or the terminal.

You can override EXE_NAME by giving "-exe_name someother.exe" as an argument
for the script.

    $ ./proton_launcher.sh -exe_name someother.exe

This way you can also run winecfg or winetricks on the prefix.

    $ ./proton_launcher.sh -exe_name wine winecfg
    $ ./proton_launcher.sh -exe_name winetricks
    
Note how you have to run winecfg and other built-in wine commands with "wine".
