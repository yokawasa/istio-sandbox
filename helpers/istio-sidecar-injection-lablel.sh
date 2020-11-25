NAMESPACE=istio-sandbox
kubectl create namespace ${NAMESPACE}
kubectl label namespace ${NAMESPACE} istio-injection=enabled
kubectl get ns ${NAMESPACE} --show-labels
