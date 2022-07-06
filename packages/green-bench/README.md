# Green Bench

Helm chart of the monitoring setup. Deployed successfully on Rancher Desktop, on Windows and Linux.

### Windows
In order to expose your local deployment (by default only reachable locally), you can use a portproxy :
```
netsh interface portproxy add v4tov4 listenport=4000 listenaddress=0.0.0.0 connectport=80 connectaddress=172.22.105.166
```

You will also probably need to add a firewall exception for the port (4000 in the example).

### Linux
You'll mostly need to add a firewall exception rule for the port you wish to use (by default the ingress isreachable on port 80).
