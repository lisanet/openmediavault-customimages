#!/bin/sh
set -e

. /usr/share/openmediavault/scripts/helper-functions

if ! omv_config_exists "/config/services/customimages"; then
  omv_config_add_node "/config/services" "customimages"
  omv_config_add_key "/config/services/customimages" "loginimage" "/usr/share/openmediavault/customimages/default/login.jpg"
  omv_config_add_key "/config/services/customimages" "blendmode" "hard-light"
  omv_config_add_key "/config/services/customimages" "standbyimage" "/usr/share/openmediavault/customimages/default/standby.jpg"
  omv_config_add_key "/config/services/customimages" "standbyblendmode" "luminosity"
  omv_config_add_key "/config/services/customimages" "shutdownimage" "/usr/share/openmediavault/customimages/default/shutdown.jpg"
  omv_config_add_key "/config/services/customimages" "shutdownblendmode" "luminosity"
fi

exit 0