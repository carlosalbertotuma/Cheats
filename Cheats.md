# Cheats

- curl -k -X TRACE -H "Via: <svg/onload=alert(‘XSS’)>" https://exemplo.com

- curl -k -X PURGE https://exemplo.com

- curl -s -o /dev/null -w "%{http_code}" dominio 

- openssl s_client -connect domain.com:443

- Origin: https://www.evil.com

---------------------------
- POST /xmlrpc.php HTTP/1.1
- Host: example.com
- Content-Length: 135

- \<?xml version="1.0" encoding="utf-8"?> 
- \<methodCall> 
- \<methodName>system.listMethods\</methodName> 
- \<params>\</params> 
- \</methodCall>

-----------------------
- nc -v domain.com 80
- GET / HTTP/1.0 
-----------------------
