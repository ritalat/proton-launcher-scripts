#!/bin/bash


# USER CONFIG
#EXE_NAME="game.exe"
STEAM_LIBRARY="/path/to/steamapps"
PROTON_VERSION="Proton 3.16 Beta"


# Initialization
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"

if [ -z ${EXE_NAME} ]; then
    echo "Uncomment and correct EXE_NAME!"
    exit
fi

if ! [ -d proton ]; then
    mkdir proton
fi

export STEAM_COMPAT_DATA_PATH="${DIR}"/proton
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
"${STEAM_LIBRARY}/common/${PROTON_VERSION}/proton" run "${EXE_NAME}" "$@"


