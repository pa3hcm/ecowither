# Ecowither

## Introduction

This is a simple application to log data of my weather station to InfluxDB.
Once stored in InfluxDB it is easy to build Grafana dashboards to present the
weather data and include weather data on my website.

I really don't know if this works for other weather stations, I only tested
this with my own station which is a 'Halley Professional Weather Station'
which also identifies itself as Ecowitt WH2650A.


## My setup

My weather station logs data to a server that runs Ecowither and InfluxDB
(both running in Docker containers). Using the WS View app I configure a
customized weather service. I selected the 'ecowitt' protocol type, since
this includes data of additional sensors (Wunderground doesn't).

## How to run

I selected InfluxDB v2 as a reliable and easy-to-use time series database.
The code includes an example docker-compose.yml to start the containerized
version. Start the container before running Ecowither:

```
cd influxdb
docker-compose up -d
cd ..
```

Now build the Ecowither container from the same directory that holds the
Dockerfile:

```
docker build -t ecowither:0.1 .
```

Now run the Ecowither container. Ensure the network name is set correctly
(use `docker network ls` to find out the correct network name created by
the InfluxDB container). Also check the name of the InfluxDB container in
the given URL (use `docker ps`).

```
docker run -d --name ecowither --network influxdb2_ecowitt_net -p 8088:8088 \
  -e INFLUXDB_ORG=my-weather-station -e STATION_ID=WS1 \
  -e INFLUXDB_URL='http://influxdb2_influxdb_1:8086/' \
  -e INFLUXDB_TOKEN='RbvidPcc6x8h8Ym2D8t4M3qC37Rx4_V76LFCRGASHJyRlwJQ==' \
  ecowither:0.1
```


## License

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see <https://www.gnu.org/licenses/>.
