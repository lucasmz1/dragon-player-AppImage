#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q dragon | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/128x128/apps/dragonplayer.png
export DESKTOP=/usr/share/applications/org.kde.dragonplayer.desktop
export DEPLOY_PIPEWIRE=1

# Deploy dependencies
quick-sharun /usr/bin/dragon /usr/lib/qt6

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
