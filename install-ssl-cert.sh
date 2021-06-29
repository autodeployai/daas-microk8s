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

if [ "$#" -ne "2" ]; then
  echo "Please call '$0 ssl_certificate ssl_certificate_key' to run this command."
  exit 1
fi

cert=$1
certkey=$2
if [ ! -f "$cert" ]; then
  echo "ssl certificate $cert not found."
  exit 1
fi

if [ ! -f "$certkey" ]; then
  echo "ssl certificate key $certkey not found."
  exit 1
fi

homedir=/daas-home
if [ ! -d "$homedir" ]; then
  echo "Make sure that run the command in any POD of DaaS."
  exit 1
fi

customerdir="${homedir}/config/customer-ssl"
if [ ! -d "$customerdir" ]; then
  mkdir -p $customerdir 
fi

cp $cert ${customerdir}/server.crt
cp $certkey ${customerdir}/server.key

pod=`kubectl get pods -o=name -n=daas | grep daas-nginx`
kubectl delete $pod -n=daas

echo "Setup ssl certification successfully."
