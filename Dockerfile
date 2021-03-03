FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /app
WORKDIR /app
# RUN sudo apt install python3-pip
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . /app/

FROM python:3-buster
# set up the psycopg2
# First RUN Statement: to install postgresql dependency
RUN apt-get update && apt-get install -y libpq-dev  \
     gcc \
     postgresql-client
# Second RUN Statement: Install postgresql driver for django
RUN pip install psycopg2==2.8.3
# Third RUN Statement: Remove the gcc compier after install the
# driver
RUN apt-get autoremove -y gcc

# set the docker entry file
COPY . /app/
RUN chmod +x /app/docker-entrypoint.sh
ENTRYPOINT [ "/app/docker-entrypoint.sh" ]