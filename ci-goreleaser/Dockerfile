FROM golang:1.12.5

LABEL maintainer="bjorn.erik.pedersen@gmail.com"

ENV GORELEASER_VERSION=0.108.0
ENV GORELEASER_SHA=cb391d06853694354ac96676230d7f09e884d08d3b63a1858cdb0e8f3fe8c298

ENV GORELEASER_DOWNLOAD_FILE=goreleaser_Linux_x86_64.tar.gz
ENV GORELEASER_DOWNLOAD_URL=https://github.com/goreleaser/goreleaser/releases/download/v${GORELEASER_VERSION}/${GORELEASER_DOWNLOAD_FILE}

# Install tools
RUN apt-get update && \
    apt-get install -y automake autogen \
    libtool libxml2-dev uuid-dev libssl-dev bash \
    patch make tar xz-utils bzip2 gzip sed cpio \
	gcc-multilib g++-multilib gcc-mingw-w64 g++-mingw-w64 clang llvm-dev --no-install-recommends || exit 1; \
	rm -rf /var/lib/apt/lists/*;

# Cross compile setup
ENV OSX_SDK_VERSION 	10.11
ENV OSX_SDK     		MacOSX$OSX_SDK_VERSION.sdk
ENV OSX_NDK_X86 		/usr/local/osx-ndk-x86
ENV OSX_SDK_PATH 		/$OSX_SDK.tar.gz

COPY $OSX_SDK.tar.gz /go

RUN git clone https://github.com/tpoechtrager/osxcross.git && \
    git -C osxcross checkout c47ff0aeed1a7d0e1f884812fc170e415f05be5a || exit 1; \
    mv $OSX_SDK.tar.gz osxcross/tarballs/ && \
    UNATTENDED=yes SDK_VERSION=${OSX_SDK_VERSION} OSX_VERSION_MIN=10.9 osxcross/build.sh || exit 1; \
    mv osxcross/target $OSX_NDK_X86; \
    rm -rf osxcross;

ENV PATH $OSX_NDK_X86/bin:$PATH

RUN mkdir -p /root/.ssh; \
    chmod 0700 /root/.ssh; \
    ssh-keyscan github.com > /root/.ssh/known_hosts;

RUN  wget ${GORELEASER_DOWNLOAD_URL}; \
			echo "$GORELEASER_SHA $GORELEASER_DOWNLOAD_FILE" | sha256sum -c - || exit 1; \
			tar -xzf $GORELEASER_DOWNLOAD_FILE -C /usr/bin/ goreleaser; \
			rm $GORELEASER_DOWNLOAD_FILE;
			
CMD ["goreleaser", "-v"]


# Notes for self:
# Windows:
# GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc CXX=x86_64-w64-mingw32-g++  go build -ldflags "-extldflags '-static'" -tags extended


# Darwin
# CC=o64-clang CXX=o64-clang++ GOOS=darwin GOARCH=amd64 CGO_ENABLED=1 go build -tags extended
# env GO111MODULE=on goreleaser --config=goreleaser-extended.yml --skip-publish --skip-validate --rm-dist --release-notes=temp/0.48-relnotes-ready.md
