#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
SSID=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {ssid = tolower(substr($0, index($0, $2))); sub(/ /, "_", ssid);print ssid}'`

if [ "$SSID" == "" ]; then
  DISCONNECTED="${SCRIPTPATH}/disconnected"
  if [ -f $DISCONNECTED ]; then
    sh $DISCONNECTED
  fi
  exit 0
fi

SCRIPT="${SCRIPTPATH}/connect/${SSID}"

# do we have a script for the current wifi?
if [ -f $SCRIPT ]; then
  sh $SCRIPT
  exit 0
fi

# if we don't find for the current, do we have a default?
SCRIPT_DEFAULT="${SCRIPTPATH}/default.noscript"
if [ -f $SCRIPT_DEFAULT ]; then
  sh $SCRIPT_DEFAULT
  exit 0
fi
