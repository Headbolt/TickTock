#!/bin/bash
#
###############################################################################################################################################
#
# ABOUT THIS PROGRAM
#
#   This Script is designed for use in JAMF
#
#   - This script will ...
#			Set TimeSync and Time Source
#
###############################################################################################################################################
#
# HISTORY
#
#	Version: 1.1 - 23/10/2018
#
#	- 31/03/2019 - V1.0 - Created by Headbolt
#
#   - 23/10/2019 - V1.1 - Updated by Headbolt
#							More comprehensive error checking and notation
#
###############################################################################################################################################
#
# DEFINE VARIABLES & READ IN PARAMETERS
#
###############################################################################################################################################
#
# Grab TimeSource from JAMF variable #4 eg. pool.ntp.org
TargetTimeSource=$4
#
# Grab Current TimeSync Status
CurrentTimeSyncStatus=$(systemsetup -getusingnetworktime | cut -c 15-)
# Grab Current TimeSource
CurrentTimeSource=$(systemsetup -getnetworktimeserver | cut -c 22-)
#
ScriptName="append prefix here as needed - Set TimeSource"
#
###############################################################################################################################################
#
# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#
###############################################################################################################################################
#
# Defining Functions
#
###############################################################################################################################################
#
# Section End Function
#
SectionEnd(){
#
# Outputting a Blank Line for Reporting Purposes
/bin/echo
#
# Outputting a Dotted Line for Reporting Purposes
/bin/echo  -----------------------------------------------
#
# Outputting a Blank Line for Reporting Purposes
/bin/echo
#
}
#
###############################################################################################################################################
#
# Script End Function
#
ScriptEnd(){
#
# Outputting a Blank Line for Reporting Purposes
#/bin/echo
#
/bin/echo Ending Script '"'$ScriptName'"'
#
# Outputting a Blank Line for Reporting Purposes
/bin/echo
#
# Outputting a Dotted Line for Reporting Purposes
/bin/echo  -----------------------------------------------
#
# Outputting a Blank Line for Reporting Purposes
/bin/echo
#
}
#
###############################################################################################################################################
#
# End Of Function Definition
#
###############################################################################################################################################
#
# Beginning Processing
#
###############################################################################################################################################
#
# Outputting a Blank Line for Reporting Purposes
/bin/echo
SectionEnd
#
/bin/echo Checking Current Settings
# Outputting a Blank Line for Reporting Purposes
/bin/echo
#
/bin/echo "Network Time Sync is - $CurrentTimeSyncStatus"
/bin/echo "Current TimeSource is - $CurrentTimeSource"
/bin/echo "TargetTimeSource is - $TargetTimeSource"
# Outputting a Blank Line for Reporting Purposes
/bin/echo
#
if [ "$CurrentTimeSource" == "$TargetTimeSource" ]
	then
		/bin/echo "TimeSource is Correct"
		# Outputting a Blank Line for Reporting Purposes
		/bin/echo
	else
		/bin/echo "TimeSource is incorrect, setting it to $TargetTimeSource"
		systemsetup -setnetworktimeserver $TargetTimeSource
		# Outputting a Blank Line for Reporting Purposes
		/bin/echo
fi
#
if [ "$CurrentTimeSyncStatus" == "On" ]
	then
		/bin/echo "TimeSync is On"
	else
		/bin/echo "TimeSync is not On, Enabling it"
		systemsetup -setusingnetworktime On
fi
#
SectionEnd
ScriptEnd
