todo
- terraform
- packer

# setup cluster
node1: 192.168.88.10 | node1.wte.sh
node2: 192.168.88.11 | node2.wte.sh
node3: 192.168.88.12 | node3.wte.sh

## tools
| name          | description          | url                                        |
| ------------- | -------------------- | ------------------------------------------ |
| k3sup         | k3s over ssh         | https://github.com/alexellis/k3sup         |
| fedora server | Fedora Server 38 DVD | https://fedoraproject.org/server/download/ |
| helm          | k8s chart installer  | https://helm.sh/docs/intro/install/        |

## proxmox config
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
| cores         | 2                                   |
| memory        | 4096                                |
| gateway       | 192.168.88.1                        |
| dns           | 192.168.88.1                        |

