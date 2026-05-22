ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.0.3
FROM ${BUILD_FROM}

# Dépendances pour compiler wize-gateway (Rust)
RUN apk add --no-cache \
    rust \
    cargo \
    build-base \
    git \
    rtl-sdr \
    python3 \
    py3-pip

# Compilation de wize-gateway depuis GitHub
RUN git clone https://github.com/OpenWize/wize-gateway.git /tmp/wize-gateway && \
    cd /tmp/wize-gateway && \
    cargo build --release && \
    cp target/release/wize-gateway /usr/local/bin/wize-gateway && \
    chmod +x /usr/local/bin/wize-gateway && \
    rm -rf /tmp/wize-gateway

# Copie des scripts rootfs
COPY rootfs/ /

# Permissions
RUN chmod a+x /etc/services.d/wize/run \
    && chmod a+x /etc/cont-init.d/10-rtl-sdr \
    && chmod a+x /run.sh

CMD [ "/run.sh" ]


