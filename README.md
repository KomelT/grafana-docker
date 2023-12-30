[![GitHub](https://img.shields.io/badge/GitHub-grafana-blue?logo=github)](https://github.com/KomelT/grafana-docker)
[![DockerHub](https://img.shields.io/badge/Docker-komelt/grafana-blue?logo=docker)](https://hub.docker.com/r/komelt/grafana)
# Grafana
I was missing option to pass datasources info trough env variables.

I added new file to [grafana/grafana:latest](https://hub.docker.com/r/grafana/grafana) which adds new datasource based on data passed trough envs.
```yaml
# /etc/grafana/provisioning/datasources/automatic.yaml
apiVersion: 1

deleteDatasources:
  - name: InfluxDB
    orgId: 1

datasources:
  - name: InfluxDB
    type: influxdb
    access: proxy
    orgId: 1
    url: ${GF_INFLUXDB_URL}
    secureJsonData:
      token: ${GF_INFLUXDB_TOKEN}
    editable: false
    isDefault: ${GF_INFLUXDB_IS_DEFAULT}
    jsonData:
      version: Flux
      organization: ${GF_INFLUXDB_ORG}
      defaultBucket: ${GF_INFLUXDB_BUCKET}
      tlsSkipVerify: ${GF_INFLUXDB_TLS_SKIP_VERIFY}
```

## Usage Example
```yaml
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