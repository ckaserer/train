FROM hashicorp/terraform

RUN apk add jq
WORKDIR /opt/train
COPY . .
ENTRYPOINT [ "./entrypoint.sh" ]