# Grafana

## Why?
I was missing option to pass datasources info trough env variables.

## Usage
```bash
version: "3.9"
services:

  grafana:
    image: komelt/grafana:latest
    container_name: grafana
    ports:
      - 3000:3000
    environment:
      GF_INFLUXDB_URL: "http://influxdb:8086" # deault: http://influxdb:8086
      GF_INFLUXDB_TOKEN: "th1515ntr3alt0k3n=="
      GF_INFLUXDB_ORG: "testorg"
      GF_INFLUXDB_BUCKET: "testbucket" # default: metrics
      GF_INFLUXDB_IS_DEFAULT: true # default: true
      GF_INFLUXDB_TLS_SKIP_VERIFY: true # default: true
```