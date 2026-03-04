#!/bin/sh
set -e

. /usr/share/openmediavault/scripts/helper-functions

# Standardwerte in die OMV-Konfig-DB schreiben, falls noch nicht vorhanden
if ! omv_config_exists "/config/services/customimages"; then
  omv_config_add_node "/config/services" "customimages"
  omv_config_add_key "/config/services/customimages" "loginimage" "/var/www/openmediavault/assets/images/login.jpg"
  omv_config_add_key "/config/services/customimages" "blendmode" "hard-light"
  omv_config_add_key "/config/services/customimages" "standbyimage" "/var/www/openmediavault/assets/images/standby.jpg"
  omv_config_add_key "/config/services/customimages" "standbyblendmode" "luminosity"
  omv_config_add_key "/config/services/customimages" "shutdownimage" "/var/www/openmediavault/assets/images/shutdown.jpg"
  omv_config_add_key "/config/services/customimages" "shutdownblendmode" "luminosity"
fi

exit 0