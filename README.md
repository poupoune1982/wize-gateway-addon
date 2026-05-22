# Wize Gateway Add-on (RTL-SDR)

Cet add-on Home Assistant permet de recevoir les trames Wize/OMS des compteurs d’eau Suez via une clé RTL-SDR.

## Fonctionnalités
- Lecture des trames Wize 169 MHz
- Décodage via wize-gateway
- Publication MQTT
- Compatible Suez, Veolia, Lyonnaise des Eaux

## Configuration

Dans Home Assistant :

```yaml
frequency: 169475000
gain: 38
mqtt_host: core-mosquitto
mqtt_port: 1883
mqtt_username: ""
mqtt_password: ""
mqtt_topic: "wize"
