#!/bin/bash
set -e -u -o pipefail

apt-get update -y || (sleep 40 && apt-get update -y)
apt-get install -y git build-essential

if [ ! -d /usr/local/go ]; then
  wget -qO- https://storage.googleapis.com/golang/go1.9.4.linux-amd64.tar.gz | tar -C /usr/local -xz
fi

for d in /go /go/src /go/bin /go/pkg
do
  mkdir -p $d
  chown vagrant $d
done
