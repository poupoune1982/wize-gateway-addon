ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.0.3
FROM ${BUILD_FROM}

# Installation des dépendances
RUN apk add --no-cache rtl-sdr python3 py3-pip

# Installation de wize-gateway
RUN pip3 install wize-gateway

# Copie des scripts rootfs
COPY rootfs/ /

# Permissions
RUN chmod a+x /etc/services.d/wize/run \
    && chmod a+x /etc/cont-init.d/10-rtl-sdr \
    && chmod a+x /run.sh

# Script principal
CMD [ "/run.sh" ]

