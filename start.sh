#!/bin/bash

# Creates let's encrypt user on this machine
./dehydrated --register --accept-terms

RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

echo "This is to generate free ssl cert using ACME Protocol"

echo "checking ACME License agreement"
if [ ! -d "${PWD}/accounts" ]; then
    echo -e "please agree to license agreement by running this command by running ${GREEN} ./dehydrated --register --accept-terms ${NC}"
    echo "available at https://letsencrypt.org/documents/LE-SA-v1.1.1-August-1-2016.pdf"
    exit 0
fi

echo -e "Tell me the route53 registered apex domain ${GREEN} [ex. example.com] ${NC}" 
read host

echo -e "Subdomain ${GREEN} [i.e. test] ${NC}" 
read subdomain

sed -e "s/{changeme}/$host/g" -e "s/{subd}/$subdomain/g" exec-cert > .gencert
chmod +x .gencert

./.gencert
