# install tailscale
https://tailscale.com/kb/1050/install-fedora/
ip: 192.168.88.3
user: jon

## iso
| name          | description          | url                                        |
| ------------- | -------------------- | ------------------------------------------ |
| fedora server | Fedora Server 38 DVD | https://fedoraproject.org/server/download/ |

## create Fedora VM in proxmox
| property      | value                               |
| ------------- | ----------------------------------- |
| node          | pve                                 |
| vm id         | 101                                 |
| name          | tailscale                           |
| start at boot | true                                |
| os            | value                               |
| iso           | fedora-server-dvd-x86_64-38-1.6.iso |
| machine       | q35                                 |
| qemu agent    | true                                |
| cores         | 5                                   |
| memory        | 2000                                |
| ip            | 192.168.88.3                        |
| gateway       | 192.168.88.1                        |
| dns           | 192.168.88.1                        |


```bash
sudo dnf config-manager --add-repo https://pkgs.tailscale.com/stable/fedora/tailscale.repo
sudo dnf install tailscale
sudo systemctl enable --now tailscaled
sudo tailscale up
tailscale ip -4
```

## setup subnet (network node)
https://tailscale.com/kb/1019/subnets/

```bash
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
sudo sysctl -p /etc/sysctl.d/99-tailscale.conf
firewall-cmd --permanent --add-masquerade
sudo tailscale up --advertise-routes=192.168.88.0/24
```

enable route on tailscale https://login.tailscale.com/admin/machines

