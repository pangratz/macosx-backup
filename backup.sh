#!/bin/sh

BASE_DIR=~
TARGET_DIR=~/backup

function createDir
{
	if [ ! -d "$1" ]; then
		mkdir "$1"
	fi
}

function copy
{
	echo "copying $1"
	fileName="$BASE_DIR/$1"
	if [ -d "$fileName" ]; then
		cp -r "$BASE_DIR/$1/" "$TARGET_DIR/$1"
	fi
	
	if [ -f "$fileName" ]; then
		cp "$BASE_DIR/$1" "$TARGET_DIR/$1"
	fi	
}

function copyMatchingFiles
{
	echo "copying files in dir $1 starting with $2"
	find "$BASE_DIR/$1" -maxdepth 1 -name "$2" | while read FILENAME;
	do
		cp "$FILENAME" "$TARGET_DIR/$1/";
	done
}

# create target dir if not yet available
createDir $TARGET_DIR
createDir $TARGET_DIR/Library
createDir $TARGET_DIR/Music


########################################
# Address Book
createDir $TARGET_DIR/Library
createDir $TARGET_DIR/Library/Preferences
copyMatchingFiles Library/Preferences "com.apple.AddressBook*"

createDir "$TARGET_DIR/Library/Application Support"
copy "Library/Application Support/AddressBook"
########################################

########################################
# Dashboard
copy Library/Preferences/com.apple.dashboard.client.plist
copy Library/Preferences/com.apple.dashboard.plist
copyMatchingFiles Library/Preferences "widget-com*"

createDir $TARGET_DIR/Library/Widgets
copy Library/Widgets
########################################

########################################
# Echofon
copy Library/Preferences/com.echofon.Echofon.plist
copy "Library/Application Support/Echofon"
########################################

########################################
# Firefox
createDir "$TARGET_DIR/Library/Application Support"
copy "Library/Application Support/Firefox"
copy Library/Preferences/org.mozilla.firefox.plist
########################################

########################################
# Google Chrome
copy Library/Preferences/com.google.Chrome.plist
createDir "$TARGET_DIR/Library/Application Support/Google"
createDir "$TARGET_DIR/Library/Application Support/Google/Chrome"
copy "Library/Application Support/Google/Chrome"
########################################

########################################
# iCal
createDir $TARGET_DIR/Library
createDir $TARGET_DIR/Library/Calendars
copy Library/Calendars

createDir $TARGET_DIR/Library/Preferences
copy Library/Preferences/com.apple.iCal.helper.plist
copy Library/Preferences/com.apple.iCal.plist
########################################

########################################
# iTunes
# copy Library iTunes dir
createDir $TARGET_DIR/Library/iTunes
copy Library/iTunes

createDir $TARGET_DIR/Library/Preferences
copyMatchingFiles Library/Preferences "com.apple.iTunes*"

# copy music directory
createDir $TARGET_DIR/Music
createDir $TARGET_DIR/Music/iTunes
#copy Music/iTunes
########################################

########################################
# iPhoto
createDir $TARGET_DIR/Pictures
#copy "Pictures/iPhoto Library"
copyMatchingFiles Library/Preferences "com.apple.iPhoto*"
########################################

########################################
# iWork
copy "Library/Application Support/iWork"
copyMatchingFiles Library/Preferences "com.apple.iWork*"
########################################

########################################
# Keychain
copy Library/Keychain
copy Library/Preferences/com.apple.keychainaccess.plist
########################################

########################################
# Mail
copyMatchingFiles Library/Preferences "com.apple.mail*"
#copy Library/Mail
########################################

########################################
# QuietRead
copy Library/Preferences/com.bambooapps.Quiet-Read.plist
copy "Library/Application Support/Quiet Read"
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
# Stickies
copy Library/StickiesDatabase
copy Library/Preferences/com.apple.Stickies.plist
########################################

########################################
# TextMate
copy Library/Preferences/com.macromates.textmate.plist
########################################

########################################
# Things
createDir "$TARGET_DIR/Library/Application Support/Cultured Code"
createDir "$TARGET_DIR/Library/Application Support/Cultured Code/Things"
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
createDir $TARGET_DIR/Library
createDir "$TARGET_DIR/Library/Application Support"
copy "Library/Application Support/Vienna"

createDir $TARGET_DIR/Library/Preferences
copy Library/Preferences/uk.co.opencommunity.vienna2.plist
########################################

########################################
# VLC
copy "Library/Application Support/org.videolan.vlc"
copyMatchingFiles Library/Preferences "org.videolan.vlc*"
########################################