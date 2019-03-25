# Build container
FROM golang:1.12.1-stretch

RUN echo $GOPATH
RUN mkdir -p /go/src/github.com/AlexAkulov
RUN git clone https://github.com/AlexAkulov/clickhouse-backup.git /go/src/clickhouse-backup
RUN cd /go/src/clickhouse-backup &&  go get
WORKDIR /go/src/clickhouse-backup
RUN go get
RUN go build -o /clickhouse-backup .

# Run container
FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -yqq  \
    ca-certificates \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*
COPY --from=0 /clickhouse-backup /usr/local/bin/
RUN chmod +x /usr/local/bin/clickhouse-backup
ENTRYPOINT [ "clickhouse-backup" ]
CMD [ "--help" ]
