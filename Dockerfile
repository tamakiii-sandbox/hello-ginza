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

# alternatives [options] --install link name path priority [--slave link name path]...  [--initscript service] [--family name]
RUN alternatives --install /usr/bin/python python /usr/bin/python3 1
RUN alternatives --install /usr/bin/pip pip /usr/bin/pip3 1

RUN pip3 install -U ginza ja_ginza_electra
