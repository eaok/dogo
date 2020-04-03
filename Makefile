BINARY=dogo

VERSION=1.0.0

BUILD=`date +%FT%T%z`

default:
	go build -o ${BINARY}  -tags=jsoniter


docker:
	docker build -f alpine.Dockerfile -t ${BINARY}:alpine .
	docker build -f distroless.Dockerfile -t ${BINARY}:dist .
	docker build -f golang.Dockerfile -t ${BINARY}:golang .
	docker build -f scratch.Dockerfile -t ${BINARY}:scratch .
	docker build -f multiBuild.Dockerfile -t ${BINARY}:multi .

clean:
	if [ -f ${BINARY} ] ; then rm ${BINARY} ; fi

.PHONY:  clean