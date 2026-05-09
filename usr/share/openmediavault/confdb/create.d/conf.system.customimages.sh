#!/bin/sh
set -e

. /usr/share/openmediavault/scripts/helper-functions

if ! omv_config_exists "/config/system/customimages"; then
  omv_config_add_node "/config/system" "customimages"
  omv_config_add_key "/config/system/customimages" "imagefolder" "/usr/share/openmediavault/customimages/default/"
  omv_config_add_key "/config/system/customimages" "loginimage" "login.jpg"
  omv_config_add_key "/config/system/customimages" "standbyimage" "standby.jpg"
  omv_config_add_key "/config/system/customimages" "shutdownimage" "shutdown.jpg"
  omv_config_add_key "/config/system/customimages" "lighttheme" "0"
  omv_config_add_key "/config/system/customimages" "darktheme" "0"
  omv_config_add_key "/config/system/customimages" "customcolor" "0"
  omv_config_add_key "/config/system/customimages" "hue" "200"
fi

exit 0