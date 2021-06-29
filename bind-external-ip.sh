#!/bin/sh

#
# Copyright (c) 2017-2021 AutoDeployAI
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if [ $# -lt 1 ]; then
  echo "Please call '$0 xxx.xxx.xxx.xxx [https_port] [http_port]' to run this command."
  exit 1
fi

ipaddr=$1
https_port=443

if [ "$2" != "" ]; then
  https_port=$2
fi

if [ "$3" != "" ]; then
  http_port=$3
fi

cmd="kubectl"
if [ -x "$(command -v microk8s.kubectl)" ]; then
  cmd="microk8s.kubectl"
fi

address="'https://${ipaddr}:${https_port}/'"
ports_spec="{\"name\":\"https-port\",\"port\":${https_port},\"protocol\":\"TCP\",\"targetPort\":443}"
if [ "$http_port" != ""  ]; then
  ports_spec="${ports_spec},{\"name\":\"http-port\",\"port\":${http_port},\"protocol\":\"TCP\",\"targetPort\":80}"
  address="${address} or 'http://${ipaddr}:${http_port}/'"
fi

${cmd} patch svc daas-nginx-svc --type merge --patch "{\"spec\":{\"externalIPs\":[\"${ipaddr}\"],\"ports\":[${ports_spec}]}}" -ndaas

echo "Please open the address ${address} to manager your AI models and deployments by browser."
echo "The default administration account is: admin/password, you can change its password from 'Home / Console / User Managerment'."