FROM golang:1.9.0

LABEL maintainer="bjorn.erik.pedersen@gmail.com"

ENV HUGO_VERSION=0.26
ENV HUGO_DOWNLOAD_URL=https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz


#RUN echo "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -sc) main universe" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y python python-dev python-distribute python-pip
RUN pip install Pygments==2.1.3
RUN go get -v github.com/bep/s3tlsproxy/clients/s3pdeploy
RUN wget ${HUGO_DOWNLOAD_URL} && \
	 	tar -xf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -C /usr/bin/ hugo && \
		rm -r hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

CMD ["hugo", "env"]

EXPOSE 1313