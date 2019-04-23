#!/bin/bash

# You should only use this script to run winecfg, regedit or winetricks!
# Example: run winecfg for this proton pfx
# $ ./_proton_command.sh wine winecfg
# Example: install faudio with winetricks for this pfx
# $ ./_proton_command.sh winetricks faudio


# USER CONFIG
STEAM_PATH="${HOME}/.steam"
STEAM_LIBRARY="/path/to/steamapps"
PROTON_VERSION="Proton 3.16 Beta"


# Initialization
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"

if [ $# -eq 0 ]; then
    echo "Give the programs that you want to run as arguments for this script."
    echo "Note: You should only use this script to run winecfg, regedit or winetricks!"
    exit
fi

if ! [ -d proton/pfx ]; then
    mkdir -p proton/pfx
fi

export WINEPREFIX="${DIR}/proton/pfx"
export WINE="${STEAM_LIBRARY}/common/${PROTON_VERSION}/dist/bin/wine64"
export WINESERVER="${STEAM_LIBRARY}/common/${PROTON_VERSION}/dist/bin/wineserver"
export WINEDLLPATH="${STEAM_LIBRARY}/common/${PROTON_VERSION}/dist/lib64/wine:${STEAM_LIBRARY}/common/${PROTON_VERSION}/dist/lib/wine"
export PATH="${STEAM_LIBRARY}/common/${PROTON_VERSION}/dist/bin/:${STEAM_PATH}/ubuntu12_32/steam-runtime/amd64/bin:${STEAM_PATH}/ubuntu12_32/steam-runtime/amd64/usr/bin:${PATH}"
export LD_LIBRARY_PATH="${STEAM_LIBRARY}/common/${PROTON_VERSION}/dist/lib64:${STEAM_LIBRARY}/common/${PROTON_VERSION}/dist/lib:${STEAM_PATH}/ubuntu12_32/steam-runtime/pinned_libs_32:${STEAM_PATH}/ubuntu12_32/steam-runtime/pinned_libs_64:/usr/lib/x86_64-linux-gnu/libfakeroot:/lib/i386-linux-gnu:/usr/lib/i386-linux-gnu:/usr/local/lib:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/lib:/usr/lib:/usr/lib/i386-linux-gnu/i686:/usr/lib/i386-linux-gnu/sse2:/usr/lib/i386-linux-gnu/i686/sse2:${STEAM_PATH}/ubuntu12_32/steam-runtime/i386/lib/i386-linux-gnu:${STEAM_PATH}/ubuntu12_32/steam-runtime/i386/lib:${STEAM_PATH}/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu:${STEAM_PATH}/ubuntu12_32/steam-runtime/i386/usr/lib:${STEAM_PATH}/ubuntu12_32/steam-runtime/amd64/lib/x86_64-linux-gnu:${STEAM_PATH}/ubuntu12_32/steam-runtime/amd64/lib:${STEAM_PATH}/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu:${STEAM_PATH}/ubuntu12_32/steam-runtime/amd64/usr/lib:${LD_LIBRARY_PATH}"

# Run the commands
"$@"


