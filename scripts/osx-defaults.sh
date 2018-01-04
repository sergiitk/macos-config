#!/bin/bash

# System Preferences
killall "System Preferences" > /dev/null 2>&1

# General -> Appearance: Graphite
defaults write -g AppleAquaColorVariant -int 6

# Needs relogin.
# Keyboard -> Key Repeat: Fast
defaults write NSGlobalDomain KeyRepeat -int 2
# Keyboard -> Delay Until Repeat: Short
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Keyboard -> Shortcuts -> Mission Control -> Mission Control: off
# Doesn't work :(
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 32 "{ enabled = 0; value = { parameters = (65535, 126, 8650752); type = 'standard'; }; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 34 "{ enabled = 0; value = { parameters = (65535, 126, 8781824); type = 'standard'; }; }"

# Keyboard -> Shortcuts -> App Shortcuts
# ~/Library/Preferences/.GlobalPreferences.plist
# http://hints.macworld.com/article.php?story=20131123074223584
# http://osxnotes.net/keybindings.html
# @ for Command
# $ for Shift
# ~ for Option
# ^ for Ctrl
# Flush existing settings. Won't pick up updates without it.
defaults delete -g NSUserKeyEquivalents
# Next tab: cmd + opt + left-arrow
defaults write -g NSUserKeyEquivalents -dict-add 'Show Next Tab' '@~\U2192'
# Prev tab: cmd + opt + right-arrow
defaults write -g NSUserKeyEquivalents -dict-add 'Show Previous Tab' '@~\U2190'

# Restart the Finder and the preferences daemon for the change to take effect
killall cfprefsd
killall SystemUIServer
killall Dock
killall Finder

# General -> Use dark menu bar and Dock
# Doesn't work: defaults write -g AppleInterfaceStyle -string "Dark"
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'
