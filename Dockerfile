# ---- STAGE 1: build JAR ----
FROM maven:3.8.7-eclipse-temurin-17-alpine AS builder

WORKDIR /build

# Copy file pom + sources
COPY pom.xml .
COPY src ./src

# Build project, tạo JAR trong /build/target/
RUN mvn clean package -DskipTests

# ---- STAGE 2: runtime ----
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Chép JAR từ builder stage
COPY --from=builder /build/target/*.jar app.jar

# Expose cổng
EXPOSE 8080

# Lệnh chạy, port lấy từ env PORT hoặc mặc định 8080
ENTRYPOINT ["sh","-c","java -Dserver.port=${PORT:-8080} -jar app.jar"]
