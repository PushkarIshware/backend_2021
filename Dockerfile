FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /app
WORKDIR /app
# RUN sudo apt install python3-pip
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . /app/