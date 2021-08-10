FROM golang:1.16.7

LABEL maintainer="bjorn.erik.pedersen@gmail.com"

ENV GORELEASER_VERSION=0.171.0
ENV GORELEASER_SHA=782c178358600f6cdad94664c0c145614b05392fc27237b31d6a9f5255651617

ENV GORELEASER_DOWNLOAD_FILE=goreleaser_Linux_x86_64.tar.gz
ENV GORELEASER_DOWNLOAD_URL=https://github.com/goreleaser/goreleaser/releases/download/v${GORELEASER_VERSION}/${GORELEASER_DOWNLOAD_FILE}

# Install tools
RUN apt-get update && \
    apt-get install -y automake autogen \
    libtool libxml2-dev uuid-dev libssl-dev bash \
    patch cmake make tar xz-utils bzip2 gzip zlib1g-dev sed cpio \
    gcc-multilib g++-multilib gcc-mingw-w64 g++-mingw-w64 clang llvm-dev --no-install-recommends || exit 1; \
    rm -rf /var/lib/apt/lists/*;

# Cross compile setup
ENV OSX_SDK_VERSION 	11.1
ENV OSX_SDK     		MacOSX$OSX_SDK_VERSION.sdk
ENV OSX_NDK_X86 		/usr/local/osx-ndk-x86
ENV OSX_SDK_PATH 		/$OSX_SDK.tar.gz

COPY $OSX_SDK.tar.gz /go

RUN git clone https://github.com/tpoechtrager/osxcross.git && \
    git -C osxcross checkout 035cc170338b7b252e3f13b0e3ccbf4411bffc41 || exit 1; \
    mv $OSX_SDK.tar.gz osxcross/tarballs/ && \
    UNATTENDED=yes SDK_VERSION=${OSX_SDK_VERSION} OSX_VERSION_MIN=10.10 osxcross/build.sh || exit 1; \
    mv osxcross/target $OSX_NDK_X86; \
    rm -rf osxcross;

ENV PATH $OSX_NDK_X86/bin:$PATH
ENV LD_LIBRARY_PATH=$OSX_NDK_X86/lib:$LD_LIBRARY_PATH

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
# CC=o64-clang CXX=o64-clang++ GOOS=darwin GOARCH=arm64 CGO_ENABLED=1 go build -tags extended
# goreleaser -p 2 --skip-publish --skip-validate --rm-dist