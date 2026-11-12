FROM ghcr.io/home-assistant/base-python:3.13-alpine3.22-2026.10.0

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

ARG JPP_VERSION=0.5.1
ARG JPP_SHA256=801507ea668286a750faddd258341461a8c7971ebc89894c46a4dee089263d0e
ENV DEBUG=false \
    LOG_LOC=none

RUN mkdir -p /juicepassproxy \
    && ln -s /data /config \
    && curl -fsSL -o /tmp/jpp.tar.gz \
        "https://github.com/JuiceRescue/juicepassproxy/archive/refs/tags/v${JPP_VERSION}.tar.gz" \
    && echo "${JPP_SHA256}  /tmp/jpp.tar.gz" | sha256sum -c - \
    && tar xzf /tmp/jpp.tar.gz --strip 1 -C /juicepassproxy \
    && rm -f /tmp/jpp.tar.gz \
    && pip install --root-user-action=ignore --no-cache-dir -r /juicepassproxy/requirements.txt \
    && chmod -f +x /juicepassproxy/*.sh

COPY --chmod=755 run.sh /run.sh

ENTRYPOINT ["/run.sh"]
