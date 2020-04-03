FROM  golang:1.14 as build-env
LABEL MAINTAINER="kcoewoys"

ENV GOPROXY=https://goproxy.cn,direct

WORKDIR /home/docker
COPY . .
RUN make

FROM gcr.io/distroless/base
EXPOSE 8888
COPY --from=build-env /home/docker/dogo /home/docker/dogo
CMD ["/home/docker/dogo"]

#docker build -f distroless.Dockerfile -t dogo:dist .
#docker run --rm -p 8888:8888 dogo:dist
