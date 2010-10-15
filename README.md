About
=====

**CLITool+InfoPlist** is an Xcode plugin that properly handles *Info.plist* files in CLI tool targets.

In the build settings, under the Packaging section, just set the *Info.plist File* (`INFOPLIST_FILE`). The plugin takes care of processing your Info.plist file based on the different Info.plist related settings, i.e. *Expand Build Settings in Info.plist File, Info.plist Output Encoding, etc*. It also automatically adds the necessary linker flags for creating the required \_\_TEXT,\_\_info_plist section.

Installation
============

1. Open CLITool+InfoPlist.xcodeproj
2. Build the project, CLITool+InfoPlist.xcplugin will be automatically installed into `~/Library/Application Support/Developer/Shared/Xcode/Plug-ins`
3. Quit Xcode
4. Relaunch Xcode

Limitations
===========

Because neither the Xcode plugin API nor Xcode internals are not documented, this plugin might break at anytime. To ensure that the plugin is still working, build and run the *dump_info_plist* projet.

This plugin was tested with Xcode 3.1.4 on Mac OS X 10.5.8 and Xcode 3.2.3 on Mac OS X 10.6.4.

If you are not comfortable with the plugin, dupe [rdar #6646614](http://openradar.me/6646614) and cross your fingers because this is a duplicate of rdar #4722772 which was filed in 2006.
