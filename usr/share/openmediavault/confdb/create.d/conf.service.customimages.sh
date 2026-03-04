#!/bin/sh
set -e

. /usr/share/openmediavault/scripts/helper-functions

# Standardwerte in die OMV-Konfig-DB schreiben, falls noch nicht vorhanden
if ! omv_config_exists "/config/services/customimages"; then
  omv_config_add_node "/config/services" "customimages"
  omv_config_add_key "/config/services/customimages" "loginimage" ""
  omv_config_add_key "/config/services/customimages" "blendmode" "normal"
fi

exit 0