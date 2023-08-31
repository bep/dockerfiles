FROM golang:1.21.0-bullseye 

LABEL maintainer="bjorn.erik.pedersen@gmail.com"

ENV HUGORELEASER_VERSION=v0.57.0

# Install tools
RUN go install github.com/gohugoio/hugoreleaser@$HUGORELEASER_VERSION

RUN apt update \
    && apt install -y --no-install-recommends \
        binutils-aarch64-linux-gnu gcc-aarch64-linux-gnu g++-aarch64-linux-gnu \
        && rm -rf /var/lib/apt/lists/*

CMD ["hugoreleaser", "-h"]