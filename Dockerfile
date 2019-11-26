# Automation Docker container based on Ubuntu to get proper SSH handling
FROM ubuntu:18.04

RUN apt-get clean && apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANGUAGE en_US.utf8
ENV LANG en_US.utf8

RUN apt-get update && apt-get install -y git \
    iputils-ping \
    python3 \
    python3-dev \
    python3-pip \
    openssh-client \
    vim && \
    mkdir /opt/ntc-templates && \
    git clone https://github.com/networktocode/ntc-templates.git /opt/ntc-templates && \
    pip3 install --no-cache ansible bandit netaddr netmiko pytest pylint requests yamllint && \
    export PS1='\n${PWD/*\//}# '
