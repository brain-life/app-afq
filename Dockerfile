FROM python
MAINTAINER Soichi Hayashi <hayashis@iu.edu>

RUN pip install AFQ-Browser

#make it work under singularity
RUN ldconfig && mkdir -p /N/u /N/home /N/dc2 /N/soft

#https://wiki.ubuntu.com/DashAsBinSh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

