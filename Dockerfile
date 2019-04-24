FROM duckietown/amod:aido2-01
COPY requirements.txt .
RUN pip3.7 install -r requirements.txt


# Copies project directory into container
# COPY pom.xml /aidamod/pom.xml
COPY . /aidamod/

# Builds JAR file
RUN mvn -f /aidamod/pom.xml compile -DskipTests=true

# Move to output directory for easy access to JAR
WORKDIR /aidamod/target/
 


COPY solution.py /project/solution.py
CMD python3.7 /project/solution.py


