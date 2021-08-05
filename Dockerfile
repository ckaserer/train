FROM hashicorp/terraform:1.0.4

RUN apk add --no-cache jq 
WORKDIR /opt/train
COPY . .
ENTRYPOINT [ "./entrypoint.sh" ]