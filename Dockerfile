FROM hashicorp/terraform

WORKDIR /opt/train
COPY . .
ENTRYPOINT [ "./entrypoint.sh" ]