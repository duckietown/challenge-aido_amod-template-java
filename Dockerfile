FROM maven

# Copies project directory into container
COPY . aidamod

# Builds JAR file
RUN mvn -f aidamod/pom.xml install -DskipTests=true

# Move to output directory for easy access to JAR
WORKDIR /aidamod/target/
