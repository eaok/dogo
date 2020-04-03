FROM  golang:latest as build-env
ENV GOPROXY=https://goproxy.cn,direct
WORKDIR /home/docker
COPY . .
RUN make

FROM scratch
LABEL MAINTAINER="kcoewoys"
EXPOSE 8888
COPY --from=build-env /home/docker/dogo /
CMD ["/dogo"]

#docker build -f multiBuild.Dockerfile -t dogo:multi .
#docker run --rm -p 8888:8888 dogo:multi