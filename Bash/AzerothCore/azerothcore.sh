#!/bin/bash
# Supported distributions
DISTRIBUTION=("debian11" "ubuntu20.04" "ubuntu20.10" "ubuntu21.04" "ubuntu21.10")
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    VERSION=$VERSION_ID

    if [[ ! " ${DISTRIBUTION[@]} " =~ " ${OS}${VERSION} " ]]; then
        printf "\e[0;31mThis distribution is currently not supported.\e[0m\n"
        exit $?
    fi
fi

# Check if the curl package is installed
if [ $(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    clear

    # Perform an update to make sure nothing is missing
    apt-get --yes update
    if [ $? -ne 0 ]; then
        exit $?
    fi

    # Install the package that is missing
    apt-get --yes install curl
    if [ $? -ne 0 ]; then
        exit $?
    fi
fi

# Remote url where files are stored
REMOTE_URL="https://raw.githubusercontent.com/tkn963/codebase/master/Bash/AzerothCore/core"

# The file that stores the version number
VERSION_FILE="version"

# The source script
SOURCE_FILE="source"

# Set local version
LOCAL_VERSION=0
if [ -f $VERSION_FILE ]; then
    LOCAL_VERSION=$(<$VERSION_FILE)
fi

# Download the version number from the server
VERSION=$(curl --fail --max-time 1 "$REMOTE_URL/$VERSION_FILE" 2>/dev/null)
if [ ! -z $VERSION ]; then
    # Set remote version
    REMOTE_VERSION=$VERSION
else
    # Something went wrong...
    if [ $LOCAL_VERSION == 0 ] || [ ! -f $SOURCE_FILE ]; then
        # If version is 0 or the source file is missing, stop
        printf "\e[0;31mWe were unable to reach the remote server or the requested file is missing.\e[0m\n"
        printf "\e[0;31mCheck your internet connection and try again, otherwise contact the administrator.\e[0m\n"
        exit $?
    fi
fi

# Download the source file if the file is missing or the local version is different from the remote
if [ ! -f $SOURCE_FILE ] || [[ $LOCAL_VERSION != $REMOTE_VERSION ]] || [ $LOCAL_VERSION == 0 ]; then
    curl --fail --max-time 1 --output $SOURCE_FILE $REMOTE_URL/$SOURCE_FILE 2>/dev/null
    if [ $? -ne 0 ]; then
        # Something went wrong...
        printf "\e[0;31mWe were unable to reach the remote server or the requested file is missing.\e[0m\n"
        printf "\e[0;31mCheck your internet connection and try again, otherwise contact the administrator.\e[0m\n"
        exit $?
    else
        # Update local version
        echo $REMOTE_VERSION > $VERSION_FILE
    fi
fi

# Include the source file
source $SOURCE_FILE
