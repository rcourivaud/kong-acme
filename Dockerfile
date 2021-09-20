FROM kong:2.5.1-ubuntu
USER root
RUN apt-get install -y git unzip