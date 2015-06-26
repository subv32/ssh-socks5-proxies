portStart=$1
proxySet() {
sshpass -p $1 ssh -N -D $2 $3 $4 $5 &
}

loop=0
while read server
do
  serversMinusPassword=$(echo -e "$server" | cut -d"#" -f1)
  password=$(echo -e "$server" | cut -d"#" -f2- | tr -d [[:space:]])
  port=$(expr $portStart + $loop)
  proxySet $password $port $serversMinusPassword
  let loop=loop+1
done<servers
