#!/bin/bash

set -e -u -x -o pipefail

export GOPATH=/go
export PATH=/usr/local/go/bin:$GOPATH/bin:$PATH

go get -u github.com/golang/dep/cmd/dep

mkdir -p $GOPATH/src/istio.io
cd $GOPATH/src/istio.io

if ! [ -d istio ]; then
  git clone https://github.com/istio/istio
fi
cd istio
dep ensure
