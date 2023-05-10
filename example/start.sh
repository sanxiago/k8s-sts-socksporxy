#!/usr/bin/env bash
# This example I use to connect to Confluent Control Center on a Mac
namespace=confluent
url="http://controlcenter.confluent.svc.cluster.local:9021/"
wget -nc "https://raw.githubusercontent.com/sanxiago/k8s-sts-socksporxy/main/socksproxy.yaml"
kubectl apply -f socksproxy.yaml -n $namespace
pkill -f "port-forward pod/socksproxy"
exec kubectl port-forward pod/socksproxy-0 1080:1080 -n ${namespace}&
exec /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --proxy-server='socks5://127.0.0.1:1080' --user-data-dir='/tmp'  --no-first-run $url &
