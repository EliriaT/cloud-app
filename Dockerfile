# Stage 1: Cache dependencies
FROM gradle:jdk17 as cache
RUN mkdir -p /home/gradle/cache_home
ENV GRADLE_USER_HOME /home/gradle/cache_home
COPY build.gradle.kts settings.gradle.kts /home/gradle/java-code/
WORKDIR /home/gradle/java-code
RUN gradle clean build -i --stacktrace || true

# Stage 2: Build the application
FROM gradle:jdk17 as builder
COPY --from=cache /home/gradle/cache_home /home/gradle/.gradle
COPY . /usr/src/java-code/
WORKDIR /usr/src/java-code
RUN gradle bootJar -i --stacktrace

# Stage 3: Create the runtime image
FROM openjdk:17-jdk-slim
EXPOSE 8080
USER root
WORKDIR /usr/src/java-app
COPY --from=builder /usr/src/java-code/build/libs/*.jar ./app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]