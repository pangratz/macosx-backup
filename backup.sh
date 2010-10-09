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
		cp -r -v "$BASE_DIR/$1/" "$TARGET_DIR/$1"
	fi
	
	if [ -f "$fileName" ]; then
		cp -v "$BASE_DIR/$1" "$TARGET_DIR/$1"
	fi	
}

function copyMatchingFiles
{
	echo "copying files in dir $1 starting with $2"
	find "$BASE_DIR/$1" -maxdepth 1 -name "$2" | while read FILENAME;
	do
		cp -v "$FILENAME" "$TARGET_DIR/$1/";
	done
}

# create target dir if not yet available
createDir $TARGET_DIR
createDir $TARGET_DIR/Library
createDir $TARGET_DIR/Music

########################################
# iTunes
# copy Library iTunes dir
createDir $TARGET_DIR/Library/iTunes
copy Library/iTunes

createDir $TARGET_DIR/Preferences
copyMatchingFiles Library/Preferences "com.apple.iTunes*"

# copy music directory
createDir $TARGET_DIR/Music
createDir $TARGET_DIR/Music/iTunes
#copy Music/iTunes
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
# Address Book
createDir $TARGET_DIR/Library
createDir $TARGET_DIR/Library/Preferences
copyMatchingFiles Library/Preferences "com.apple.AddressBook*"

createDir "$TARGET_DIR/Library/Application Support"
copy "Library/Application Support/AddressBook"
########################################

########################################
# Safari
########################################

########################################
# Google Chrome
########################################

########################################
# Firefox
########################################

########################################
# Mail
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
# Keychain
########################################

########################################
# Dropbox
########################################

########################################
# Notes
########################################

########################################
# Vienna
createDir $TARGET_DIR/Library
createDir "$TARGET_DIR/Library/Application Support"
copy "Library/Application Support/Vienna"

createDir $TARGET_DIR/Preferences
copy Library/Preferences/uk.co.opencommunity.vienna2.plist
########################################