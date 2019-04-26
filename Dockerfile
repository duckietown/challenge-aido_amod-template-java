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
 

RUN cp /root/.m2/repository/ch/ethz/idsc/tensor/0.6.1/tensor-0.6.1.jar /aidamod/target/

RUN chmod -R o+rx /root
RUN chmod -R o+rx /amod
RUN chmod -R o+rx /aidamod

COPY solution.py /project/solution.py
CMD python3.7 /project/solution.py


