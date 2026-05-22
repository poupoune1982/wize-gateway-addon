#!/usr/bin/with-contenv bash
# Script principal du conteneur

echo "Wize Gateway Add-on démarré"

# Lancer s6-overlay (services)
exec s6-svscan /etc/services.d

