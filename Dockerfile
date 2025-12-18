# Use Java 17
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy maven wrapper and pom
COPY backend/pom.xml backend/
COPY backend/mvnw backend/
COPY backend/.mvn backend/.mvn

# Download dependencies (offline)
RUN cd backend && ./mvnw dependency:go-offline -B

# Copy source code
COPY backend/src backend/src

# Build the app
RUN cd backend && ./mvnw clean package -DskipTests -B

# Expose Render port
EXPOSE 8080

# Run the jar
CMD ["sh", "-c", "java -jar backend/target/*.jar"]
