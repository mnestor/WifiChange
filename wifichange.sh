#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
SSID=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {ssid = tolower(substr($0, index($0, $2))); sub(/ /, "_", ssid);print ssid}'`

SCRIPT="${SCRIPTPATH}/connect/${SSID}"

if [ -f $SCRIPT ]; then
  sh $SCRIPT
fi
