#!/usr/bin/env bashio
# shellcheck shell=bash

if bashio::config.has_value 'mqtt_host'; then
    MQTT_HOST="$(bashio::config 'mqtt_host')"
    export MQTT_HOST
    if bashio::config.has_value 'mqtt_port'; then
        MQTT_PORT="$(bashio::config 'mqtt_port')"
    else
        MQTT_PORT="1883"
    fi
    export MQTT_PORT
    if bashio::config.has_value 'mqtt_username'; then
        MQTT_USER="$(bashio::config 'mqtt_username')"
        export MQTT_USER
    fi
    if bashio::config.has_value 'mqtt_password'; then
        MQTT_PASS="$(bashio::config 'mqtt_password')"
        export MQTT_PASS
    fi
elif bashio::services.available 'mqtt'; then
    if bashio::config.has_value 'mqtt_port' || bashio::config.has_value 'mqtt_username' || bashio::config.has_value 'mqtt_password'; then
        bashio::log.warning "mqtt_port, mqtt_username, or mqtt_password is set without mqtt_host; ignoring them and using Home Assistant MQTT auto-discovery instead."
    fi
    bashio::log.info "Auto-discovering MQTT broker settings from Home Assistant..."
    MQTT_HOST="$(bashio::services mqtt 'host')"
    MQTT_PORT="$(bashio::services mqtt 'port')"
    MQTT_USER="$(bashio::services mqtt 'username')"
    MQTT_PASS="$(bashio::services mqtt 'password')"
    export MQTT_HOST MQTT_PORT MQTT_USER MQTT_PASS
else
    bashio::exit.nok "No MQTT broker configured and no Home Assistant MQTT service found. Please configure mqtt_host or install an MQTT broker app (such as Mosquitto)."
fi

IGNORE_ENELX="$(bashio::config 'ignore_enelx')"
ENELX_IP="$(bashio::config 'enelx_ip')"
UPDATE_UDPC="$(bashio::config 'update_udpc')"
export IGNORE_ENELX ENELX_IP UPDATE_UDPC

if bashio::config.true 'update_udpc'; then
    if ! bashio::config.has_value 'juicebox_host' || ! bashio::config.has_value 'jpp_host'; then
        bashio::exit.nok "When update_udpc is enabled, both juicebox_host and jpp_host must be configured."
    fi
fi

if ! bashio::config.true 'ignore_enelx' && [[ "${ENELX_IP}" == "127.0.0.1" ]]; then
    bashio::exit.nok "When ignore_enelx is disabled, enelx_ip cannot be 127.0.0.1. Please configure a valid EnelX server IP or enable ignore_enelx."
fi

if bashio::config.has_value 'juicebox_host'; then
    JUICEBOX_HOST="$(bashio::config 'juicebox_host')"
    export JUICEBOX_HOST
fi

if bashio::config.has_value 'juicebox_id'; then
    JUICEBOX_ID="$(bashio::config 'juicebox_id')"
    export JUICEBOX_ID
fi

if bashio::config.has_value 'jpp_host'; then
    JPP_HOST="$(bashio::config 'jpp_host')"
    export JPP_HOST
fi

if bashio::config.has_value 'device_name'; then
    DEVICE_NAME="$(bashio::config 'device_name')"
    export DEVICE_NAME
fi

if bashio::config.has_value 'mqtt_discovery_prefix'; then
    MQTT_DISCOVERY_PREFIX="$(bashio::config 'mqtt_discovery_prefix')"
    export MQTT_DISCOVERY_PREFIX
fi

if bashio::config.true 'experimental'; then
    export EXPERIMENTAL="true"
fi

if bashio::config.true 'debug'; then
    export DEBUG="true"
else
    export DEBUG="false"
fi

exec /juicepassproxy/docker_entrypoint.sh
