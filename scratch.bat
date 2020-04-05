@echo off
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=amd64
go build

::docker run --rm -it ^
::-e GOPROXY=https://goproxy.cn,direct -e CGO_ENABLED=0 ^
::-v /c/Users/Administrator/Documents/dogo:/home/dogo ^
::-w /home/dogo golang go build