ARG GRAFANA_VERSION="latest"

FROM grafana/grafana:${GRAFANA_VERSION}

# Default values for Datasource InfluxDB
ENV GF_INFLUXDB_URL=http://influxdb:8086
ENV GF_INFLUXDB_BUCKET=metrics
ENV GF_INFLUXDB_IS_DEFAULT=true
ENV GF_INFLUXDB_TLS_SKIP_VERIFY=true

# Add Datasources config with InfluxDB into Datasources folder
COPY ./provisioning/datasources/automatic.yaml /etc/grafana/provisioning/datasources/