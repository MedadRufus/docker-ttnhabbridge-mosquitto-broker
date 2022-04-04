FROM eclipse-mosquitto


COPY mosquitto.conf /mosquitto/config/mosquitto.conf
COPY passwdfile /mosquitto/config/passwdfile


CMD ["/usr/sbin/mosquitto","-c","/mosquitto/config/mosquitto.conf"]
