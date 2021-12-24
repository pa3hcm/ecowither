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
version. Start the container before running Ecowither.

Now build the Ecowither container from the same directory that holds the
Dockerfile:

```
cd ecowitt
docker build -t ecowither:0.1 .
```

Now run the Ecowither container:

```
docker run -d ecowither:0.1 -p 8088:8088 \
  -e INFLUXDB_URL='http://influxdb2_influxdb_1:8086' \
  -e INFLUXDB_TOKEN='Nw0cN7uOoXWc6TaO7b4f_35-je7nbE1o2uaJjl-pHzwTtbAW-cn-9g==' \
  -e INFLUXDB_ORG=my-weather-station \
  -e STATION_ID=WS1
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
