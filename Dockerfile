FROM golang:1.12.1-stretch

RUN echo $GOPATH
RUN mkdir -p /go/src/github.com/AlexAkulov
RUN git clone https://github.com/AlexAkulov/clickhouse-backup.git /go/src/clickhouse-backup
RUN cd /go/src/clickhouse-backup &&  go get
RUN go install clickhouse-backup
ENTRYPOINT [ "clickhouse-backup" ]
CMD [ "--help" ]
