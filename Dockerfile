#stage 1 build
#FROM  openjdk:21
#
## set a directory for the app
#WORKDIR /app
#
## copy all the files to the container
#COPY . .
#COPY --from=build /app/build/libs/springjava21-0.0.1-SNAPSHOT.jar ./app.jar
## install dependencies
#
## define the port number the container should expose
#EXPOSE 8080
#
## run the command
##CMD ["python", "./app.py"]
#CMD ["java", "-jar", "app.jar"]


# Build stage
FROM gradle:7.6.3-jdk17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Gradle project file and settings to the container
COPY build.gradle settings.gradle ./

# Copy the entire source code to the container
COPY . .
#RUN gradle --version
## Build the application using Gradle
#RUN gradle clean build

# Final stage
FROM adoptopenjdk/openjdk11:alpine-jre AS final

# Set the working directory in the container
WORKDIR /app

# Copy the compiled JAR file from the build stage to the final stage
COPY --from=build /app/build/libs/springjava21-0.0.1-SNAPSHOT.jar ./app.jar

# Define the port number the container should expose
EXPOSE 8080

# Command to run the Spring Boot application when the container starts
CMD ["java", "-jar", "app.jar"]





#
#FROM gradle AS build
##ARG JAR_FILE=target/*.jar
#WORKDIR /app
#
#COPY build.gradle .
#COPY src ./src
##RUN ./gradlew clean jar
#
##stage 2 runtime
#FROM openjdk:17-jdk-alpine
##2ARG JAR_FILE=target/*.jar
#WORKDIR /app
#COPY --from=build /app/build/libs/springjava21-0.0.1-SNAPSHOT.jar ./app.jar
#EXPOSE 8080
##ENTRYPOINT ["java", "-jar", "./app.jar"]
#CMD ["java", "-jar", "app.jar"]
#FROM openjdk:17-jdk-alpine
#ARG JAR_FILE=target/*.jar
#COPY ./target/jeanyvesart-0.0.1-SNAPSHOT.jar app.jar
#ENTRYPOINT ["java", "-jar","/app.jar"]