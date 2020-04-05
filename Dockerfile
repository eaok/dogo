FROM  golang:latest as build-env
ENV GOPROXY=https://goproxy.cn,direct CGO_ENABLED=0
WORKDIR /home/docker
COPY . .
RUN make

FROM scratch
LABEL MAINTAINER="kcoewoys"
EXPOSE 8888
COPY --from=build-env /home/docker/dogo /
CMD ["/dogo"]