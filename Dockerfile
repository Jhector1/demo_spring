#stage 1 build
FROM  openjdk:21

# set a directory for the app
WORKDIR /app

# copy all the files to the container
COPY . .
COPY ./build/libs/springjava21-0.0.1-SNAPSHOT.jar ./app.jar
# install dependencies
#RUN pip install --no-cache-dir -r requirements.txt

# define the port number the container should expose
EXPOSE 5000

# run the command
#CMD ["python", "./app.py"]
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