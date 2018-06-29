FROM golang:1.10.3

LABEL maintainer="bjorn.erik.pedersen@gmail.com"

ENV GORELEASER_VERSION=0.79.0
ENV GORELEASER_SHA=14d24fdfdc8a7aff0956e4c0dcfad8a71fbaed804013be4ee93d26955dc75704

ENV GORELEASER_DOWNLOAD_FILE=goreleaser_Linux_x86_64.tar.gz
ENV GORELEASER_DOWNLOAD_URL=https://github.com/goreleaser/goreleaser/releases/download/v${GORELEASER_VERSION}/${GORELEASER_DOWNLOAD_FILE}

ENV MAGE_VERSION=2.1
ENV MAGE_SHA=44f4a34fcf7bd17c11c6ed2a7b495900c771289c580fdef517a950fdccd15e02
ENV MAGE_DOWNLOAD_FILE=mage_${MAGE_VERSION}_Linux-64bit.tar.gz
ENV MAGE_DOWNLOAD_URL=https://github.com/magefile/mage/releases/download/${MAGE_VERSION}/${MAGE_DOWNLOAD_FILE}

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
			rm $MAGE_DOWNLOAD_FILE;	
CMD ["goreleaser", "-v"]

