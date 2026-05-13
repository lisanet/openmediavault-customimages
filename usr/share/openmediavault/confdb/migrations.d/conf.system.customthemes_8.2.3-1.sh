#!/bin/bash
set -e

. /usr/share/openmediavault/scripts/helper-functions

SERVICE_XPATH_NAME="customthemes"
SERVICE_XPATH="/config/system/${SERVICE_XPATH_NAME}"

if ! omv_config_exists "${SERVICE_XPATH}/removecursor"; then
    omv_config_add_key "${SERVICE_XPATH}" "removecursor" "0"
   omv_config_add_key "${SERVICE_XPATH}" "wallpapers" "0"

   omv-salt stage run --quiet prepare
fi

f="$(omv_config_get /config/system/customthemes/imagefolder)"
if [[ "$f" =~ "/customthemes/default/" ]]; then
    omv_config_update "/config/system/customthemes/imagefolder" "/usr/share/openmediavault/customthemes/"
else
    omv_config_update "/config/system/customthemes/wallpapers" "1"
fi

exit 0