FROM python:3.7.6-stretch

#boto3 used for AWS commands
RUN apt install python3-boto3


RUN pip install pip --upgrade
RUN pip install ansible==2.10.4
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sshpass

WORKDIR /playbooks

ENTRYPOINT [ "/usr/local/bin" ]