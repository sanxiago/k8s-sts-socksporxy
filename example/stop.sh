#!/usr/bin/env bash
namespace=confluent

kubectl delete -f socksproxy.yaml -n $namespace
pkill -f "port-forward pod/socksproxy"
