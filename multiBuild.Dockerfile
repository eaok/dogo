FROM  golang:latest as build-env
#https://yryz.net/post/golang-docker-alpine-start-panic.html
ENV GOPROXY=https://goproxy.cn,direct CGO_ENABLED=0
WORKDIR /home/docker
COPY . .
RUN make

FROM alpine:latest
LABEL MAINTAINER="kcoewoys"
EXPOSE 8888
COPY --from=build-env /home/docker/dogo /home/docker/
CMD ["/home/docker/dogo"]

#docker build -f multiBuild.Dockerfile -t dogo:multi .
#docker run --rm -p 8888:8888 dogo:multi