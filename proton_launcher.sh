#!/bin/bash

# USER CONFIG
#EXE_NAME="game.exe"
STEAM_PATH="${HOME}/.steam"
STEAM_LIBRARY="${STEAM_PATH}/steam/steamapps"
PROTON_VERSION="Proton 3.16 Beta"


# Initialization
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"

if [ "$1" = "-exe_name" ]; then
    shift
    EXE_NAME="$1"
    shift
fi

if [ -z "${EXE_NAME}" ]; then
    echo "Uncomment and set EXE_NAME or give it as an argument!"
    echo "Example: $ ./proton_launcher.sh -exe_name someprogram.exe"
    exit
fi

if [ "${EXE_NAME}" = "winecfg" ] || [ "${EXE_NAME}" = "regedit" ] || [ "${EXE_NAME}" = "cmd" ]; then
    echo "You have to run winecfg and other built-in wine tools through the wine command!"
    echo "Example: $ ./proton_launcher.sh -exe_name wine winecfg"
    exit
fi

if [ -z "${STEAM_COMPAT_DATA_PATH}" ]; then
    echo "No STEAM_COMPAT_DATA_PATH set. Using ${DIR}/proton"
    export STEAM_COMPAT_DATA_PATH="${DIR}"/proton
fi

if ! [ -d "${STEAM_COMPAT_DATA_PATH}"/pfx ]; then
    mkdir -p "${STEAM_COMPAT_DATA_PATH}"/pfx
fi

# Running wine, winecfg, regedit or winetricks
if [ "${EXE_NAME}" = "wine" ] || [ "${EXE_NAME}" = "winetricks" ]; then

    export WINEPREFIX="${STEAM_COMPAT_DATA_PATH}/pfx"
    export WINE="${STEAM_LIBRARY}/common/${PROTON_VERSION}/dist/bin/wine64"
    export WINESERVER="${STEAM_LIBRARY}/common/${PROTON_VERSION}/dist/bin/wineserver"
    export WINEDLLPATH="${STEAM_LIBRARY}/common/${PROTON_VERSION}/dist/lib64/wine:${STEAM_LIBRARY}/common/${PROTON_VERSION}/dist/lib/wine"
    export PATH="${STEAM_LIBRARY}/common/${PROTON_VERSION}/dist/bin/:${STEAM_PATH}/ubuntu12_32/steam-runtime/amd64/bin:${STEAM_PATH}/ubuntu12_32/steam-runtime/amd64/usr/bin:${PATH}"
    export LD_LIBRARY_PATH="${STEAM_LIBRARY}/common/${PROTON_VERSION}/dist/lib64:${STEAM_LIBRARY}/common/${PROTON_VERSION}/dist/lib:${STEAM_PATH}/ubuntu12_32/steam-runtime/pinned_libs_32:${STEAM_PATH}/ubuntu12_32/steam-runtime/pinned_libs_64:/usr/lib/x86_64-linux-gnu/libfakeroot:/lib/i386-linux-gnu:/usr/lib/i386-linux-gnu:/usr/local/lib:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/lib:/usr/lib:/usr/lib/i386-linux-gnu/i686:/usr/lib/i386-linux-gnu/sse2:/usr/lib/i386-linux-gnu/i686/sse2:${STEAM_PATH}/ubuntu12_32/steam-runtime/i386/lib/i386-linux-gnu:${STEAM_PATH}/ubuntu12_32/steam-runtime/i386/lib:${STEAM_PATH}/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu:${STEAM_PATH}/ubuntu12_32/steam-runtime/i386/usr/lib:${STEAM_PATH}/ubuntu12_32/steam-runtime/amd64/lib/x86_64-linux-gnu:${STEAM_PATH}/ubuntu12_32/steam-runtime/amd64/lib:${STEAM_PATH}/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu:${STEAM_PATH}/ubuntu12_32/steam-runtime/amd64/usr/lib:${LD_LIBRARY_PATH}"

    # Run the commands
    echo "running \"${EXE_NAME}\" directly with arguments: $@"
    "${EXE_NAME}" "$@"

# Running a normal .exe
else

    #export DXVK_HUD=version,devinfo,fps
    #export PROTON_LOG=1
    #export PROTON_DUMP_DEBUG_COMMANDS=1
    #export PROTON_DEBUG_DIR=1
    #export PROTON_USE_WINED3D=1
    #export PROTON_NO_D3D11=1
    #export PROTON_NO_D3D10=1
    #export PROTON_NO_ESYNC=1
    #export PROTON_FORCE_LARGE_ADDRESS_AWARE=1
    #export PROTON_OLD_GL_STRING=1
    
    # Launch the game
    echo "running \"${EXE_NAME}\" through proton with arguments: $@"
    "${STEAM_LIBRARY}/common/${PROTON_VERSION}/proton" run "${EXE_NAME}" "$@"
    
fi


