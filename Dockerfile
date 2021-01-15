FROM python:3.7.6-stretch



RUN pip install pip --upgrade

RUN pip install ansible==2.10.4
RUN pip install vi

#VMWare things
RUN pip install pyvmomi
RUN pip install pyvim

#dig for doing DNS lookups
RUN pip install dnspython

#Windows things
RUN pip install pywinrm

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sshpass \
    less

#AWS Things
RUN pip install boto3
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

#fix for boto3 to find AWS config
ENV AWS_SHARED_CREDENTIALS_FILE=/root/.aws/credentials
ENV AWS_CONFIG_FILE=/root/.aws/config

WORKDIR /playbooks
