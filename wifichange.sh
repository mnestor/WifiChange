#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
SSID=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {ssid = tolower(substr($0, index($0, $2))); sub(/ /, "_", ssid);print ssid}'`

SCRIPT="${SCRIPTPATH}/connect/${SSID}"

# do we have a script for the current wifi?
if [ -f $SCRIPT ]; then
  sh $SCRIPT
  exit 0
fi

# if we don't find for the current, do we have a default?
SCRITP_DEFAULT="${SCRIPTPATH}/default.noscript"
if [ -f $SCRITP_DEFAULT ]; then
  sh $SCRITP_DEFAULT
  exit 0
fi