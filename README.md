# istio-workspace

```
vagrant up
vagrant ssh
```

then something like 

```
cd /go/src/istio.io/istio
export ISTIO_BIN=/go/bin
export KUBECONFIG=$PWD/.circleci/config
make pilot-test
```
