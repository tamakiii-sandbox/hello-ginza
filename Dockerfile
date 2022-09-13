FROM amazonlinux:2.0.20220805.0

RUN yum update -y && \
    yum install -y \
      which \
      less \
      make \
      man \
      python3 \
      python3-pip \
      libxml2 \
      jq \
      && \
    yum clean all && \
    rm -rf /var/cache/yum/*

# Because yum does not support Python3.
# You can run command vi /usr/bin/yum, change /usr/bin/python to /usr/bin/python2 in first line.
# # alternatives [options] --install link name path priority [--slave link name path]...  [--initscript service] [--family name]
# RUN alternatives --install /usr/bin/python python /usr/bin/python3 1
# RUN alternatives --install /usr/bin/pip pip /usr/bin/pip3 1
# ```
# bash-4.2# yum update -y
#   File "/usr/bin/yum", line 30
#       except KeyboardInterrupt, e:
#                                   ^
# 				  SyntaxError: invalid syntax
# ```

RUN pip3 install -U ginza ja_ginza_electra
