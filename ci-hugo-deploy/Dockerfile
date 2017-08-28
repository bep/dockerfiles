FROM golang:1.9.0-alpine3.6

LABEL maintainer="bjorn.erik.pedersen@gmail.com"

ENV HUGO_VERSION=0.26
ENV HUGO_DOWNLOAD_URL=https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

RUN 	apk add --no-cache --update --virtual .build-deps \
    	curl py-pip && \
    	apk add git && \
    	curl -L ${HUGO_DOWNLOAD_URL} | tar -xzf - -C /usr/bin/ hugo && \
		pip install Pygments==2.1.3 && \
		go get -v github.com/bep/s3tlsproxy/clients/s3pdeploy && \
		mv $GOPATH/bin/s3pdeploy /usr/bin/ && \
		apk del .build-deps;
	
CMD ["hugo", "env"]

EXPOSE 1313