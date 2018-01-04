#!/bin/bash

# System Preferences
killall "System Preferences" > /dev/null 2>&1
defaults delete -g NSUserKeyEquivalents

# System Preferences - Keyboard -> Shortcuts -> App Shortcuts
# ~/Library/Preferences/.GlobalPreferences.plist
# http://hints.macworld.com/article.php?story=20131123074223584
# http://osxnotes.net/keybindings.html
# @ for Command
# $ for Shift
# ~ for Option
# ^ for Ctrl
# Next tab: cmd + opt + left-arrow
defaults write -g NSUserKeyEquivalents -dict-add 'Show Next Tab' '@~\U2192'
# Prev tab: cmd + opt + right-arrow
defaults write -g NSUserKeyEquivalents -dict-add 'Show Previous Tab' '@~\U2190'

# Restart the Finder and the preferences daemon for the change to take effect
killall Dock
killall Finder
killall cfprefsd
killall SystemUIServer
