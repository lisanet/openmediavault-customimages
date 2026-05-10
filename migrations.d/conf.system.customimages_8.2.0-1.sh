#!/bin/sh
set -e

. /usr/share/openmediavault/scripts/helper-functions

SERVICE_XPATH_NAME="customthemes"
SERVICE_XPATH="/config/system/${SERVICE_XPATH_NAME}"

if ! omv_config_exists "${SERVICE_XPATH}/customcolor"; then
  omv_config_add_key "${SERVICE_XPATH}" "customcolor" "0"
  omv_config_add_key "${SERVICE_XPATH}" "hue" "200"

  omv-salt stage run --quiet prepare
fi

exit 0