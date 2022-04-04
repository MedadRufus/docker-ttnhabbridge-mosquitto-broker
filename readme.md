# How to run the docker image

First, you will have to generate a password and username file, which will then be copied over to the docker image. Do so by running(change the username field to your own):
```
mosquitto_passwd -c passwdfile <username>
```
You will be promped to key in a password for this user name. An example command could be:
```
mosquitto_passwd -c passwdfile medad

```

Then build the image:
```
docker build -t mqtt_broker .
```

Then run it. The port specified in the command should match the port in the `mosquitto.conf` file, under the `listener` field. It can be changed as necessary.

```
docker run -p 1887:1887 mqtt_broker
```

## test the broker
```
mosquitto_pub -h localhost -p 1887 -t my-mqtt-topic -m "sample-msg-1" -u "medad" -P "mqttTestBeyond"
```

## Subscribing to uplink packets on the Helium Network
```
docker run hivemq/mqtt-cli sub -V 3 -t helium/+/rx -h beta.medadnewman.co.uk -p 1887 -u "medad" -pw "mqttTestBeyond"
```

You should see an output like this when packets come in:
```
(base) medad@medad-ThinkPad-P51:~/Documents/GitHub/mosquitto-docker$ d
ocker run hivemq/mqtt-cli sub -V 3 -t helium/+/rx -h beta.medadnewman.co.uk -p 1887 -u "medad" -pw "mqttTestBeyond"
{
  "id": "dbf4cbbb-2b09-4fd7-83b5-7274de29928c",
  "name": "virtual-device-us",
  "app_eui": "6081F9C2627E358C",
  "dev_eui": "6081F9C2F457D396",
  "devaddr": "18000048",
  "downlink_url": "",
  "fcnt": "0",
  "port": "243",
  "payload": "RKANDw==",
  "reported_at": "1634770613902"
}
```
