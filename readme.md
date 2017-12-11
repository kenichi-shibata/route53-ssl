# route 53 ssl 
Built on top of dehydrated 
This is specifically for usage with AWS Route 53

Uses DNS challenge to avoid firewalls, ip filtering 

Meaning no need to open your AWS Security Group to 0.0.0.0/0 when creating/renewing certificates

# Overview
![overview diagram](docs/diag.png.png)

## Requirements
* Webserver (NGINX, Apache, nodejs)
* python2 
* boto 
* pip
* awscli
* aws profile named route53 with full access to route53 (or at least read write access to the domain you want to add)
* aws route 53 public hosted zone
* unix based server

## Installation
* clone this repo
* Check if your system has python most linux server has one already installed 
* install pip 
* install boto 

## Run 

* supply the aws credentials either on ~/.aws dir or inside this repo under credentials/.aws

* accept the license agreement

	 ./dehydrated --register --accept-terms

* answer the questions regarding the domain you want to register

	./start.sh #answer the questions

* the certificate will be on the certs/{domain} directory
* The executable file that generates the certificates is .gencert you can rerun it without answering questions on .start again
	

## Usage 
### Apache 
```
     SSLEngine On
     SSLCertificateFile $cloned_dir/ssl-autobot/certs/sample.example.com/fullchain.pem
     SSLCertificateKeyFile  $cloned_dir/ssl-autobot/certs/sample.example.com/privkey.pem
```
### Nginx
```
server {
    listen 443 ssl;
    ssl_certificate      $cloned_dir/ssl-autobot/certs/sample.example.com/fullchain.pem;
    ssl_certificate_key  $cloned_dir/ssl-autobot/certs/sample.example.com/privkey.pem;
	...
}
```
## Renew Certs

	crontab -e 
	0 1 * * * /certs/certs/.gencert >> /var/log/cronlog 2>&1 

## Certs directory
```
lrwxrwxrwx 1 kenichi.shibata kenichi.shibata   19 Apr 14 07:51 cert.csr -> cert-1492156260.csr
lrwxrwxrwx 1 kenichi.shibata kenichi.shibata   19 Apr 14 07:51 cert.pem -> cert-1492156260.pem
-rw------- 1 kenichi.shibata kenichi.shibata 1684 Apr 14 07:51 chain-1492156260.pem
lrwxrwxrwx 1 kenichi.shibata kenichi.shibata   20 Apr 14 07:51 chain.pem -> chain-1492156260.pem
-rw------- 1 kenichi.shibata kenichi.shibata 3851 Apr 14 07:51 fullchain-1492156260.pem
lrwxrwxrwx 1 kenichi.shibata kenichi.shibata   24 Apr 14 07:51 fullchain.pem -> fullchain-1492156260.pem
-rw------- 1 kenichi.shibata kenichi.shibata 3243 Apr 14 07:34 cert-1492155278.csr
-rw------- 1 kenichi.shibata kenichi.shibata 3243 Apr 14 07:34 privkey-1492155292.pem
-rw------- 1 kenichi.shibata kenichi.shibata 3243 Apr 14 07:35 privkey-1492155318.pem
-rw------- 1 kenichi.shibata kenichi.shibata 3243 Apr 14 07:36 privkey-1492155395.pem
-rw------- 1 kenichi.shibata kenichi.shibata 3239 Apr 14 07:37 privkey-1492155447.pem
-rw------- 1 kenichi.shibata kenichi.shibata 3243 Apr 14 07:48 privkey-1492156112.pem
-rw------- 1 kenichi.shibata kenichi.shibata 3243 Apr 14 07:48 privkey-1492156133.pem
-rw------- 1 kenichi.shibata kenichi.shibata 3243 Apr 14 07:51 privkey-1492156260.pem
lrwxrwxrwx 1 kenichi.shibata kenichi.shibata   22 Apr 14 07:51 privkey.pem -> privkey-1492156260.pem


```

