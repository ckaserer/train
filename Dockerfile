FROM hashicorp/terraform:latest

RUN apk add --no-cache jq 
WORKDIR /opt/train
COPY . .
ENTRYPOINT [ "./entrypoint.sh" ]