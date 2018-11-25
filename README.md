# Deployment automation

## SSL Certs
self signed certs created using this guide: https://deliciousbrains.com/ssl-certificate-authority-for-local-https-development/
Without a cert that the browser trusts, the secure websocket connection will not work. You can add exceptions for the http pages and it'll work, but without a trusted CA the secure websocket connection will not work.
