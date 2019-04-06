FROM maven:3.6.0-jdk-8

# Copies project directory into container
# COPY pom.xml /aidamod/pom.xml
COPY . /aidamod/

# Builds JAR file
RUN mvn -f /aidamod/pom.xml compile -DskipTests=true

# Move to output directory for easy access to JAR
WORKDIR /aidamod/target/

RUN apt-get update
RUN apt-get install -y python-pip
COPY requirements.txt /project/requirements.txt
RUN pip install -r /project/requirements.txt

COPY solution.py /project/solution.py
CMD python2 /project/solution.py


