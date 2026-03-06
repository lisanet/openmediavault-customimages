#!/bin/sh
set -e

. /usr/share/openmediavault/scripts/helper-functions

if ! omv_config_exists "/config/system/customimages"; then
  omv_config_add_node "/config/system" "customimages"
  omv_config_add_key "/config/system/customimages" "imagefolder" "/usr/share/openmediavault/customimages/default/"
  omv_config_add_key "/config/system/customimages" "loginimage" "/usr/share/openmediavault/customimages/default/login.jpg"
  omv_config_add_key "/config/system/customimages" "blendmode" "hard-light"
  omv_config_add_key "/config/system/customimages" "standbyimage" "/usr/share/openmediavault/customimages/default/standby.jpg"
  omv_config_add_key "/config/system/customimages" "standbyblendmode" "luminosity"
  omv_config_add_key "/config/system/customimages" "shutdownimage" "/usr/share/openmediavault/customimages/default/shutdown.jpg"
  omv_config_add_key "/config/system/customimages" "shutdownblendmode" "luminosity"
fi

exit 0