#!/usr/bin/env bashio

export MQTT_HOST="$(bashio::config 'mqtt_host')"
export MQTT_PORT="$(bashio::config 'mqtt_port')"
export MQTT_USER="$(bashio::config 'mqtt_username')"
export MQTT_PASS="$(bashio::config 'mqtt_password')"
export IGNORE_ENELX="$(bashio::config 'ignore_enelx')"
export ENELX_IP="$(bashio::config 'enelx_ip')"
export UPDATE_UDPC="$(bashio::config 'update_udpc')"

if bashio::config.has_value 'juicebox_host'; then
    export JUICEBOX_HOST="$(bashio::config 'juicebox_host')"
fi

if bashio::config.has_value 'juicebox_id'; then
    export JUICEBOX_ID="$(bashio::config 'juicebox_id')"
fi

if bashio::config.has_value 'jpp_host'; then
    export JPP_HOST="$(bashio::config 'jpp_host')"
fi

if bashio::config.true 'experimental'; then
    export EXPERIMENTAL="true"
fi

if bashio::config.true 'debug'; then
    export DEBUG="true"
else
    export DEBUG="false"
fi

/juicepassproxy/docker_entrypoint.sh
