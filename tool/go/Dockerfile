FROM centos:latest
#ARG REGION="china"
# ensure local python is preferred over distribution python
#ENV PATH /usr/local/bin:$PATH

COPY build /build

RUN yum install -y pcre-devel openssl-devel gcc curl perf make && \
    yum clean all && \
    /build/go && \
	rm -rf /build

ENV PATH="/usr/local/go/bin:${PATH}"
CMD ["bash"]
