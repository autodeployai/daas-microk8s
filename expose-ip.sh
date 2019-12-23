#!/bin/sh

#
# Copyright (c) 2017-2019 AutoDeploy AI
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

if [ "$#" -ne "1" ]
then
  echo "Please call '$0 xxx.xxx.xxx.xxx' to run this command."
  exit 1
fi

ipaddr=$1
microk8s.kubectl patch svc daas-nginx-svc -p "{\"spec\":{\"externalIPs\":[\"${ipaddr}\"]}}" -ndaas

echo "Please open the address 'https://${ipaddr}/' to manager your AI models and deployments by browser."
echo "The default administration account is: admin/password, you can change its password from 'Home / Console / User Managerment'."

