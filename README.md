# k8s-sts-socksporxy
A simple stateful set that creates a k8s socks proxy 
This uses https://github.com/httptoolkit/docker-socks-tunnel

To setup a Stateful Set with a socks proxy

# To use:
1.Download 
`wget https://raw.githubusercontent.com/sanxiago/k8s-sts-socksporxy/main/socksproxy.yaml`

2.Deploy proxy in your namespace:
`kubectl apply -f socks_container.yaml -n namespace`

3.Configure your proxy to send all URLS that match, your cluster namespace:
 `*.namespace.svc.cluster.local.*`
 To use `socks5://socksproxy-0:1080`

4.Only needed if you don't have access to the pod 
i.e: running on a mac you need to manually forward the port
 `$ kubectl port-forward pod/socksproxy-0 1080:1080 -n namespace`
