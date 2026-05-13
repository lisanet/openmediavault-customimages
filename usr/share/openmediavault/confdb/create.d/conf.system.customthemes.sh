#!/bin/sh
set -e

. /usr/share/openmediavault/scripts/helper-functions

if ! omv_config_exists "/config/system/customthemes"; then
  omv_config_add_node "/config/system" "customthemes"
  omv_config_add_key "/config/system/customthemes" "imagefolder" "/usr/share/openmediavault/customthemes/default/"
  omv_config_add_key "/config/system/customthemes" "loginimage" "login.jpg"
  omv_config_add_key "/config/system/customthemes" "standbyimage" "standby.jpg"
  omv_config_add_key "/config/system/customthemes" "shutdownimage" "shutdown.jpg"
  omv_config_add_key "/config/system/customthemes" "lighttheme" "0"
  omv_config_add_key "/config/system/customthemes" "darktheme" "0"
  omv_config_add_key "/config/system/customthemes" "removecursor" "0"
  omv_config_add_key "/config/system/customthemes" "customcolor" "0"
  omv_config_add_key "/config/system/customthemes" "hue" "200"
  omv_config_add_key "/config/system/customthemes" "wallpapers" "0"
fi

exit 0