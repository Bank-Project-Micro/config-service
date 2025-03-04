
FROM maven:3.9.9-openjdk-21-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:21-jdk-slim
WORKDIR /app
COPY --from=build /app/target/config-service.jar app.jar
EXPOSE 8888
ENTRYPOINT ["java", "-jar", "app.jar"]
