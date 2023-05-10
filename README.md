# k8s-sts-socksporxy
A simple stateful set that creates a k8s socks proxy 
This uses https://github.com/httptoolkit/docker-socks-tunnel

To setup a Stateful Set with a socks proxy

# To use:

1. Download 
```
wget https://raw.githubusercontent.com/sanxiago/k8s-sts-socksporxy/main/socksproxy.yaml
```

2. Deploy proxy in your namespace:
```
kubectl apply -f socks_container.yaml -n namespace
```

3. Configure your proxy to send all URLS that match:
```
 *.namespace.svc.cluster.local.*
```
For your namespace to use your socksproxy
```
socks5h://localhost:1080
```
4. If you need forward the port, this is required on a MAC
```
 $ kubectl port-forward pod/socksproxy-0 1080:1080 -n namespace`
```
For example using curl:
```
curl http://my_service.my_namespace.svc.cluster.local:9021 --socks5-hostname localhost
```
