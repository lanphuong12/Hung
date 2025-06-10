# 1) Chọn base image Java 17 nhẹ
FROM eclipse-temurin:17-jdk-alpine

# 2) Tạo thư mục chứa app
WORKDIR /app

# 3) Copy file JAR đã build
COPY target/*.jar app.jar

# 4) Expose port (Spring Boot mặc định 8080)
EXPOSE 8080

# 5) CMD để chạy ứng dụng, nhận PORT từ env
ENTRYPOINT ["sh","-c","java -Dserver.port=${PORT:-8080} -jar app.jar"]
