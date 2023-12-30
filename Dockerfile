FROM grafana/grafana:latest

ENV GF_INFLUXDB_URL=http://influxdb:8086
ENV GF_INFLUXDB_BUCKET=metrics
ENV GF_INFLUXDB_IS_DEFAULT=true
ENV GF_INFLUXDB_TLS_SKIP_VERIFY=true

COPY ./provisioning/datasources/automatic.yaml /etc/grafana/provisioning/datasources/