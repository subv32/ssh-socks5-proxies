# ssh-socks5-proxies
Creates socks5 proxies from a list of servers

This script will create socks5 proxies from a list of servers. The first and only argument passed to the script should be the port number to start with, the first server in the file "servers" will be bound to that port. Each server after will be bound to initial port + increment

Servers should be a file in the same directory that looks like this:
```
user@ip # password
user@ip -p port #password
user@ip # password
user@ip #password
```

Example:
File: servers
```
root@example.com #oranges
root@example2.com # bannanas
root@example3.com # apples
```

Then run
```
./createProxies.sh 1080
```

Now say we want to make some requests to google using curl and our newly created proxies:
```
curl --socks5 localhost:1080 google.com #example.com
curl --socks5 localhost:1081 google.com #example2.com
curl --socks5 localhost:1082 google.com #example3.com
```

