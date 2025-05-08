FROM eclipse-temurin:21

WORKDIR /app

COPY . /app/
RUN ./gradlew bootJar

EXPOSE 8080

CMD [ "java", "-jar", "./build/libs/cloud-app-0.0.1-SNAPSHOT.jar" ]