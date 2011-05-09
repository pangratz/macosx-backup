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
createDir $TARGET_DIR/Library/Preferences
createDir "$TARGET_DIR/Library/Application Support"
createDir $TARGET_DIR/Library/Caches
createDir $TARGET_DIR/Library/Widgets

########################################
# Dashboard
copy Library/Preferences/com.apple.dashboard.client.plist
copy Library/Preferences/com.apple.dashboard.plist
copyMatchingFiles Library/Preferences "widget-com*"

copy Library/Widgets
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
# ShakesPeer
copy Library/Preferences/se.hedenfalk.shakespeer.plist
copy "Library/Application Support/ShakesPeer"
########################################

########################################
# TextMate
createDir "$TARGET_DIR/Library/Application Support/TextMate"
copy Library/Preferences/com.macromates.textmate.plist
copy "Library/Application Support/TextMate"
########################################

########################################
# Things
createDir "$TARGET_DIR/Library/Application Support/Cultured Code"
createDir "$TARGET_DIR/Library/Application Support/Cultured Code/Things"
copy "Library/Application Support/Cultured Code/Things"
copy Library/Preferences/com.culturedcode.things.plist
########################################

########################################
# Cyberduck
createDir "$TARGET_DIR/Library/Application Support/Cyberduck"
createDir "$TARGET_DIR/Library/Application Support/Cyberduck/Sessions"
createDir "$TARGET_DIR/Library/Application Support/Cyberduck/History"
createDir "$TARGET_DIR/Library/Application Support/Cyberduck/Bookmarks"
copy "Library/Application Support/Cyberduck"

# Sparrow
createDir "$TARGET_DIR/Library/Application Support/Sparrow"
copy "Library/Application Support/Sparrow"
copy Library/Preferences/com.sparrowmailapp.sparrow.plist
copy Library/Caches/com.sparrowmailapp.sparrow

# .ssh
copy .ssh
########################################