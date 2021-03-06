# Use official base image of Java Runtim
FROM openjdk:8-jdk-alpine

# Set volume point to /tmp
VOLUME /tmp

# Make port 8090 available to the world outside container
EXPOSE 8090

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# YOU NEED TO BUILD MAVEN PACKAGE FIRST
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# Set application's JAR file
ARG JAR_FILE=target/atm-0.0.1-SNAPSHOT.jar

# Add the application's JAR file to the container
ADD ${JAR_FILE} app.jar

# Run the JAR file
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.jar"]
