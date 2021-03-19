FROM golang:1.16.2-alpine3.13 AS build

WORKDIR /go/src/influxdb-relay

COPY . /go/src/influxdb-relay/

RUN go build -o /bin/influxdb-relay



FROM alpine:3.13.2

COPY --from=build /bin/influxdb-relay /influxdb-relay

ENTRYPOINT ["/influxdb-relay"]

CMD ["-config","relay.toml"]
