FROM golang:1.19.0-buster

LABEL maintainer="bjorn.erik.pedersen@gmail.com"

ENV HUGORELEASER_VERSION=v0.54.0

RUN mkdir -p /root/.ssh; \
    chmod 0700 /root/.ssh; \
    ssh-keyscan github.com > /root/.ssh/known_hosts;

# Install tools
RUN go install github.com/gohugoio/hugoreleaser@$HUGORELEASER_VERSION


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

CMD ["hugoreleaser", "-h"]



# Notes for self:
# Windows:
# GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc CXX=x86_64-w64-mingw32-g++  go build -ldflags "-extldflags '-static'" -tags extended


# Darwin
# CC=o64-clang CXX=o64-clang++ GOOS=darwin GOARCH=amd64 CGO_ENABLED=1 go build -tags extended
# CC=o64-clang CXX=o64-clang++ GOOS=darwin GOARCH=arm64 CGO_ENABLED=1 go build -tags extended
# goreleaser -p 2 --skip-publish --skip-validate --rm-dist
# goreleaser build --id hugo_extended_linux --skip-validate --rm-dist
# goreleaser release --skip-publish --skip-validate --rm-dist