# Installation of k3s
192.168.88.2

## tools
| name          | description          | url                                        |
| ------------- | -------------------- | ------------------------------------------ |
| k3sup         | k3s over ssh         | https://github.com/alexellis/k3sup         |
| fedora server | Fedora Server 38 DVD | https://fedoraproject.org/server/download/ |

## create Fedora VM in proxmox
| property      | value                               |
| ------------- | ----------------------------------- |
| node          | pve                                 |
| vm id         | 100                                 |
| name          | webserver                           |
| start at boot | true                                |
| os            | value                               |
| iso           | fedora-server-dvd-x86_64-38-1.6.iso |
| machine       | q35                                 |
| qemu agent    | true                                |
| cores         | 5                                   |
| memory        | 24000                               |
| ip            | 192.168.88.2                        |
| gateway       | 192.168.88.1                        |
| dns           | 192.168.88.1                        |


## setup portforwarding (mikrotik)
```bash
ssh admin@192.168.88.1
/ip firewall nat
add chain=dstnat dst-address-list=MyDDNS dst-port=6443 protocol=tcp to-address=192.168.88.2 to-ports=6443 action=dst-nat
```

## configure VM
```bash
# add ssh key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/webserver
ssh-copy-id -i ~/.ssh/webserver.pub jon@192.168.88.2

# disable password login
ssh jon@192.168.88.2
sudo sed -i -E 's/#?PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo grep -F -w "PasswordAuthentication" /etc/ssh/sshd_config
sudo service sshd restart

# install k3s
curl -sfL https://get.k3s.io | sh -

# config kubectl
export KUBECONFIG=~/.kube/config
mkdir ~/.kube 2> /dev/null
sudo k3s kubectl config view --raw > "$KUBECONFIG"

# open firewall
sudo firewall-cmd --add-port=6443/tcp --permanent
sudo firewall-cmd --reload
exit

# configure on local system
export KUBECONFIG=~/.kube/config
# kubectl config view --flatten may be needed if merging
scp jon@192.168.88.2:~/.kube/config $KUBECONFIG
sed -i.bak 's/\<127.0.0.1\>/192.168.88.2/g' $KUBECONFIG
```
