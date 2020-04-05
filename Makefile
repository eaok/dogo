BINARY=dogo

VERSION=1.0.0

BUILD=`date +%FT%T%z`

default:
	go build -o ${BINARY}  -tags=jsoniter

docker: alpine dist golang multi latest scratch clean

alpine:
	docker build -f alpine.Dockerfile -t ${BINARY}:alpine .

dist:
	docker build -f distroless.Dockerfile -t ${BINARY}:dist .

golang:
	docker build -f golang.Dockerfile -t ${BINARY}:golang .

multi:
	docker build -f multiBuild.Dockerfile -t ${BINARY}:multi .

latest:
	docker build -t ${BINARY}:latest .

scratch:
#	@scratch.bat
#	go build -o ${BINARY} #环境变量设置不成功过，在bat中编译
	docker run --rm -it -e GOPROXY=https://goproxy.cn,direct -e CGO_ENABLED=0 -v /c/Users/Administrator/Documents/dogo:/home/dogo -w /home/dogo golang go build
	docker build -f scratch.Dockerfile -t ${BINARY}:scratch .


clean:
	del $(BINARY)

.PHONY: clean docker alpine dist golang multi latest scratch