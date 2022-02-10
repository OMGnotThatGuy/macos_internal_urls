# USAGE: Open the System Preferences app to a panel, then run this script to enumerate the shortcuts to that panel. Shortcuts will be copied to the clipboard.

# Example output:
# x-apple.systempreferences:com.apple.preference.printfax?scan
# x-apple.systempreferences:com.apple.preference.printfax?fax
# x-apple.systempreferences:com.apple.preference.printfax?print
# x-apple.systempreferences:com.apple.preference.printfax?share

# x-apple.systempreferences:com.apple.preferences.AppleIDPrefPane?com.apple.AppleMediaServicesUI.SpyglassPurchases
# x-apple.systempreferences:com.apple.preferences.AppleIDPrefPane?AppleAccount
# x-apple.systempreferences:com.apple.preferences.AppleIDPrefPane?iCloud

if application "System Preferences" is not running then
	set alertText to "System Preferences is not running!"
	display alert alertText as critical buttons {"Exit"} default button 1
	error number -128
end if

tell application "System Preferences"
	try
		set myPane to (get id of current pane)
	on error
		set alertText to "No panel selected! Open a panel in System Preferences and try again."
		display alert alertText as critical buttons {"Exit"} default button 1
		error number -128
	end try
	
	try
		set myAnchors to (get anchors of current pane)
	on error
		set alertText to "Panel did not return any anchors."
		display alert alertText as critical buttons {"Exit"} default button 1
		error number -128
	end try
end tell

# Loop through each anchor in the pane to compose an x-URL
set theList to {}
repeat with theItem in myAnchors
	set myURL to "x-apple.systempreferences:" & myPane & "?" & (get name of theItem)
	copy myURL to the end of theList
end repeat

# Send results to the clipboard
set AppleScript's text item delimiters to "
"
set the clipboard to theList as string

set alertText to "Shortcuts copied to clipboard:"
set alertMessage to (theList as string)

# Workaround: Make the "OK" button REALLY wide to prevent wrapping in the list items.
# It's ugly, but at least the list doesn't wrap except on excessively long URLs
set okLabel to "                                                                        OK                                                                        "
display alert alertText message alertMessage as informational buttons {okLabel} default button 1