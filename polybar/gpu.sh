#!/bin/bash

OUTPUT="null"

LOAD=$(cat /sys/class/drm/card0/device/gpu_busy_percent)
TEMP=$(cat /sys/class/drm/card0/device/hwmon/hwmon*/temp1_input | cut -c 1-2)

echo "${LOAD}%  ${TEMP}c"
