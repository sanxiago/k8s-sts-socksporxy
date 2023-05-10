# k8s-sts-socksporxy
A simple stateful set that creates a k8s socks proxy 
This uses https://github.com/httptoolkit/docker-socks-tunnel

To setup a Stateful Set with a socks proxy

# To use:

1. Deploy proxy in your namespace:
`kubectl apply -f socks_container.yaml -n namespace`

2. Configure your proxy to send all URLS that match, your cluster namespace:
 `*.namespace.svc.cluster.local.*`

 If running on a mac you need to manually forward the port
 `$ kubectl port-forward pod/socksproxy-0 1080:1080 -n namespace`
