FROM golang:1.9.4

LABEL maintainer="bjorn.erik.pedersen@gmail.com"

ENV GORELEASER_VERSION=0.34.2
ENV GORELEASER_SHA=013b6289cff41b8afca638007a727170efc8d61469405e2a5d30edf1343e5b68

ENV GORELEASER_DOWNLOAD_FILE=goreleaser_Linux_x86_64.tar.gz
ENV GORELEASER_DOWNLOAD_URL=https://github.com/goreleaser/goreleaser/releases/download/v${GORELEASER_VERSION}/${GORELEASER_DOWNLOAD_FILE}

ENV MAGE_VERSION=1.0.2
ENV MAGE_SHA=49f6eb1a5e2acb8d55c879613e7fb612daaab638a85ce482544412d88a46f7d7
ENV MAGE_DOWNLOAD_FILE=mage_${MAGE_VERSION}_Linux-64bit.tar.gz
ENV MAGE_DOWNLOAD_URL=https://github.com/magefile/mage/releases/download/v${MAGE_VERSION}/${MAGE_DOWNLOAD_FILE}

RUN mkdir -p /root/.ssh; \
    chmod 0700 /root/.ssh; \
    ssh-keyscan github.com > /root/.ssh/known_hosts;

RUN  wget ${GORELEASER_DOWNLOAD_URL}; \
			echo "$GORELEASER_SHA $GORELEASER_DOWNLOAD_FILE" | sha256sum -c - || exit 1; \
			tar -xzf $GORELEASER_DOWNLOAD_FILE -C /usr/bin/ goreleaser; \
			rm $GORELEASER_DOWNLOAD_FILE; \
			wget ${MAGE_DOWNLOAD_URL}; \
			echo "$MAGE_SHA $MAGE_DOWNLOAD_FILE" | sha256sum -c - || exit 1; \
			tar -xzf $MAGE_DOWNLOAD_FILE -C /usr/bin/ mage; \
			rm $MAGE_DOWNLOAD_FILE; \
			apt-get update; \
			apt-get install -y nano autoconf libtool ruby ruby-dev ruby-bundler; \
		  	rm -rf /var/lib/apt/lists/*; \
		  	gem install fpm;

CMD ["goreleaser", "-v"]

