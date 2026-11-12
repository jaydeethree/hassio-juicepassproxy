#!/usr/bin/env bashio

if bashio::config.has_value 'mqtt_host'; then
    export MQTT_HOST="$(bashio::config 'mqtt_host')"
    if bashio::config.has_value 'mqtt_port'; then
        export MQTT_PORT="$(bashio::config 'mqtt_port')"
    else
        export MQTT_PORT="1883"
    fi
    if bashio::config.has_value 'mqtt_username'; then
        export MQTT_USER="$(bashio::config 'mqtt_username')"
    fi
    if bashio::config.has_value 'mqtt_password'; then
        export MQTT_PASS="$(bashio::config 'mqtt_password')"
    fi
elif bashio::services.available 'mqtt'; then
    bashio::log.info "Auto-discovering MQTT broker settings from Home Assistant..."
    export MQTT_HOST="$(bashio::services mqtt 'host')"
    export MQTT_PORT="$(bashio::services mqtt 'port')"
    export MQTT_USER="$(bashio::services mqtt 'username')"
    export MQTT_PASS="$(bashio::services mqtt 'password')"
else
    bashio::exit.nok "No MQTT broker configured and no Home Assistant MQTT service found. Please configure mqtt_host or install an MQTT broker app (such as Mosquitto)."
fi
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
