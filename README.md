# DVWA MODSECURITY
This repo contains a docker version of DVWA (Damn Vulnerable Web Application).

## USAGE
First create a network.
``` bash
$ docker network create mynet 
```
Build the dvwa image. To build the image, navigate to the `website_dvwa/` directory and run the following command:
``` bash
$ docker build -t <image-tag> .
``` 
To run the container, use the following command:
``` bash
$ docker run <image-tag/image-id> -p 80:80 --network mynet
```
DVWA requires a MYSQL databse for it to properly work. To setup a mysql database, run the following command:
``` bash
$ docker run --name mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=dvwa -e MYSQL_USER=dvwa -e MYSQL_PASSWORD=p@ssw0rd -p 3306:3306 --network mynet
```
Navigate to `http://localhost:80` and it should be working.

### DOCKER COMPSE
Alternativly you could also simply run the compose file which wont require further conigurations.
Navigate to the home directory of the repo and run the following command.
``` bash
$ docker-compose up
```

## Environment Variables
This docker version of DVWA along with the MYSQL database has different environment variables that can be used to configure the web app and the databse.
### DVWA Configuration
To change the DVWA configuration, following environment variables can be used:
* DB_USER: Name of the user created by DVWA for the databse. Default is `dvwa`
* DB_PASSWORD: Password of the database created by DVWA. Default is `p@ssw0rd`
* DB_DATABASE: Name of the database created by DVWA. Default is `dvwa`
* DB_SERVER: Address or hostname of the MYSQL/Mariadb server. Default is `mysql` which is the name of the databse container that is created
* DB_PORT: Port on which the database is listening. Default is `3306`
* DVWA_SEC_LEVEL: The DVWA security level. Default is `impossible`

### MYSQL Configuration
The MYSQL environmnet variables are the same as provided in the [official MYSQL image](https://hub.docker.com/_/mysql).
However you need to make sure that the `MYSQL_USER`, `MYSQL_PASSWORD` and `MYSQL_DATABASE` are the same as `DB_USER`, `DB_PASSWORD` and `DB_DATABASE` that are provided to DVWA respectively.
