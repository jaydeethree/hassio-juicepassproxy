ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV DEBUG=false

RUN mkdir -p /juicepassproxy
RUN mkdir -p /log
RUN mkdir -p /config
RUN apk add --no-cache py3-pip
RUN curl -J -L -o /tmp/jpp.tar.gz \
    "https://github.com/JuiceRescue/juicepassproxy/archive/refs/tags/v0.5.1.tar.gz" \
    && tar xvfz /tmp/jpp.tar.gz --strip 1 -C /juicepassproxy
RUN pip install --root-user-action=ignore --no-cache-dir -r /juicepassproxy/requirements.txt
RUN chmod -f +x /juicepassproxy/*.sh

COPY run.sh /run.sh
RUN chmod -f +x /run.sh

ENTRYPOINT /run.sh