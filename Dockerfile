
FROM ubuntu:14.04
FROM tomcat:8.0
MAINTAINER jabajaj
EXPOSE 8080

Run apt-get update
Run apt-get install -y curl
Run apt-get install -y vim

# Fix sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh



# Install dependencies
RUN apt-get update && \
apt-get install -y git build-essential curl wget software-properties-common


# Install JDK 8
RUN \
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
add-apt-repository -y ppa:webupd8team/java && \
apt-get update && \
apt-get install -y oracle-java8-installer wget unzip tar && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

COPY System.war /usr/local/tomcat/webapps/
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
