# Daas-MicroK8s

DaaS-MicroK8s is a free DaaS edition for a single node Kubernetes cluster based on [MicroK8s](https://microk8s.io/) that is the smallest, fastest, fully-conformant single node Kubernetes cluster. DaaS-MicroK8s makes it easy to set up AI model deployment service in your private cloud environment, it provides complete AI model deployment capabilities. More details about DaaS, see its official website: https://www.autodeploy.ai/

![DaaS-home](snapshots/daas-home.png)

## System Requirements

### Hardware
* 4 Cores CPU, 8 GB RAM (8 Cores CPU and 16 GB RAM or more recommended).
* 30 GB of available hard disk space.

### Software
* Linux distributions for x86-64 installed [Snap](https://snapcraft.io/), see [Installing snapd](https://snapcraft.io/docs/installing-snapd) for how to install Snap for your server.
* Ubuntu 18.04 LTS recommended (Snap is pre-installed in Ubuntu 16.04.4 LTS or lator)

## Install Instructions
Run the installer by a user with sudo privileges:

1. Install one of both:
    * daas-x.x.x.x-standalone-all.run, an offline installer, used in the environment without internet access.
    * daas-x.x.x.x-standalone.run, a web installer, it installs MicroK8s and others by snap online.

2. Run the following script to bind the DaaS service to the IP address of the server, "HTTPS_PORT" is the port of encrypted HTTPS with the default value 443, and "HTTP_PORT" is optional port of unsecure HTTP. Then you can open the DaaS web portal https://xxx.xxx.xxx.xxx[:HTTPS_PORT] or http://xxx.xxx.xxx.xxx[:HTTP_PORT] by a browser:
```
bind-external-ip.sh xxx.xxx.xxx.xxx [HTTPS_PORT] [HTTP_PORT]
```

3. [Optional] DaaS uses a self-signed certificate by default, you could get a warning from a browser when access it, you can install your own ssl certificate of the domain for your server by the command:
```
install-ssl-cert.sh ssl_certificate ssl_certificate_key
```
NOTE: you can get `bind-external-ip.sh` and `install-ssl-cert.sh` in the current repository


## How to get a free version
Please do not hesitate to send a mail to `autodeploy.ai(at)gmail.com` to request a download link.
