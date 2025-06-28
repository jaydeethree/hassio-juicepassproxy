#!/usr/bin/env bashio

export MQTT_HOST="$(bashio::config 'mqtt_host')"
export MQTT_PORT="$(bashio::config 'mqtt_port')"
export MQTT_USER="$(bashio::config 'mqtt_username')"
export MQTT_PASS="$(bashio::config 'mqtt_password')"
export IGNORE_ENELX="$(bashio::config 'ignore_enelx')"
export JUICEBOX_HOST="$(bashio::config 'juicebox_host')"
export JUICEBOX_ID="$(bashio::config 'juicebox_id')"
export UPDATE_UDPC="$(bashio::config 'update_udpc')"
export JPP_HOST="$(bashio::config 'jpp_host')"
export DEBUG="$(bashio::config 'debug')"

/juicepassproxy/docker_entrypoint.sh