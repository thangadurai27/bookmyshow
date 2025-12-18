# Use Java 17
FROM eclipse-temurin:17-jdk

# Working dir inside container
WORKDIR /app

# Copy maven wrapper and pom
COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

# Download dependencies (offline)
RUN ./mvnw dependency:go-offline -B

# Copy source code
COPY src src

# Build the app
RUN ./mvnw clean package -DskipTests -B

# Expose Render port
EXPOSE 8080

# Run the jar
CMD ["sh", "-c", "java -jar target/*.jar"]
