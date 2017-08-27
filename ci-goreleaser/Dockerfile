FROM golang:1.9.0

LABEL maintainer="bjorn.erik.pedersen@gmail.com"

ENV GORELEASER_VERSION=0.30.2

ENV GORELEASER_DOWNLOAD_URL=https://github.com/goreleaser/goreleaser/releases/download/v${GORELEASER_VERSION}/goreleaser_Linux_x86_64.tar.gz

RUN wget ${GORELEASER_DOWNLOAD_URL} && \
	 	tar -xf goreleaser_Linux_x86_64.tar.gz -C /usr/bin/ goreleaser && \
		rm goreleaser_Linux_x86_64.tar.gz

CMD ["goreleaser", "-v"]

