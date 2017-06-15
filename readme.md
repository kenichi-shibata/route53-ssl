# ssl autobot
Built on top of dehydrated 
This is specifically for usage with aws route 53 

# Overview
![overview diagram](docs/diag.png.png)

## Requirements
* Webserver (NGINX, Apache, nodejs)
* python2 
* boto 
* pip
* awscli
* aws profile named route53 with full access to route53 
* aws route 53 public hosted zone
* unix based server

## Installation
* clone this repo
* Check if your system has python most linux server has one already installed 
* install pip 
* install boto 

## Run 
```
	#update the credentials/.aws dir add your config and credenials
 	
	#accept the license agreement

         ./dehydrated --register --accept-terms

     	./start.sh #answer the questions

	# the certificate will be on the certs/{domain} directory

	
```

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
Done automatically since --cron flag is passed on dehydrated


## Certs directory
>>>>>>> Stashed changes
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

