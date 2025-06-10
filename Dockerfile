# ---- STAGE 1: build JAR with Maven ----
FROM maven:3.8.7-eclipse-temurin-17 AS builder
WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# ---- STAGE 2: runtime ----
FROM eclipse-temurin:17-jdk-slim
WORKDIR /app

# Copy JAR từ builder
COPY --from=builder /build/target/*.jar app.jar

# Expose port
EXPOSE 8080

# Run với port từ env hoặc default 8080
ENTRYPOINT ["sh","-c","java -Dserver.port=${PORT:-8080} -jar app.jar"]
