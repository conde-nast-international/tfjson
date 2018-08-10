FROM golang:alpine
ENV GOBIN $GOPATH/bin
WORKDIR .
RUN apk update && apk upgrade && \
    apk add --no-cache git && \
    go get github.com/conde-nast-international/tfjson
#ENTRYPOINT ./goapp
CMD ["./bin/tfjson"]
