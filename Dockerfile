FROM grafana/grafana:latest

COPY ./provisioning/datasources/automatic.yaml /etc/grafana/provisioning/datasources/