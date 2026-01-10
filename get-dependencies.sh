#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
	dragon            \
	pipewire-audio      \
	ffmpeg \
	kconfig \
	kcoreaddons \
	kcrash \
	ki18n \
	kio \
	kirigami \
	kservice \
	kwindowsystem \
	qt6-base \
	qt6-declarative \
	qt6-multimedia \
	qt6-multimedia-ffmpeg \
	pipewire-jack 

if [ "$ARCH" = 'x86_64' ]; then
        pacman -Syu --noconfirm libva-intel-driver
fi

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano intel-media-driver-mini


# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here
