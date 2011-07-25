#!/bin/sh

BASE_DIR=~
TARGET_DIR=~/backup

function createDir
{
	if [ ! -e "$1" ]; then
		mkdir -p "$1"
	fi
}

function copy
{
	src="$BASE_DIR/$1"
	dest="$TARGET_DIR/$1"
	destDirName=`dirname "$dest"`
	
	echo "Copying files in dir $src to dir $dest"
	
	if [ -d "$src" ]; then
		createDir "$dest"
		cp -r "$BASE_DIR/$1/" "$TARGET_DIR/$1"
	elif [ -f "$src" ]; then
		createDir "$destDirName"
		cp "$BASE_DIR/$1" "$TARGET_DIR/$1"
	else
		echo "Source directory $src does not exist"
	fi
}

function copyMatchingFiles
{
	echo "copying files in dir $1 starting with $2"
	find "$BASE_DIR/$1" -maxdepth 1 -name "$2" | while read FILENAME;
	do
		createDir "$TARGET_DIR/$1"
		cp "$FILENAME" "$TARGET_DIR/$1/";
	done
}

########################################
# Address Book
copyMatchingFiles Library/Preferences "com.apple.AddressBook*"
copy "Library/Application Support/AddressBook"
########################################

########################################
# Bibdesk
copy "Library/Application Support/BibDesk"
########################################

########################################
# Cyberduck
copy "Library/Application Support/Cyberduck"
########################################

########################################
# Dashboard
copy Library/Preferences/com.apple.dashboard.client.plist
copy Library/Preferences/com.apple.dashboard.plist
copyMatchingFiles Library/Preferences "widget-com*"

copy Library/Widgets
########################################

########################################
# Echofon
copy Library/Preferences/com.echofon.Echofon.plist
copy "Library/Application Support/Echofon"
########################################

########################################
# Firefox
copy "Library/Application Support/Firefox"
copy Library/Preferences/org.mozilla.firefox.plist
########################################

########################################
# Google Chrome
copy Library/Preferences/com.google.Chrome.plist
copy "Library/Application Support/Google/Chrome"
########################################

########################################
# iCal
copy Library/Calendars

copy Library/Preferences/com.apple.iCal.helper.plist
copy Library/Preferences/com.apple.iCal.plist
########################################

########################################
# iTunes
# copy Library iTunes dir
copy Library/iTunes
copyMatchingFiles Library/Preferences "com.apple.iTunes*"

copy Music/iTunes
########################################

########################################
# iPhoto
copyMatchingFiles Library/Preferences "com.apple.iPhoto*"
copy "Pictures/iPhoto Library"
########################################

########################################
# iWork
copy "Library/Application Support/iWork"
copyMatchingFiles Library/Preferences "com.apple.iWork*"
########################################

########################################
# Keychain
copy Library/Keychains
copy Library/Preferences/com.apple.keychainaccess.plist
########################################

########################################
# Mail
copyMatchingFiles Library/Preferences "com.apple.mail*"
copy Library/Mail
########################################

########################################
# Safari
copy  Library/Safari
copyMatchingFiles Library/Safari "com.apple.Safari*"
########################################

########################################
# ShakesPeer
copy Library/Preferences/se.hedenfalk.shakespeer.plist
copy "Library/Application Support/ShakesPeer"
########################################

########################################
# Skype
copy Library/Preferences/com.skype.skype.plist
copy "Library/Application Support/Skype"
########################################

########################################
# Sparrow
copy "Library/Application Support/Sparrow"
copy Library/Preferences/com.sparrowmailapp.sparrow.plist
copy Library/Caches/com.sparrowmailapp.sparrow
########################################

########################################
# Stickies
copy Library/StickiesDatabase
copy Library/Preferences/com.apple.Stickies.plist
########################################

########################################
# TextMate
copy Library/Preferences/com.macromates.textmate.plist
copy "Library/Application Support/TextMate"
########################################

########################################
# Things
copy "Library/Application Support/Cultured Code/Things"
copy Library/Preferences/com.culturedcode.things.plist
########################################

########################################
# Transmission
copyMatchingFiles Library/Preferences "org.m0k.transmission*"
copy "Library/Application Support/Transmission"
########################################

########################################
# Vienna
copy "Library/Application Support/Vienna"

copy Library/Preferences/uk.co.opencommunity.vienna2.plist
########################################

########################################
# VLC
copy "Library/Application Support/org.videolan.vlc"
copyMatchingFiles Library/Preferences "org.videolan.vlc*"
########################################

########################################
# .ssh
copy .ssh
########################################

########################################
# Maven
copy .m2/settings-security.xml
copy .m2/settings.xml
########################################

########################################
# Git
copy .gitconfig
########################################