#!/bin/bash
set -u -e -o pipefail

cat >> $HOME/.profile <<'EOF'
export GOPATH=/go
export PATH=/usr/local/go/bin:$GOPATH/bin:$PATH
export ISTIO_BIN=$GOPATH/out
export KUBECONFIG=$GOPATH/src/istio.io/istio/.circleci/config
EOF

echo 'source $HOME/.profile' >> $HOME/.bashrc
source $HOME/.profile

dep version || go get github.com/golang/dep/cmd/dep

mkdir -p $GOPATH/src/istio.io
cd $GOPATH/src/istio.io
if [ ! -d istio ]; then
  git clone https://github.com/istio/istio
fi
