set -e -x

export NAMESPACE=testns1
export FORTIO_POD=$(kubectl get pods -lapp=fortio -n $NAMESPACE -o 'jsonpath={.items[0].metadata.name}')
kubectl exec "$FORTIO_POD" -c fortio -n $NAMESPACE -- /usr/bin/fortio load -c 11 -qps 0 -n 100 -loglevel Warning http://httpbin.${NAMESPACE}.svc.cluster.local/get
