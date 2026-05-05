#!/bin/sh
set -e

. /usr/share/openmediavault/scripts/helper-functions

SERVICE_XPATH_NAME="customimages"
SERVICE_XPATH="/config/system/${SERVICE_XPATH_NAME}"

if ! omv_config_exists "${SERVICE_XPATH}/lighttheme"; then
  omv_config_add_key "${SERVICE_XPATH}" "lighttheme" "0"
  omv_config_add_key "${SERVICE_XPATH}" "darktheme" "0"

  omv-salt stage run --quiet prepare
fi

exit 0