## Unreleased
- Auto-discover Home Assistant's internal MQTT broker (such as Mosquitto) when mqtt_host is not configured, and make MQTT options optional so unauthenticated and external brokers are supported
- Fix some configuration fields passing literal "null" string to JuicePassProxy
- Persist juicepassproxy.yaml in Home Assistant's /data volume across restarts and updates
- Disable duplicate file logging inside the container since Home Assistant already captures stdout/stderr
- Clean up and consolidate Dockerfile layers
- Improve container stop/restart signal handling (SIGTERM forwarding)
- Expose optional device_name and mqtt_discovery_prefix configuration options
- Add missing UI translation for enelx_ip, add network port description for 8047/udp, and fix minor description typos
- Add in-app README.md / DOCS.md links and url metadata
- Various CI improvements

## 0.5.1.16
- Hotfix release for https://github.com/jaydeethree/hassio-juicepassproxy/issues/20

## 0.5.1.15
- Bump base images to [2026.10.0](https://github.com/home-assistant/docker-base/releases/tag/2026.10.0)

## 0.5.1.14
- Bump base images to [2026.08.0](https://github.com/home-assistant/docker-base/releases/tag/2026.08.0)

## 0.5.1.13
- Bump base images to [2026.06.1](https://github.com/home-assistant/docker-base/releases/tag/2026.06.1)

## 0.5.1.12
- Bump base images to [2026.05.0](https://github.com/home-assistant/docker-base/releases/tag/2026.05.0)

## 0.5.1.11
- Add an option to enable the `experimental` flag for JuicePassProxy (https://github.com/jaydeethree/hassio-juicepassproxy/issues/6)

## 0.5.1.10
- Migrate to new Home Assistant builder (https://developers.home-assistant.io/blog/2026/04/02/builder-migration/)

## 0.5.1.09
- Bump base images to [2026.04.0](https://github.com/home-assistant/docker-base/releases/tag/2026.04.0)

## 0.5.1.08
- Update base image from Alpine 3.21 to Alpine 3.22
- Update Python from 3.12 to 3.13
- Drop support for `armhf`, `armv7`, and `i386` architectures since they're no longer supported by Home Assistant
- Bump base images to [2026.02.0](https://github.com/home-assistant/docker-base/releases/tag/2026.02.0)
- Added Dependabot and bumped versions for several dependencies

## 0.5.1.07
- Bump base image to [2025.12.0](https://github.com/home-assistant/docker-base/releases/tag/2025.12.0)

## 0.5.1.06
- Bump base image to [2025.11.1](https://github.com/home-assistant/docker-base/releases/tag/2025.11.1)

## 0.5.1.05
- Bump base image to [2025.11.0](https://github.com/home-assistant/docker-base/releases/tag/2025.11.0)

## 0.5.1.04
- Bump base image to [2025.10.0](https://github.com/home-assistant/docker-base/releases/tag/2025.10.0)

## 0.5.1.03
- Bump base image to [2025.09.0](https://github.com/home-assistant/docker-base/releases/tag/2025.09.0)

## 0.5.1.02
- Create separate images for each CPU architecture

## 0.5.1.01
- Initial release
