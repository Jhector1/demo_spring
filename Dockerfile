#stage 1 build
#
FROM gradle AS build
##ARG JAR_FILE=target/*.jar
#WORKDIR /app
#
#COPY build.gradle .
#COPY src ./src
RUN ./gradlew clean jar

#stage 2 runtime
FROM openjdk:21
ARG JAR_FILE=build/*.jar
#WORKDIR /app
COPY build/libs/springjava21-0.0.1-SNAPSHOT.jar ./app.jar
EXPOSE 8080
#ENTRYPOINT ["java", "-jar", "./app.jar"]
#CMD ["java", "-jar", "app.jar"]
#FROM openjdk:17-jdk-alpine
#ARG JAR_FILE=target/*.jar
#COPY ./target/jeanyvesart-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar","/app.jar"]