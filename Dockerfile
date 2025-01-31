FROM ubuntu

RUN apt update && apt upgrade -y
RUN apt install python3 -y
RUN apt install python3-pip -y
RUN apt install fonts-roboto -y

WORKDIR /usr/src/app

COPY main.py /usr/src/app
COPY src/__init__.py /usr/src/app/src
COPY src/wh_img.py /usr/src/app/src
COPY src/requirements.txt /usr/src/app
COPY src/.env /usr/src/app/src

ENV PYTHONPATH /usr/src/app/

RUN ["pip3", "install", "-r", "requirements.txt"]

CMD ["python3", "main.py"]
