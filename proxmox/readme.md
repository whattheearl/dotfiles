# Installation of Proxmox
https://192.168.88.69:8006

| name                        | description          | url                                        |
| --------------------------- | -------------------- | ------------------------------------------ |
| ventoy                      | usb installer        | https://www.ventoy.net/en/doc_start.html   |
| proxmox virtual environment | hypervisor           | https://www.proxmox.com/en/downloads       |
| proxmox backup server       | pve backup server    | https://www.proxmox.com/en/downloads       |
| fedora server               | Fedora Server 38 DVD | https://fedoraproject.org/server/download/ |

## config
| property             | value         |
| -------------------- | ------------- |
| bootdisk filesystem  | ext4          |
| bootdisk             | /dev/nvme0n1  |
| management interface | enp4s0        |
| hostname             | pve.wte.sh    |
| host ip              | 192.168.88.69 |
| gateway              | 192.168.88.1  |
| dns                  | 192.168.88.1  |

## storage pools
### fastd
| property    | value                          |
| ----------- | ------------------------------ |
| add storage | false                          |
| raid level  | mirror                         |
| compression | zstd                           |
| disks       | /dev/sda, /dev/sdb (512gb sdd) |

### rust
| property    | value                         |
| ----------- | ----------------------------- |
| add storage | false                         |
| raid level  | mirror                        |
| compression | zstd                          |
| disks       | /dev/sda, /dev/sdb (14tb hdd) |

## configure reverse proxy
https://pve.proxmox.com/wiki/Web_Interface_Via_Nginx_Proxy

```bash
# setup proxy
scp proxmox/nginx/proxmox.conf root@192.168.88.69:/etc/nginx/conf.d/proxmox.conf
ssh jon@192.168.88.69
apt install nginx
rm /etc/nginx/sites-enabled/default
nano /etc/nginx/conf.d/proxmox.conf
nginx -t 
systemctl restart nginx
```