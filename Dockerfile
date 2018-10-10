FROM duckietown/amod:latest

RUN apt-get update
RUN apt-get install -y python-pip

COPY requirements.txt /project/requirements.txt
RUN pip install -r /project/requirements.txt

COPY solution.py /project/solution.py

# Builds JAR file
RUN mvn clean install -DskipTests=true 


WORKDIR /project
CMD python /project/solution.py


