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
			rm $MAGE_DOWNLOAD_FILE; \
			apt-get update && \
			apt-get install -y automake autogen build-essential ca-certificates \
			gcc-multilib gcc-mingw-w64 g++-mingw-w64 --no-install-recommends; \
			rm -rf /var/lib/apt/lists/*;
CMD ["goreleaser", "-v"]


# Windows:
# GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc CXX=x86_64-w64-mingw32-g++ go build -tags extended


# Notes:
#GOOS=windows GOARCH=386 CGO_ENABLED=1 CC=i686-w64-ming32-gcc CXX=i686-w64-mingw32-g++ CGO_LDFLAGS="-static" go build -i -v -x -ldflags "-extldflags '-static' -extld=$CC"


#echo "Bootstrapping windows/386..."
#GOOS=windows GOARCH=386 CGO_ENABLED=1 CC=i686-w64-mingw32-gcc go install std

# GOOS=darwin GOARCH=amd64 CGO_ENABLED=1 CC=o64-clang go install std