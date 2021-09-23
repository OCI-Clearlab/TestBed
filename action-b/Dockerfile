FROM golang:1.16-alpine

ADD entrypoint.sh /entrypoint.sh
ADD hello.go /hello.go
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["./hello"]
