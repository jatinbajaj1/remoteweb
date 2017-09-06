FROM ubuntu:16.10
FROM tomcat:8.0
MAINTAINER jabajaj
EXPOSE 8080

Run apt-get update
Run apt-get install -y curl
Run apt-get install -y vim

COPY System.war /usr/local/tomcat/webapps/
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
