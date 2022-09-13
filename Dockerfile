FROM amazonlinux:2.0.20220805.0

RUN yum update -y && \
    yum install -y \
      which \
      less \
      make \
      man \
      python3 \
      python3-pip \
      && \
    yum clean all && \
    rm -rf /var/cache/yum/*

RUN pip3 install -U ginza ja_ginza_electra
