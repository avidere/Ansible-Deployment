FROM tomcat
WORKDIR /usr/local/tomcat
COPY ./target/helloworld.war webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
