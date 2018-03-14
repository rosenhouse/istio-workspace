#!/bin/bash
set -u -e -o pipefail

cat >> $HOME/.profile <<'EOF'
export GOPATH=/go
export PATH=/usr/local/go/bin:$GOPATH/bin:$PATH
export ISTIO_BIN=$GOPATH/out
export KUBECONFIG=$GOPATH/src/istio.io/istio/.circleci/config
EOF

source $HOME/.profile

go get -u istio.io/istio || true
