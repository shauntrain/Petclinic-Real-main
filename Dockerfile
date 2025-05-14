FROM maven:3.9-openjdk-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

FROM tomcat:9.0
COPY --from=build /app/target/petclinic.war /usr/local/tomcat/webapps/
EXPOSE 8080
