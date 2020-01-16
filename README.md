# Daas-MicroK8s

DaaS-MicroK8s help users to install DaaS into a single server based on [MicroK8s](https://microk8s.io/) that is the smallest, fastest, fully-conformant single node Kubernetes cluster. DaaS-MicroK8s makes it easy to set up AI model deployment service in your private cloud environment, it provides complete AI model deployment capabilities. More details about DaaS, see its official website: https://www.autodeploy.ai/


## System Requirements

### Hardware
* 4 Cores CPU, 8 GB RAM (8 Cores CPU and 16 GB RAM or more recommended).
* 30 GB of available hard disk space.

### Software
* Linux distributions for x86-64 installed [Snap](https://snapcraft.io/), see [Installing snapd](https://snapcraft.io/docs/installing-snapd) for how to install Snap for your server.
* Ubuntu 18.04 LTS recommended (Snap is pre-installed in Ubuntu 16.04.4 LTS or lator)

## Install Instructions
Run all the following commands as `root`.

1. Install one of both:
    * daas-0.9.0.0-standalone-all.run, 2.97G, an offline installer, used in the environment without internet access.
    * daas-0.9.0.0-standalone.run, 2.69G, a web installer, it installs MicroK8s and others by snap online.
2. Run the following script to bind the DaaS service to the IP address of the server, the second argument `port` is optional with the default value `443`:
```
./expose-ip.sh xxx.xxx.xxx.xxx [port]
```
Then, you can open the DaaS web portal `https://xxx.xxx.xxx.xxx` or `https://xxx.xxx.xxx.xxx:port` by a browser. 

3. [Optional] DaaS uses a self-signed certificate by default, you could get a warning from a browser when access it, you can install your own ssl certificate of the domain for your server by the command:
```
./copy-ssl-cert.sh ssl_certificate ssl_certificate_key
```
NOTE: you can get `expose-ip.sh` and `copy-ssl-cert.sh` in the current repository

## How to get a trial version
Please do not hesitate to send a mail to autodeploy.ai(at)gmail to request a download link.
