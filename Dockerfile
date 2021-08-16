FROM tomcat:latest

#COPY manager-context.xml /tmp
#COPY host-context.xml /tmp

RUN /bin/bash -c "mv /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps"

COPY manager-context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY host-context.xml /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
COPY tomcat-users.xml /usr/local/tomcat/conf/

#COPY testServlet.war /usr/local/tomcat/webapps/

RUN rm -fdr /usr/local/tomcat/webapps.dist

RUN apt-get update
RUN apt-get -y install nano
RUN apt-get -y install less


#EXPOSE 8088 8080


#CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]

