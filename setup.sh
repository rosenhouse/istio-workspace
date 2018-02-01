#!/bin/bash

set -e -u -x -o pipefail

export GOPATH=/go
export PATH=/usr/local/go/bin:$GOPATH/bin:$PATH

cd $GOPATH/src/istio.io/istio

go get -u github.com/golang/dep/cmd/dep
