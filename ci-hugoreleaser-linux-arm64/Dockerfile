FROM bepsays/ci-go:1.22300.20400

LABEL maintainer="bjorn.erik.pedersen@gmail.com"

ENV HUGORELEASER_VERSION=v0.60.0

# Install tools
RUN go install github.com/gohugoio/hugoreleaser@$HUGORELEASER_VERSION

RUN apt update \
    && apt install -y --no-install-recommends \
        binutils-aarch64-linux-gnu gcc-aarch64-linux-gnu g++-aarch64-linux-gnu \
        && rm -rf /var/lib/apt/lists/*

CMD ["hugoreleaser", "-h"]