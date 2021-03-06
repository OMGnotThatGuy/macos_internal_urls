# macos_internal_urls
An applescript for extracting the shortcut URLs from macOS System Preference panes.

Script Usage:

1) Open shortcut_enumerator.applescript
1) Open 'System Preferences'
1) Open a preference pane
1) Execute the shortcut_enumerator applescript
1) Paste links somewhere

![Demo GIF](/images/demo.gif)

**Note**: _Not all preference panes can be accessed by their shortcut. Only preference panes whose Info.plist includes NSPrefPaneAllowsXAppleSystemPreferencesURLScheme can be accessed with shortcuts._


macOS 12.1 Pref Panes that can be accessed with Shortcuts:

* Accessibility
* Apple ID
* Battery
* Class Progress
* Energy Saver
* Family Sharing
* Language and Region
* Notifications and Focus
* Profiles
* Screen Time
* Security & Privacy
* Sharing
* Siri
* Software Update
* Touch ID
* Wallet & Apple Pay

Using Shortcut URLs to access Preference Panes inside Shortcut.app:
![Shortcut.app Screenshot](/images/shortcut_example.jpg)


# Written for [u/Same_Nebula3406](https://www.reddit.com/user/Same_Nebula3406/).
