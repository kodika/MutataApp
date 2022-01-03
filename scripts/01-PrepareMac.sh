#!/bin/bash
set -e

echo "Checking HomeBrew"
which -s brew
if [[ $? != 0 ]] ; then
    echo "Installing HomeBrew"
    echo "Installing Brew from https://brew.sh"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Updating HomeBrew"
    brew update
fi

echo "Installing Javac"
brew install openjdk@8

echo "Installing Tools: coreutils cmake wget gradle"
brew install coreutils cmake wget gradle
