# mikrotik

80 -> webserver
443 -> webserver
51820 -> wireguard

http://192.168.88.1/webfig/#IP:Cloud

- ddns: enable
- dns name: "d4500e0ffc99.sn.mynetname.net" <- on table

## setup portforwarding

```bash
/ip cloud set ddns-enabled=yes
# verify dns-name (d4500e0ffc99.sn.mynetname.net)
/ip cloud print

# add ddns to addresslist
/ip firewall address-list
add address=d4500e0ffc99.sn.mynetname.net list=MyDDNS #replace suffix if different

# portforwarding
/ip firewall nat
add chain=dstnat dst-address-list=MyDDNS dst-port=80 protocol=tcp to-address=192.168.88.11 to-ports=80 action=dst-nat
add chain=dstnat dst-address-list=MyDDNS dst-port=443 protocol=tcp to-address=192.168.88.11 to-ports=443 action=dst-nat
add chain=dstnat dst-address-list=MyDDNS dst-port=51820 protocol=tcp to-address=192.168.88.3 to-ports=51820 action=dst-nat
```
