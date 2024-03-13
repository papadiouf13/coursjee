FROM openjdk:17
WORKDIR /app
COPY target/coursjee.war /app/servlet.war 
CMD [ "java", "-jar", "servlet.war" ]