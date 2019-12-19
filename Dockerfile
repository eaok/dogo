FROM golang:1.12
LABEL MAINTAINER="kcoewoys"

ENV GO111MODULE on
EXPOSE 9999
WORKDIR /go/src/docker

COPY . .

RUN go mod vendor

RUN make

CMD [ "bash", "-c", "/go/src/docker/go-docker" ]
