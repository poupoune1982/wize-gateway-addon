ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.0.3
FROM ${BUILD_FROM}

# Dépendances runtime
RUN apk add --no-cache rtl-sdr python3 py3-pip

# Copie du binaire wize-gateway (fourni par toi dans rootfs/usr/local/bin/)
COPY rootfs/usr/local/bin/wize-gateway /usr/local/bin/wize-gateway
RUN chmod +x /usr/local/bin/wize-gateway

# Copie des scripts rootfs
COPY rootfs/ /

# Permissions
RUN chmod a+x /etc/services.d/wize/run \
    && chmod a+x /etc/cont-init.d/10-rtl-sdr \
    && chmod a+x /run.sh

CMD [ "/run.sh" ]
