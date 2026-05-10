#!/bin/sh
set -e

. /usr/share/openmediavault/scripts/helper-functions

SERVICE_XPATH_NAME="customthemes"
SERVICE_XPATH="/config/system/${SERVICE_XPATH_NAME}"

if omv_config_exists "${SERVICE_XPATH}/blendmode"; then
  omv_config_delete "${SERVICE_XPATH}/blendmode"
  omv_config_delete "${SERVICE_XPATH}/standbyblendmode"
  omv_config_delete "${SERVICE_XPATH}/shutdownblendmode"

  omv-salt stage run --quiet prepare
fi

exit 0