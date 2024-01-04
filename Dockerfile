ARG GRAFANA_VERSION="latest"

FROM grafana/grafana:${GRAFANA_VERSION}

USER root

# Default values for datasource InfluxDB
ENV GF_INFLUXDB_URL=http://influxdb:8086
ENV GF_INFLUXDB_BUCKET=metrics
ENV GF_INFLUXDB_IS_DEFAULT=true
ENV GF_INFLUXDB_TLS_SKIP_VERIFY=true

# Add datasource config with InfluxDB into container
COPY ./provisioning/datasources/automatic.yaml /

# Add config to run.sh
RUN sed -i '80i# START ---------------- Added by Tilen Komel \<me@komelt.dev\>' /run.sh
RUN sed -i '81icp /automatic.yaml /etc/grafana/provisioning/datasources/' /run.sh
RUN sed -i '82i# END ------------------\n' /run.sh

USER grafana