# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "ashishdalvir@gmail.com" 
COPY ./target/helloworld.war /usr/local/tomcat/webapps

