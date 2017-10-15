FROM golang:1.9.0-alpine3.6

LABEL maintainer="bjorn.erik.pedersen@gmail.com"

ENV HUGO_VERSION=0.26
ENV HUGO_DOWNLOAD_FILE=hugo_${HUGO_VERSION}_Linux-64bit.tar.gz
ENV HUGO_DOWNLOAD_URL=https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_DOWNLOAD_FILE}
ENV HUGO_SHA=67e4ba5ec2a02c8164b6846e30a17cc765b0165a5b183d5e480149baf54e1a50

RUN 	wget ${HUGO_DOWNLOAD_URL}; \
		echo "$HUGO_SHA $HUGO_DOWNLOAD_FILE" | sha256sum -c - || exit 1;\
		tar -xzf $HUGO_DOWNLOAD_FILE -C /usr/bin/ hugo; \
		rm $HUGO_DOWNLOAD_FILE; \
		apk add --no-cache --update --virtual .build-deps \
    	curl py-pip && \
    	apk add git && \
    	pip install Pygments==2.1.3 && \
		go get -v github.com/bep/s3tlsproxy/clients/s3pdeploy && \
		mv $GOPATH/bin/s3pdeploy /usr/bin/ && \
		apk del .build-deps;
	
CMD ["hugo", "env"]

EXPOSE 1313