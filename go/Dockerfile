FROM golang:1.26.3-alpine3.23 AS builder

RUN mkdir /app
WORKDIR /app

COPY ./src /app

RUN go mod init hello
RUN go mod tidy
RUN go build


FROM scratch
COPY --from=builder /app/hello /
ENTRYPOINT ["/hello"]
