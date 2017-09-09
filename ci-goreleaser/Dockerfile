FROM golang:1.9.0

LABEL maintainer="bjorn.erik.pedersen@gmail.com"

ENV GORELEASER_VERSION=0.30.2

ENV GORELEASER_DOWNLOAD_FILE=goreleaser_Linux_x86_64.tar.gz
ENV GORELEASER_DOWNLOAD_URL=https://github.com/goreleaser/goreleaser/releases/download/v${GORELEASER_VERSION}/${GORELEASER_DOWNLOAD_FILE}

RUN mkdir -p /root/.ssh; \
    chmod 0700 /root/.ssh; \
    ssh-keyscan github.com > /root/.ssh/known_hosts;

RUN curl -L ${GORELEASER_DOWNLOAD_URL} | tar -xzf - -C /usr/bin/ goreleaser; \
			apt-get update; \
		  	apt-get install -y ruby ruby-dev ruby-bundler; \
		  	rm -rf /var/lib/apt/lists/*; \
		  	gem install fpm;

CMD ["goreleaser", "-v"]

