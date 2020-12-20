FROM python:3.7.6-stretch

RUN pip install pip --upgrade
RUN pip install ansible==2.8.8
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sshpass

WORKDIR /playbooks
