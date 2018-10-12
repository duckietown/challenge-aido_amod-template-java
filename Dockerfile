FROM maven

# Copies project directory into container
COPY . aidamod

# Builds JAR file
RUN mvn -f aidamod/pom.xml install -DskipTests=true

# Move to output directory for easy access to JAR
WORKDIR /aidamod/target/

# Start AidoGuest
RUN java -Xmx10000m -cp aidamod-1.4.7.jar aidamod.demo.AidoGuest aido-host
