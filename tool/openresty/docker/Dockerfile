FROM centos:latest
#ARG REGION="china"
# ensure local python is preferred over distribution python
#ENV PATH /usr/local/bin:$PATH

COPY build /build

RUN yum install -y pcre-devel openssl-devel gcc curl perf make && \
    yum clean all && \
    /build/openresty 

ENV PATH="/usr/local/openresty/bin:${PATH}"
CMD ["bash"]
