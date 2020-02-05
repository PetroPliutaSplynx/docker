Splynx Framework – WISP billing and network management  
https://splynx.com  

---

### Create Splynx container  
`docker create --name splynx-container --privileged -p 80:80 -p 443:443 -p 8101:8101 -p 8102:8102 -p 8103:8103 -p 8104:8104 -p 1812:1812/udp -p 1813:1813/udp -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v splynx-files:/var/www/splynx -v splynx-mysql-data:/var/lib/mysql -v splynx-etc:/etc -v splynx-logs:/var/log --mount type=tmpfs,destination=/tmp --mount type=tmpfs,destination=/var/tmp pliuta/splynx`  

By default, you get container with latest stable Splynx version. If you want get another Splynx version, replace **pliuta/splynx** to:  
* **pliuta/splynx:2.3** to create container with Splynx 2.3  
* **pliuta/splynx:3.0** to create container with Splynx 3.0  

### Start container  
`docker start splynx-container`  

### Enter into container  
`docker exec -it splynx-container bash`  

### Exit from container  
`exit`  

### Turn off container (from container)  
`poweroff`  

### Turn off container (from host)  
`docker stop splynx-container`  

---
Splynx web interface will be available on the 80/tcp port of the host. You can change web port by changing `docker create` command. Change **-p 80:80** to **\-p host_port:container_port** . For instance, if you write **-p 8080:80**, Splynx will be available on the 8080 port of the host.  

**Default web inteface credentials = admin/docker.**  

Links:  
* Systemd - https://hub.docker.com/r/jrei/systemd-ubuntu/  
* Volumes - https://stackoverflow.com/questions/41935435/understanding-volume-instruction-in-dockerfile  
* About Ubuntu image - https://habr.com/ru/post/247903/  
