FROM centos:7

MAINTAINER kvendingoldo@yandex.ru

RUN yum -y install epel-release

RUN yum -yq install python34 \
                    python34-devel \
                    python34-pip

COPY ../ /app
WORKDIR /app

RUN pip3 install -r requirements.txt

ENTRYPOINT [ "python3", "/app/main.py" ]