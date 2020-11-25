set -e -x

export NAMESPACE=testns1
export SLEEP_POD=$(kubectl get pod -l app=sleep -n $NAMESPACE -o jsonpath={.items..metadata.name})
watch kubectl exec "${SLEEP_POD}" -c sleep -n $NAMESPACE -- curl -H \"client-id: gogo123\" -sv  "http://httpbin.${NAMESPACE}.svc.cluster.local/headers"
