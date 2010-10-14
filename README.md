About
=====

**CLITool+InfoPlist** is an Xcode plugin that makes handling *Info.plist* files in CLI Tool targets the way it should be done by Xcode.

See [rdar #6646614](http://openradar.me/6646614) for a description of the problem.

Installation
============

1. Open CLITool+InfoPlist.xcodeproj
2. Build the project
3. Quit Xcode
4. Relaunch Xcode

Usage
=====

In your CLI tool target build settings, just set the *Info.plist File* (`INFOPLIST_FILE`) to your Info.plist file. The plugin takes care of processing your Info.plist and adding the linker flags for creating the \_\_TEXT,\_\_info_plist section.
